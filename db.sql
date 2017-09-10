SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `article_type`;
DROP TABLE IF EXISTS `article`;
DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `article_type` (
    `type_id` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` CHAR(32) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `article` (
    `article_id` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `type_id` INTEGER NOT NULL,
    `title` VARCHAR(128) NOT NULL,
    `url` VARCHAR(255) NOT NULL UNIQUE,
    `thumb` VARCHAR(255) DEFAULT NULL,
    `content` TEXT NOT NULL,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(`type_id`) REFERENCES `article_type`(`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `attachment` (
    `attach_id` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `article_id` INTEGER NOT NULL,
    `content` VARCHAR(128) NOT NULL,
    `url` VARCHAR(512) NOT NULL,
    FOREIGN KEY(`article_id`) REFERENCES `article`(`article_id`)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

SET FOREIGN_KEY_CHECKS = 1;

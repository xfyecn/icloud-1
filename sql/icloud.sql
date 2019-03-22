/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : icloud

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 22/03/2019 16:43:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for icloud_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `icloud_sys_permission`;
CREATE TABLE `icloud_sys_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` bit(1) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `permission_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `weight` int(11) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKarkyg4p1bouosuixjo7rebdjn`(`parent_id`) USING BTREE,
  CONSTRAINT `icloud_sys_permission_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `icloud_sys_permission` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of icloud_sys_permission
-- ----------------------------
INSERT INTO `icloud_sys_permission` VALUES (1, b'1', '系统管理', NULL, NULL, '', 'system', '', 'CATEGORY', 0, NULL, 'fa fa-cogs');
INSERT INTO `icloud_sys_permission` VALUES (2, b'1', '菜单管理', 'system:permission:list', 'list', '/system/permission', 'system:permission', 'permission', 'MENU', 0, 1, 'fa fa-key');
INSERT INTO `icloud_sys_permission` VALUES (3, b'1', '角色管理', 'system:role:list', 'list', NULL, 'role', 'role', 'MENU', NULL, 1, NULL);
INSERT INTO `icloud_sys_permission` VALUES (4, b'1', '用户管理', 'system:user:list', 'list', '/system/user', 'system:user', 'user', 'MENU', 2, 1, 'fa fa-user');
INSERT INTO `icloud_sys_permission` VALUES (5, b'1', '创建', 'system:user:add', 'add', '', 'system:user:create', 'user', 'FUNCTION', 0, 4, 'fa fa-user-plus');
INSERT INTO `icloud_sys_permission` VALUES (6, b'1', '编辑', 'system:user:update', 'update', '', 'system:user:edit', 'user', 'FUNCTION', 0, 4, 'fa fa-edit');
INSERT INTO `icloud_sys_permission` VALUES (7, b'1', '删除', 'system:user:delete', 'delete', '', 'system:user:delete', 'user', 'FUNCTION', 0, 4, 'fa fa-trash');
INSERT INTO `icloud_sys_permission` VALUES (8, b'1', '创建', 'system:role:add', 'add', NULL, 'role', 'role', NULL, NULL, 3, NULL);
INSERT INTO `icloud_sys_permission` VALUES (9, b'1', '编辑', 'system:role:update', 'update', NULL, 'role', 'role', NULL, NULL, 3, NULL);
INSERT INTO `icloud_sys_permission` VALUES (10, b'1', '删除', 'system:role:delete', 'delete', NULL, 'role', 'role', NULL, NULL, 3, NULL);
INSERT INTO `icloud_sys_permission` VALUES (11, b'1', '创建', 'system:permission:add', 'add', NULL, 'permission', 'permission', NULL, NULL, 2, NULL);
INSERT INTO `icloud_sys_permission` VALUES (12, b'1', '编辑', 'system:permission:update', 'update', NULL, 'permission', 'permission', NULL, NULL, 2, NULL);
INSERT INTO `icloud_sys_permission` VALUES (13, b'1', '删除', 'system:permission:delete', 'delete', NULL, 'permission', 'permission', NULL, NULL, 2, NULL);
INSERT INTO `icloud_sys_permission` VALUES (14, b'1', '系统日志', 'system:log:list', 'list', '/system/log', 'system:log', 'log', 'MENU', 3, 1, 'fa fa-list');

-- ----------------------------
-- Table structure for icloud_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `icloud_sys_role`;
CREATE TABLE `icloud_sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  `role_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_iace11lm41qsi7dstkaiecion`(`role_key`) USING BTREE,
  UNIQUE INDEX `UK_eu9uvi1fl9j2kmtul6bmcu0mh`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of icloud_sys_role
-- ----------------------------
INSERT INTO `icloud_sys_role` VALUES (1, '拥有系统全部权限，请谨慎分配。', b'1', 'admin', '管理员');
INSERT INTO `icloud_sys_role` VALUES (3, '测试', b'1', 'normal', '普通用户');

-- ----------------------------
-- Table structure for icloud_sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `icloud_sys_role_permission`;
CREATE TABLE `icloud_sys_role_permission`  (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FK6l1rpsk0jgvg41t538728fjm4`(`permission_id`) USING BTREE,
  CONSTRAINT `icloud_sys_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `icloud_sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `icloud_sys_role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `icloud_sys_permission` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of icloud_sys_role_permission
-- ----------------------------
INSERT INTO `icloud_sys_role_permission` VALUES (1, 1);
INSERT INTO `icloud_sys_role_permission` VALUES (3, 1);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 2);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 3);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 4);
INSERT INTO `icloud_sys_role_permission` VALUES (3, 4);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 5);
INSERT INTO `icloud_sys_role_permission` VALUES (3, 5);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 6);
INSERT INTO `icloud_sys_role_permission` VALUES (3, 6);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 7);
INSERT INTO `icloud_sys_role_permission` VALUES (3, 7);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 8);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 9);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 10);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 11);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 12);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 13);
INSERT INTO `icloud_sys_role_permission` VALUES (1, 14);

-- ----------------------------
-- Table structure for icloud_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `icloud_sys_user`;
CREATE TABLE `icloud_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_dxesfklauarqhov4147i100ud`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of icloud_sys_user
-- ----------------------------
INSERT INTO `icloud_sys_user` VALUES (7, 'admin', b'1', '$2a$10$ItmuMLR4wUb5jjkBzg/CwuQADK7d9qbU725e.KyT/lLJEZeykDL62', '13203314875', '管理员', '');
INSERT INTO `icloud_sys_user` VALUES (8, 'test', b'1', 'e10adc3949ba59abbe56e057f20f883e', '18676037292', 'test', '');

-- ----------------------------
-- Table structure for icloud_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `icloud_sys_user_role`;
CREATE TABLE `icloud_sys_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKnviybsn4jexeg8t4n0n4bagi5`(`role_id`) USING BTREE,
  CONSTRAINT `icloud_sys_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `icloud_sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `icloud_sys_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `icloud_sys_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of icloud_sys_user_role
-- ----------------------------
INSERT INTO `icloud_sys_user_role` VALUES (7, 1);
INSERT INTO `icloud_sys_user_role` VALUES (8, 3);

SET FOREIGN_KEY_CHECKS = 1;

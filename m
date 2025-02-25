Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C339C197BF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:56:50 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.19972.1740517005849937733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cATU0XvB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fa5af6d743so9445751a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740517005; x=1741121805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28/MvCg5g/jB5W5n0HlcxUJecJ7HTloTNa2Us2d2C+M=;
        b=cATU0XvB2fvX/CE5cyGWUJAHR7hFkYvVwVBi5XK1r6zKIxKB2PTGOYRDoV7hGMyjOQ
         01eNiLwJoL7UEqvb/KPvlloqwr5PdLK94IK9iLY/Ik8TX+WOyf15HWBo1hIApcaC8uYE
         go9Jj2Wgd/EKzbMTnPqxbVpgOtI/DyG5GSks2xvyoFhbr6mYcZuK10OfY1vATlgtrcCw
         VrYibL1RNAfWXXvIRaZTjp97cq91aPMAndXeJpCLyp61rg7lXRrvi2uynqHHuOTJQlCT
         StThqwbQAcfL0qqNx/v1q/6mZFMCoiVmq9KMBbrEIhEvOeuVxPOoSo//MQ1P4ANr4Cg/
         kjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517005; x=1741121805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28/MvCg5g/jB5W5n0HlcxUJecJ7HTloTNa2Us2d2C+M=;
        b=KNtZZ00rDf6Tp+UCFHiKEof9Tog9s9Wv6wtN7sYMNZkY0RbXduwTKfWCV3za3I1b8y
         +kscWbimTgtk3j3fAy13LAtuPH+vBYl37ZWcL5Asf0M1cr37S2mLnqBHIcRrPzwaA3+C
         DYzacmGdN4zuwemB8T68257jdlNs7Eted9+RQDqbYAQ3x/YccJo/aMGd++4BaLEE4Gnt
         ch5kiwfx2T6X1clKHpzxA//uhR2Vt6MCX/8F8Is+vxkzoUlxKZGdgFRu2S80WOEcJqAS
         6//DYVEgKFXm5L6isOYvk6cdtLGi7+0GPAnb3VKqJkQWqSKjnwBY9I2qWKAidAH2ieop
         wZGA==
X-Gm-Message-State: AOJu0Yzgmc+LoIbkGHoqHHBgb30M0GAmcpCF0gcPbl7z99KyF+f54xJ0
	i+BraPb1XgJTHdKrZER3c2TCfN8lGsx31UXF+ZbBOyE0Hmi4Z4/MDOkk8AVYazr6jUIpAprQVIN
	U
X-Gm-Gg: ASbGncstJCtrosyIWwzHd9NB5E894q/RQ4HafNAdvhemmYOhEL/DdNW3Rt9eDIjZ2Rm
	RD2uuAA2Uxel5LMJo9qiNCHkZ1RffNQBxpUB6vw6/20p2acmrV4gUDQRAPIx+WsrezGXmZvfSnZ
	rB62vLp5yc3T9M8fSHVk2uzK9v8cXXutZjjQ0+0uUO00kr25aq7SYeq7N5+hf9AjYFw6Po03fCv
	mrEB7JeHMFQtYEYpCM2oP0beslot+3Ddl1DHgxgBPa5uvZlhSZkwLq7aPPemHVbfVlxi5zwsP2V
	KWvBmOddD+RQVnNWkA==
X-Google-Smtp-Source: AGHT+IHg1sh/POAMaQMJDIOh04ButF0WlvXDkCWoi+h4DTEW4PY9hE3Mud9HJIem4F9WlPvoJ1fssA==
X-Received: by 2002:a17:90b:4ecf:b0:2ee:f19b:86e5 with SMTP id 98e67ed59e1d1-2fe68ada443mr8695066a91.14.1740517005018;
        Tue, 25 Feb 2025 12:56:45 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d9b4sm10083810a91.6.2025.02.25.12.56.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:56:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/10] u-boot: fix CVE-2024-57257
Date: Tue, 25 Feb 2025 12:56:27 -0800
Message-ID: <890597539246c0f2b427d60965d5665cf7f4731c.1740516861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740516861.git.steve@sakoman.com>
References: <cover.1740516861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211928

From: Hongxu Jia <hongxu.jia@windriver.com>

A stack consumption issue in sqfs_size in Das U-Boot before 2025.01-rc1
occurs via a crafted squashfs filesystem with deep symlink nesting.

https://nvd.nist.gov/vuln/detail/CVE-2024-57257

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-57257.patch         | 227 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
 2 files changed, 228 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57257.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57257.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57257.patch
new file mode 100644
index 0000000000..bfffcafa43
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57257.patch
@@ -0,0 +1,227 @@
+From 4eb527c473068953f90ea65b33046a25140e0a89 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 18:36:47 +0200
+Subject: [PATCH 4/8] squashfs: Fix stack overflow while symlink resolving
+
+The squashfs driver blindly follows symlinks, and calls sqfs_size()
+recursively. So an attacker can create a crafted filesystem and with
+a deep enough nesting level a stack overflow can be achieved.
+
+Fix by limiting the nesting level to 8.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
+
+CVE: CVE-2024-57257
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/4f5cc096bfd0a591f8a11e86999e3d90a9484c34]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/squashfs/sqfs.c | 76 +++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 61 insertions(+), 15 deletions(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index 16a07c06..a5b7890e 100644
+--- a/fs/squashfs/sqfs.c
++++ b/fs/squashfs/sqfs.c
+@@ -24,7 +24,12 @@
+ #include "sqfs_filesystem.h"
+ #include "sqfs_utils.h"
+ 
++#define MAX_SYMLINK_NEST 8
++
+ static struct squashfs_ctxt ctxt;
++static int symlinknest;
++
++static int sqfs_readdir_nest(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp);
+ 
+ static int sqfs_disk_read(__u32 block, __u32 nr_blocks, void *buf)
+ {
+@@ -508,7 +513,7 @@ static int sqfs_search_dir(struct squashfs_dir_stream *dirs, char **token_list,
+ 			goto out;
+ 		}
+ 
+-		while (!sqfs_readdir(dirsp, &dent)) {
++		while (!sqfs_readdir_nest(dirsp, &dent)) {
+ 			ret = strcmp(dent->name, token_list[j]);
+ 			if (!ret)
+ 				break;
+@@ -533,6 +538,11 @@ static int sqfs_search_dir(struct squashfs_dir_stream *dirs, char **token_list,
+ 
+ 		/* Check for symbolic link and inode type sanity */
+ 		if (get_unaligned_le16(&dir->inode_type) == SQFS_SYMLINK_TYPE) {
++			if (++symlinknest == MAX_SYMLINK_NEST) {
++				ret = -ELOOP;
++				goto out;
++			}
++
+ 			sym = (struct squashfs_symlink_inode *)table;
+ 			/* Get first j + 1 tokens */
+ 			path = sqfs_concat_tokens(token_list, j + 1);
+@@ -880,7 +890,7 @@ out:
+ 	return metablks_count;
+ }
+ 
+-int sqfs_opendir(const char *filename, struct fs_dir_stream **dirsp)
++static int sqfs_opendir_nest(const char *filename, struct fs_dir_stream **dirsp)
+ {
+ 	unsigned char *inode_table = NULL, *dir_table = NULL;
+ 	int j, token_count = 0, ret = 0, metablks_count;
+@@ -975,7 +985,19 @@ out:
+ 	return ret;
+ }
+ 
++int sqfs_opendir(const char *filename, struct fs_dir_stream **dirsp)
++{
++	symlinknest = 0;
++	return sqfs_opendir_nest(filename, dirsp);
++}
++
+ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
++{
++	symlinknest = 0;
++	return sqfs_readdir_nest(fs_dirs, dentp);
++}
++
++static int sqfs_readdir_nest(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
+ {
+ 	struct squashfs_super_block *sblk = ctxt.sblk;
+ 	struct squashfs_dir_stream *dirs;
+@@ -1319,8 +1341,8 @@ static int sqfs_get_lregfile_info(struct squashfs_lreg_inode *lreg,
+ 	return datablk_count;
+ }
+ 
+-int sqfs_read(const char *filename, void *buf, loff_t offset, loff_t len,
+-	      loff_t *actread)
++static int sqfs_read_nest(const char *filename, void *buf, loff_t offset,
++			  loff_t len, loff_t *actread)
+ {
+ 	char *dir = NULL, *fragment_block, *datablock = NULL;
+ 	char *fragment = NULL, *file = NULL, *resolved, *data;
+@@ -1350,11 +1372,11 @@ int sqfs_read(const char *filename, void *buf, loff_t offset, loff_t len,
+ 	}
+ 
+ 	/*
+-	 * sqfs_opendir will uncompress inode and directory tables, and will
++	 * sqfs_opendir_nest will uncompress inode and directory tables, and will
+ 	 * return a pointer to the directory that contains the requested file.
+ 	 */
+ 	sqfs_split_path(&file, &dir, filename);
+-	ret = sqfs_opendir(dir, &dirsp);
++	ret = sqfs_opendir_nest(dir, &dirsp);
+ 	if (ret) {
+ 		goto out;
+ 	}
+@@ -1362,7 +1384,7 @@ int sqfs_read(const char *filename, void *buf, loff_t offset, loff_t len,
+ 	dirs = (struct squashfs_dir_stream *)dirsp;
+ 
+ 	/* For now, only regular files are able to be loaded */
+-	while (!sqfs_readdir(dirsp, &dent)) {
++	while (!sqfs_readdir_nest(dirsp, &dent)) {
+ 		ret = strcmp(dent->name, file);
+ 		if (!ret)
+ 			break;
+@@ -1411,9 +1433,14 @@ int sqfs_read(const char *filename, void *buf, loff_t offset, loff_t len,
+ 		break;
+ 	case SQFS_SYMLINK_TYPE:
+ 	case SQFS_LSYMLINK_TYPE:
++		if (++symlinknest == MAX_SYMLINK_NEST) {
++			ret = -ELOOP;
++			goto out;
++		}
++
+ 		symlink = (struct squashfs_symlink_inode *)ipos;
+ 		resolved = sqfs_resolve_symlink(symlink, filename);
+-		ret = sqfs_read(resolved, buf, offset, len, actread);
++		ret = sqfs_read_nest(resolved, buf, offset, len, actread);
+ 		free(resolved);
+ 		goto out;
+ 	case SQFS_BLKDEV_TYPE:
+@@ -1584,7 +1611,14 @@ out:
+ 	return ret;
+ }
+ 
+-int sqfs_size(const char *filename, loff_t *size)
++int sqfs_read(const char *filename, void *buf, loff_t offset, loff_t len,
++	      loff_t *actread)
++{
++	symlinknest = 0;
++	return sqfs_read_nest(filename, buf, offset, len, actread);
++}
++
++static int sqfs_size_nest(const char *filename, loff_t *size)
+ {
+ 	struct squashfs_super_block *sblk = ctxt.sblk;
+ 	struct squashfs_symlink_inode *symlink;
+@@ -1600,10 +1634,10 @@ int sqfs_size(const char *filename, loff_t *size)
+ 
+ 	sqfs_split_path(&file, &dir, filename);
+ 	/*
+-	 * sqfs_opendir will uncompress inode and directory tables, and will
++	 * sqfs_opendir_nest will uncompress inode and directory tables, and will
+ 	 * return a pointer to the directory that contains the requested file.
+ 	 */
+-	ret = sqfs_opendir(dir, &dirsp);
++	ret = sqfs_opendir_nest(dir, &dirsp);
+ 	if (ret) {
+ 		ret = -EINVAL;
+ 		goto free_strings;
+@@ -1611,7 +1645,7 @@ int sqfs_size(const char *filename, loff_t *size)
+ 
+ 	dirs = (struct squashfs_dir_stream *)dirsp;
+ 
+-	while (!sqfs_readdir(dirsp, &dent)) {
++	while (!sqfs_readdir_nest(dirsp, &dent)) {
+ 		ret = strcmp(dent->name, file);
+ 		if (!ret)
+ 			break;
+@@ -1644,6 +1678,11 @@ int sqfs_size(const char *filename, loff_t *size)
+ 		break;
+ 	case SQFS_SYMLINK_TYPE:
+ 	case SQFS_LSYMLINK_TYPE:
++		if (++symlinknest == MAX_SYMLINK_NEST) {
++			*size = 0;
++			return -ELOOP;
++		}
++
+ 		symlink = (struct squashfs_symlink_inode *)ipos;
+ 		resolved = sqfs_resolve_symlink(symlink, filename);
+ 		ret = sqfs_size(resolved, size);
+@@ -1683,10 +1722,11 @@ int sqfs_exists(const char *filename)
+ 
+ 	sqfs_split_path(&file, &dir, filename);
+ 	/*
+-	 * sqfs_opendir will uncompress inode and directory tables, and will
++	 * sqfs_opendir_nest will uncompress inode and directory tables, and will
+ 	 * return a pointer to the directory that contains the requested file.
+ 	 */
+-	ret = sqfs_opendir(dir, &dirsp);
++	symlinknest = 0;
++	ret = sqfs_opendir_nest(dir, &dirsp);
+ 	if (ret) {
+ 		ret = -EINVAL;
+ 		goto free_strings;
+@@ -1694,7 +1734,7 @@ int sqfs_exists(const char *filename)
+ 
+ 	dirs = (struct squashfs_dir_stream *)dirsp;
+ 
+-	while (!sqfs_readdir(dirsp, &dent)) {
++	while (!sqfs_readdir_nest(dirsp, &dent)) {
+ 		ret = strcmp(dent->name, file);
+ 		if (!ret)
+ 			break;
+@@ -1711,6 +1751,12 @@ free_strings:
+ 	return ret == 0;
+ }
+ 
++int sqfs_size(const char *filename, loff_t *size)
++{
++	symlinknest = 0;
++	return sqfs_size_nest(filename, size);
++}
++
+ void sqfs_close(void)
+ {
+ 	sqfs_decompressor_cleanup(&ctxt);
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 097ef685e9..ec3b4d8fdf 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -18,6 +18,7 @@ SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
            file://CVE-2024-57254.patch \
            file://CVE-2024-57255.patch \
            file://CVE-2024-57256.patch \
+           file://CVE-2024-57257.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.43.0



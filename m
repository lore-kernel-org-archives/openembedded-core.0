Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25852C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:22 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.9024.1740493815942108722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WoMKxuQq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220c4159f87so81004145ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493815; x=1741098615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEmRfOitrW5j4M7w/M7C34sZ5wZsq+JME8yhVLYODMw=;
        b=WoMKxuQqU6vEesLK0E4jamwgUURfhocDpK4ixbHGp0ipEfbrOSGMOcGbElxi+R+VMg
         dFs2I/Utp1KMHnChPdq4H1/b7FEL6gh6YlOA8Ky5r2Z7kywgPqrqn8XXW/VSFWt3cBSl
         EU5VLHeUjGROWxcq9NgEuQoG5AwDBpG6qZ7T3p0QthxiU6FQs7jO66RhhWMwrSvalukB
         jSURMQeX459BJYz/ZkuePcUCZ63Ef9lOKNHiKFHxceIPiom1m1Q7wqaLzjjVd8l/VUrF
         aqlR1hfxyFu9Wp79mdQi7PBgI06PXf//V216QGQxJgKvxZ3ST8TYTwAim09WcvJFEQkL
         1CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493815; x=1741098615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEmRfOitrW5j4M7w/M7C34sZ5wZsq+JME8yhVLYODMw=;
        b=YtNicD89/igS0Q0IsShZrTa+DOsViERHjSE3Fbgr2bE5ymknuTE8/Noqxr1q9D0sq8
         /Yj/ZTGMceeUtZfbpO/WNHKMKigOIT6iN9kY12DrczH2Sp2nYtXzUVcZDeIEayIbTTZ5
         HadpPKhWFck7UPZIOqYrXxtA69BHtds885DQ2wjEdaJRq45E4TZ63DE4qGhPnV+dHjgG
         FQ4ycdhlXwlCZiJNLGB1T+YQFrY/YjiW7IhyafkuvY8dxnptjD2BhuH+HdOq8reO3GwF
         LKvlI25AeEDffnJz0HAIKciSESALcXsDsBf89rKyg2Fz2CyeXUzTDcccDKaaxKf7Gvcn
         vDKQ==
X-Gm-Message-State: AOJu0YxBcRDZf0ShnmaHoXlfTG6pDphvyYYzL3/gNWPfDo0H5OJwEDVj
	J/bjIasKK7fLbVMOchX9rr1fpj+XfU0K/K6cK+zljmMq/nlliVEUKNo2pyvm4149qcwF2NYW8om
	q
X-Gm-Gg: ASbGncuYJDNgrXgZAThb8ROgZ+1xlPXiyhz654uji8zYLaps9v+p0bhyZ9iE33aSLpQ
	WKTQT2ho/O5wYkrvDlLqlTEdH2yniUzzReatlUkOVL6vLtxgFf5iaW/dcHDejTFcrEG/j064jxn
	eGabBX/NSRKNk8Ts4jXEAauWiDz3lWAwfzjj2pmK8PM5dnc4Cu8tMPMT593QgOru6kXTWNMSONb
	4MHaLGFjKe/R6Awzx2Ok1jhHrwqT4qOeDBTEoosoQMznVakxQtXe4zhi+gM7cOI8sCBcgIdoJmP
	3wqvvAJFKh08rt5D/Q==
X-Google-Smtp-Source: AGHT+IHimQ83N5m8ztPrB9ThLuQg1V2YQ+PwHJQCIQkFDTx0wbQzlAoT4Ik1uUOrrLEL0E77HunPnw==
X-Received: by 2002:a05:6a21:3403:b0:1f0:e3f3:e533 with SMTP id adf61e73a8af0-1f0fc24b3camr6671903637.24.1740493815069;
        Tue, 25 Feb 2025 06:30:15 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/22] u-boot: fix CVE-2024-57257
Date: Tue, 25 Feb 2025 06:29:41 -0800
Message-ID: <5ed8ad78bcce836aa8894de7a1d7fdf719e5bbca.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211891

From: Hongxu Jia <hongxu.jia@windriver.com>

A stack consumption issue in sqfs_size in Das U-Boot before 2025.01-rc1
occurs via a crafted squashfs filesystem with deep symlink nesting.

https://nvd.nist.gov/vuln/detail/CVE-2024-57257

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-57257.patch         | 228 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   1 +
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57257.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57257.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57257.patch
new file mode 100644
index 0000000000..5b6cbb8cad
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57257.patch
@@ -0,0 +1,228 @@
+From 790a2005e7a44dba059f5dbf1b9eff3a13e9b5e7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 19 Feb 2025 15:51:53 +0800
+Subject: [PATCH] squashfs: Fix stack overflow while symlink resolving
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
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/squashfs/sqfs.c | 76 +++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 61 insertions(+), 15 deletions(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index 7f2af8e1f9..09c0911689 100644
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
+@@ -502,7 +507,7 @@ static int sqfs_search_dir(struct squashfs_dir_stream *dirs, char **token_list,
+ 			goto out;
+ 		}
+ 
+-		while (!sqfs_readdir(dirsp, &dent)) {
++		while (!sqfs_readdir_nest(dirsp, &dent)) {
+ 			ret = strcmp(dent->name, token_list[j]);
+ 			if (!ret)
+ 				break;
+@@ -527,6 +532,11 @@ static int sqfs_search_dir(struct squashfs_dir_stream *dirs, char **token_list,
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
+@@ -872,7 +882,7 @@ out:
+ 	return metablks_count;
+ }
+ 
+-int sqfs_opendir(const char *filename, struct fs_dir_stream **dirsp)
++static int sqfs_opendir_nest(const char *filename, struct fs_dir_stream **dirsp)
+ {
+ 	unsigned char *inode_table = NULL, *dir_table = NULL;
+ 	int j, token_count = 0, ret = 0, metablks_count;
+@@ -967,7 +977,19 @@ out:
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
+@@ -1311,8 +1333,8 @@ static int sqfs_get_lregfile_info(struct squashfs_lreg_inode *lreg,
+ 	return datablk_count;
+ }
+ 
+-int sqfs_read(const char *filename, void *buf, loff_t offset, loff_t len,
+-	      loff_t *actread)
++static int sqfs_read_nest(const char *filename, void *buf, loff_t offset,
++			  loff_t len, loff_t *actread)
+ {
+ 	char *dir = NULL, *fragment_block, *datablock = NULL, *data_buffer = NULL;
+ 	char *fragment = NULL, *file = NULL, *resolved, *data;
+@@ -1342,11 +1364,11 @@ int sqfs_read(const char *filename, void *buf, loff_t offset, loff_t len,
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
+@@ -1354,7 +1376,7 @@ int sqfs_read(const char *filename, void *buf, loff_t offset, loff_t len,
+ 	dirs = (struct squashfs_dir_stream *)dirsp;
+ 
+ 	/* For now, only regular files are able to be loaded */
+-	while (!sqfs_readdir(dirsp, &dent)) {
++	while (!sqfs_readdir_nest(dirsp, &dent)) {
+ 		ret = strcmp(dent->name, file);
+ 		if (!ret)
+ 			break;
+@@ -1403,9 +1425,14 @@ int sqfs_read(const char *filename, void *buf, loff_t offset, loff_t len,
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
+@@ -1579,7 +1606,14 @@ out:
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
+@@ -1595,10 +1629,10 @@ int sqfs_size(const char *filename, loff_t *size)
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
+@@ -1606,7 +1640,7 @@ int sqfs_size(const char *filename, loff_t *size)
+ 
+ 	dirs = (struct squashfs_dir_stream *)dirsp;
+ 
+-	while (!sqfs_readdir(dirsp, &dent)) {
++	while (!sqfs_readdir_nest(dirsp, &dent)) {
+ 		ret = strcmp(dent->name, file);
+ 		if (!ret)
+ 			break;
+@@ -1639,6 +1673,11 @@ int sqfs_size(const char *filename, loff_t *size)
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
+@@ -1678,10 +1717,11 @@ int sqfs_exists(const char *filename)
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
+@@ -1689,7 +1729,7 @@ int sqfs_exists(const char *filename)
+ 
+ 	dirs = (struct squashfs_dir_stream *)dirsp;
+ 
+-	while (!sqfs_readdir(dirsp, &dent)) {
++	while (!sqfs_readdir_nest(dirsp, &dent)) {
+ 		ret = strcmp(dent->name, file);
+ 		if (!ret)
+ 			break;
+@@ -1706,6 +1746,12 @@ free_strings:
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
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index c643fb35f3..c68e3e442f 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -14,6 +14,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2024-57254.patch \
                    file://CVE-2024-57255.patch \
                    file://CVE-2024-57256.patch \
+                   file://CVE-2024-57257.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.43.0



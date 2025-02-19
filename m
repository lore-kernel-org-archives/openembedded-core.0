Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4875BC021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 07:04:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17083.1739948683405327301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 23:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J5gvgC027882
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 23:04:43 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00k8mq7-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 23:04:43 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 18 Feb 2025 23:04:42 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 18 Feb 2025 23:04:42 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 4/6] u-boot: fix CVE-2024-57257
Date: Wed, 19 Feb 2025 15:04:36 +0800
Message-ID: <20250219070438.2320112-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219070438.2320112-1-hongxu.jia@windriver.com>
References: <20250219070438.2320112-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b5828b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=YfCOm-DyAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=f3mU4yBjuhGa3ZgnF9gA:9
 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: YrHplYWn9tORtHVwu4o-kmVwPx9T6XF5
X-Proofpoint-GUID: YrHplYWn9tORtHVwu4o-kmVwPx9T6XF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 07:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211670

A stack consumption issue in sqfs_size in Das U-Boot before 2025.01-rc1
occurs via a crafted squashfs filesystem with deep symlink nesting.

https://nvd.nist.gov/vuln/detail/CVE-2024-57257

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
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
2.34.1



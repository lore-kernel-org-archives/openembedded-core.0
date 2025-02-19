Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB655C021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 08:06:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17622.1739952380522064787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 00:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J5h4j2011199
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:06:19 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00j8pk9-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:06:19 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 19 Feb 2025 00:06:19 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 19 Feb 2025 00:06:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 4/6] u-boot: fix CVE-2024-57257
Date: Wed, 19 Feb 2025 16:06:12 +0800
Message-ID: <20250219080614.902786-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219080614.902786-1-hongxu.jia@windriver.com>
References: <20250219080614.902786-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vntXvvhSHJ59nIhq7_Ff5izJiLUzONne
X-Authority-Analysis: v=2.4 cv=I4GfRMgg c=1 sm=1 tr=0 ts=67b590fb cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=YfCOm-DyAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=f3mU4yBjuhGa3ZgnF9gA:9
 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: vntXvvhSHJ59nIhq7_Ff5izJiLUzONne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211676

A stack consumption issue in sqfs_size in Das U-Boot before 2025.01-rc1
occurs via a crafted squashfs filesystem with deep symlink nesting.

https://nvd.nist.gov/vuln/detail/CVE-2024-57257

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
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
2.34.1



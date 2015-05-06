Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF9173F44
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 09:09:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4699gEJ029210
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 May 2015 02:09:42 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 6 May 2015 02:09:42 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 May 2015 17:09:41 +0800
Message-ID: <1430903381-31057-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: fix the CVE-2015-1572
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 May 2015 09:09:42 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Backport a patch to fix CVE-2015-1572
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1572

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-fix-potential-buffer-overflow-in-closefs.patch | 58 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
new file mode 100644
index 0000000..72f77cc
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
@@ -0,0 +1,58 @@
+From 49d0fe2a14f2a23da2fe299643379b8c1d37df73 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Fri, 6 Feb 2015 12:46:39 -0500
+Subject: [PATCH] libext2fs: fix potential buffer overflow in closefs()
+
+Upstream-Status: Backport
+
+The bug fix in f66e6ce4446: "libext2fs: avoid buffer overflow if
+s_first_meta_bg is too big" had a typo in the fix for
+ext2fs_closefs().  In practice most of the security exposure was from
+the openfs path, since this meant if there was a carefully crafted
+file system, buffer overrun would be triggered when the file system was
+opened.
+
+However, if corrupted file system didn't trip over some corruption
+check, and then the file system was modified via tune2fs or debugfs,
+such that the superblock was marked dirty and then written out via the
+closefs() path, it's possible that the buffer overrun could be
+triggered when the file system is closed.
+
+Also clear up a signed vs unsigned warning while we're at it.
+
+Thanks to Nick Kralevich <nnk@google.com> for asking me to look at
+compiler warning in the code in question, which led me to notice the
+bug in f66e6ce4446.
+
+Addresses: CVE-2015-1572
+
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+---
+ lib/ext2fs/closefs.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/ext2fs/closefs.c b/lib/ext2fs/closefs.c
+index 1f99113..ab5b2fb 100644
+--- a/lib/ext2fs/closefs.c
++++ b/lib/ext2fs/closefs.c
+@@ -287,7 +287,7 @@ errcode_t ext2fs_flush2(ext2_filsys fs, int flags)
+ 	dgrp_t		j;
+ #endif
+ 	char	*group_ptr;
+-	int	old_desc_blocks;
++	blk64_t	old_desc_blocks;
+ 	struct ext2fs_numeric_progress_struct progress;
+ 
+ 	EXT2_CHECK_MAGIC(fs, EXT2_ET_MAGIC_EXT2FS_FILSYS);
+@@ -346,7 +346,7 @@ errcode_t ext2fs_flush2(ext2_filsys fs, int flags)
+ 	group_ptr = (char *) group_shadow;
+ 	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG) {
+ 		old_desc_blocks = fs->super->s_first_meta_bg;
+-		if (old_desc_blocks > fs->super->s_first_meta_bg)
++		if (old_desc_blocks > fs->desc_blocks)
+ 			old_desc_blocks = fs->desc_blocks;
+ 	} else
+ 		old_desc_blocks = fs->desc_blocks;
+-- 
+2.1.0
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index be1db9e..b354088 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://acinclude.m4 \
             file://misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch \
             file://cache_inode.patch \
             file://CVE-2015-0247.patch \
+            file://0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch \
 "
 
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
-- 
2.1.0



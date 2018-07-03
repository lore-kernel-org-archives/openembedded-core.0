Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 592A278AA7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 04:02:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w63426QA010411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2018 21:02:06 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Mon, 2 Jul 2018 21:02:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jul 2018 12:11:54 +0800
Message-ID: <5f8547e5f23e043c1677a40fcda22a407628e0c4.1530591075.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530591075.git.liezhi.yang@windriver.com>
References: <cover.1530591075.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] e2fsprogs: 1.43.8 -> 1.44.2
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
X-List-Received-Date: Tue, 03 Jul 2018 04:02:05 -0000
Content-Type: text/plain

- Rebased Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
- Removed backport patch 0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
- The LIC_FILES_CHKSUM changed because it updated the address, others are the same

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |  2 +-
 ...ix-build-failure-in-swapfs.c-on-big-endia.patch | 40 ----------------------
 ...fs-enable-the-metadata_csum-and-64bit-fea.patch | 12 +++----
 .../{e2fsprogs_1.43.8.bb => e2fsprogs_1.44.2.bb}   |  3 +-
 4 files changed, 8 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.8.bb => e2fsprogs_1.44.2.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 81d90a1..a54a11c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -9,7 +9,7 @@ LICENSE_e2fsprogs-mke2fs = "GPLv2"
 LICENSE_e2fsprogs-fsck = "GPLv2"
 LICENSE_e2fsprogs-tune2fs = "GPLv2"
 LICENSE_e2fsprogs-badblocks = "GPLv2"
-LIC_FILES_CHKSUM = "file://NOTICE;md5=b48f21d765b875bd10400975d12c1ca2 \
+LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
                       file://lib/ext2fs/ext2fs.h;beginline=1;endline=9;md5=596a8dedcb4e731c6b21c7a46fba6bef \
                       file://lib/e2p/e2p.h;beginline=1;endline=7;md5=8a74ade8f9d65095d70ef2d4bf48e36a \
                       file://lib/uuid/uuid.h.in;beginline=1;endline=32;md5=dbb8079e114a5f841934b99e59c8820a \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
deleted file mode 100644
index ff1284e..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ae6603206176b771c9ed1f82569f68fc1257f014 Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Wed, 3 Jan 2018 01:32:02 -0500
-Subject: [PATCH] libext2fs: fix build failure in swapfs.c on big-endian
- systems
-
-Addresses-Debian-Bug: #886119
-
-Reported-by: James Clarke <jrtc27@debian.org>
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
----
-Upstream-Status: Backport
-
- lib/ext2fs/swapfs.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/ext2fs/swapfs.c b/lib/ext2fs/swapfs.c
-index 6e5cff97..b13dc422 100644
---- a/lib/ext2fs/swapfs.c
-+++ b/lib/ext2fs/swapfs.c
-@@ -19,6 +19,7 @@
- 
- #include "ext2_fs.h"
- #include "ext2fs.h"
-+#include "ext2fsP.h"
- #include <ext2fs/ext2_ext_attr.h>
- 
- #ifdef WORDS_BIGENDIAN
-@@ -358,7 +359,7 @@ void ext2fs_swap_inode_full(ext2_filsys fs, struct ext2_inode_large *t,
- 	if (inode_includes(inode_size, i_projid))
-                 t->i_projid = ext2fs_swab16(f->i_projid);
- 	/* catch new static fields added after i_projid */
--	EXT2FS_BUILD_BUG_ON(sizeof(ext2_inode_large) != 160);
-+	EXT2FS_BUILD_BUG_ON(sizeof(struct ext2_inode_large) != 160);
- 
- 	i = sizeof(struct ext2_inode) + extra_isize + sizeof(__u32);
- 	if (bufsize < (int) i)
--- 
-2.16.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
index 38e1bdb..d7e09b6 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
@@ -19,16 +19,16 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  misc/mke2fs.conf.in | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: git/misc/mke2fs.conf.in
-===================================================================
---- git.orig/misc/mke2fs.conf.in
-+++ git/misc/mke2fs.conf.in
+diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
+index 01e35cf..25105b3 100644
+--- a/misc/mke2fs.conf.in
++++ b/misc/mke2fs.conf.in
 @@ -11,8 +11,9 @@
  		features = has_journal
  	}
  	ext4 = {
--		features = has_journal,extent,huge_file,flex_bg,uninit_bg,64bit,dir_nlink,extra_isize
-+		features = has_journal,extent,huge_file,flex_bg,uninit_bg,dir_nlink,extra_isize
+-		features = has_journal,extent,huge_file,flex_bg,metadata_csum,64bit,dir_nlink,extra_isize
++		features = has_journal,extent,huge_file,flex_bg,metadata_csum,dir_nlink,extra_isize
  		inode_size = 256
 +		auto_64-bit_support = 1
  	}
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.2.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.2.bb
index 989d473..f2537a5 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.2.bb
@@ -6,14 +6,13 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://mkdir_p.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
-            file://0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch \
             "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
                                 file://quiet-debugfs.patch \
 "
 
-SRCREV = "af2eac481cf426c05ae12b946396980e16c8ab19"
+SRCREV = "7b9ea51db3be8972c7a17de25be179b18fc9fcde"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.7.4



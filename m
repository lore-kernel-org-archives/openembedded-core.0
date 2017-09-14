Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 75AF27856E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:13:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8E9DKRY023171
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 02:13:20 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 14 Sep 2017 02:13:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 02:13:17 -0700
Message-ID: <93267ae9f897ad6cd334f8f6233cf4aa1f769dd4.1505380364.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1505380364.git.liezhi.yang@windriver.com>
References: <cover.1505380364.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] e2fsprogs: set dir's mode correctly
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
X-List-Received-Date: Thu, 14 Sep 2017 09:13:19 -0000
Content-Type: text/plain

Fixed:
1) in pkg_postinst task set wanted file permissions:
---> chmod -R 521 "$D/opt/my_folder"
2) generate the rootfs image

Results:
my_folder hasn't correct permissions on rootfs ext4 image -> permissions are changed to 721

But it should be 521.

[YOCTO #11652]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...c-create_inode.c-set-dir-s-mode-correctly.patch | 41 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch
new file mode 100644
index 0000000..fc4a540
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch
@@ -0,0 +1,41 @@
+From f6d188580c2c9599319076fee22f2424652c711c Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 13 Sep 2017 19:55:35 -0700
+Subject: [PATCH] misc/create_inode.c: set dir's mode correctly
+
+The dir's mode has been set by ext2fs_mkdir() with umask, so
+reset it to the source's mode in set_inode_extra().
+
+Fixed when source dir's mode is 521, but tarball would be 721, this was
+incorrect.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/create_inode.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 8ce3faf..50fbaa8 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -116,7 +116,14 @@ static errcode_t set_inode_extra(ext2_filsys fs, ext2_ino_t ino,
+ 
+ 	inode.i_uid = st->st_uid;
+ 	inode.i_gid = st->st_gid;
+-	inode.i_mode |= st->st_mode;
++	/*
++	 * The dir's mode has been set by ext2fs_mkdir() with umask, so
++	 * reset it to the source's mode
++	 */
++	if S_ISDIR(st->st_mode)
++		inode.i_mode = LINUX_S_IFDIR | st->st_mode;
++	else
++		inode.i_mode |= st->st_mode;
+ 	inode.i_atime = st->st_atime;
+ 	inode.i_mtime = st->st_mtime;
+ 	inode.i_ctime = st->st_ctime;
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
index fb02d79..7fba8eb 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://acinclude.m4 \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://mkdir_p.patch \
             file://reproducible-doc.patch \
+            file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
 "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
-- 
2.10.2



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B81B775B98
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 11:22:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9NBM5RH002285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 04:22:05 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 23 Oct 2015 04:22:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Oct 2015 04:22:04 -0700
Message-ID: <419d11fb18463abb9afbe2cbb3f66d02eb61a9c9.1445599274.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1445599274.git.liezhi.yang@windriver.com>
References: <cover.1445599274.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] e2fsprogs: backport a patch to fix filetype for hardlink
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
X-List-Received-Date: Fri, 23 Oct 2015 11:22:06 -0000
Content-Type: text/plain

Backport a patch to fix hardlinks filetype:
IMAGE_INSTALL_append = " e2fsprogs"
$ ./tmp/sysroots/x86_64-linux/sbin/fsck.ext4 tmp/deploy/images/qemux86/core-image-minimal-qemux86.ext4 -f
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Setting filetype for entry 'fsck.ext2' in /sbin (80) to 1.
Setting filetype for entry 'mkfs.ext4' in /sbin (80) to 1.
Setting filetype for entry 'fsck.ext4' in /sbin (80) to 1.
Setting filetype for entry 'mkfs.ext4dev' in /sbin (80) to 1.
Setting filetype for entry 'fsck.ext3' in /sbin (80) to 1.
Setting filetype for entry 'mkfs.ext2' in /sbin (80) to 1.
Setting filetype for entry 'mkfs.ext3' in /sbin (80) to 1.
Setting filetype for entry 'e2fsck' in /sbin (80) to 1.
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information

test.img: ***** FILE SYSTEM WAS MODIFIED *****
test.img: 799/65536 files (0.1% non-contiguous), 14652/262144 blocks

Now when run it again, we may get:
[snip]
Pass 3A: Optimizing directories
[snip]
test.img: ***** FILE SYSTEM WAS MODIFIED *****
test.img: 799/65536 files (0.1% non-contiguous), 14652/262144 blocks

This is fine since it is optimizing, from "man e2fsck":
e2fsck may sometimes optimize a few directories --- for example, if
directory indexing is enabled and a directory is not indexed and would
benefit from being indexed, or if the index structures are corrupted
and need to be rebuilt.

[YOCTO #8544]
---
 ...ate-hardlinks-with-the-correct-directory-.patch |   81 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in-create-hardlinks-with-the-correct-directory-.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in-create-hardlinks-with-the-correct-directory-.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in-create-hardlinks-with-the-correct-directory-.patch
new file mode 100644
index 0000000..f549693
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in-create-hardlinks-with-the-correct-directory-.patch
@@ -0,0 +1,81 @@
+From 2dcf8e92bc39e05b3c799f53fe911c024aee4375 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 23 Oct 2015 03:21:05 -0700
+Subject: [PATCH] copy-in: create hardlinks with the correct directory
+ filetype
+
+When we're creating hard links via ext2fs_link, the (misnamed?) flags
+argument specifies the filetype for the directory entry.  This is
+*derived* from i_mode, so provide a translator.  Otherwise, fsck will
+complain about unset file types.
+
+Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/create_inode.c |   33 +++++++++++++++++++++++++++++++--
+ 1 file changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index fcec5aa..b8565da 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -22,6 +22,33 @@
+ /* For saving the hard links */
+ int hdlink_cnt = HDLINK_CNT;
+ 
++static int ext2_file_type(unsigned int mode)
++{
++	if (LINUX_S_ISREG(mode))
++		return EXT2_FT_REG_FILE;
++
++	if (LINUX_S_ISDIR(mode))
++		return EXT2_FT_DIR;
++
++	if (LINUX_S_ISCHR(mode))
++		return EXT2_FT_CHRDEV;
++
++	if (LINUX_S_ISBLK(mode))
++		return EXT2_FT_BLKDEV;
++
++	if (LINUX_S_ISLNK(mode))
++		return EXT2_FT_SYMLINK;
++
++	if (LINUX_S_ISFIFO(mode))
++		return EXT2_FT_FIFO;
++
++	if (LINUX_S_ISSOCK(mode))
++		return EXT2_FT_SOCK;
++
++	return 0;
++}
++
++
+ /* Link an inode number to a directory */
+ static errcode_t add_link(ext2_ino_t parent_ino, ext2_ino_t ino, const char *name)
+ {
+@@ -34,14 +61,16 @@ static errcode_t add_link(ext2_ino_t parent_ino, ext2_ino_t ino, const char *nam
+ 		return retval;
+ 	}
+ 
+-	retval = ext2fs_link(current_fs, parent_ino, name, ino, inode.i_flags);
++	retval = ext2fs_link(current_fs, parent_ino, name, ino,
++	             ext2_file_type(inode.i_mode));
+ 	if (retval == EXT2_ET_DIR_NO_SPACE) {
+ 		retval = ext2fs_expand_dir(current_fs, parent_ino);
+ 		if (retval) {
+ 			com_err(__func__, retval, "while expanding directory");
+ 			return retval;
+ 		}
+-		retval = ext2fs_link(current_fs, parent_ino, name, ino, inode.i_flags);
++		retval = ext2fs_link(current_fs, parent_ino, name, ino,
++	                     ext2_file_type(inode.i_mode));
+ 	}
+ 	if (retval) {
+ 		com_err(__func__, retval, "while linking %s", name);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 97e29c8..ce7d2e8 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -23,6 +23,7 @@ SRC_URI += "file://acinclude.m4 \
             file://cache_inode.patch \
             file://CVE-2015-0247.patch \
             file://0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch \
+            file://copy-in-create-hardlinks-with-the-correct-directory-.patch \
 "
 
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
-- 
1.7.9.5



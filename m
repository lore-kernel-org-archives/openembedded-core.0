Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5466F66E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:59:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s276xgoD016390
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 22:59:42 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 22:59:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:24 -0500
Message-ID: <4fac4160af5b4453172f38558d3f1782a5eeec20.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174908.git.liezhi.yang@windriver.com>
References: <cover.1394174908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/14] e2fsprogs: mke2fs: create special file
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
X-List-Received-Date: Fri, 07 Mar 2014 06:59:42 -0000
Content-Type: text/plain

The do_mknod_internal() is used for creating special file which is
block, character and fifo, most of the code are from debugfs/debugfs.c,
the debugfs/debugfs.c will be modified to use this function.

[YOCTO #4083]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Reviewed-by: Darren Hart <dvhart@linux.intel.com>
---
 ...3-misc-create_inode.c-create-special-file.patch |  103 ++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0003-misc-create_inode.c-create-special-file.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0003-misc-create_inode.c-create-special-file.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0003-misc-create_inode.c-create-special-file.patch
new file mode 100644
index 0000000..3847b6e
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0003-misc-create_inode.c-create-special-file.patch
@@ -0,0 +1,103 @@
+From ae7d33823bfc330e08b25c5fe4d25838ef7c77ce Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 23 Dec 2013 03:13:28 -0500
+Subject: [PATCH 03/11] misc/create_inode.c: create special file
+
+The do_mknod_internal() is used for creating special file which is
+block, character and fifo, most of the code are from debugfs/debugfs.c,
+the debugfs/debugfs.c will be modified to use this function.
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Reviewed-by: Darren Hart <dvhart@linux.intel.com>
+---
+ misc/create_inode.c |   72 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 72 insertions(+)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index b68b910..4da8aff 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -11,6 +11,78 @@
+ /* Make a special file which is block, character and fifo */
+ errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
+ {
++	ext2_ino_t		ino;
++	errcode_t 		retval;
++	struct ext2_inode	inode;
++	unsigned long		major, minor, mode;
++	int			filetype;
++
++	switch(st->st_mode & S_IFMT) {
++		case S_IFCHR:
++			mode = LINUX_S_IFCHR;
++			filetype = EXT2_FT_CHRDEV;
++			break;
++		case S_IFBLK:
++			mode = LINUX_S_IFBLK;
++			filetype =  EXT2_FT_BLKDEV;
++			break;
++		case S_IFIFO:
++			mode = LINUX_S_IFIFO;
++			filetype = EXT2_FT_FIFO;
++			break;
++	}
++
++	if (!(current_fs->flags & EXT2_FLAG_RW)) {
++		com_err(__func__, 0, "Filesystem opened read/only");
++		return -1;
++	}
++	retval = ext2fs_new_inode(current_fs, cwd, 010755, 0, &ino);
++	if (retval) {
++		com_err(__func__, retval, 0);
++		return retval;
++	}
++
++#ifdef DEBUGFS
++	printf("Allocated inode: %u\n", ino);
++#endif
++	retval = ext2fs_link(current_fs, cwd, name, ino, filetype);
++	if (retval == EXT2_ET_DIR_NO_SPACE) {
++		retval = ext2fs_expand_dir(current_fs, cwd);
++		if (retval) {
++			com_err(__func__, retval, "while expanding directory");
++			return retval;
++		}
++		retval = ext2fs_link(current_fs, cwd, name, ino, filetype);
++	}
++	if (retval) {
++		com_err(name, retval, 0);
++		return -1;
++	}
++        if (ext2fs_test_inode_bitmap2(current_fs->inode_map, ino))
++		com_err(__func__, 0, "Warning: inode already set");
++	ext2fs_inode_alloc_stats2(current_fs, ino, +1, 0);
++	memset(&inode, 0, sizeof(inode));
++	inode.i_mode = mode;
++	inode.i_atime = inode.i_ctime = inode.i_mtime =
++		current_fs->now ? current_fs->now : time(0);
++
++	major = major(st->st_rdev);
++	minor = minor(st->st_rdev);
++
++	if ((major < 256) && (minor < 256)) {
++		inode.i_block[0] = major * 256 + minor;
++		inode.i_block[1] = 0;
++	} else {
++		inode.i_block[0] = 0;
++		inode.i_block[1] = (minor & 0xff) | (major << 8) | ((minor & ~0xff) << 12);
++	}
++	inode.i_links_count = 1;
++
++	retval = ext2fs_write_new_inode(current_fs, ino, &inode);
++	if (retval)
++		com_err(__func__, retval, "while creating inode %u", ino);
++
++	return retval;
+ }
+ 
+ /* Make a symlink name -> target */
+-- 
+1.7.10.4
+
-- 
1.7.10.4



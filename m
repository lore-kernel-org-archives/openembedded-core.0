Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A7D276DBE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EHvB013404
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:17 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:16 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:49 -0600
Message-ID: <1385018038-23380-4-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 03/12] e2fsprogs/mke2fs: create special file
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:17 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

The do_mknod_internal() is used for creating special file which is
block, character and fifo, most of the code are from debugfs/debugfs.c,
the debugfs/debugfs.c will be modified to use this function.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0003-misc-util.c-create-special-file.patch     | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0003-misc-util.c-create-special-file.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0003-misc-util.c-create-special-file.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0003-misc-util.c-create-special-file.patch
new file mode 100644
index 0000000..b080e4c
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0003-misc-util.c-create-special-file.patch
@@ -0,0 +1,98 @@
+From de4bd6db5044263b15d4cbbbd0227fd2070b37da Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 27 Aug 2013 16:34:09 +0800
+Subject: [rootdir 03/10] misc/util.c: create special file
+
+The do_mknod_internal() is used for creating special file which is
+block, character and fifo, most of the code are from debugfs/debugfs.c,
+the debugfs/debugfs.c will be modified to use this function.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/util.c |   70 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 70 insertions(+)
+
+diff --git a/misc/util.c b/misc/util.c
+index 6d87393..c793b42 100644
+--- a/misc/util.c
++++ b/misc/util.c
+@@ -317,6 +317,76 @@ void dump_mmp_msg(struct mmp_struct *mmp, const char *msg)
+ /* Make a special file which is block, character and fifo */
+ errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
+ {
++	ext2_ino_t		ino;
++	errcode_t 		retval;
++	struct ext2_inode	inode;
++	char			*func_name = "do_mknod_internal";
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
++		com_err(func_name, 0, "Filesystem opened read/only");
++		return -1;
++	}
++	retval = ext2fs_new_inode(current_fs, cwd, 010755, 0, &ino);
++	if (retval) {
++		com_err(func_name, retval, 0);
++		return retval;
++	}
++	printf("Allocated inode: %u\n", ino);
++	retval = ext2fs_link(current_fs, cwd, name, ino, filetype);
++	if (retval == EXT2_ET_DIR_NO_SPACE) {
++		retval = ext2fs_expand_dir(current_fs, cwd);
++		if (retval) {
++			com_err(func_name, retval, "while expanding directory");
++			return retval;
++		}
++		retval = ext2fs_link(current_fs, cwd, name, ino, filetype);
++	}
++	if (retval) {
++		com_err(name, retval, 0);
++		return -1;
++	}
++        if (ext2fs_test_inode_bitmap2(current_fs->inode_map, ino))
++		com_err(func_name, 0, "Warning: inode already set");
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
++		com_err(func_name, retval, "while creating inode %u", ino);
++
++	return retval;
+ }
+ 
+ /* Make a symlink name -> target */
+-- 
+1.7.10.4
+
-- 
1.8.1.2.545.g2f19ada



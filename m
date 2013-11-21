Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5346DBD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EO1Q025124
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:24 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:23 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:51 -0600
Message-ID: <1385018038-23380-6-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 05/12] e2fsprogs/mke2fs: copy regular file
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:24 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

The do_write_internal() is used for copying file from native fs to
target, most of the code are from debugfs/debugfs.c, the
debugfs/debugfs.c will be modified to use this function.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0005-misc-util.c-copy-regular-file.patch       | 221 +++++++++++++++++++++
 1 file changed, 221 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0005-misc-util.c-copy-regular-file.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0005-misc-util.c-copy-regular-file.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0005-misc-util.c-copy-regular-file.patch
new file mode 100644
index 0000000..18533a3
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0005-misc-util.c-copy-regular-file.patch
@@ -0,0 +1,221 @@
+From 7c51a671c1de6237baaac4cf44bc7151394e521e Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 28 Aug 2013 10:06:11 +0800
+Subject: [rootdir 05/10] misc/util.c: copy regular file
+
+The do_write_internal() is used for copying file from native fs to
+target, most of the code are from debugfs/debugfs.c, the
+debugfs/debugfs.c will be modified to use this function.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/util.c |  179 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 179 insertions(+)
+
+diff --git a/misc/util.c b/misc/util.c
+index f6ae7ca..6cb68ff 100644
+--- a/misc/util.c
++++ b/misc/util.c
+@@ -37,6 +37,16 @@
+ 
+ #include "util.h"
+ 
++/* 64KiB is the minimium blksize to best minimize system call overhead. */
++#ifndef IO_BUFSIZE
++#define IO_BUFSIZE 64*1024
++#endif
++
++/* Block size for `st_blocks' */
++#ifndef S_BLKSIZE
++#define S_BLKSIZE 512
++#endif
++
+ int	journal_size;
+ int	journal_flags;
+ char	*journal_device;
+@@ -428,6 +438,80 @@ try_again:
+ 
+ }
+ 
++static errcode_t copy_file(int fd, ext2_ino_t ino, int bufsize, int make_holes)
++{
++	ext2_file_t	e2_file;
++	errcode_t	retval;
++	int		got;
++	unsigned int	written;
++	char		*buf;
++	char		*ptr;
++	char		*zero_buf;
++	int		cmp;
++
++	retval = ext2fs_file_open(current_fs, ino, EXT2_FILE_WRITE, &e2_file);
++	if (retval)
++		return retval;
++
++	if (!(buf = (char *) malloc(bufsize))){
++		com_err("copy_file", errno, "can't allocate buffer\n");
++		return;
++	}
++
++	/* This is used for checking whether the whole block is zero */
++	retval = ext2fs_get_memzero(bufsize, &zero_buf);
++	if (retval) {
++		com_err("copy_file", retval, "can't allocate buffer\n");
++		free(buf);
++		return retval;
++	}
++
++	while (1) {
++		got = read(fd, buf, bufsize);
++		if (got == 0)
++			break;
++		if (got < 0) {
++			retval = errno;
++			goto fail;
++		}
++		ptr = buf;
++
++		/* Sparse copy */
++		if (make_holes) {
++			/* Check whether all is zero */
++			cmp = memcmp(ptr, zero_buf, got);
++			if (cmp == 0) {
++				 /* The whole block is zero, make a hole */
++				retval = ext2fs_file_lseek(e2_file, got, EXT2_SEEK_CUR, NULL);
++				if (retval)
++					goto fail;
++				got = 0;
++			}
++		}
++
++		/* Normal copy */
++		while (got > 0) {
++			retval = ext2fs_file_write(e2_file, ptr,
++						   got, &written);
++			if (retval)
++				goto fail;
++
++			got -= written;
++			ptr += written;
++		}
++	}
++	free(buf);
++	ext2fs_free_mem(&zero_buf);
++	retval = ext2fs_file_close(e2_file);
++	return retval;
++
++fail:
++	free(buf);
++	ext2fs_free_mem(&zero_buf);
++	(void) ext2fs_file_close(e2_file);
++	return retval;
++}
++
+ /* Make a directory in the fs */
+ errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st)
+ {
+@@ -436,6 +520,101 @@ errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st)
+ /* Copy the native file to the fs */
+ errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest)
+ {
++	int		fd;
++	struct stat	statbuf;
++	ext2_ino_t	ino;
++	errcode_t	retval;
++	struct		ext2_inode inode;
++	char		*func_name = "do_write_internal";
++	int		hdlink;
++	int		bufsize = IO_BUFSIZE;
++	int		make_holes = 0;
++
++	fd = open(src, O_RDONLY);
++	if (fd < 0) {
++		com_err(src, errno, 0);
++		return errno;
++	}
++	if (fstat(fd, &statbuf) < 0) {
++		com_err(src, errno, 0);
++		close(fd);
++		return errno;
++	}
++
++	retval = ext2fs_namei(current_fs, root, cwd, dest, &ino);
++	if (retval == 0) {
++		com_err(func_name, 0, "The file '%s' already exists\n", dest);
++		close(fd);
++		return errno;
++	}
++
++	retval = ext2fs_new_inode(current_fs, cwd, 010755, 0, &ino);
++	if (retval) {
++		com_err(func_name, retval, 0);
++		close(fd);
++		return errno;
++	}
++	printf("Allocated inode: %u\n", ino);
++	retval = ext2fs_link(current_fs, cwd, dest, ino, EXT2_FT_REG_FILE);
++	if (retval == EXT2_ET_DIR_NO_SPACE) {
++		retval = ext2fs_expand_dir(current_fs, cwd);
++		if (retval) {
++			com_err(func_name, retval, "while expanding directory");
++			close(fd);
++			return errno;
++		}
++		retval = ext2fs_link(current_fs, cwd, dest, ino, EXT2_FT_REG_FILE);
++	}
++	if (retval) {
++		com_err(dest, retval, 0);
++		close(fd);
++		return errno;
++	}
++        if (ext2fs_test_inode_bitmap2(current_fs->inode_map, ino))
++		com_err(func_name, 0, "Warning: inode already set");
++	ext2fs_inode_alloc_stats2(current_fs, ino, +1, 0);
++	memset(&inode, 0, sizeof(inode));
++	inode.i_mode = (statbuf.st_mode & ~LINUX_S_IFMT) | LINUX_S_IFREG;
++	inode.i_atime = inode.i_ctime = inode.i_mtime =
++		current_fs->now ? current_fs->now : time(0);
++	inode.i_links_count = 1;
++	inode.i_size = statbuf.st_size;
++	if (current_fs->super->s_feature_incompat &
++	    EXT3_FEATURE_INCOMPAT_EXTENTS) {
++		int i;
++		struct ext3_extent_header *eh;
++
++		eh = (struct ext3_extent_header *) &inode.i_block[0];
++		eh->eh_depth = 0;
++		eh->eh_entries = 0;
++		eh->eh_magic = EXT3_EXT_MAGIC;
++		i = (sizeof(inode.i_block) - sizeof(*eh)) /
++			sizeof(struct ext3_extent);
++		eh->eh_max = ext2fs_cpu_to_le16(i);
++		inode.i_flags |= EXT4_EXTENTS_FL;
++	}
++
++	if ((retval = ext2fs_write_new_inode(current_fs, ino, &inode))) {
++		com_err(func_name, retval, "while creating inode %u", ino);
++		close(fd);
++		return errno;
++	}
++	if (LINUX_S_ISREG(inode.i_mode)) {
++		if (statbuf.st_blocks < statbuf.st_size / S_BLKSIZE) {
++			make_holes = 1;
++			/*
++			 * Use I/O blocksize as buffer size when
++			 * copying sparse files.
++			 */
++			bufsize = statbuf.st_blksize;
++		}
++		retval = copy_file(fd, ino, bufsize, make_holes);
++		if (retval)
++			com_err("copy_file", retval, 0);
++	}
++	close(fd);
++
++	return 0;
+ }
+ 
+ /* Copy files from source_dir to fs */
+-- 
+1.7.10.4
+
-- 
1.8.1.2.545.g2f19ada



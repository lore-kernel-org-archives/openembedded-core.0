Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 416626DBEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EaH4025193
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:36 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:35 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:56 -0600
Message-ID: <1385018038-23380-11-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 10/12] e2fsprogs/mke2fs: debugfs: use the functions in misc/util.c
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:36 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

Use the functions in misc/util.c to reduce the duplicated code.

We should use the $(top_builddir)/misc/util.o rather than
$(srcdir)/../misc/util.o, otherwise, if B != S, then the util.o would be
placed in $(srcdir) which would cause build errors.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 ...-debugfs-use-the-functions-in-misc-util.c.patch | 449 +++++++++++++++++++++
 1 file changed, 449 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0010-debugfs-use-the-functions-in-misc-util.c.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0010-debugfs-use-the-functions-in-misc-util.c.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0010-debugfs-use-the-functions-in-misc-util.c.patch
new file mode 100644
index 0000000..9a33c26
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0010-debugfs-use-the-functions-in-misc-util.c.patch
@@ -0,0 +1,449 @@
+From 08443658349aaf3bfa7666ff9445c9170ef6784f Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 28 Aug 2013 10:32:59 +0800
+Subject: [rootdir 10/10] debugfs: use the functions in misc/util.c
+
+Use the functions in misc/util.c to reduce the duplicated code.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ debugfs/Makefile.in |    7 +-
+ debugfs/debugfs.c   |  294 +++------------------------------------------------
+ debugfs/debugfs.h   |    1 +
+ 3 files changed, 21 insertions(+), 281 deletions(-)
+
+diff --git a/debugfs/Makefile.in b/debugfs/Makefile.in
+index 9a86dc6..4af2483 100644
+--- a/debugfs/Makefile.in
++++ b/debugfs/Makefile.in
+@@ -18,7 +18,7 @@ MK_CMDS=	_SS_DIR_OVERRIDE=../lib/ss ../lib/ss/mk_cmds
+ 
+ DEBUG_OBJS= debug_cmds.o debugfs.o util.o ncheck.o icheck.o ls.o \
+ 	lsdel.o dump.o set_fields.o logdump.o htree.o unused.o e2freefrag.o \
+-	filefrag.o extent_cmds.o extent_inode.o zap.o
++	filefrag.o extent_cmds.o extent_inode.o zap.o $(top_builddir)/misc/util.o
+ 
+ RO_DEBUG_OBJS= ro_debug_cmds.o ro_debugfs.o util.o ncheck.o icheck.o ls.o \
+ 	lsdel.o logdump.o htree.o e2freefrag.o filefrag.o extent_cmds.o \
+@@ -28,7 +28,8 @@ SRCS= debug_cmds.c $(srcdir)/debugfs.c $(srcdir)/util.c $(srcdir)/ls.c \
+ 	$(srcdir)/ncheck.c $(srcdir)/icheck.c $(srcdir)/lsdel.c \
+ 	$(srcdir)/dump.c $(srcdir)/set_fields.c ${srcdir}/logdump.c \
+ 	$(srcdir)/htree.c $(srcdir)/unused.c ${srcdir}/../misc/e2freefrag.c \
+-	$(srcdir)/filefrag.c $(srcdir)/extent_inode.c $(srcdir)/zap.c
++	$(srcdir)/filefrag.c $(srcdir)/extent_inode.c $(srcdir)/zap.c \
++	$(srcdir)/../misc/util.c
+ 
+ LIBS= $(LIBEXT2FS) $(LIBE2P) $(LIBSS) $(LIBCOM_ERR) $(LIBBLKID) \
+ 	$(LIBUUID)
+@@ -141,7 +142,7 @@ debugfs.o: $(srcdir)/debugfs.c $(top_srcdir)/lib/et/com_err.h \
+  $(top_srcdir)/lib/ext2fs/ext2_ext_attr.h $(top_srcdir)/lib/ext2fs/bitops.h \
+  $(top_srcdir)/lib/e2p/e2p.h $(top_srcdir)/version.h $(srcdir)/jfs_user.h \
+  $(top_srcdir)/lib/ext2fs/kernel-jbd.h $(top_srcdir)/lib/ext2fs/jfs_compat.h \
+- $(top_srcdir)/lib/ext2fs/kernel-list.h
++ $(top_srcdir)/lib/ext2fs/kernel-list.h $(top_srcdir)/misc/util.h
+ util.o: $(srcdir)/util.c $(srcdir)/debugfs.h \
+  $(top_srcdir)/lib/ext2fs/ext2_fs.h $(top_builddir)/lib/ext2fs/ext2_types.h \
+  $(top_srcdir)/lib/ext2fs/ext2fs.h $(top_srcdir)/lib/ext2fs/ext3_extents.h \
+diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
+index 5590295..5d2b289 100644
+--- a/debugfs/debugfs.c
++++ b/debugfs/debugfs.c
+@@ -25,8 +25,6 @@ extern char *optarg;
+ #include <errno.h>
+ #endif
+ #include <fcntl.h>
+-#include <sys/types.h>
+-#include <sys/stat.h>
+ 
+ #include "debugfs.h"
+ #include "uuid/uuid.h"
+@@ -55,8 +53,7 @@ ss_request_table *extra_cmds;
+ const char *debug_prog_name;
+ int sci_idx;
+ 
+-ext2_filsys	current_fs = NULL;
+-ext2_ino_t	root, cwd;
++ext2_ino_t	cwd;
+ 
+ static void open_filesystem(char *device, int open_flags, blk64_t superblock,
+ 			    blk64_t blocksize, int catastrophic,
+@@ -1573,188 +1570,24 @@ void do_find_free_inode(int argc, char *argv[])
+ }
+ 
+ #ifndef READ_ONLY
+-static errcode_t copy_file(int fd, ext2_ino_t newfile, int bufsize, int make_holes)
+-{
+-	ext2_file_t	e2_file;
+-	errcode_t	retval;
+-	int		got;
+-	unsigned int	written;
+-	char		*buf;
+-	char		*ptr;
+-	char		*zero_buf;
+-	int		cmp;
+-
+-	retval = ext2fs_file_open(current_fs, newfile,
+-				  EXT2_FILE_WRITE, &e2_file);
+-	if (retval)
+-		return retval;
+-
+-	if (!(buf = (char *) malloc(bufsize))){
+-		com_err("copy_file", errno, "can't allocate buffer\n");
+-		return;
+-	}
+-
+-	/* This is used for checking whether the whole block is zero */
+-	retval = ext2fs_get_memzero(bufsize, &zero_buf);
+-	if (retval) {
+-		com_err("copy_file", retval, "can't allocate buffer\n");
+-		free(buf);
+-		return retval;
+-	}
+-
+-	while (1) {
+-		got = read(fd, buf, bufsize);
+-		if (got == 0)
+-			break;
+-		if (got < 0) {
+-			retval = errno;
+-			goto fail;
+-		}
+-		ptr = buf;
+-
+-		/* Sparse copy */
+-		if (make_holes) {
+-			/* Check whether all is zero */
+-			cmp = memcmp(ptr, zero_buf, got);
+-			if (cmp == 0) {
+-				 /* The whole block is zero, make a hole */
+-				retval = ext2fs_file_lseek(e2_file, got, EXT2_SEEK_CUR, NULL);
+-				if (retval)
+-					goto fail;
+-				got = 0;
+-			}
+-		}
+-
+-		/* Normal copy */
+-		while (got > 0) {
+-			retval = ext2fs_file_write(e2_file, ptr,
+-						   got, &written);
+-			if (retval)
+-				goto fail;
+-
+-			got -= written;
+-			ptr += written;
+-		}
+-	}
+-	free(buf);
+-	ext2fs_free_mem(&zero_buf);
+-	retval = ext2fs_file_close(e2_file);
+-	return retval;
+-
+-fail:
+-	free(buf);
+-	ext2fs_free_mem(&zero_buf);
+-	(void) ext2fs_file_close(e2_file);
+-	return retval;
+-}
+-
+-
+ void do_write(int argc, char *argv[])
+ {
+-	int		fd;
+-	struct stat	statbuf;
+-	ext2_ino_t	newfile;
+ 	errcode_t	retval;
+-	struct ext2_inode inode;
+-	int		bufsize = IO_BUFSIZE;
+-	int		make_holes = 0;
+ 
+ 	if (common_args_process(argc, argv, 3, 3, "write",
+ 				"<native file> <new file>", CHECK_FS_RW))
+ 		return;
+ 
+-	fd = open(argv[1], O_RDONLY);
+-	if (fd < 0) {
+-		com_err(argv[1], errno, 0);
+-		return;
+-	}
+-	if (fstat(fd, &statbuf) < 0) {
+-		com_err(argv[1], errno, 0);
+-		close(fd);
+-		return;
+-	}
+-
+-	retval = ext2fs_namei(current_fs, root, cwd, argv[2], &newfile);
+-	if (retval == 0) {
+-		com_err(argv[0], 0, "The file '%s' already exists\n", argv[2]);
+-		close(fd);
+-		return;
+-	}
+-
+-	retval = ext2fs_new_inode(current_fs, cwd, 010755, 0, &newfile);
+-	if (retval) {
++	if ((retval = do_write_internal(cwd, argv[1], argv[2])))
+ 		com_err(argv[0], retval, 0);
+-		close(fd);
+-		return;
+-	}
+-	printf("Allocated inode: %u\n", newfile);
+-	retval = ext2fs_link(current_fs, cwd, argv[2], newfile,
+-			     EXT2_FT_REG_FILE);
+-	if (retval == EXT2_ET_DIR_NO_SPACE) {
+-		retval = ext2fs_expand_dir(current_fs, cwd);
+-		if (retval) {
+-			com_err(argv[0], retval, "while expanding directory");
+-			close(fd);
+-			return;
+-		}
+-		retval = ext2fs_link(current_fs, cwd, argv[2], newfile,
+-				     EXT2_FT_REG_FILE);
+-	}
+-	if (retval) {
+-		com_err(argv[2], retval, 0);
+-		close(fd);
+-		return;
+-	}
+-        if (ext2fs_test_inode_bitmap2(current_fs->inode_map,newfile))
+-		com_err(argv[0], 0, "Warning: inode already set");
+-	ext2fs_inode_alloc_stats2(current_fs, newfile, +1, 0);
+-	memset(&inode, 0, sizeof(inode));
+-	inode.i_mode = (statbuf.st_mode & ~LINUX_S_IFMT) | LINUX_S_IFREG;
+-	inode.i_atime = inode.i_ctime = inode.i_mtime =
+-		current_fs->now ? current_fs->now : time(0);
+-	inode.i_links_count = 1;
+-	inode.i_size = statbuf.st_size;
+-	if (current_fs->super->s_feature_incompat &
+-	    EXT3_FEATURE_INCOMPAT_EXTENTS) {
+-		int i;
+-		struct ext3_extent_header *eh;
+-
+-		eh = (struct ext3_extent_header *) &inode.i_block[0];
+-		eh->eh_depth = 0;
+-		eh->eh_entries = 0;
+-		eh->eh_magic = EXT3_EXT_MAGIC;
+-		i = (sizeof(inode.i_block) - sizeof(*eh)) /
+-			sizeof(struct ext3_extent);
+-		eh->eh_max = ext2fs_cpu_to_le16(i);
+-		inode.i_flags |= EXT4_EXTENTS_FL;
+-	}
+-	if (debugfs_write_new_inode(newfile, &inode, argv[0])) {
+-		close(fd);
+-		return;
+-	}
+-	if (LINUX_S_ISREG(inode.i_mode)) {
+-		if (statbuf.st_blocks < statbuf.st_size / S_BLKSIZE) {
+-			make_holes = 1;
+-			/*
+-			 * Use I/O blocksize as buffer size when
+-			 * copying sparse files.
+-			 */
+-			bufsize = statbuf.st_blksize;
+-		}
+-		retval = copy_file(fd, newfile, bufsize, make_holes);
+-		if (retval)
+-			com_err("copy_file", retval, 0);
+-	}
+-	close(fd);
+ }
+ 
+ void do_mknod(int argc, char *argv[])
+ {
+ 	unsigned long	mode, major, minor;
+-	ext2_ino_t	newfile;
+ 	errcode_t 	retval;
+-	struct ext2_inode inode;
+ 	int		filetype, nr;
++	struct stat	st;
+ 
+ 	if (check_fs_open(argv[0]))
+ 		return;
+@@ -1763,115 +1596,50 @@ void do_mknod(int argc, char *argv[])
+ 		com_err(argv[0], 0, "Usage: mknod <name> [p| [c|b] <major> <minor>]");
+ 		return;
+ 	}
++
+ 	mode = minor = major = 0;
+ 	switch (argv[2][0]) {
+ 		case 'p':
+-			mode = LINUX_S_IFIFO;
+-			filetype = EXT2_FT_FIFO;
++			st.st_mode = S_IFIFO;
+ 			nr = 3;
+ 			break;
+ 		case 'c':
+-			mode = LINUX_S_IFCHR;
+-			filetype = EXT2_FT_CHRDEV;
++			st.st_mode = S_IFCHR;
+ 			nr = 5;
+ 			break;
+ 		case 'b':
+-			mode = LINUX_S_IFBLK;
+-			filetype = EXT2_FT_BLKDEV;
++			st.st_mode = S_IFBLK;
+ 			nr = 5;
+ 			break;
+ 		default:
+-			filetype = 0;
+ 			nr = 0;
+ 	}
++
+ 	if (nr == 5) {
+ 		major = strtoul(argv[3], argv+3, 0);
+ 		minor = strtoul(argv[4], argv+4, 0);
+ 		if (major > 65535 || minor > 65535 || argv[3][0] || argv[4][0])
+ 			nr = 0;
+ 	}
++
+ 	if (argc != nr)
+ 		goto usage;
+-	if (check_fs_read_write(argv[0]))
+-		return;
+-	retval = ext2fs_new_inode(current_fs, cwd, 010755, 0, &newfile);
+-	if (retval) {
++
++	st.st_rdev = makedev(major, minor);
++	if ((retval = do_mknod_internal(cwd, argv[1], &st)))
+ 		com_err(argv[0], retval, 0);
+-		return;
+-	}
+-	printf("Allocated inode: %u\n", newfile);
+-	retval = ext2fs_link(current_fs, cwd, argv[1], newfile, filetype);
+-	if (retval == EXT2_ET_DIR_NO_SPACE) {
+-		retval = ext2fs_expand_dir(current_fs, cwd);
+-		if (retval) {
+-			com_err(argv[0], retval, "while expanding directory");
+-			return;
+-		}
+-		retval = ext2fs_link(current_fs, cwd, argv[1], newfile,
+-				     filetype);
+-	}
+-	if (retval) {
+-		com_err(argv[1], retval, 0);
+-		return;
+-	}
+-        if (ext2fs_test_inode_bitmap2(current_fs->inode_map,newfile))
+-		com_err(argv[0], 0, "Warning: inode already set");
+-	ext2fs_inode_alloc_stats2(current_fs, newfile, +1, 0);
+-	memset(&inode, 0, sizeof(inode));
+-	inode.i_mode = mode;
+-	inode.i_atime = inode.i_ctime = inode.i_mtime =
+-		current_fs->now ? current_fs->now : time(0);
+-	if ((major < 256) && (minor < 256)) {
+-		inode.i_block[0] = major*256+minor;
+-		inode.i_block[1] = 0;
+-	} else {
+-		inode.i_block[0] = 0;
+-		inode.i_block[1] = (minor & 0xff) | (major << 8) | ((minor & ~0xff) << 12);
+-	}
+-	inode.i_links_count = 1;
+-	if (debugfs_write_new_inode(newfile, &inode, argv[0]))
+-		return;
+ }
+ 
+ void do_mkdir(int argc, char *argv[])
+ {
+-	char	*cp;
+-	ext2_ino_t	parent;
+-	char	*name;
+ 	errcode_t retval;
+ 
+ 	if (common_args_process(argc, argv, 2, 2, "mkdir",
+ 				"<filename>", CHECK_FS_RW))
+ 		return;
+ 
+-	cp = strrchr(argv[1], '/');
+-	if (cp) {
+-		*cp = 0;
+-		parent = string_to_inode(argv[1]);
+-		if (!parent) {
+-			com_err(argv[1], ENOENT, 0);
+-			return;
+-		}
+-		name = cp+1;
+-	} else {
+-		parent = cwd;
+-		name = argv[1];
+-	}
+-
+-try_again:
+-	retval = ext2fs_mkdir(current_fs, parent, 0, name);
+-	if (retval == EXT2_ET_DIR_NO_SPACE) {
+-		retval = ext2fs_expand_dir(current_fs, parent);
+-		if (retval) {
+-			com_err(argv[0], retval, "while expanding directory");
+-			return;
+-		}
+-		goto try_again;
+-	}
+-	if (retval) {
+-		com_err("ext2fs_mkdir", retval, 0);
+-		return;
+-	}
++	if ((retval = do_mkdir_internal(cwd, argv[1], NULL)))
++		com_err(argv[0], retval, 0);
+ 
+ }
+ 
+@@ -2260,44 +2028,14 @@ void do_punch(int argc, char *argv[])
+ 
+ void do_symlink(int argc, char *argv[])
+ {
+-	char		*cp;
+-	ext2_ino_t	parent;
+-	char		*name, *target;
+ 	errcode_t	retval;
+ 
+ 	if (common_args_process(argc, argv, 3, 3, "symlink",
+ 				"<filename> <target>", CHECK_FS_RW))
+ 		return;
+ 
+-	cp = strrchr(argv[1], '/');
+-	if (cp) {
+-		*cp = 0;
+-		parent = string_to_inode(argv[1]);
+-		if (!parent) {
+-			com_err(argv[1], ENOENT, 0);
+-			return;
+-		}
+-		name = cp+1;
+-	} else {
+-		parent = cwd;
+-		name = argv[1];
+-	}
+-	target = argv[2];
+-
+-try_again:
+-	retval = ext2fs_symlink(current_fs, parent, 0, name, target);
+-	if (retval == EXT2_ET_DIR_NO_SPACE) {
+-		retval = ext2fs_expand_dir(current_fs, parent);
+-		if (retval) {
+-			com_err(argv[0], retval, "while expanding directory");
+-			return;
+-		}
+-		goto try_again;
+-	}
+-	if (retval) {
+-		com_err("ext2fs_symlink", retval, 0);
+-		return;
+-	}
++	if ((retval = do_symlink_internal(cwd, argv[1], argv[2])))
++		com_err(argv[0], retval, 0);
+ 
+ }
+ 
+diff --git a/debugfs/debugfs.h b/debugfs/debugfs.h
+index 45175cf..64ed608 100644
+--- a/debugfs/debugfs.h
++++ b/debugfs/debugfs.h
+@@ -5,6 +5,7 @@
+ #include "ss/ss.h"
+ #include "ext2fs/ext2_fs.h"
+ #include "ext2fs/ext2fs.h"
++#include "../misc/util.h"
+ 
+ #ifdef __STDC__
+ #define NOARGS void
+-- 
+1.7.10.4
+
-- 
1.8.1.2.545.g2f19ada



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B32906B912
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 09:43:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s039hJqS027680
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jan 2014 01:43:19 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 3 Jan 2014 01:43:18 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 4 Jan 2014 01:45:47 +0800
Message-ID: <339067c6bea13af0e30eaaeb34916bcd20b5527f.1388771106.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388771106.git.liezhi.yang@windriver.com>
References: <cover.1388771106.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] e2fsprogs: upgrade to 1.42.9
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
X-List-Received-Date: Fri, 03 Jan 2014 09:43:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

* Upgrade to 1.42.9
* Remove the following patches since they have been merged/fixed by
  upstream:
  - debugfs-extent-header.patch
  - debugfs-sparse-copy.patch
  - debugfs-too-short.patch
  - e2fsprogs-fix-tests-f_extent_oobounds.patch
  - fallocate.patch

* The populate-extfs.sh had been merged by the upstream, but I'd like to
  go on using the previous one which is from our meta layer, they are a
  little different, and the script would be dropped when we use the mke2fs
  to populate the rootfs.

* Sumitted the patch for populate-extfs.sh (from Søren Holm) to upstream.

* Submitted fix-icache.patch to upstream, I wrongly thought it was not
  applicable to the upstream, but it does.

* Join the do_install() and do_install_append() together.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs-1.42.8/debugfs-extent-header.patch   |  47 -------
 .../e2fsprogs-1.42.8/debugfs-sparse-copy.patch     | 148 ---------------------
 .../e2fsprogs-1.42.8/debugfs-too-short.patch       |  41 ------
 .../e2fsprogs-fix-tests-f_extent_oobounds.patch    |  43 ------
 .../e2fsprogs/e2fsprogs-1.42.8/fallocate.patch     |  22 ---
 .../{e2fsprogs-1.42.8 => e2fsprogs}/acinclude.m4   |   0
 .../fix-icache.patch                               |   6 +-
 .../{e2fsprogs-1.42.8 => e2fsprogs}/mkdir.patch    |   0
 .../populate-extfs.sh                              |   0
 .../quiet-debugfs.patch                            |   0
 .../remove.ldconfig.call.patch                     |   0
 .../{e2fsprogs_1.42.8.bb => e2fsprogs_1.42.9.bb}   |  10 +-
 12 files changed, 3 insertions(+), 314 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-extent-header.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-sparse-copy.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/e2fsprogs-fix-tests-f_extent_oobounds.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fallocate.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/fix-icache.patch (91%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/mkdir.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/populate-extfs.sh (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/quiet-debugfs.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.8.bb => e2fsprogs_1.42.9.bb} (85%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-extent-header.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-extent-header.patch
deleted file mode 100644
index ae44730..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-extent-header.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-debugfs: properly set up extent header in do_write
-
-do_write doesn't fully set up the first extent header on a new
-inode, so if we write a 0-length file, and don't write any data
-to the new file, we end up creating something that looks corrupt
-to kernelspace:
-
-EXT4-fs error (device loop0): ext4_ext_check_inode:464: inode #12: comm ls: bad header/extent: invalid magic - magic 0, entries 0, max 0(0), depth 0(0)
-
-Do something similar to ext4_ext_tree_init() here, and
-fill out the first extent header upon creation to avoid this.
-
-Upstream-Status: Backport
-
-Reported-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Eric Sandeen <sandeen@redhat.com>
----
- debugfs/debugfs.c | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
---- a/debugfs/debugfs.c
-+++ b/debugfs/debugfs.c
-@@ -1726,8 +1726,19 @@ void do_write(int argc, char *argv[])
- 	inode.i_links_count = 1;
- 	inode.i_size = statbuf.st_size;
- 	if (current_fs->super->s_feature_incompat &
--	    EXT3_FEATURE_INCOMPAT_EXTENTS)
-+	    EXT3_FEATURE_INCOMPAT_EXTENTS) {
-+		int i;
-+		struct ext3_extent_header *eh;
-+
-+		eh = (struct ext3_extent_header *) &inode.i_block[0];
-+		eh->eh_depth = 0;
-+		eh->eh_entries = 0;
-+		eh->eh_magic = EXT3_EXT_MAGIC;
-+		i = (sizeof(inode.i_block) - sizeof(*eh)) /
-+			sizeof(struct ext3_extent);
-+		eh->eh_max = ext2fs_cpu_to_le16(i);
- 		inode.i_flags |= EXT4_EXTENTS_FL;
-+	}
- 	if (debugfs_write_new_inode(newfile, &inode, argv[0])) {
- 		close(fd);
- 		return;
--- 
-1.8.1.2
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-sparse-copy.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-sparse-copy.patch
deleted file mode 100644
index 0712470..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-sparse-copy.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-debugfs.c: do sparse copy when src is a sparse file
-
-Let debugfs do sparse copy when src is a sparse file, just like
-"cp --sparse=auto"
-
-* For the:
-  #define IO_BUFSIZE 64*1024
-  this is a suggested value from gnu coreutils:
-  http://git.savannah.gnu.org/gitweb/?p=coreutils.git;a=blob;f=src/ioblksize.h;h=1ae93255e7d0ccf0855208c7ae5888209997bf16;hb=HEAD
-
-* Use malloc() to allocate memory for the buffer since put 64K (or
-  more) on the stack seems not a good idea.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Acked-by: Darren Hart <dvhart@linux.intel.com>
----
- debugfs/debugfs.c |   62 +++++++++++++++++++++++++++++++++++++++++++++++++----
- 1 file changed, 58 insertions(+), 4 deletions(-)
-
-diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
---- a/debugfs/debugfs.c
-+++ b/debugfs/debugfs.c
-@@ -41,6 +41,16 @@ extern char *optarg;
- #define BUFSIZ 8192
- #endif
- 
-+/* 64KiB is the minimium blksize to best minimize system call overhead. */
-+#ifndef IO_BUFSIZE
-+#define IO_BUFSIZE 64*1024
-+#endif
-+
-+/* Block size for `st_blocks' */
-+#ifndef S_BLKSIZE
-+#define S_BLKSIZE 512
-+#endif
-+
- ss_request_table *extra_cmds;
- const char *debug_prog_name;
- int sci_idx;
-@@ -1563,22 +1573,37 @@ void do_find_free_inode(int argc, char *argv[])
- }
- 
- #ifndef READ_ONLY
--static errcode_t copy_file(int fd, ext2_ino_t newfile)
-+static errcode_t copy_file(int fd, ext2_ino_t newfile, int bufsize, int make_holes)
- {
- 	ext2_file_t	e2_file;
- 	errcode_t	retval;
- 	int		got;
- 	unsigned int	written;
--	char		buf[8192];
-+	char		*buf;
- 	char		*ptr;
-+	char		*zero_buf;
-+	int		cmp;
- 
- 	retval = ext2fs_file_open(current_fs, newfile,
- 				  EXT2_FILE_WRITE, &e2_file);
- 	if (retval)
- 		return retval;
- 
-+	if (!(buf = (char *) malloc(bufsize))){
-+		com_err("copy_file", errno, "can't allocate buffer\n");
-+		return;
-+	}
-+
-+	/* This is used for checking whether the whole block is zero */
-+	retval = ext2fs_get_memzero(bufsize, &zero_buf);
-+	if (retval) {
-+		com_err("copy_file", retval, "can't allocate buffer\n");
-+		free(buf);
-+		return retval;
-+	}
-+
- 	while (1) {
--		got = read(fd, buf, sizeof(buf));
-+		got = read(fd, buf, bufsize);
- 		if (got == 0)
- 			break;
- 		if (got < 0) {
-@@ -1586,6 +1611,21 @@ static errcode_t copy_file(int fd, ext2_ino_t newfile)
- 			goto fail;
- 		}
- 		ptr = buf;
-+
-+		/* Sparse copy */
-+		if (make_holes) {
-+			/* Check whether all is zero */
-+			cmp = memcmp(ptr, zero_buf, got);
-+			if (cmp == 0) {
-+				 /* The whole block is zero, make a hole */
-+				retval = ext2fs_file_lseek(e2_file, got, EXT2_SEEK_CUR, NULL);
-+				if (retval)
-+					goto fail;
-+				got = 0;
-+			}
-+		}
-+
-+		/* Normal copy */
- 		while (got > 0) {
- 			retval = ext2fs_file_write(e2_file, ptr,
- 						   got, &written);
-@@ -1596,10 +1636,14 @@ static errcode_t copy_file(int fd, ext2_ino_t newfile)
- 			ptr += written;
- 		}
- 	}
-+	free(buf);
-+	ext2fs_free_mem(&zero_buf);
- 	retval = ext2fs_file_close(e2_file);
- 	return retval;
- 
- fail:
-+	free(buf);
-+	ext2fs_free_mem(&zero_buf);
- 	(void) ext2fs_file_close(e2_file);
- 	return retval;
- }
-@@ -1612,6 +1656,8 @@ void do_write(int argc, char *argv[])
- 	ext2_ino_t	newfile;
- 	errcode_t	retval;
- 	struct ext2_inode inode;
-+	int		bufsize = IO_BUFSIZE;
-+	int		make_holes = 0;
- 
- 	if (common_args_process(argc, argv, 3, 3, "write",
- 				"<native file> <new file>", CHECK_FS_RW))
-@@ -1687,7 +1733,15 @@ void do_write(int argc, char *argv[])
- 		return;
- 	}
- 	if (LINUX_S_ISREG(inode.i_mode)) {
--		retval = copy_file(fd, newfile);
-+		if (statbuf.st_blocks < statbuf.st_size / S_BLKSIZE) {
-+			make_holes = 1;
-+			/*
-+			 * Use I/O blocksize as buffer size when
-+			 * copying sparse files.
-+			 */
-+			bufsize = statbuf.st_blksize;
-+		}
-+		retval = copy_file(fd, newfile, bufsize, make_holes);
- 		if (retval)
- 			com_err("copy_file", retval, 0);
- 	}
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
deleted file mode 100644
index 607305b..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-debugfs.c: the max length of debugfs argument is too short
-
-The max length of debugfs argument is 256 which is too short, the
-arguments are two paths, the PATH_MAX is 4096 according to
-/usr/include/linux/limits.h, so use BUFSIZ (which is 8192 on Linux
-systems), that's also what the ss library uses.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Acked-by: Darren Hart <dvhart@linux.intel.com>
----
- debugfs/debugfs.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
---- a/debugfs/debugfs.c
-+++ b/debugfs/debugfs.c
-@@ -37,6 +37,10 @@ extern char *optarg;
- #include "../version.h"
- #include "jfs_user.h"
- 
-+#ifndef BUFSIZ
-+#define BUFSIZ 8192
-+#endif
-+
- ss_request_table *extra_cmds;
- const char *debug_prog_name;
- int sci_idx;
-@@ -2311,7 +2315,7 @@ void do_dump_mmp(int argc EXT2FS_ATTR((unused)), char *argv[])
- static int source_file(const char *cmd_file, int ss_idx)
- {
- 	FILE		*f;
--	char		buf[256];
-+	char		buf[BUFSIZ];
- 	char		*cp;
- 	int		exit_status = 0;
- 	int		retval;
--- 
-1.8.1.2
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/e2fsprogs-fix-tests-f_extent_oobounds.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/e2fsprogs-fix-tests-f_extent_oobounds.patch
deleted file mode 100644
index a4f7077..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/e2fsprogs-fix-tests-f_extent_oobounds.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1bfd0e015be7dd22a44995dd2a7002328aedc0e6 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sat, 9 Nov 2013 22:24:37 +0800
-Subject: [PATCH] e2fsprogs: fix tests/f_extent_oobounds
-
-Use $DEBUGFS and $MKE2FS to get the in-tree executables
-for this test.
-
-(Build machines which run make check shouldn't need to have
-e2fsprogs installed, and we should be testing just-built versions
-of the tools anyway)
-
-This patch is from:
-http://www.spinics.net/lists/linux-ext4/msg38880.html
-
-Eric Sandeen had sent it to the upstream, but haven't been merge by now.
-
-Upstream-Status: Backport
-
-Signed-off-by: Eric Sandeen <sandeen@xxxxxxxxxx>
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- tests/f_extent_oobounds/script | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/f_extent_oobounds/script b/tests/f_extent_oobounds/script
-index 31ac6c9..b00b031 100644
---- a/tests/f_extent_oobounds/script
-+++ b/tests/f_extent_oobounds/script
-@@ -4,8 +4,8 @@ SKIP_GUNZIP="true"
- TEST_DATA="$test_name.tmp"
- 
- dd if=/dev/zero of=$TMPFILE bs=1k count=256 > /dev/null 2>&1
--mke2fs -Ft ext4 $TMPFILE > /dev/null 2>&1
--debugfs -w $TMPFILE << EOF  > /dev/null 2>&1
-+$MKE2FS -Ft ext4 $TMPFILE > /dev/null 2>&1
-+$DEBUGFS -w $TMPFILE << EOF  > /dev/null 2>&1
- write /dev/null testfile
- extent_open testfile
-   insert_node 0 15 100
--- 
-1.8.3.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fallocate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fallocate.patch
deleted file mode 100644
index d074c15..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fallocate.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-We assume that fallocate is supported somehow
-but we need to check if we have fallocate()
-this problem shows up on uclibc systems since
-uclibc does not have fallocate() implemented
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: e2fsprogs-1.42/lib/ext2fs/unix_io.c
-===================================================================
---- e2fsprogs-1.42.orig/lib/ext2fs/unix_io.c	2012-01-17 17:24:34.290780625 -0800
-+++ e2fsprogs-1.42/lib/ext2fs/unix_io.c	2012-01-17 17:25:37.338783680 -0800
-@@ -895,7 +895,7 @@
- 		goto unimplemented;
- #endif
- 	} else {
--#ifdef FALLOC_FL_PUNCH_HOLE
-+#if defined FALLOC_FL_PUNCH_HOLE && defined HAVE_FALLOCATE
- 		/*
- 		 * If we are not on block device, try to use punch hole
- 		 * to reclaim free space.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/acinclude.m4 b/meta/recipes-devtools/e2fsprogs/e2fsprogs/acinclude.m4
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/acinclude.m4
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs/acinclude.m4
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
similarity index 91%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
index ad4e343..03c0abc 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
@@ -16,11 +16,7 @@ cache[0]: cached ino 15 when bufsize = 156 by ext2fs_read_inode_full()
 Then the ino 14 would hit the cache[1] when bufsize = 128 (but it was
 cached by bufsize = 156), so there would be errors.
 
-Note: the upstream has changed the icache lot, so this patch is
-inappropriate for the upstream, we can drop this patch when we update
-the package.
-
-Upstream-Status: [Inappropriate]
+Upstream-Status: [Submitted]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/mkdir.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/mkdir.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/quiet-debugfs.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/remove.ldconfig.call.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/remove.ldconfig.call.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
similarity index 85%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 6175ce7..0c8ec71 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -3,17 +3,13 @@ require e2fsprogs.inc
 
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
-            file://debugfs-too-short.patch \
-            file://debugfs-sparse-copy.patch \
             file://fix-icache.patch \
-            file://debugfs-extent-header.patch \
             file://populate-extfs.sh \
-            file://e2fsprogs-fix-tests-f_extent_oobounds.patch \
             file://quiet-debugfs.patch \
 "
 
-SRC_URI[md5sum] = "8ef664b6eb698aa6b733df59b17b9ed4"
-SRC_URI[sha256sum] = "b984aaf1fe888d6a4cf8c2e8d397207879599b5368f1d33232c1ec9d68d00c97"
+SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
+SRC_URI[sha256sum] = "2f92ac06e92fa00f2ada3ee67dad012d74d685537527ad1241d82f2d041f2802"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd"
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
@@ -37,9 +33,7 @@ do_install () {
 	rm -f ${D}${base_sbindir}/blkid
 	rm -f ${D}${base_sbindir}/fsck
 	rm -f ${D}${base_sbindir}/findfs
-}
 
-do_install_append () {
 	# e2initrd_helper and the pkgconfig files belong in libdir
 	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
 		install -d ${D}${libdir}
-- 
1.8.3.1



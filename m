Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9C8605BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 02:05:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F25N9w018833
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jan 2016 18:05:23 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 18:05:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 18:05:22 -0800
Message-ID: <2f2bda63c8a7f435e76c5d4ea1c5c529847f7f65.1452823464.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452823464.git.liezhi.yang@windriver.com>
References: <cover.1452823464.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] e2fsprogs: 1.42.9 -> 1.43-WIP
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
X-List-Received-Date: Fri, 15 Jan 2016 02:05:23 -0000
Content-Type: text/plain

Upgrade to 1.43-WIP to make "mke2fs -d" support xattr, so that the layer
which requires xattr such as meta-selinux can populate images easily.

* Remove the following patches since they are alredy in the source.
  0001-e2fsprogs-fix-cross-compilation-problem.patch
  0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
  0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
  0002-misc-create_inode.c-copy-files-recursively.patch
  0003-misc-create_inode.c-create-special-file.patch
  0004-misc-create_inode.c-create-symlink.patch
  0005-misc-create_inode.c-copy-regular-file.patch
  0006-misc-create_inode.c-create-directory.patch
  0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
  0008-mke2fs.c-add-an-option-d-root-directory.patch
  0009-misc-create_inode.c-handle-hardlinks.patch
  0010-debugfs-use-the-functions-in-misc-create_inode.c.patch
  0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
  0012-Fix-musl-build-failures.patch
  CVE-2015-0247.patch
  copy-in-create-hardlinks-with-the-correct-directory-.patch
  fix-icache.patch
  misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch

* Remove cache_inode.patch since it is not needed any more

* Updated mkdir.patch and ptest.patch

* Add --enable-libblkid to EXTRA_OECONF since libblkid is not created by
  default.

* Time of core-image-sato-sdk do_rootfs:
  - Before upgrade
    real    3m18.508s
    user    7m42.088s
    sys     1m1.984s

  - After upgrade
    real    3m21.552s
    user    7m38.496s
    sys     1m0.644s

   The are nearly the same

* The "fsck -fn" shows the image is OK, and also can boot.

[YOCTO #8622]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |    8 +-
 ...1-e2fsprogs-fix-cross-compilation-problem.patch |   55 ---
 ...-fix-potential-buffer-overflow-in-closefs.patch |   59 ---
 ...the-ability-to-copy-files-from-a-given-di.patch |   98 ----
 ...isc-create_inode.c-copy-files-recursively.patch |  135 ------
 ...3-misc-create_inode.c-create-special-file.patch |  103 ----
 .../0004-misc-create_inode.c-create-symlink.patch  |   63 ---
 ...005-misc-create_inode.c-copy-regular-file.patch |  224 ---------
 ...0006-misc-create_inode.c-create-directory.patch |   62 ---
 ..._inode.c-set-owner-mode-time-for-the-inod.patch |   81 ----
 ...8-mke2fs.c-add-an-option-d-root-directory.patch |  168 -------
 ...0009-misc-create_inode.c-handle-hardlinks.patch |  210 ---------
 ...-use-the-functions-in-misc-create_inode.c.patch |  496 --------------------
 ...s.8.in-update-the-manual-for-the-d-option.patch |   43 --
 .../e2fsprogs/0012-Fix-musl-build-failures.patch   |   54 ---
 .../e2fsprogs/e2fsprogs/CVE-2015-0247.patch        |   58 ---
 .../e2fsprogs/e2fsprogs/cache_inode.patch          |   52 --
 ...ate-hardlinks-with-the-correct-directory-.patch |   81 ----
 .../e2fsprogs/e2fsprogs/fix-icache.patch           |   65 ---
 ...c-return-error-when-failed-to-populate-fs.patch |   37 --
 .../e2fsprogs/e2fsprogs/mkdir.patch                |   32 +-
 .../e2fsprogs/e2fsprogs/ptest.patch                |   35 +-
 .../{e2fsprogs_1.42.9.bb => e2fsprogs_git.bb}      |   44 +-
 23 files changed, 43 insertions(+), 2220 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-cross-compilation-problem.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0002-misc-create_inode.c-copy-files-recursively.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0003-misc-create_inode.c-create-special-file.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0004-misc-create_inode.c-create-symlink.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0005-misc-create_inode.c-copy-regular-file.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0006-misc-create_inode.c-create-directory.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0008-mke2fs.c-add-an-option-d-root-directory.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0009-misc-create_inode.c-handle-hardlinks.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0010-debugfs-use-the-functions-in-misc-create_inode.c.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in-create-hardlinks-with-the-correct-directory-.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.9.bb => e2fsprogs_git.bb} (61%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index bcd9ba7..09e4ea5 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -19,7 +19,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b48f21d765b875bd10400975d12c1ca2 \
 SECTION = "base"
 DEPENDS = "util-linux"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
-           file://mkdir.patch"
+SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
+S = "${WORKDIR}/git"
 
-inherit autotools gettext texinfo pkgconfig multilib_header
+inherit autotools gettext texinfo pkgconfig multilib_header update-alternatives ptest
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-cross-compilation-problem.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-cross-compilation-problem.patch
deleted file mode 100644
index 73043be..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-cross-compilation-problem.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Pending
-
-Subject: e2fsprogs: fix cross compilation problem
-
-The checking of types in parse-types.sh doesn't make much sense in a
-cross-compilation environment, because the generated binary is executed
-on build machine.
-
-So even if asm_types.h has got correct statements for types, it's possible
-that the generated binary will report an error. Because these types are for
-the target machine.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- config/parse-types.sh |    6 ++++--
- configure.in          |    6 +++++-
- 2 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/config/parse-types.sh b/config/parse-types.sh
-index 5076f6c..24d2a99 100755
---- a/config/parse-types.sh
-+++ b/config/parse-types.sh
-@@ -118,8 +118,10 @@ if ./asm_types
- then
-     true
- else
--    echo "Problem detected with asm_types.h"
--    echo "" > asm_types.h
-+    if [ "${CROSS_COMPILE}" != "1" ]; then
-+	echo "Problem detected with asm_types.h"
-+	echo "" > asm_types.h
-+    fi
- fi
- rm asm_types.c asm_types
- 
-diff --git a/configure.in b/configure.in
-index 68adf0d..ed1697b 100644
---- a/configure.in
-+++ b/configure.in
-@@ -953,7 +953,11 @@ AC_SUBST(SIZEOF_LONG)
- AC_SUBST(SIZEOF_LONG_LONG)
- AC_SUBST(SIZEOF_OFF_T)
- AC_C_BIGENDIAN
--BUILD_CC="$BUILD_CC" CPP="$CPP" /bin/sh $ac_aux_dir/parse-types.sh
-+if test $cross_compiling = no; then
-+  BUILD_CC="$BUILD_CC" CPP="$CPP" /bin/sh $ac_aux_dir/parse-types.sh
-+else
-+  CROSS_COMPILE="1" BUILD_CC="$BUILD_CC" CPP="$CPP" /bin/sh $ac_aux_dir/parse-types.sh
-+fi
- ASM_TYPES_HEADER=./asm_types.h
- AC_SUBST_FILE(ASM_TYPES_HEADER)
- dnl
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
deleted file mode 100644
index b904e46..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 49d0fe2a14f2a23da2fe299643379b8c1d37df73 Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Fri, 6 Feb 2015 12:46:39 -0500
-Subject: [PATCH] libext2fs: fix potential buffer overflow in closefs()
-
-Upstream-Status: Backport
-CVE: CVE-2015-1572
-
-The bug fix in f66e6ce4446: "libext2fs: avoid buffer overflow if
-s_first_meta_bg is too big" had a typo in the fix for
-ext2fs_closefs().  In practice most of the security exposure was from
-the openfs path, since this meant if there was a carefully crafted
-file system, buffer overrun would be triggered when the file system was
-opened.
-
-However, if corrupted file system didn't trip over some corruption
-check, and then the file system was modified via tune2fs or debugfs,
-such that the superblock was marked dirty and then written out via the
-closefs() path, it's possible that the buffer overrun could be
-triggered when the file system is closed.
-
-Also clear up a signed vs unsigned warning while we're at it.
-
-Thanks to Nick Kralevich <nnk@google.com> for asking me to look at
-compiler warning in the code in question, which led me to notice the
-bug in f66e6ce4446.
-
-Addresses: CVE-2015-1572
-
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
----
- lib/ext2fs/closefs.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/ext2fs/closefs.c b/lib/ext2fs/closefs.c
-index 1f99113..ab5b2fb 100644
---- a/lib/ext2fs/closefs.c
-+++ b/lib/ext2fs/closefs.c
-@@ -287,7 +287,7 @@ errcode_t ext2fs_flush2(ext2_filsys fs, int flags)
- 	dgrp_t		j;
- #endif
- 	char	*group_ptr;
--	int	old_desc_blocks;
-+	blk64_t	old_desc_blocks;
- 	struct ext2fs_numeric_progress_struct progress;
- 
- 	EXT2_CHECK_MAGIC(fs, EXT2_ET_MAGIC_EXT2FS_FILSYS);
-@@ -346,7 +346,7 @@ errcode_t ext2fs_flush2(ext2_filsys fs, int flags)
- 	group_ptr = (char *) group_shadow;
- 	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG) {
- 		old_desc_blocks = fs->super->s_first_meta_bg;
--		if (old_desc_blocks > fs->super->s_first_meta_bg)
-+		if (old_desc_blocks > fs->desc_blocks)
- 			old_desc_blocks = fs->desc_blocks;
- 	} else
- 		old_desc_blocks = fs->desc_blocks;
--- 
-2.1.0
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
deleted file mode 100644
index 9ea413e..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From c98fec004f077e566b9dfa20b25e3b86cb462a2e Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 24 Dec 2013 01:41:08 -0500
-Subject: [PATCH 01/11] mke2fs: add the ability to copy files from a given
- directory
-
-We will add a -d option which will be used for adding the files from a
-given directory to the filesystem, it is similiar to genext2fs, but
-genext2fs doesn't fully support ext4.
-
-* We already have the basic operations in debugfs:
-  - Copy regular file
-  - Create directory
-  - Create symlink
-  - Create special file
-
-  We will move these operations into create_inode.h and create_inode.c,
-  then let both mke2fs and debugfs use them.
-
-* What we need to do are:
-  - Copy the given directory recursively, this will be done by the
-    populate_fs()
-  - Set the owner, mode and other informations
-  - Handle the hard links
-
-TODO:
-  - The libext2fs can't create the socket file (S_IFSOCK), do we have a
-    plan to support it ?
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- misc/create_inode.c |   26 ++++++++++++++++++++++++++
- misc/create_inode.h |   17 +++++++++++++++++
- 2 files changed, 43 insertions(+)
- create mode 100644 misc/create_inode.c
- create mode 100644 misc/create_inode.h
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-new file mode 100644
-index 0000000..46aaa60
---- /dev/null
-+++ b/misc/create_inode.c
-@@ -0,0 +1,26 @@
-+#include "create_inode.h"
-+
-+/* Make a special file which is block, character and fifo */
-+errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
-+{
-+}
-+
-+/* Make a symlink name -> target */
-+errcode_t do_symlink_internal(ext2_ino_t cwd, const char *name, char *target)
-+{
-+}
-+
-+/* Make a directory in the fs */
-+errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st)
-+{
-+}
-+
-+/* Copy the native file to the fs */
-+errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest)
-+{
-+}
-+
-+/* Copy files from source_dir to fs */
-+errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
-+{
-+}
-diff --git a/misc/create_inode.h b/misc/create_inode.h
-new file mode 100644
-index 0000000..9fc97fa
---- /dev/null
-+++ b/misc/create_inode.h
-@@ -0,0 +1,17 @@
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <fcntl.h>
-+#include "et/com_err.h"
-+#include "e2p/e2p.h"
-+#include "ext2fs/ext2fs.h"
-+#include "nls-enable.h"
-+
-+ext2_filsys    current_fs;
-+ext2_ino_t     root;
-+
-+/* For populating the filesystem */
-+extern errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir);
-+extern errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st);
-+extern errcode_t do_symlink_internal(ext2_ino_t cwd, const char *name, char *target);
-+extern errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st);
-+extern errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest);
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0002-misc-create_inode.c-copy-files-recursively.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0002-misc-create_inode.c-copy-files-recursively.patch
deleted file mode 100644
index 9bff644..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0002-misc-create_inode.c-copy-files-recursively.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 08dfbaf4e3f704232ff46d78c0758a6cfe3961c8 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 23 Dec 2013 02:59:10 -0500
-Subject: [PATCH 02/11] misc/create_inode.c: copy files recursively
-
-Use opendir() and readdir() to read the native directory, then use
-lstat() to identify the file type and call the corresponding function to
-add the file to the filesystem, call the populate_fs() recursively if it
-is a directory.
-
-NOTE: the libext2fs can't create the socket file.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- misc/create_inode.c |   97 +++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 97 insertions(+)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 46aaa60..b68b910 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -1,5 +1,13 @@
- #include "create_inode.h"
- 
-+#if __STDC_VERSION__ < 199901L
-+# if __GNUC__ >= 2
-+#  define __func__ __FUNCTION__
-+# else
-+#  define __func__ "<unknown>"
-+# endif
-+#endif
-+
- /* Make a special file which is block, character and fifo */
- errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
- {
-@@ -23,4 +31,93 @@ errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest)
- /* Copy files from source_dir to fs */
- errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
- {
-+	const char	*name;
-+	DIR		*dh;
-+	struct dirent	*dent;
-+	struct stat	st;
-+	char		ln_target[PATH_MAX];
-+	ext2_ino_t	ino;
-+	errcode_t	retval;
-+	int		read_cnt;
-+
-+	root = EXT2_ROOT_INO;
-+
-+	if (chdir(source_dir) < 0) {
-+		com_err(__func__, errno,
-+			_("while changing working directory to \"%s\""), source_dir);
-+		return errno;
-+	}
-+
-+	if (!(dh = opendir("."))) {
-+		com_err(__func__, errno,
-+			_("while openning directory \"%s\""), source_dir);
-+		return errno;
-+	}
-+
-+	while((dent = readdir(dh))) {
-+		if((!strcmp(dent->d_name, ".")) || (!strcmp(dent->d_name, "..")))
-+			continue;
-+		lstat(dent->d_name, &st);
-+		name = dent->d_name;
-+
-+		switch(st.st_mode & S_IFMT) {
-+			case S_IFCHR:
-+			case S_IFBLK:
-+			case S_IFIFO:
-+				if ((retval = do_mknod_internal(parent_ino, name, &st))) {
-+					com_err(__func__, retval,
-+						_("while creating special file \"%s\""), name);
-+					return retval;
-+				}
-+				break;
-+			case S_IFSOCK:
-+				/* FIXME: there is no make socket function atm. */
-+				com_err(__func__, 0,
-+					_("ignoring socket file \"%s\""), name);
-+				continue;
-+			case S_IFLNK:
-+				if((read_cnt = readlink(name, ln_target, sizeof(ln_target))) == -1) {
-+					com_err(__func__, errno,
-+						_("while trying to readlink \"%s\""), name);
-+					return errno;
-+				}
-+				ln_target[read_cnt] = '\0';
-+				if ((retval = do_symlink_internal(parent_ino, name, ln_target))) {
-+					com_err(__func__, retval,
-+						_("while writing symlink\"%s\""), name);
-+					return retval;
-+				}
-+				break;
-+			case S_IFREG:
-+				if ((retval = do_write_internal(parent_ino, name, name))) {
-+					com_err(__func__, retval,
-+						_("while writing file \"%s\""), name);
-+					return retval;
-+				}
-+				break;
-+			case S_IFDIR:
-+				if ((retval = do_mkdir_internal(parent_ino, name, &st))) {
-+					com_err(__func__, retval,
-+						_("while making dir \"%s\""), name);
-+					return retval;
-+				}
-+				if ((retval = ext2fs_namei(current_fs, root, parent_ino, name, &ino))) {
-+					com_err(name, retval, 0);
-+						return retval;
-+				}
-+				/* Populate the dir recursively*/
-+				retval = populate_fs(ino, name);
-+				if (retval) {
-+					com_err(__func__, retval, _("while adding dir \"%s\""), name);
-+					return retval;
-+				}
-+				chdir("..");
-+				break;
-+			default:
-+				com_err(__func__, 0,
-+					_("ignoring entry \"%s\""), name);
-+		}
-+	}
-+	closedir(dh);
-+	return retval;
- }
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0003-misc-create_inode.c-create-special-file.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0003-misc-create_inode.c-create-special-file.patch
deleted file mode 100644
index 3847b6e..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0003-misc-create_inode.c-create-special-file.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From ae7d33823bfc330e08b25c5fe4d25838ef7c77ce Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 23 Dec 2013 03:13:28 -0500
-Subject: [PATCH 03/11] misc/create_inode.c: create special file
-
-The do_mknod_internal() is used for creating special file which is
-block, character and fifo, most of the code are from debugfs/debugfs.c,
-the debugfs/debugfs.c will be modified to use this function.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- misc/create_inode.c |   72 +++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 72 insertions(+)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index b68b910..4da8aff 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -11,6 +11,78 @@
- /* Make a special file which is block, character and fifo */
- errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
- {
-+	ext2_ino_t		ino;
-+	errcode_t 		retval;
-+	struct ext2_inode	inode;
-+	unsigned long		major, minor, mode;
-+	int			filetype;
-+
-+	switch(st->st_mode & S_IFMT) {
-+		case S_IFCHR:
-+			mode = LINUX_S_IFCHR;
-+			filetype = EXT2_FT_CHRDEV;
-+			break;
-+		case S_IFBLK:
-+			mode = LINUX_S_IFBLK;
-+			filetype =  EXT2_FT_BLKDEV;
-+			break;
-+		case S_IFIFO:
-+			mode = LINUX_S_IFIFO;
-+			filetype = EXT2_FT_FIFO;
-+			break;
-+	}
-+
-+	if (!(current_fs->flags & EXT2_FLAG_RW)) {
-+		com_err(__func__, 0, "Filesystem opened read/only");
-+		return -1;
-+	}
-+	retval = ext2fs_new_inode(current_fs, cwd, 010755, 0, &ino);
-+	if (retval) {
-+		com_err(__func__, retval, 0);
-+		return retval;
-+	}
-+
-+#ifdef DEBUGFS
-+	printf("Allocated inode: %u\n", ino);
-+#endif
-+	retval = ext2fs_link(current_fs, cwd, name, ino, filetype);
-+	if (retval == EXT2_ET_DIR_NO_SPACE) {
-+		retval = ext2fs_expand_dir(current_fs, cwd);
-+		if (retval) {
-+			com_err(__func__, retval, "while expanding directory");
-+			return retval;
-+		}
-+		retval = ext2fs_link(current_fs, cwd, name, ino, filetype);
-+	}
-+	if (retval) {
-+		com_err(name, retval, 0);
-+		return -1;
-+	}
-+        if (ext2fs_test_inode_bitmap2(current_fs->inode_map, ino))
-+		com_err(__func__, 0, "Warning: inode already set");
-+	ext2fs_inode_alloc_stats2(current_fs, ino, +1, 0);
-+	memset(&inode, 0, sizeof(inode));
-+	inode.i_mode = mode;
-+	inode.i_atime = inode.i_ctime = inode.i_mtime =
-+		current_fs->now ? current_fs->now : time(0);
-+
-+	major = major(st->st_rdev);
-+	minor = minor(st->st_rdev);
-+
-+	if ((major < 256) && (minor < 256)) {
-+		inode.i_block[0] = major * 256 + minor;
-+		inode.i_block[1] = 0;
-+	} else {
-+		inode.i_block[0] = 0;
-+		inode.i_block[1] = (minor & 0xff) | (major << 8) | ((minor & ~0xff) << 12);
-+	}
-+	inode.i_links_count = 1;
-+
-+	retval = ext2fs_write_new_inode(current_fs, ino, &inode);
-+	if (retval)
-+		com_err(__func__, retval, "while creating inode %u", ino);
-+
-+	return retval;
- }
- 
- /* Make a symlink name -> target */
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0004-misc-create_inode.c-create-symlink.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0004-misc-create_inode.c-create-symlink.patch
deleted file mode 100644
index 83d198c..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0004-misc-create_inode.c-create-symlink.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 09d3049776882167f7249ee26265b4163d7222c1 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 23 Dec 2013 03:19:55 -0500
-Subject: [PATCH 04/11] misc/create_inode.c: create symlink
-
-The do_symlink_internal() is used for creating symlinks, most of the
-code are from debugfs/debugfs.c, the debugfs/debugfs.c will be modified
-to use this function.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- misc/create_inode.c |   32 ++++++++++++++++++++++++++++++++
- 1 file changed, 32 insertions(+)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 4da8aff..f845103 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -88,6 +88,38 @@ errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
- /* Make a symlink name -> target */
- errcode_t do_symlink_internal(ext2_ino_t cwd, const char *name, char *target)
- {
-+	char			*cp;
-+	ext2_ino_t		parent_ino;
-+	errcode_t		retval;
-+	struct ext2_inode	inode;
-+	struct stat		st;
-+
-+	cp = strrchr(name, '/');
-+	if (cp) {
-+		*cp = 0;
-+		if ((retval =  ext2fs_namei(current_fs, root, cwd, name, &parent_ino))){
-+			com_err(name, retval, 0);
-+			return retval;
-+		}
-+		name = cp+1;
-+	} else
-+		parent_ino = cwd;
-+
-+try_again:
-+	retval = ext2fs_symlink(current_fs, parent_ino, 0, name, target);
-+	if (retval == EXT2_ET_DIR_NO_SPACE) {
-+		retval = ext2fs_expand_dir(current_fs, parent_ino);
-+		if (retval) {
-+			com_err("do_symlink_internal", retval, "while expanding directory");
-+			return retval;
-+		}
-+		goto try_again;
-+	}
-+	if (retval) {
-+		com_err("ext2fs_symlink", retval, 0);
-+		return retval;
-+	}
-+
- }
- 
- /* Make a directory in the fs */
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0005-misc-create_inode.c-copy-regular-file.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0005-misc-create_inode.c-copy-regular-file.patch
deleted file mode 100644
index 7935cd8..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0005-misc-create_inode.c-copy-regular-file.patch
+++ /dev/null
@@ -1,224 +0,0 @@
-From 2973c74afaa532f3f72639b463322b2523519c20 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 23 Dec 2013 03:28:12 -0500
-Subject: [PATCH 05/11] misc/create_inode.c: copy regular file
-
-The do_write_internal() is used for copying file from native fs to
-target, most of the code are from debugfs/debugfs.c, the
-debugfs/debugfs.c will be modified to use this function.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- misc/create_inode.c |  183 +++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 183 insertions(+)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index f845103..98f4a93 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -8,6 +8,16 @@
- # endif
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
- /* Make a special file which is block, character and fifo */
- errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
- {
-@@ -127,9 +137,182 @@ errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st)
- {
- }
- 
-+static errcode_t copy_file(int fd, ext2_ino_t newfile, int bufsize, int make_holes)
-+{
-+	ext2_file_t	e2_file;
-+	errcode_t	retval;
-+	int		got;
-+	unsigned int	written;
-+	char		*buf;
-+	char		*ptr;
-+	char		*zero_buf;
-+	int		cmp;
-+
-+	retval = ext2fs_file_open(current_fs, newfile,
-+				  EXT2_FILE_WRITE, &e2_file);
-+	if (retval)
-+		return retval;
-+
-+	retval = ext2fs_get_mem(bufsize, &buf);
-+	if (retval) {
-+		com_err("copy_file", retval, "can't allocate buffer\n");
-+		return retval;
-+	}
-+
-+	/* This is used for checking whether the whole block is zero */
-+	retval = ext2fs_get_memzero(bufsize, &zero_buf);
-+	if (retval) {
-+		com_err("copy_file", retval, "can't allocate buffer\n");
-+		ext2fs_free_mem(&buf);
-+		return retval;
-+	}
-+
-+	while (1) {
-+		got = read(fd, buf, bufsize);
-+		if (got == 0)
-+			break;
-+		if (got < 0) {
-+			retval = errno;
-+			goto fail;
-+		}
-+		ptr = buf;
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
-+		while (got > 0) {
-+			retval = ext2fs_file_write(e2_file, ptr,
-+						   got, &written);
-+			if (retval)
-+				goto fail;
-+
-+			got -= written;
-+			ptr += written;
-+		}
-+	}
-+	ext2fs_free_mem(&buf);
-+	ext2fs_free_mem(&zero_buf);
-+	retval = ext2fs_file_close(e2_file);
-+	return retval;
-+
-+fail:
-+	ext2fs_free_mem(&buf);
-+	ext2fs_free_mem(&zero_buf);
-+	(void) ext2fs_file_close(e2_file);
-+	return retval;
-+}
-+
- /* Copy the native file to the fs */
- errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest)
- {
-+	int		fd;
-+	struct stat	statbuf;
-+	ext2_ino_t	newfile;
-+	errcode_t	retval;
-+	struct ext2_inode inode;
-+	int		bufsize = IO_BUFSIZE;
-+	int		make_holes = 0;
-+
-+	fd = open(src, O_RDONLY);
-+	if (fd < 0) {
-+		com_err(src, errno, 0);
-+		return errno;
-+	}
-+	if (fstat(fd, &statbuf) < 0) {
-+		com_err(src, errno, 0);
-+		close(fd);
-+		return errno;
-+	}
-+
-+	retval = ext2fs_namei(current_fs, root, cwd, dest, &newfile);
-+	if (retval == 0) {
-+		com_err(__func__, 0, "The file '%s' already exists\n", dest);
-+		close(fd);
-+		return retval;
-+	}
-+
-+	retval = ext2fs_new_inode(current_fs, cwd, 010755, 0, &newfile);
-+	if (retval) {
-+		com_err(__func__, retval, 0);
-+		close(fd);
-+		return retval;
-+	}
-+#ifdef DEBUGFS
-+	printf("Allocated inode: %u\n", newfile);
-+#endif
-+	retval = ext2fs_link(current_fs, cwd, dest, newfile,
-+				EXT2_FT_REG_FILE);
-+	if (retval == EXT2_ET_DIR_NO_SPACE) {
-+		retval = ext2fs_expand_dir(current_fs, cwd);
-+		if (retval) {
-+			com_err(__func__, retval, "while expanding directory");
-+			close(fd);
-+			return retval;
-+		}
-+		retval = ext2fs_link(current_fs, cwd, dest, newfile,
-+					EXT2_FT_REG_FILE);
-+	}
-+	if (retval) {
-+		com_err(dest, retval, 0);
-+		close(fd);
-+		return retval;
-+	}
-+        if (ext2fs_test_inode_bitmap2(current_fs->inode_map, newfile))
-+		com_err(__func__, 0, "Warning: inode already set");
-+	ext2fs_inode_alloc_stats2(current_fs, newfile, +1, 0);
-+	memset(&inode, 0, sizeof(inode));
-+	inode.i_mode = (statbuf.st_mode & ~LINUX_S_IFMT) | LINUX_S_IFREG;
-+	inode.i_atime = inode.i_ctime = inode.i_mtime =
-+		current_fs->now ? current_fs->now : time(0);
-+	inode.i_links_count = 1;
-+	inode.i_size = statbuf.st_size;
-+	if (current_fs->super->s_feature_incompat &
-+	    EXT3_FEATURE_INCOMPAT_EXTENTS) {
-+		int i;
-+		struct ext3_extent_header *eh;
-+
-+		eh = (struct ext3_extent_header *) &inode.i_block[0];
-+		eh->eh_depth = 0;
-+		eh->eh_entries = 0;
-+		eh->eh_magic = ext2fs_cpu_to_le16(EXT3_EXT_MAGIC);
-+		i = (sizeof(inode.i_block) - sizeof(*eh)) /
-+			sizeof(struct ext3_extent);
-+		eh->eh_max = ext2fs_cpu_to_le16(i);
-+		inode.i_flags |= EXT4_EXTENTS_FL;
-+	}
-+
-+	if ((retval = ext2fs_write_new_inode(current_fs, newfile, &inode))) {
-+		com_err(__func__, retval, "while creating inode %u", newfile);
-+		close(fd);
-+		return retval;
-+	}
-+	if (LINUX_S_ISREG(inode.i_mode)) {
-+		if (statbuf.st_blocks < statbuf.st_size / S_BLKSIZE) {
-+			make_holes = 1;
-+			/*
-+			 * Use I/O blocksize as buffer size when
-+			 * copying sparse files.
-+			 */
-+			bufsize = statbuf.st_blksize;
-+		}
-+		retval = copy_file(fd, newfile, bufsize, make_holes);
-+		if (retval)
-+			com_err("copy_file", retval, 0);
-+	}
-+	close(fd);
-+
-+	return 0;
- }
- 
- /* Copy files from source_dir to fs */
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0006-misc-create_inode.c-create-directory.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0006-misc-create_inode.c-create-directory.patch
deleted file mode 100644
index 5c7ca9c..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0006-misc-create_inode.c-create-directory.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From c8d1c43be24489036137f8fdebcfccc208f7cc8b Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 23 Dec 2013 03:34:14 -0500
-Subject: [PATCH 06/11] misc/create_inode.c: create directory
-
-The do_mkdir_internal() is used for making dir on the target fs, most of
-the code are from debugfs/debugfs.c, the debugfs/debugfs.c will be
-modified to use this function.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- misc/create_inode.c |   31 +++++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 98f4a93..6a8c92a 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -135,6 +135,37 @@ try_again:
- /* Make a directory in the fs */
- errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st)
- {
-+	char			*cp;
-+	ext2_ino_t		parent_ino, ino;
-+	errcode_t		retval;
-+	struct ext2_inode	inode;
-+
-+
-+	cp = strrchr(name, '/');
-+	if (cp) {
-+		*cp = 0;
-+		if ((retval =  ext2fs_namei(current_fs, root, cwd, name, &parent_ino))){
-+			com_err(name, retval, 0);
-+			return retval;
-+		}
-+		name = cp+1;
-+	} else
-+		parent_ino = cwd;
-+
-+try_again:
-+	retval = ext2fs_mkdir(current_fs, parent_ino, 0, name);
-+	if (retval == EXT2_ET_DIR_NO_SPACE) {
-+		retval = ext2fs_expand_dir(current_fs, parent_ino);
-+		if (retval) {
-+			com_err(__func__, retval, "while expanding directory");
-+			return retval;
-+		}
-+		goto try_again;
-+	}
-+	if (retval) {
-+		com_err("ext2fs_mkdir", retval, 0);
-+		return retval;
-+	}
- }
- 
- static errcode_t copy_file(int fd, ext2_ino_t newfile, int bufsize, int make_holes)
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
deleted file mode 100644
index f296393..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 2b1f6e6b386703a5d7e60b7d8b72746f3d31a8bc Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 23 Dec 2013 03:39:56 -0500
-Subject: [PATCH 07/11] misc/create_inode.c: set owner/mode/time for the inode
-
-Set the uid, gid, mode and time for inode.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- misc/create_inode.c |   45 +++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 45 insertions(+)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 6a8c92a..aad7354 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -18,6 +18,40 @@
- #define S_BLKSIZE 512
- #endif
- 
-+/* Fill the uid, gid, mode and time for the inode */
-+static void fill_inode(struct ext2_inode *inode, struct stat *st)
-+{
-+	if (st != NULL) {
-+		inode->i_uid = st->st_uid;
-+		inode->i_gid = st->st_gid;
-+		inode->i_mode |= st->st_mode;
-+		inode->i_atime = st->st_atime;
-+		inode->i_mtime = st->st_mtime;
-+		inode->i_ctime = st->st_ctime;
-+	}
-+}
-+
-+/* Set the uid, gid, mode and time for the inode */
-+errcode_t set_inode_extra(ext2_ino_t cwd, ext2_ino_t ino, struct stat *st)
-+{
-+	errcode_t		retval;
-+	struct ext2_inode	inode;
-+
-+	retval = ext2fs_read_inode(current_fs, ino, &inode);
-+        if (retval) {
-+		com_err(__func__, retval, "while reading inode %u", ino);
-+		return retval;
-+	}
-+
-+	fill_inode(&inode, st);
-+
-+	retval = ext2fs_write_inode(current_fs, ino, &inode);
-+	if (retval) {
-+		com_err(__func__, retval, "while writing inode %u", ino);
-+		return retval;
-+	}
-+}
-+
- /* Make a special file which is block, character and fifo */
- errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
- {
-@@ -435,6 +469,17 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
- 				com_err(__func__, 0,
- 					_("ignoring entry \"%s\""), name);
- 		}
-+
-+		if ((retval =  ext2fs_namei(current_fs, root, parent_ino, name, &ino))){
-+			com_err(name, retval, 0);
-+			return retval;
-+		}
-+
-+		if ((retval = set_inode_extra(parent_ino, ino, &st))) {
-+			com_err(__func__, retval,
-+				_("while setting inode for \"%s\""), name);
-+			return retval;
-+		}
- 	}
- 	closedir(dh);
- 	return retval;
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0008-mke2fs.c-add-an-option-d-root-directory.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0008-mke2fs.c-add-an-option-d-root-directory.patch
deleted file mode 100644
index 1f98673..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0008-mke2fs.c-add-an-option-d-root-directory.patch
+++ /dev/null
@@ -1,168 +0,0 @@
-From df856929e42bd4f3bdc8d4f59ee82ae8b28532e6 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 24 Dec 2013 01:50:45 -0500
-Subject: [PATCH 08/11] mke2fs.c: add an option: -d root-directory
-
-This option is used for adding the files from a given directory (the
-root-directory) to the filesystem, it is similiar to genext2fs, but
-genext2fs doesn't fully support ext4.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- misc/Makefile.in |   14 ++++++++++----
- misc/mke2fs.c    |   32 +++++++++++++++++++++++---------
- 2 files changed, 33 insertions(+), 13 deletions(-)
-
-diff --git a/misc/Makefile.in b/misc/Makefile.in
-index 553c361..8253723 100644
---- a/misc/Makefile.in
-+++ b/misc/Makefile.in
-@@ -42,7 +42,8 @@ LPROGS=		@E2INITRD_PROG@
- 
- TUNE2FS_OBJS=	tune2fs.o util.o
- MKLPF_OBJS=	mklost+found.o
--MKE2FS_OBJS=	mke2fs.o util.o profile.o prof_err.o default_profile.o
-+MKE2FS_OBJS=	mke2fs.o util.o profile.o prof_err.o default_profile.o \
-+			create_inode.o
- CHATTR_OBJS=	chattr.o
- LSATTR_OBJS=	lsattr.o
- UUIDGEN_OBJS=	uuidgen.o
-@@ -60,7 +61,8 @@ E2FREEFRAG_OBJS= e2freefrag.o
- PROFILED_TUNE2FS_OBJS=	profiled/tune2fs.o profiled/util.o
- PROFILED_MKLPF_OBJS=	profiled/mklost+found.o
- PROFILED_MKE2FS_OBJS=	profiled/mke2fs.o profiled/util.o profiled/profile.o \
--			profiled/prof_err.o profiled/default_profile.o
-+			profiled/prof_err.o profiled/default_profile.o \
-+			profiled/create_inode.o
- PROFILED_CHATTR_OBJS=	profiled/chattr.o
- PROFILED_LSATTR_OBJS=	profiled/lsattr.o
- PROFILED_UUIDGEN_OBJS=	profiled/uuidgen.o
-@@ -82,7 +84,7 @@ SRCS=	$(srcdir)/tune2fs.c $(srcdir)/mklost+found.c $(srcdir)/mke2fs.c \
- 		$(srcdir)/uuidgen.c $(srcdir)/blkid.c $(srcdir)/logsave.c \
- 		$(srcdir)/filefrag.c $(srcdir)/base_device.c \
- 		$(srcdir)/ismounted.c $(srcdir)/../e2fsck/profile.c \
--		$(srcdir)/e2undo.c $(srcdir)/e2freefrag.c
-+		$(srcdir)/e2undo.c $(srcdir)/e2freefrag.c $(srcdir)/create_inode.c
- 
- LIBS= $(LIBEXT2FS) $(LIBCOM_ERR) 
- DEPLIBS= $(LIBEXT2FS) $(DEPLIBCOM_ERR)
-@@ -630,7 +632,7 @@ mke2fs.o: $(srcdir)/mke2fs.c $(top_builddir)/lib/config.h \
-  $(top_srcdir)/lib/ext2fs/ext2_ext_attr.h $(top_srcdir)/lib/ext2fs/bitops.h \
-  $(top_srcdir)/lib/e2p/e2p.h $(top_srcdir)/lib/ext2fs/ext2fs.h \
-  $(srcdir)/util.h profile.h prof_err.h $(top_srcdir)/version.h \
-- $(srcdir)/nls-enable.h $(top_srcdir)/lib/quota/mkquota.h \
-+ $(srcdir)/nls-enable.h $(top_srcdir)/lib/quota/mkquota.h $(srcdir)/create_inode.h\
-  $(top_srcdir)/lib/quota/quotaio.h $(top_srcdir)/lib/quota/dqblk_v2.h \
-  $(top_srcdir)/lib/quota/quotaio_tree.h $(top_srcdir)/lib/../e2fsck/dict.h
- chattr.o: $(srcdir)/chattr.c $(top_builddir)/lib/config.h \
-@@ -710,3 +712,7 @@ e2freefrag.o: $(srcdir)/e2freefrag.c $(top_builddir)/lib/config.h \
-  $(top_srcdir)/lib/ext2fs/ext2_io.h $(top_builddir)/lib/ext2fs/ext2_err.h \
-  $(top_srcdir)/lib/ext2fs/ext2_ext_attr.h $(top_srcdir)/lib/ext2fs/bitops.h \
-  $(srcdir)/e2freefrag.h
-+create_inode.o: $(srcdir)/create_inode.h $(srcdir)/create_inode.c \
-+ $(top_builddir)/lib/config.h $(top_srcdir)/lib/ext2fs/ext2fs.h \
-+ $(top_srcdir)/lib/et/com_err.h $(top_srcdir)/lib/e2p/e2p.h \
-+ $(srcdir)/nls-enable.h
-diff --git a/misc/mke2fs.c b/misc/mke2fs.c
-index 2e8ba60..578b62d 100644
---- a/misc/mke2fs.c
-+++ b/misc/mke2fs.c
-@@ -22,7 +22,6 @@
- #include <stdio.h>
- #include <string.h>
- #include <strings.h>
--#include <fcntl.h>
- #include <ctype.h>
- #include <time.h>
- #ifdef __linux__
-@@ -44,24 +43,19 @@ extern int optind;
- #include <errno.h>
- #endif
- #include <sys/ioctl.h>
--#include <sys/types.h>
--#include <sys/stat.h>
- #include <libgen.h>
- #include <limits.h>
- #include <blkid/blkid.h>
- 
- #include "ext2fs/ext2_fs.h"
- #include "ext2fs/ext2fsP.h"
--#include "et/com_err.h"
- #include "uuid/uuid.h"
--#include "e2p/e2p.h"
--#include "ext2fs/ext2fs.h"
- #include "util.h"
- #include "profile.h"
- #include "prof_err.h"
- #include "../version.h"
--#include "nls-enable.h"
- #include "quota/mkquota.h"
-+#include "create_inode.h"
- 
- #define STRIDE_LENGTH 8
- 
-@@ -105,6 +99,7 @@ static char *mount_dir;
- char *journal_device;
- static int sync_kludge;	/* Set using the MKE2FS_SYNC env. option */
- static char **fs_types;
-+const char *root_dir;  /* Copy files from the specified directory */
- 
- static profile_t	profile;
- 
-@@ -116,7 +111,8 @@ static void usage(void)
- 	fprintf(stderr, _("Usage: %s [-c|-l filename] [-b block-size] "
- 	"[-C cluster-size]\n\t[-i bytes-per-inode] [-I inode-size] "
- 	"[-J journal-options]\n"
--	"\t[-G flex-group-size] [-N number-of-inodes]\n"
-+	"\t[-G flex-group-size] [-N number-of-inodes] "
-+	"[-d root-directory]\n"
- 	"\t[-m reserved-blocks-percentage] [-o creator-os]\n"
- 	"\t[-g blocks-per-group] [-L volume-label] "
- 	"[-M last-mounted-directory]\n\t[-O feature[,...]] "
-@@ -1394,7 +1390,7 @@ profile_error:
- 	}
- 
- 	while ((c = getopt (argc, argv,
--		    "b:cg:i:jl:m:no:qr:s:t:vC:DE:FG:I:J:KL:M:N:O:R:ST:U:V")) != EOF) {
-+		    "b:cg:i:jl:m:no:qr:s:t:d:vC:DE:FG:I:J:KL:M:N:O:R:ST:U:V")) != EOF) {
- 		switch (c) {
- 		case 'b':
- 			blocksize = parse_num_blocks2(optarg, -1);
-@@ -1582,6 +1578,9 @@ profile_error:
- 		case 'U':
- 			fs_uuid = optarg;
- 			break;
-+		case 'd':
-+			root_dir = optarg;
-+			break;
- 		case 'v':
- 			verbose = 1;
- 			break;
-@@ -2726,6 +2725,21 @@ no_journal:
- 				       EXT4_FEATURE_RO_COMPAT_QUOTA))
- 		create_quota_inodes(fs);
- 
-+	/* Copy files from the specified directory */
-+	if (root_dir) {
-+		if (!quiet)
-+			printf("%s", _("Copying files into the device: "));
-+
-+		current_fs = fs;
-+		root = EXT2_ROOT_INO;
-+		retval = populate_fs(root, root_dir);
-+		if (retval)
-+			fprintf(stderr, "%s",
-+				_("\nError while populating file system"));
-+		else if (!quiet)
-+			printf("%s", _("done\n"));
-+	}
-+
- 	if (!quiet)
- 		printf("%s", _("Writing superblocks and "
- 		       "filesystem accounting information: "));
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0009-misc-create_inode.c-handle-hardlinks.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0009-misc-create_inode.c-handle-hardlinks.patch
deleted file mode 100644
index a330ee4..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0009-misc-create_inode.c-handle-hardlinks.patch
+++ /dev/null
@@ -1,210 +0,0 @@
-From d83dc950b3ec1fbde33b23d42c5154091a74f4d9 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 23 Dec 2013 03:44:03 -0500
-Subject: [PATCH 09/11] misc/create_inode.c: handle hardlinks
-
-Create the inode and save the native inode number when we meet the hard
-link (st_nlink > 1) at the first time, use ext2fs_link() to link the
-name to the target inode number when we meet the same native inode
-number again.
-
-This algorithm is referred from the genext2fs.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- misc/create_inode.c |   88 +++++++++++++++++++++++++++++++++++++++++++++++++++
- misc/create_inode.h |   18 +++++++++++
- misc/mke2fs.c       |   12 +++++++
- 3 files changed, 118 insertions(+)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index aad7354..763504d 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -18,6 +18,44 @@
- #define S_BLKSIZE 512
- #endif
- 
-+/* For saving the hard links */
-+int hdlink_cnt = HDLINK_CNT;
-+
-+/* Link an inode number to a directory */
-+static errcode_t add_link(ext2_ino_t parent_ino, ext2_ino_t ino, const char *name)
-+{
-+	struct ext2_inode	inode;
-+	errcode_t		retval;
-+
-+	retval = ext2fs_read_inode(current_fs, ino, &inode);
-+        if (retval) {
-+		com_err(__func__, retval, "while reading inode %u", ino);
-+		return retval;
-+	}
-+
-+	retval = ext2fs_link(current_fs, parent_ino, name, ino, inode.i_flags);
-+	if (retval == EXT2_ET_DIR_NO_SPACE) {
-+		retval = ext2fs_expand_dir(current_fs, parent_ino);
-+		if (retval) {
-+			com_err(__func__, retval, "while expanding directory");
-+			return retval;
-+		}
-+		retval = ext2fs_link(current_fs, parent_ino, name, ino, inode.i_flags);
-+	}
-+	if (retval) {
-+		com_err(__func__, retval, "while linking %s", name);
-+		return retval;
-+	}
-+
-+	inode.i_links_count++;
-+
-+	retval = ext2fs_write_inode(current_fs, ino, &inode);
-+	if (retval)
-+		com_err(__func__, retval, "while writing inode %u", ino);
-+
-+	return retval;
-+}
-+
- /* Fill the uid, gid, mode and time for the inode */
- static void fill_inode(struct ext2_inode *inode, struct stat *st)
- {
-@@ -278,6 +316,17 @@ fail:
- 	return retval;
- }
- 
-+int is_hardlink(ext2_ino_t ino)
-+{
-+	int i;
-+
-+	for(i = 0; i < hdlinks.count; i++) {
-+		if(hdlinks.hdl[i].src_ino == ino)
-+			return i;
-+	}
-+	return -1;
-+}
-+
- /* Copy the native file to the fs */
- errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest)
- {
-@@ -388,9 +437,11 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
- 	struct dirent	*dent;
- 	struct stat	st;
- 	char		ln_target[PATH_MAX];
-+	unsigned int	save_inode;
- 	ext2_ino_t	ino;
- 	errcode_t	retval;
- 	int		read_cnt;
-+	int		hdlink;
- 
- 	root = EXT2_ROOT_INO;
- 
-@@ -412,6 +463,22 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
- 		lstat(dent->d_name, &st);
- 		name = dent->d_name;
- 
-+		/* Check for hardlinks */
-+		save_inode = 0;
-+		if (!S_ISDIR(st.st_mode) && !S_ISLNK(st.st_mode) && st.st_nlink > 1) {
-+			hdlink = is_hardlink(st.st_ino);
-+			if (hdlink >= 0) {
-+				retval = add_link(parent_ino,
-+						hdlinks.hdl[hdlink].dst_ino, name);
-+				if (retval) {
-+					com_err(__func__, retval, "while linking %s", name);
-+					return retval;
-+				}
-+				continue;
-+			} else
-+				save_inode = 1;
-+		}
-+
- 		switch(st.st_mode & S_IFMT) {
- 			case S_IFCHR:
- 			case S_IFBLK:
-@@ -480,6 +547,27 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
- 				_("while setting inode for \"%s\""), name);
- 			return retval;
- 		}
-+
-+		/* Save the hardlink ino */
-+		if (save_inode) {
-+			/*
-+			 * Check whether need more memory, and we don't need
-+			 * free() since the lifespan will be over after the fs
-+			 * populated.
-+			 */
-+			if (hdlinks.count == hdlink_cnt) {
-+				if ((hdlinks.hdl = realloc (hdlinks.hdl,
-+						(hdlink_cnt + HDLINK_CNT) *
-+						sizeof (struct hdlink_s))) == NULL) {
-+					com_err(name, errno, "Not enough memory");
-+					return errno;
-+				}
-+				hdlink_cnt += HDLINK_CNT;
-+			}
-+			hdlinks.hdl[hdlinks.count].src_ino = st.st_ino;
-+			hdlinks.hdl[hdlinks.count].dst_ino = ino;
-+			hdlinks.count++;
-+		}
- 	}
- 	closedir(dh);
- 	return retval;
-diff --git a/misc/create_inode.h b/misc/create_inode.h
-index 9fc97fa..2b6d429 100644
---- a/misc/create_inode.h
-+++ b/misc/create_inode.h
-@@ -6,9 +6,27 @@
- #include "ext2fs/ext2fs.h"
- #include "nls-enable.h"
- 
-+struct hdlink_s
-+{
-+	ext2_ino_t src_ino;
-+	ext2_ino_t dst_ino;
-+};
-+
-+struct hdlinks_s
-+{
-+	int count;
-+	struct hdlink_s *hdl;
-+};
-+
-+struct hdlinks_s hdlinks;
-+
- ext2_filsys    current_fs;
- ext2_ino_t     root;
- 
-+/* For saving the hard links */
-+#define HDLINK_CNT     4
-+extern int hdlink_cnt;
-+
- /* For populating the filesystem */
- extern errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir);
- extern errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st);
-diff --git a/misc/mke2fs.c b/misc/mke2fs.c
-index 578b62d..a63f0b7 100644
---- a/misc/mke2fs.c
-+++ b/misc/mke2fs.c
-@@ -2730,6 +2730,18 @@ no_journal:
- 		if (!quiet)
- 			printf("%s", _("Copying files into the device: "));
- 
-+		/*
-+		 * Allocate memory for the hardlinks, we don't need free()
-+		 * since the lifespan will be over after the fs populated.
-+		 */
-+		if ((hdlinks.hdl = (struct hdlink_s *)
-+				malloc(hdlink_cnt * sizeof(struct hdlink_s))) == NULL) {
-+			fprintf(stderr, "%s", _("\nNot enough memory\n"));
-+			retval = ext2fs_close(fs);
-+			return retval;
-+		}
-+
-+		hdlinks.count = 0;
- 		current_fs = fs;
- 		root = EXT2_ROOT_INO;
- 		retval = populate_fs(root, root_dir);
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0010-debugfs-use-the-functions-in-misc-create_inode.c.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0010-debugfs-use-the-functions-in-misc-create_inode.c.patch
deleted file mode 100644
index 2a6ca8f..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0010-debugfs-use-the-functions-in-misc-create_inode.c.patch
+++ /dev/null
@@ -1,496 +0,0 @@
-From db89992fab2215f52dce4c595a39271b4ff3000b Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 23 Dec 2013 04:22:22 -0500
-Subject: [PATCH 10/11] debugfs: use the functions in misc/create_inode.c
-
-* Use the functions in misc/create_inode.c, and remove the duplicated
-  code.
-
-* The CREATE_INODE_DEPS in the debugfs/Makefile.in is used for recording
-  create_inode.o's depends which is from misc/Makefile.in, we have to
-  recompile create_inode.o because we need it to print more messages when
-  it is used by debugfs, just like we recompile e2freefrag.o, but it seems
-  that the e2freefrag.o's depends in debugfs/Makefile.in is incorrect, it
-  would not rebuild when its depends (e.g.: lib/config.h) is changed,
-  which would cause unexpected errors. Make duplicated code in
-  debugfs/Makefile.in and misc/Makefile.in is not a good idea, maybe we'd
-  better define CREATE_INODE_DEPS in the top Makefile, I'd like to send
-  another patch and fix the e2freefrag if you are fine with it.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- debugfs/Makefile.in |   17 ++-
- debugfs/debugfs.c   |  305 +++------------------------------------------------
- debugfs/debugfs.h   |    1 +
- 3 files changed, 31 insertions(+), 292 deletions(-)
-
-diff --git a/debugfs/Makefile.in b/debugfs/Makefile.in
-index bf037e0..f51b78e 100644
---- a/debugfs/Makefile.in
-+++ b/debugfs/Makefile.in
-@@ -18,7 +18,7 @@ MK_CMDS=	_SS_DIR_OVERRIDE=../lib/ss ../lib/ss/mk_cmds
- 
- DEBUG_OBJS= debug_cmds.o debugfs.o util.o ncheck.o icheck.o ls.o \
- 	lsdel.o dump.o set_fields.o logdump.o htree.o unused.o e2freefrag.o \
--	filefrag.o extent_cmds.o extent_inode.o zap.o
-+	filefrag.o extent_cmds.o extent_inode.o zap.o create_inode.o
- 
- RO_DEBUG_OBJS= ro_debug_cmds.o ro_debugfs.o util.o ncheck.o icheck.o ls.o \
- 	lsdel.o logdump.o htree.o e2freefrag.o filefrag.o extent_cmds.o \
-@@ -28,7 +28,13 @@ SRCS= debug_cmds.c $(srcdir)/debugfs.c $(srcdir)/util.c $(srcdir)/ls.c \
- 	$(srcdir)/ncheck.c $(srcdir)/icheck.c $(srcdir)/lsdel.c \
- 	$(srcdir)/dump.c $(srcdir)/set_fields.c ${srcdir}/logdump.c \
- 	$(srcdir)/htree.c $(srcdir)/unused.c ${srcdir}/../misc/e2freefrag.c \
--	$(srcdir)/filefrag.c $(srcdir)/extent_inode.c $(srcdir)/zap.c
-+	$(srcdir)/filefrag.c $(srcdir)/extent_inode.c $(srcdir)/zap.c \
-+	$(srcdir)/../misc/create_inode.c
-+
-+CREATE_INODE_DEPS= $(srcdir)/../misc/create_inode.h \
-+	$(srcdir)/../misc/create_inode.c $(top_builddir)/lib/config.h \
-+	$(srcdir)/../lib/ext2fs/ext2fs.h $(srcdir)/../lib/et/com_err.h \
-+	$(srcdir)/../lib/e2p/e2p.h $(srcdir)/../misc/nls-enable.h
- 
- LIBS= $(LIBEXT2FS) $(LIBE2P) $(LIBSS) $(LIBCOM_ERR) $(LIBBLKID) \
- 	$(LIBUUID)
-@@ -81,6 +87,11 @@ e2freefrag.o: $(srcdir)/../misc/e2freefrag.c
- 	$(E) "	CC $@"
- 	$(Q) $(CC) -c $(ALL_CFLAGS) -I$(srcdir) $< -DDEBUGFS -o $@
- 
-+create_inode.o: $(CREATE_INODE_DEPS)
-+	$(E) "	CC $@"
-+	$(Q) $(CC) -c $(ALL_CFLAGS) -I$(srcdir) \
-+		 $(srcdir)/../misc/create_inode.c -DDEBUGFS -o $@
-+
- debugfs.8: $(DEP_SUBSTITUTE) $(srcdir)/debugfs.8.in
- 	$(E) "	SUBST $@"
- 	$(Q) $(SUBSTITUTE_UPTIME) $(srcdir)/debugfs.8.in debugfs.8
-@@ -142,7 +153,7 @@ debugfs.o: $(srcdir)/debugfs.c $(top_srcdir)/lib/et/com_err.h \
-  $(top_srcdir)/lib/ext2fs/ext2_ext_attr.h $(top_srcdir)/lib/ext2fs/bitops.h \
-  $(top_srcdir)/lib/e2p/e2p.h $(top_srcdir)/version.h $(srcdir)/jfs_user.h \
-  $(top_srcdir)/lib/ext2fs/kernel-jbd.h $(top_srcdir)/lib/ext2fs/jfs_compat.h \
-- $(top_srcdir)/lib/ext2fs/kernel-list.h
-+ $(top_srcdir)/lib/ext2fs/kernel-list.h $(top_srcdir)/misc/util.h
- util.o: $(srcdir)/util.c $(srcdir)/debugfs.h \
-  $(top_srcdir)/lib/ext2fs/ext2_fs.h $(top_builddir)/lib/ext2fs/ext2_types.h \
-  $(top_srcdir)/lib/ext2fs/ext2fs.h $(top_srcdir)/lib/ext2fs/ext3_extents.h \
-diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
-index 9c215f7..62e9f44 100644
---- a/debugfs/debugfs.c
-+++ b/debugfs/debugfs.c
-@@ -25,8 +25,6 @@ extern char *optarg;
- #include <errno.h>
- #endif
- #include <fcntl.h>
--#include <sys/types.h>
--#include <sys/stat.h>
- 
- #include "debugfs.h"
- #include "uuid/uuid.h"
-@@ -41,22 +39,11 @@ extern char *optarg;
- #define BUFSIZ 8192
- #endif
- 
--/* 64KiB is the minimium blksize to best minimize system call overhead. */
--#ifndef IO_BUFSIZE
--#define IO_BUFSIZE 64*1024
--#endif
--
--/* Block size for `st_blocks' */
--#ifndef S_BLKSIZE
--#define S_BLKSIZE 512
--#endif
--
- ss_request_table *extra_cmds;
- const char *debug_prog_name;
- int sci_idx;
- 
--ext2_filsys	current_fs = NULL;
--ext2_ino_t	root, cwd;
-+ext2_ino_t	cwd;
- 
- static void open_filesystem(char *device, int open_flags, blk64_t superblock,
- 			    blk64_t blocksize, int catastrophic,
-@@ -1576,189 +1563,24 @@ void do_find_free_inode(int argc, char *argv[])
- }
- 
- #ifndef READ_ONLY
--static errcode_t copy_file(int fd, ext2_ino_t newfile, int bufsize, int make_holes)
--{
--	ext2_file_t	e2_file;
--	errcode_t	retval;
--	int		got;
--	unsigned int	written;
--	char		*buf;
--	char		*ptr;
--	char		*zero_buf;
--	int		cmp;
--
--	retval = ext2fs_file_open(current_fs, newfile,
--				  EXT2_FILE_WRITE, &e2_file);
--	if (retval)
--		return retval;
--
--	retval = ext2fs_get_mem(bufsize, &buf);
--	if (retval) {
--		com_err("copy_file", retval, "can't allocate buffer\n");
--		return retval;
--	}
--
--	/* This is used for checking whether the whole block is zero */
--	retval = ext2fs_get_memzero(bufsize, &zero_buf);
--	if (retval) {
--		com_err("copy_file", retval, "can't allocate buffer\n");
--		ext2fs_free_mem(&buf);
--		return retval;
--	}
--
--	while (1) {
--		got = read(fd, buf, bufsize);
--		if (got == 0)
--			break;
--		if (got < 0) {
--			retval = errno;
--			goto fail;
--		}
--		ptr = buf;
--
--		/* Sparse copy */
--		if (make_holes) {
--			/* Check whether all is zero */
--			cmp = memcmp(ptr, zero_buf, got);
--			if (cmp == 0) {
--				 /* The whole block is zero, make a hole */
--				retval = ext2fs_file_lseek(e2_file, got, EXT2_SEEK_CUR, NULL);
--				if (retval)
--					goto fail;
--				got = 0;
--			}
--		}
--
--		/* Normal copy */
--		while (got > 0) {
--			retval = ext2fs_file_write(e2_file, ptr,
--						   got, &written);
--			if (retval)
--				goto fail;
--
--			got -= written;
--			ptr += written;
--		}
--	}
--	ext2fs_free_mem(&buf);
--	ext2fs_free_mem(&zero_buf);
--	retval = ext2fs_file_close(e2_file);
--	return retval;
--
--fail:
--	ext2fs_free_mem(&buf);
--	ext2fs_free_mem(&zero_buf);
--	(void) ext2fs_file_close(e2_file);
--	return retval;
--}
--
--
- void do_write(int argc, char *argv[])
- {
--	int		fd;
--	struct stat	statbuf;
--	ext2_ino_t	newfile;
- 	errcode_t	retval;
--	struct ext2_inode inode;
--	int		bufsize = IO_BUFSIZE;
--	int		make_holes = 0;
- 
- 	if (common_args_process(argc, argv, 3, 3, "write",
- 				"<native file> <new file>", CHECK_FS_RW))
- 		return;
- 
--	fd = open(argv[1], O_RDONLY);
--	if (fd < 0) {
--		com_err(argv[1], errno, 0);
--		return;
--	}
--	if (fstat(fd, &statbuf) < 0) {
--		com_err(argv[1], errno, 0);
--		close(fd);
--		return;
--	}
--
--	retval = ext2fs_namei(current_fs, root, cwd, argv[2], &newfile);
--	if (retval == 0) {
--		com_err(argv[0], 0, "The file '%s' already exists\n", argv[2]);
--		close(fd);
--		return;
--	}
--
--	retval = ext2fs_new_inode(current_fs, cwd, 010755, 0, &newfile);
--	if (retval) {
-+	if ((retval = do_write_internal(cwd, argv[1], argv[2])))
- 		com_err(argv[0], retval, 0);
--		close(fd);
--		return;
--	}
--	printf("Allocated inode: %u\n", newfile);
--	retval = ext2fs_link(current_fs, cwd, argv[2], newfile,
--			     EXT2_FT_REG_FILE);
--	if (retval == EXT2_ET_DIR_NO_SPACE) {
--		retval = ext2fs_expand_dir(current_fs, cwd);
--		if (retval) {
--			com_err(argv[0], retval, "while expanding directory");
--			close(fd);
--			return;
--		}
--		retval = ext2fs_link(current_fs, cwd, argv[2], newfile,
--				     EXT2_FT_REG_FILE);
--	}
--	if (retval) {
--		com_err(argv[2], retval, 0);
--		close(fd);
--		return;
--	}
--        if (ext2fs_test_inode_bitmap2(current_fs->inode_map,newfile))
--		com_err(argv[0], 0, "Warning: inode already set");
--	ext2fs_inode_alloc_stats2(current_fs, newfile, +1, 0);
--	memset(&inode, 0, sizeof(inode));
--	inode.i_mode = (statbuf.st_mode & ~LINUX_S_IFMT) | LINUX_S_IFREG;
--	inode.i_atime = inode.i_ctime = inode.i_mtime =
--		current_fs->now ? current_fs->now : time(0);
--	inode.i_links_count = 1;
--	inode.i_size = statbuf.st_size;
--	if (current_fs->super->s_feature_incompat &
--	    EXT3_FEATURE_INCOMPAT_EXTENTS) {
--		int i;
--		struct ext3_extent_header *eh;
--
--		eh = (struct ext3_extent_header *) &inode.i_block[0];
--		eh->eh_depth = 0;
--		eh->eh_entries = 0;
--		eh->eh_magic = ext2fs_cpu_to_le16(EXT3_EXT_MAGIC);
--		i = (sizeof(inode.i_block) - sizeof(*eh)) /
--			sizeof(struct ext3_extent);
--		eh->eh_max = ext2fs_cpu_to_le16(i);
--		inode.i_flags |= EXT4_EXTENTS_FL;
--	}
--	if (debugfs_write_new_inode(newfile, &inode, argv[0])) {
--		close(fd);
--		return;
--	}
--	if (LINUX_S_ISREG(inode.i_mode)) {
--		if (statbuf.st_blocks < statbuf.st_size / S_BLKSIZE) {
--			make_holes = 1;
--			/*
--			 * Use I/O blocksize as buffer size when
--			 * copying sparse files.
--			 */
--			bufsize = statbuf.st_blksize;
--		}
--		retval = copy_file(fd, newfile, bufsize, make_holes);
--		if (retval)
--			com_err("copy_file", retval, 0);
--	}
--	close(fd);
- }
- 
- void do_mknod(int argc, char *argv[])
- {
- 	unsigned long	mode, major, minor;
--	ext2_ino_t	newfile;
- 	errcode_t 	retval;
--	struct ext2_inode inode;
- 	int		filetype, nr;
-+	struct stat	st;
- 
- 	if (check_fs_open(argv[0]))
- 		return;
-@@ -1767,115 +1589,50 @@ void do_mknod(int argc, char *argv[])
- 		com_err(argv[0], 0, "Usage: mknod <name> [p| [c|b] <major> <minor>]");
- 		return;
- 	}
-+
- 	mode = minor = major = 0;
- 	switch (argv[2][0]) {
- 		case 'p':
--			mode = LINUX_S_IFIFO;
--			filetype = EXT2_FT_FIFO;
-+			st.st_mode = S_IFIFO;
- 			nr = 3;
- 			break;
- 		case 'c':
--			mode = LINUX_S_IFCHR;
--			filetype = EXT2_FT_CHRDEV;
-+			st.st_mode = S_IFCHR;
- 			nr = 5;
- 			break;
- 		case 'b':
--			mode = LINUX_S_IFBLK;
--			filetype = EXT2_FT_BLKDEV;
-+			st.st_mode = S_IFBLK;
- 			nr = 5;
- 			break;
- 		default:
--			filetype = 0;
- 			nr = 0;
- 	}
-+
- 	if (nr == 5) {
- 		major = strtoul(argv[3], argv+3, 0);
- 		minor = strtoul(argv[4], argv+4, 0);
- 		if (major > 65535 || minor > 65535 || argv[3][0] || argv[4][0])
- 			nr = 0;
- 	}
-+
- 	if (argc != nr)
- 		goto usage;
--	if (check_fs_read_write(argv[0]))
--		return;
--	retval = ext2fs_new_inode(current_fs, cwd, 010755, 0, &newfile);
--	if (retval) {
-+
-+	st.st_rdev = makedev(major, minor);
-+	if ((retval = do_mknod_internal(cwd, argv[1], &st)))
- 		com_err(argv[0], retval, 0);
--		return;
--	}
--	printf("Allocated inode: %u\n", newfile);
--	retval = ext2fs_link(current_fs, cwd, argv[1], newfile, filetype);
--	if (retval == EXT2_ET_DIR_NO_SPACE) {
--		retval = ext2fs_expand_dir(current_fs, cwd);
--		if (retval) {
--			com_err(argv[0], retval, "while expanding directory");
--			return;
--		}
--		retval = ext2fs_link(current_fs, cwd, argv[1], newfile,
--				     filetype);
--	}
--	if (retval) {
--		com_err(argv[1], retval, 0);
--		return;
--	}
--        if (ext2fs_test_inode_bitmap2(current_fs->inode_map,newfile))
--		com_err(argv[0], 0, "Warning: inode already set");
--	ext2fs_inode_alloc_stats2(current_fs, newfile, +1, 0);
--	memset(&inode, 0, sizeof(inode));
--	inode.i_mode = mode;
--	inode.i_atime = inode.i_ctime = inode.i_mtime =
--		current_fs->now ? current_fs->now : time(0);
--	if ((major < 256) && (minor < 256)) {
--		inode.i_block[0] = major*256+minor;
--		inode.i_block[1] = 0;
--	} else {
--		inode.i_block[0] = 0;
--		inode.i_block[1] = (minor & 0xff) | (major << 8) | ((minor & ~0xff) << 12);
--	}
--	inode.i_links_count = 1;
--	if (debugfs_write_new_inode(newfile, &inode, argv[0]))
--		return;
- }
- 
- void do_mkdir(int argc, char *argv[])
- {
--	char	*cp;
--	ext2_ino_t	parent;
--	char	*name;
- 	errcode_t retval;
- 
- 	if (common_args_process(argc, argv, 2, 2, "mkdir",
- 				"<filename>", CHECK_FS_RW))
- 		return;
- 
--	cp = strrchr(argv[1], '/');
--	if (cp) {
--		*cp = 0;
--		parent = string_to_inode(argv[1]);
--		if (!parent) {
--			com_err(argv[1], ENOENT, 0);
--			return;
--		}
--		name = cp+1;
--	} else {
--		parent = cwd;
--		name = argv[1];
--	}
--
--try_again:
--	retval = ext2fs_mkdir(current_fs, parent, 0, name);
--	if (retval == EXT2_ET_DIR_NO_SPACE) {
--		retval = ext2fs_expand_dir(current_fs, parent);
--		if (retval) {
--			com_err(argv[0], retval, "while expanding directory");
--			return;
--		}
--		goto try_again;
--	}
--	if (retval) {
--		com_err("ext2fs_mkdir", retval, 0);
--		return;
--	}
-+	if ((retval = do_mkdir_internal(cwd, argv[1], NULL)))
-+		com_err(argv[0], retval, 0);
- 
- }
- 
-@@ -2270,44 +2027,14 @@ void do_punch(int argc, char *argv[])
- 
- void do_symlink(int argc, char *argv[])
- {
--	char		*cp;
--	ext2_ino_t	parent;
--	char		*name, *target;
- 	errcode_t	retval;
- 
- 	if (common_args_process(argc, argv, 3, 3, "symlink",
- 				"<filename> <target>", CHECK_FS_RW))
- 		return;
- 
--	cp = strrchr(argv[1], '/');
--	if (cp) {
--		*cp = 0;
--		parent = string_to_inode(argv[1]);
--		if (!parent) {
--			com_err(argv[1], ENOENT, 0);
--			return;
--		}
--		name = cp+1;
--	} else {
--		parent = cwd;
--		name = argv[1];
--	}
--	target = argv[2];
--
--try_again:
--	retval = ext2fs_symlink(current_fs, parent, 0, name, target);
--	if (retval == EXT2_ET_DIR_NO_SPACE) {
--		retval = ext2fs_expand_dir(current_fs, parent);
--		if (retval) {
--			com_err(argv[0], retval, "while expanding directory");
--			return;
--		}
--		goto try_again;
--	}
--	if (retval) {
--		com_err("ext2fs_symlink", retval, 0);
--		return;
--	}
-+	if ((retval = do_symlink_internal(cwd, argv[1], argv[2])))
-+		com_err(argv[0], retval, 0);
- 
- }
- 
-diff --git a/debugfs/debugfs.h b/debugfs/debugfs.h
-index 6b4f6ef..2d464c1 100644
---- a/debugfs/debugfs.h
-+++ b/debugfs/debugfs.h
-@@ -5,6 +5,7 @@
- #include "ss/ss.h"
- #include "ext2fs/ext2_fs.h"
- #include "ext2fs/ext2fs.h"
-+#include "../misc/create_inode.h"
- 
- #ifdef __STDC__
- #define NOARGS void
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
deleted file mode 100644
index ddd2cb8..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 89fca439f1b58595f2f424598a27869f8c7bd815 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 23 Dec 2013 04:43:18 -0500
-Subject: [PATCH 11/11] mke2fs.8.in: update the manual for the -d option
-
-Update the manual for the -d option
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Reviewed-by: Darren Hart <dvhart@linux.intel.com>
----
- misc/mke2fs.8.in |    7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/misc/mke2fs.8.in b/misc/mke2fs.8.in
-index fea50da..b1ca486 100644
---- a/misc/mke2fs.8.in
-+++ b/misc/mke2fs.8.in
-@@ -52,6 +52,10 @@ mke2fs \- create an ext2/ext3/ext4 filesystem
- .I number-of-inodes
- ]
- [
-+.B \-d
-+.I root-directory
-+]
-+[
- .B \-n
- ]
- [
-@@ -502,6 +506,9 @@ the
- ratio).  This allows the user to specify the number
- of desired inodes directly.
- .TP
-+.BI \-d " root-directory"
-+Add the files from the root-directory to the filesystem.
-+.TP
- .BI \-o " creator-os"
- Overrides the default value of the "creator operating system" field of the
- filesystem.  The creator field is set by default to the name of the OS the
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch
deleted file mode 100644
index 0b8008d..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c6ff7feb9038d6e8aaffe2e69b205ad5fa33df2f Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Mon, 18 Aug 2014 21:02:56 +0200
-Subject: [PATCH] Fix musl build failures
-
-In lib/ext2fs/unix_io.c, __u64 should be used instead of __uint64_t. This type
-is guaranteed by the e2fsprogs build system.
-(795c02def3681a99cc792a5ebc162d06f8a1eeb7)
-
-In misc/create_inode.c, <limits.h> is needed for the definition of PATH_MAX.
-(bbccc6f3c6a106721fb6f1ef4df6bc32c7986235)
-
-Both of these fixes have been made upstream with the git commit IDs given but
-those are larger commits containing other changes not needed here.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-
-Upstream-Status: Backport
----
- lib/ext2fs/unix_io.c | 6 +++---
- misc/create_inode.c  | 1 +
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/lib/ext2fs/unix_io.c b/lib/ext2fs/unix_io.c
-index 19be630..0cc0f52 100644
---- a/lib/ext2fs/unix_io.c
-+++ b/lib/ext2fs/unix_io.c
-@@ -931,10 +931,10 @@ static errcode_t unix_discard(io_channel channel, unsigned long long block,
- 
- 	if (channel->flags & CHANNEL_FLAGS_BLOCK_DEVICE) {
- #ifdef BLKDISCARD
--		__uint64_t range[2];
-+		__u64 range[2];
- 
--		range[0] = (__uint64_t)(block) * channel->block_size;
--		range[1] = (__uint64_t)(count) * channel->block_size;
-+		range[0] = (__u64)(block) * channel->block_size;
-+		range[1] = (__u64)(count) * channel->block_size;
- 
- 		ret = ioctl(data->dev, BLKDISCARD, &range);
- #else
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 6d8de04..fcec5aa 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -1,4 +1,5 @@
- #include "create_inode.h"
-+#include <limits.h>
- 
- #if __STDC_VERSION__ < 199901L
- # if __GNUC__ >= 2
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
deleted file mode 100644
index 5b6346b..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From f66e6ce4446738c2c7f43d41988a3eb73347e2f5 Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Sat, 9 Aug 2014 12:24:54 -0400
-Subject: libext2fs: avoid buffer overflow if s_first_meta_bg is too big
-
-If s_first_meta_bg is greater than the of number block group
-descriptor blocks, then reading or writing the block group descriptors
-will end up overruning the memory buffer allocated for the
-descriptors.  Fix this by limiting first_meta_bg to no more than
-fs->desc_blocks.  This doesn't correct the bad s_first_meta_bg value,
-but it avoids causing the e2fsprogs userspace programs from
-potentially crashing.
-
-Upstream-Status: Backport
-CVE: CVE-2015-0247
-
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
-
-diff --git a/lib/ext2fs/closefs.c b/lib/ext2fs/closefs.c
-index 4599eef..1f99113 100644
---- a/lib/ext2fs/closefs.c
-+++ b/lib/ext2fs/closefs.c
-@@ -344,9 +344,11 @@ errcode_t ext2fs_flush2(ext2_filsys fs, int flags)
- 	 * superblocks and group descriptors.
- 	 */
- 	group_ptr = (char *) group_shadow;
--	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG)
-+	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG) {
- 		old_desc_blocks = fs->super->s_first_meta_bg;
--	else
-+		if (old_desc_blocks > fs->super->s_first_meta_bg)
-+			old_desc_blocks = fs->desc_blocks;
-+	} else
- 		old_desc_blocks = fs->desc_blocks;
- 
- 	ext2fs_numeric_progress_init(fs, &progress, NULL,
-diff --git a/lib/ext2fs/openfs.c b/lib/ext2fs/openfs.c
-index a1a3517..ba501e6 100644
---- a/lib/ext2fs/openfs.c
-+++ b/lib/ext2fs/openfs.c
-@@ -378,9 +378,11 @@ errcode_t ext2fs_open2(const char *name, const char *io_options,
- #ifdef WORDS_BIGENDIAN
- 	groups_per_block = EXT2_DESC_PER_BLOCK(fs->super);
- #endif
--	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG)
-+	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG) {
- 		first_meta_bg = fs->super->s_first_meta_bg;
--	else
-+		if (first_meta_bg > fs->desc_blocks)
-+			first_meta_bg = fs->desc_blocks;
-+	} else
- 		first_meta_bg = fs->desc_blocks;
- 	if (first_meta_bg) {
- 		retval = io_channel_read_blk(fs->io, group_block +
--- 
-cgit v0.10.2
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch
deleted file mode 100644
index f9ef8e5..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-The comment to this function says:
-
-"""
-  * Stupid algorithm --- we now just search forward starting from the
-  * goal.  Should put in a smarter one someday....
-"""
-
-This adds in a rather hacky algorthim which starts where we finished
-searching previously using a static variable rather than starting 
-from scratch if a hint isn't provided.
-
-This was after noticing that mkfs.ext4 -F X -d Y was spending *lots*
-of time in ext2fs_new_block2 called from ext2fs_bmap from ext2fs_file_write().
-
-Numbers wise, this took a core-image-sato-sdk mkfs time from over 
-8 minutes to around 35 seconds.
-
-Upstream-Status: Pending
-
-RP 2015/02/20
-
-Index: e2fsprogs-1.42.9/lib/ext2fs/alloc.c
-===================================================================
---- e2fsprogs-1.42.9.orig/lib/ext2fs/alloc.c
-+++ e2fsprogs-1.42.9/lib/ext2fs/alloc.c
-@@ -160,6 +160,8 @@ errcode_t ext2fs_new_inode(ext2_filsys f
- 	return 0;
- }
- 
-+static blk64_t last_goal = 0;
-+
- /*
-  * Stupid algorithm --- we now just search forward starting from the
-  * goal.  Should put in a smarter one someday....
-@@ -170,6 +172,9 @@ errcode_t ext2fs_new_block2(ext2_filsys
- 	blk64_t	i;
- 	int	c_ratio;
- 
-+        if (!goal)
-+            goal = last_goal;
-+
- 	EXT2_CHECK_MAGIC(fs, EXT2_ET_MAGIC_EXT2FS_FILSYS);
- 
- 	if (!map)
-@@ -194,6 +199,7 @@ errcode_t ext2fs_new_block2(ext2_filsys
- 
- 		if (!ext2fs_fast_test_block_bitmap2(map, i)) {
- 			*ret = i;
-+			last_goal = i;
- 			return 0;
- 		}
- 		i = (i + c_ratio) & ~(c_ratio - 1);
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in-create-hardlinks-with-the-correct-directory-.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in-create-hardlinks-with-the-correct-directory-.patch
deleted file mode 100644
index f549693..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in-create-hardlinks-with-the-correct-directory-.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 2dcf8e92bc39e05b3c799f53fe911c024aee4375 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Fri, 23 Oct 2015 03:21:05 -0700
-Subject: [PATCH] copy-in: create hardlinks with the correct directory
- filetype
-
-When we're creating hard links via ext2fs_link, the (misnamed?) flags
-argument specifies the filetype for the directory entry.  This is
-*derived* from i_mode, so provide a translator.  Otherwise, fsck will
-complain about unset file types.
-
-Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- misc/create_inode.c |   33 +++++++++++++++++++++++++++++++--
- 1 file changed, 31 insertions(+), 2 deletions(-)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index fcec5aa..b8565da 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -22,6 +22,33 @@
- /* For saving the hard links */
- int hdlink_cnt = HDLINK_CNT;
- 
-+static int ext2_file_type(unsigned int mode)
-+{
-+	if (LINUX_S_ISREG(mode))
-+		return EXT2_FT_REG_FILE;
-+
-+	if (LINUX_S_ISDIR(mode))
-+		return EXT2_FT_DIR;
-+
-+	if (LINUX_S_ISCHR(mode))
-+		return EXT2_FT_CHRDEV;
-+
-+	if (LINUX_S_ISBLK(mode))
-+		return EXT2_FT_BLKDEV;
-+
-+	if (LINUX_S_ISLNK(mode))
-+		return EXT2_FT_SYMLINK;
-+
-+	if (LINUX_S_ISFIFO(mode))
-+		return EXT2_FT_FIFO;
-+
-+	if (LINUX_S_ISSOCK(mode))
-+		return EXT2_FT_SOCK;
-+
-+	return 0;
-+}
-+
-+
- /* Link an inode number to a directory */
- static errcode_t add_link(ext2_ino_t parent_ino, ext2_ino_t ino, const char *name)
- {
-@@ -34,14 +61,16 @@ static errcode_t add_link(ext2_ino_t parent_ino, ext2_ino_t ino, const char *nam
- 		return retval;
- 	}
- 
--	retval = ext2fs_link(current_fs, parent_ino, name, ino, inode.i_flags);
-+	retval = ext2fs_link(current_fs, parent_ino, name, ino,
-+	             ext2_file_type(inode.i_mode));
- 	if (retval == EXT2_ET_DIR_NO_SPACE) {
- 		retval = ext2fs_expand_dir(current_fs, parent_ino);
- 		if (retval) {
- 			com_err(__func__, retval, "while expanding directory");
- 			return retval;
- 		}
--		retval = ext2fs_link(current_fs, parent_ino, name, ino, inode.i_flags);
-+		retval = ext2fs_link(current_fs, parent_ino, name, ino,
-+	                     ext2_file_type(inode.i_mode));
- 	}
- 	if (retval) {
- 		com_err(__func__, retval, "while linking %s", name);
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
deleted file mode 100644
index d38cc4d..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-inode.c: only update the icache for ext2_inode
-
-We only read the cache when:
-
-bufsize == sizeof(struct ext2_inode)
-
-then we should only update the cache in the same condition, otherwise
-there would be errors, for example:
-
-cache[0]: cached ino 14 when bufsize = 128 by ext2fs_write_inode_full()
-cache[1]: cached ino 14 when bufsize = 156 by ext2fs_read_inode_full()
-
-Then update the cache:
-cache[0]: cached ino 15 when bufsize = 156 by ext2fs_read_inode_full()
-
-Then the ino 14 would hit the cache[1] when bufsize = 128 (but it was
-cached by bufsize = 156), so there would be errors.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- lib/ext2fs/inode.c | 20 ++++++++++++--------
- 1 file changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/lib/ext2fs/inode.c b/lib/ext2fs/inode.c
---- a/lib/ext2fs/inode.c
-+++ b/lib/ext2fs/inode.c
-@@ -612,10 +612,12 @@ errcode_t ext2fs_read_inode_full(ext2_filsys fs, ext2_ino_t ino,
- #endif
- 
- 	/* Update the inode cache */
--	fs->icache->cache_last = (fs->icache->cache_last + 1) %
--		fs->icache->cache_size;
--	fs->icache->cache[fs->icache->cache_last].ino = ino;
--	fs->icache->cache[fs->icache->cache_last].inode = *inode;
-+	if (bufsize == sizeof(struct ext2_inode)) {
-+		fs->icache->cache_last = (fs->icache->cache_last + 1) %
-+			fs->icache->cache_size;
-+		fs->icache->cache[fs->icache->cache_last].ino = ino;
-+		fs->icache->cache[fs->icache->cache_last].inode = *inode;
-+	}
- 
- 	return 0;
- }
-@@ -648,10 +650,12 @@ errcode_t ext2fs_write_inode_full(ext2_filsys fs, ext2_ino_t ino,
- 
- 	/* Check to see if the inode cache needs to be updated */
- 	if (fs->icache) {
--		for (i=0; i < fs->icache->cache_size; i++) {
--			if (fs->icache->cache[i].ino == ino) {
--				fs->icache->cache[i].inode = *inode;
--				break;
-+		if (bufsize == sizeof(struct ext2_inode)) {
-+			for (i=0; i < fs->icache->cache_size; i++) {
-+				if (fs->icache->cache[i].ino == ino) {
-+					fs->icache->cache[i].inode = *inode;
-+					break;
-+				}
- 			}
- 		}
- 	} else {
--- 
-1.8.1.2
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
deleted file mode 100644
index cba0ce0..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e4ffd6fe975888d306b5f700ba54af18b59f6759 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 20 Mar 2014 11:10:21 +0800
-Subject: [PATCH] misc/mke2fs.c: return error when failed to populate filesystem
-
-We need return retval when "mke2fs -d" failed, otherwise the "$?" would
-be 0 which is misleading.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- misc/mke2fs.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/misc/mke2fs.c b/misc/mke2fs.c
-index a63f0b7..846190e 100644
---- a/misc/mke2fs.c
-+++ b/misc/mke2fs.c
-@@ -2745,10 +2745,11 @@ no_journal:
- 		current_fs = fs;
- 		root = EXT2_ROOT_INO;
- 		retval = populate_fs(root, root_dir);
--		if (retval)
-+		if (retval) {
- 			fprintf(stderr, "%s",
--				_("\nError while populating file system"));
--		else if (!quiet)
-+				_("\nError while populating file system\n"));
-+			return retval;
-+		} else if (!quiet)
- 			printf("%s", _("done\n"));
- 	}
- 
--- 
-1.8.3.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch
index aa7a298..2a3aeff 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch
@@ -2,29 +2,17 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Mei Lei <lei.mei@intel.com>
 
-Index: e2fsprogs-1.41.5/po/Makefile.in.in
-===================================================================
---- e2fsprogs-1.41.5.orig/po/Makefile.in.in	2009-02-14 13:49:08.000000000 +0000
-+++ e2fsprogs-1.41.5/po/Makefile.in.in	2009-08-19 17:52:31.000000000 +0100
-@@ -30,7 +30,7 @@
- INSTALL = @INSTALL@
- INSTALL_DATA = @INSTALL_DATA@
- MKINSTALLDIRS = @MKINSTALLDIRS@
--mkinstalldirs = $(SHELL) $(MKINSTALLDIRS)
-+mkinstalldirs = $(MKINSTALLDIRS)
- 
- GMSGFMT = @GMSGFMT@
- MSGFMT = @MSGFMT@
-Index: e2fsprogs-1.41.5/configure.in
-===================================================================
---- e2fsprogs-1.41.5.orig/configure.in	2009-08-19 17:53:50.000000000 +0100
-+++ e2fsprogs-1.41.5/configure.in	2009-08-19 17:48:38.000000000 +0100
-@@ -970,6 +970,8 @@
+diff --git a/configure.ac b/configure.ac
+index c1fe224..f5ac628 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1374,7 +1374,8 @@ if test -n "$WITH_DIET_LIBC" ; then
+ 	INCLUDES="$INCLUDES -D_REENTRANT"
  fi
- AC_SUBST(BUILD_CFLAGS)
- AC_SUBST(BUILD_LDFLAGS)
+ AC_SUBST(INCLUDES)
+-AM_MKINSTALLDIRS
 +MKINSTALLDIRS="mkdir -p"
 +AC_SUBST(MKINSTALLDIRS)
  dnl
- dnl Make our output files, being sure that we create the some miscellaneous 
- dnl directories
+ dnl Build CFLAGS
+ dnl
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index b8a53e9..ef1ce58 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,17 +1,17 @@
-Index: e2fsprogs-1.42.9/tests/Makefile.in
-===================================================================
---- e2fsprogs-1.42.9.orig/tests/Makefile.in
-+++ e2fsprogs-1.42.9/tests/Makefile.in
-@@ -18,7 +18,7 @@ test_one: $(srcdir)/test_one.in Makefile
+diff --git a/tests/Makefile.in b/tests/Makefile.in
+index 60cf655..ce220f1 100644
+--- a/tests/Makefile.in
++++ b/tests/Makefile.in
+@@ -18,7 +18,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
  	@echo "#!/bin/sh" > test_one
- @HTREE_CMT@	@echo "HTREE=y" >> test_one
- @QUOTA_CMT@	@echo "QUOTA=y" >> test_one
+ 	@echo "HTREE=y" >> test_one
+ 	@echo "QUOTA=y" >> test_one
 -	@echo "SRCDIR=@srcdir@" >> test_one
 +	@echo "SRCDIR=/usr/lib/e2fsprogs/ptest/test" >> test_one
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
  	@cat $(srcdir)/test_one.in >> test_one
  	@chmod +x test_one
-@@ -26,7 +26,7 @@ test_one: $(srcdir)/test_one.in Makefile
+@@ -26,7 +26,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
  test_script: test_one test_script.in Makefile mke2fs.conf
  	@echo "Creating test_script..."
  	@echo "#!/bin/sh" > test_script
@@ -20,11 +20,11 @@ Index: e2fsprogs-1.42.9/tests/Makefile.in
  	@cat $(srcdir)/test_script.in >> test_script
  	@chmod +x test_script
  
-Index: e2fsprogs-1.42.9/tests/test_config
-===================================================================
---- e2fsprogs-1.42.9.orig/tests/test_config
-+++ e2fsprogs-1.42.9/tests/test_config
-@@ -3,23 +3,23 @@
+diff --git a/tests/test_config b/tests/test_config
+index 7f39157..c815a44 100644
+--- a/tests/test_config
++++ b/tests/test_config
+@@ -3,24 +3,24 @@
  #
  
  unset LANG LANGUAGE LC_ADDRESS LC_ALL LC_COLLATE LC_CTYPE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME PAGER
@@ -54,13 +54,14 @@ Index: e2fsprogs-1.42.9/tests/test_config
 +RESIZE2FS_EXE="/sbin/resize2fs"
  RESIZE2FS="$USE_VALGRIND $RESIZE2FS_EXE"
 -E2UNDO_EXE="../misc/e2undo"
++E2UNDO_EXE="/sbin/e2undo"
+ E2UNDO="$USE_VALGRIND $E2UNDO_EXE"
 -TEST_REL=../tests/progs/test_rel
 -TEST_ICOUNT=../tests/progs/test_icount
 -CRCSUM=../tests/progs/crcsum
-+E2UNDO_EXE="/sbin/e2undo"
 +TEST_REL=./progs/test_rel
 +TEST_ICOUNT=./progs/test_icount
 +CRCSUM=./progs/crcsum
- LD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss
- DYLD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss
- export LD_LIBRARY_PATH
+ CLEAN_OUTPUT="sed -f $cmd_dir/filter.sed"
+ LD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${LD_LIBRARY_PATH}
+ DYLD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${DYLD_LIBRARY_PATH}
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
similarity index 61%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index ce7d2e8..d57d619 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -1,35 +1,20 @@
 require e2fsprogs.inc
 
-RECIPE_NO_UPDATE_REASON = "Updating backported patches to 1.42.13 is too much pain. Let's wait until 1.43 is released."
-
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
-            file://fix-icache.patch \
             file://quiet-debugfs.patch \
-            file://0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch \
-            file://0002-misc-create_inode.c-copy-files-recursively.patch \
-            file://0003-misc-create_inode.c-create-special-file.patch \
-            file://0004-misc-create_inode.c-create-symlink.patch \
-            file://0005-misc-create_inode.c-copy-regular-file.patch \
-            file://0006-misc-create_inode.c-create-directory.patch \
-            file://0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch \
-            file://0008-mke2fs.c-add-an-option-d-root-directory.patch \
-            file://0009-misc-create_inode.c-handle-hardlinks.patch \
-            file://0010-debugfs-use-the-functions-in-misc-create_inode.c.patch \
-            file://0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch \
-            file://0012-Fix-musl-build-failures.patch \
-            file://0001-e2fsprogs-fix-cross-compilation-problem.patch \
-            file://misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch \
-            file://cache_inode.patch \
-            file://CVE-2015-0247.patch \
-            file://0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch \
-            file://copy-in-create-hardlinks-with-the-correct-directory-.patch \
+            file://run-ptest \
+            file://ptest.patch \
+            file://mkdir.patch \
 "
 
-SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
-SRC_URI[sha256sum] = "2f92ac06e92fa00f2ada3ee67dad012d74d685537527ad1241d82f2d041f2802"
+SRCREV = "0f26747167cc9d82df849b0aad387bf824f04544"
+PV = "1.43-WIP+git${SRCPV}"
+
+EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
+                --enable-elf-shlibs --disable-libuuid --disable-uuidd \
+                --enable-libblkid --enable-verbose-makecmds"
 
-EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd --enable-verbose-makecmds"
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
 do_configure_prepend () {
@@ -84,10 +69,6 @@ FILES_libe2p = "${base_libdir}/libe2p.so.*"
 FILES_libext2fs = "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so.*"
 FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so"
 
-BBCLASSEXTEND = "native nativesdk"
-
-inherit update-alternatives
-
 ALTERNATIVE_${PN} = "chattr"
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINK_NAME[chattr] = "${base_bindir}/chattr"
@@ -99,12 +80,7 @@ ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
 ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
 ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
 
-inherit ptest
-SRC_URI += "file://run-ptest"
-SRC_URI += "file://ptest.patch"
-
-RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps"
-#RDEPENDS_${PN}-ptest += "expect"
+RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash"
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests
-- 
1.7.9.5



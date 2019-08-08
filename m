Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD5AE7F286
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 15:45:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x78FjGdo021624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 08:45:16 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 08:45:16 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2019 11:45:13 -0400
Message-ID: <20190808154513.146689-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: 1.44.5 -> 1.45.3
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
X-List-Received-Date: Thu, 08 Aug 2019 15:45:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update e2fsprogs from 1.44.5 to 1.45.3:
* rebase ptest.patch
* remove 0001-create_inode-fix-copying-large-files.patch which merged by upstream
* add new sub-package e2fsprogs-e2scrub and disable cron support

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...create_inode-fix-copying-large-files.patch | 50 -------------------
 .../e2fsprogs/e2fsprogs/ptest.patch           | 33 +++---------
 ...2fsprogs_1.44.5.bb => e2fsprogs_1.45.3.bb} | 10 ++--
 3 files changed, 14 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.44.5.bb => e2fsprogs_1.45.3.bb} (93%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch
deleted file mode 100644
index c89581dce8..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 674ab87b8338372338d20e21a350f88b4ff6c7c8 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Fri, 1 Feb 2019 10:59:59 +0000
-Subject: [PATCH] create_inode: fix copying large files
-
-When copying large files into a ext filesystem at mkfs time the copy fails at
-2^31 bytes in.  There are two problems:
-
-copy_file_chunk() passes an offset (off_t, 64-bit typically) to
-ext2fs_file_lseek() which expects a ext2_off_t (typedef to __u32) so the value
-is truncated. Solve by calling ext2fs_file_llseek() which takes a u64 offset
-instead.
-
-try_lseek_copy() rounds the data and hole offsets as found by lseek() to block
-boundaries, but the calculation gets truncated to 32-bits.  Solve by casting the
-32-bit blocksize to off_t to ensure this doesn't happen.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- misc/create_inode.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 05aa6363..f106dcda 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -438,7 +438,7 @@ static errcode_t copy_file_chunk(ext2_filsys fs, int fd, ext2_file_t e2_file,
- 				ptr += blen;
- 				continue;
- 			}
--			err = ext2fs_file_lseek(e2_file, off + bpos,
-+			err = ext2fs_file_llseek(e2_file, off + bpos,
- 						EXT2_SEEK_SET, NULL);
- 			if (err)
- 				goto fail;
-@@ -481,7 +481,7 @@ static errcode_t try_lseek_copy(ext2_filsys fs, int fd, struct stat *statbuf,
- 			return EXT2_ET_UNIMPLEMENTED;
- 
- 		data_blk = data & ~(fs->blocksize - 1);
--		hole_blk = (hole + (fs->blocksize - 1)) & ~(fs->blocksize - 1);
-+		hole_blk = (hole + (off_t)(fs->blocksize - 1)) & ~(off_t)(fs->blocksize - 1);
- 		err = copy_file_chunk(fs, fd, e2_file, data_blk, hole_blk, buf,
- 				      zerobuf);
- 		if (err)
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index 4e6b6292e1..c3e46ce65f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -5,11 +5,13 @@ Subject: [PATCH] e2fsprogs: add ptest
 
 Upstream-Status: Inappropriate
 
+Rebase for e2fsprogs 1.45.3.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- tests/Makefile.in    |  4 ++--
- tests/test_config    | 32 ++++++++++++++++----------------
- tests/test_script.in |  2 +-
- 3 files changed, 19 insertions(+), 19 deletions(-)
+ tests/Makefile.in |  4 ++--
+ tests/test_config | 32 ++++++++++++++++----------------
+ 2 files changed, 18 insertions(+), 18 deletions(-)
 
 diff --git a/tests/Makefile.in b/tests/Makefile.in
 index 8c4d2048..e021af32 100644
@@ -34,10 +36,10 @@ index 8c4d2048..e021af32 100644
  	@chmod +x-w test_script
  
 diff --git a/tests/test_config b/tests/test_config
-index 1f146ca2..05125f9c 100644
+index 9dc762ce..a5fbdef6 100644
 --- a/tests/test_config
 +++ b/tests/test_config
-@@ -3,16 +3,16 @@
+@@ -3,25 +3,25 @@
  #
  
  unset LANG LANGUAGE LC_ADDRESS LC_ALL LC_COLLATE LC_CTYPE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME PAGER
@@ -62,12 +64,6 @@ index 1f146ca2..05125f9c 100644
 +DEBUGFS="$USE_VALGRIND debugfs"
 +DEBUGFS_EXE="/sbin/debugfs"
  TEST_BITS="test_data.tmp"
- if [ ! -s $TEST_BITS ]; then
- 	# create a non-sparse test file if possible, since debugfs may be
-@@ -21,14 +21,14 @@ if [ ! -s $TEST_BITS ]; then
- 	dd if=/dev/urandom of=$TEST_BITS bs=128k count=1 > /dev/null 2>&1 ||
- 		TEST_BITS="$DEFBUGFS_EXE"
- fi
 -RESIZE2FS_EXE="../resize/resize2fs"
 +RESIZE2FS_EXE="/sbin/resize2fs"
  RESIZE2FS="$USE_VALGRIND $RESIZE2FS_EXE"
@@ -85,16 +81,3 @@ index 1f146ca2..05125f9c 100644
  CLEAN_OUTPUT="sed -f $cmd_dir/filter.sed"
  LD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${LD_LIBRARY_PATH}
  DYLD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${DYLD_LIBRARY_PATH}
-diff --git a/tests/test_script.in b/tests/test_script.in
-index 9959e308..442999db 100644
---- a/tests/test_script.in
-+++ b/tests/test_script.in
-@@ -39,7 +39,7 @@ for i; do
- done
- 
- if test "$TESTS"x = x ; then
--    if test -n "DO_FAILED"; then
-+    if test -n "$DO_FAILED"; then
- 	exit 0
-     fi
-     TESTS=`ls -d $SRCDIR/[a-zA-Z]_*`
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
similarity index 93%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
index 5cda89f59f..fdc9454b58 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
@@ -5,19 +5,19 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://ptest.patch \
             file://mkdir_p.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
-            file://0001-create_inode-fix-copying-large-files.patch \
             "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
                                 file://quiet-debugfs.patch \
 "
 
-SRCREV = "9a03c07e00f09a772245281d84a284c67e905148"
+SRCREV = "1f56fb81236fe3e25e2c60c1e89ea0aa7cb36260"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
                 --enable-elf-shlibs --disable-libuuid --disable-uuidd \
-                --disable-libblkid --enable-verbose-makecmds"
+                --disable-libblkid --enable-verbose-makecmds \
+                --with-crond-dir=no"
 
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
@@ -83,11 +83,12 @@ do_install_append_class-target() {
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
 RRECOMMENDS_e2fsprogs = "e2fsprogs-mke2fs e2fsprogs-e2fsck"
 
-PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks e2fsprogs-resize2fs"
+PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-e2scrub e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks e2fsprogs-resize2fs"
 PACKAGES =+ "libcomerr libss libe2p libext2fs"
 
 FILES_e2fsprogs-resize2fs = "${base_sbindir}/resize2fs*"
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
+FILES_e2fsprogs-e2scrub = "${base_sbindir}/e2scrub*"
 FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs.e2fsprogs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"
 FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs.e2fsprogs ${base_sbindir}/e2label"
 FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
@@ -112,6 +113,7 @@ ALTERNATIVE_LINK_NAME[mkfs.ext2] = "${base_sbindir}/mkfs.ext2"
 ALTERNATIVE_${PN}-tune2fs = "tune2fs"
 ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
 
+RDEPENDS_e2fsprogs-e2scrub = "bash"
 RDEPENDS_${PN}-ptest += "coreutils procps bash bzip2 diffutils perl sed"
 RDEPENDS_${PN}-ptest += "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks e2fsprogs-resize2fs"
 
-- 
2.20.0



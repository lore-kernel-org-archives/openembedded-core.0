Return-Path: <uol@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id B5DCD7ECB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 13:54:44 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hnNum-0007z2-Nk; Tue, 16 Jul 2019 15:54:44 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hnNum-00039G-1l; Tue, 16 Jul 2019 15:54:44 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2019 15:54:44 +0200
Message-Id: <20190716135444.12057-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>
Subject: [PATCH] squashfs-tools: upgrade to commit f95864afe883
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
X-List-Received-Date: Tue, 16 Jul 2019 13:54:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The master branch's current tip commit as of this writing is [1], see the
squashfs-tool's repo at [0].

Because of commits [2]-[4] which are included in the master branch three
corresponding patches are dropped as they are not needed anymore. The single
remaining patch was rebased on top of [1] to apply cleanly.

Commits [5] & [6] introduced interesting features, namely zstd support and
reproducibility of created SquashFS images. They are reflected in two new
PACKAGECONFIG options now.

[0] https://github.com/plougher/squashfs-tools.git
[1] f95864afe883 ("unsquashfs-4: Add more sanity checks + fix CVE-2015-4645/6")
[2] 46bdc1726e5a ("mksquashfs: Make a load of functions static")
[3] b0ca8a5c98ff ("pseudo.c: add explicit <sys/stat.h> include")
[4] f95864afe883 ("unsquashfs-4: Add more sanity checks + fix CVE-2015-4645/6")
[5] 6113361316d5 ("squashfs-tools: Add zstd support")
[6] e0d74d07bb35 ("Add configuration and Mksquashfs build options for
                   reproducible builds")

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 ...c-get-inline-functions-work-with-C99.patch | 154 ------------------
 ...shfs-tools-patch-for-CVE-2015-4645-6.patch |  47 ------
 .../squashfs-tools/fix-compat.patch           |  17 --
 .../squashfs-tools-4.3-sysmacros.patch        |   2 +-
 .../squashfs-tools/squashfs-tools_git.bb      |   9 +-
 5 files changed, 5 insertions(+), 224 deletions(-)
 delete mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-mksquashfs.c-get-inline-functions-work-with-C99.patch
 delete mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch
 delete mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-mksquashfs.c-get-inline-functions-work-with-C99.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-mksquashfs.c-get-inline-functions-work-with-C99.patch
deleted file mode 100644
index a5bab054486a..000000000000
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-mksquashfs.c-get-inline-functions-work-with-C99.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From ac6268e843c43286eebff2a1052182c2393cdb2e Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Mon, 14 Sep 2015 12:31:42 +0800
-Subject: [PATCH] mksquashfs.c:  get inline functions work with both gnu11 and gnu89
-
-Upstream-Status: Pending
-
-After gcc upgraded to gcc5, and if the codes is compiled without optimization(-O0),
-and the below error will happen:
-
-| mksquashfs.o: In function `create_inode':
-| git/squashfs-tools/mksquashfs.c:897: undefined reference to `get_inode_no'
-| git/squashfs-tools/mksquashfs.c:960: undefined reference to `get_parent_no'
-| git/squashfs-tools/mksquashfs.c:983: undefined reference to `get_parent_no'
-| mksquashfs.o: In function `reader_read_process':
-| git/squashfs-tools/mksquashfs.c:2132: undefined reference to `is_fragment'
-| mksquashfs.o: In function `reader_read_file':
-| git/squashfs-tools/mksquashfs.c:2228: undefined reference to `is_fragment'
-| mksquashfs.o: In function `dir_scan':
-| git/squashfs-tools/mksquashfs.c:3101: undefined reference to `create_dir_entry'
-
-gcc5 defaults to -std=gnu11 instead of -std=gnu89, and it requires that exactly one C
-source file has the callable copy of the inline function. Consider the following
-program:
-
-  inline int
-  foo (void)
-  {
-    return 42;
-  }
-
-  int
-  main (void)
-  {
-    return foo ();
-  }
-
-The program above will not link with the C99 inline semantics, because no out-of-line
-function foo is generated. To fix this, either mark the function foo as static, or
-add the following declaration:
-  static inline int foo (void);
-
-more information refer to: https://gcc.gnu.org/gcc-5/porting_to.html;
-
-but the use of "extern inline" will lead to the compilation issue if gcc is not
-gcc5, as the commit in oe-core d0af30c92fde [alsa-lib: Change function type to
-"static __inline__"]
-    "extern __inline__ function()" is the inlined version that
-    can be used in this compilation unit, but there will be another
-    definition of this function somewhere, so compiler will not emit
-    any code for the function body. This causes problem in -O0,
-    where functions are never inlined, the function call is preserved,
-    but linker can't find the symbol, thus the error happens.
-
-so replace "inline" with "static inline" to make it work with both gnu11 and gnu89
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- squashfs-tools/mksquashfs.c | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/squashfs-tools/mksquashfs.c b/squashfs-tools/mksquashfs.c
-index d221c35..6bba1d2 100644
---- a/squashfs-tools/mksquashfs.c
-+++ b/squashfs-tools/mksquashfs.c
-@@ -828,13 +828,13 @@ char *subpathname(struct dir_ent *dir_ent)
- }
- 
- 
--inline unsigned int get_inode_no(struct inode_info *inode)
-+static inline unsigned int get_inode_no(struct inode_info *inode)
- {
- 	return inode->inode_number;
- }
- 
- 
--inline unsigned int get_parent_no(struct dir_info *dir)
-+static inline unsigned int get_parent_no(struct dir_info *dir)
- {
- 	return dir->depth ? get_inode_no(dir->dir_ent->inode) : inode_no;
- }
-@@ -2027,7 +2027,7 @@ struct file_info *duplicate(long long file_size, long long bytes,
- }
- 
- 
--inline int is_fragment(struct inode_info *inode)
-+static inline int is_fragment(struct inode_info *inode)
- {
- 	off_t file_size = inode->buf.st_size;
- 
-@@ -2996,13 +2996,13 @@ struct inode_info *lookup_inode2(struct stat *buf, int pseudo, int id)
- }
- 
- 
--inline struct inode_info *lookup_inode(struct stat *buf)
-+static inline struct inode_info *lookup_inode(struct stat *buf)
- {
- 	return lookup_inode2(buf, 0, 0);
- }
- 
- 
--inline void alloc_inode_no(struct inode_info *inode, unsigned int use_this)
-+static inline void alloc_inode_no(struct inode_info *inode, unsigned int use_this)
- {
- 	if (inode->inode_number == 0) {
- 		inode->inode_number = use_this ? : inode_no ++;
-@@ -3013,7 +3013,7 @@ inline void alloc_inode_no(struct inode_info *inode, unsigned int use_this)
- }
- 
- 
--inline struct dir_ent *create_dir_entry(char *name, char *source_name,
-+static inline struct dir_ent *create_dir_entry(char *name, char *source_name,
- 	char *nonstandard_pathname, struct dir_info *dir)
- {
- 	struct dir_ent *dir_ent = malloc(sizeof(struct dir_ent));
-@@ -3031,7 +3031,7 @@ inline struct dir_ent *create_dir_entry(char *name, char *source_name,
- }
- 
- 
--inline void add_dir_entry(struct dir_ent *dir_ent, struct dir_info *sub_dir,
-+static inline void add_dir_entry(struct dir_ent *dir_ent, struct dir_info *sub_dir,
- 	struct inode_info *inode_info)
- {
- 	struct dir_info *dir = dir_ent->our_dir;
-@@ -3047,7 +3047,7 @@ inline void add_dir_entry(struct dir_ent *dir_ent, struct dir_info *sub_dir,
- }
- 
- 
--inline void add_dir_entry2(char *name, char *source_name,
-+static inline void add_dir_entry2(char *name, char *source_name,
- 	char *nonstandard_pathname, struct dir_info *sub_dir,
- 	struct inode_info *inode_info, struct dir_info *dir)
- {
-@@ -3059,7 +3059,7 @@ inline void add_dir_entry2(char *name, char *source_name,
- }
- 
- 
--inline void free_dir_entry(struct dir_ent *dir_ent)
-+static inline void free_dir_entry(struct dir_ent *dir_ent)
- {
- 	if(dir_ent->name)
- 		free(dir_ent->name);
-@@ -3080,7 +3080,7 @@ inline void free_dir_entry(struct dir_ent *dir_ent)
- }
- 
- 
--inline void add_excluded(struct dir_info *dir)
-+static inline void add_excluded(struct dir_info *dir)
- {
- 	dir->excluded ++;
- }
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch
deleted file mode 100644
index 2261ea94b75d..000000000000
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 3c0d67184d6edb63f3b7d6d5eb81531daa6388f3 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 28 Aug 2018 16:25:36 +0800
-Subject: [PATCH] squashfs-tools: patch for CVE-2015-4645(6)
-
-Upstream-Status: Backport[https://github.com/devttys0/sasquatch/pull/
-                 5/commits/6777e08cc38bc780d27c69c1d8c272867b74524f]
-
-CVE: CVE-2015-4645 CVE-2015-4646
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- squashfs-tools/unsquash-4.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/squashfs-tools/unsquash-4.c b/squashfs-tools/unsquash-4.c
-index ecdaac7..692ae25 100644
---- a/squashfs-tools/unsquash-4.c
-+++ b/squashfs-tools/unsquash-4.c
-@@ -31,9 +31,9 @@ static unsigned int *id_table;
- int read_fragment_table_4(long long *directory_table_end)
- {
- 	int res, i;
--	int bytes = SQUASHFS_FRAGMENT_BYTES(sBlk.s.fragments);
--	int  indexes = SQUASHFS_FRAGMENT_INDEXES(sBlk.s.fragments);
--	long long fragment_table_index[indexes];
-+	size_t bytes = SQUASHFS_FRAGMENT_BYTES(sBlk.s.fragments);
-+	size_t indexes = SQUASHFS_FRAGMENT_INDEXES(sBlk.s.fragments);
-+	long long *fragment_table_index;
- 
- 	TRACE("read_fragment_table: %d fragments, reading %d fragment indexes "
- 		"from 0x%llx\n", sBlk.s.fragments, indexes,
-@@ -43,6 +43,11 @@ int read_fragment_table_4(long long *directory_table_end)
- 		*directory_table_end = sBlk.s.fragment_table_start;
- 		return TRUE;
- 	}
-+        
-+	fragment_table_index = malloc(indexes*sizeof(long long));
-+	if(fragment_table_index == NULL)
-+		EXIT_UNSQUASH("read_fragment_table: failed to allocate "
-+			"fragment table index\n");
- 
- 	fragment_table = malloc(bytes);
- 	if(fragment_table == NULL)
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
deleted file mode 100644
index 87c1e8cac03f..000000000000
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-include missing sys/stat.h for stat* function declarations
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: squashfs-tools/pseudo.c
-===================================================================
---- squashfs-tools.orig/pseudo.c
-+++ squashfs-tools/pseudo.c
-@@ -32,6 +32,7 @@
- #include <stdlib.h>
- #include <sys/types.h>
- #include <sys/wait.h>
-+#include <sys/stat.h>
- #include <ctype.h>
- 
- #include "pseudo.h"
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch
index 39521a7d8b26..f2e88f416a2c 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch
@@ -19,7 +19,7 @@ sys/types.h might not always include sys/sysmacros.h for major/minor/makedev
  #include "squashfs_fs.h"
 --- a/squashfs-tools/unsquashfs.c
 +++ b/squashfs-tools/unsquashfs.c
-@@ -38,6 +38,10 @@
+@@ -40,6 +40,10 @@
  #include <limits.h>
  #include <ctype.h>
  
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index dc1568a77c9a..cca0524b7ea4 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -6,12 +6,9 @@ LICENSE = "GPL-2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PV = "4.3+gitr${SRCPV}"
-SRCREV = "9c1db6d13a51a2e009f0027ef336ce03624eac0d"
+SRCREV = "f95864afe8833fe3ad782d714b41378e860977b1"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
-           file://0001-mksquashfs.c-get-inline-functions-work-with-C99.patch;striplevel=2 \
            file://squashfs-tools-4.3-sysmacros.patch;striplevel=2 \
-           file://fix-compat.patch \
-           file://0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch;striplevel=2 \
 "
 UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
@@ -24,13 +21,15 @@ COMPATIBLE_HOST_libc-musl = 'null'
 
 EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
 
-PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr"
+PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr zstd reproducible"
 PACKAGECONFIG[gzip] = "GZIP_SUPPORT=1,GZIP_SUPPORT=0,zlib"
 PACKAGECONFIG[xz] = "XZ_SUPPORT=1,XZ_SUPPORT=0,xz"
 PACKAGECONFIG[lzo] = "LZO_SUPPORT=1,LZO_SUPPORT=0,lzo"
 PACKAGECONFIG[lz4] = "LZ4_SUPPORT=1,LZ4_SUPPORT=0,lz4"
 PACKAGECONFIG[lzma] = "LZMA_XZ_SUPPORT=1,LZMA_XZ_SUPPORT=0,xz"
 PACKAGECONFIG[xattr] = "XATTR_SUPPORT=1,XATTR_SUPPORT=0,attr"
+PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
+PACKAGECONFIG[reproducible] = "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"
 
 do_compile() {
 	oe_runmake mksquashfs unsquashfs
-- 
2.20.1



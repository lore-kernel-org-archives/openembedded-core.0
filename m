Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5318E77342
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543626"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:47 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:25 +0200
Message-Id: <1486734151-28331-18-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 17/23] libarchive: Backport upstream fixes.
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:47 -0000

These set of patches backported from upstream, which fixes the issues in
extracting hardlinks over softlinks while etracting packages by opkg.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 ...te_disk_posix.c-make-_fsobj-functions-mor.patch | 242 +++++++++++++++++++++
 ...02-Fix-extracting-hardlinks-over-symlinks.patch | 116 ++++++++++
 .../libarchive/libarchive_3.2.2.bb                 |   2 +
 3 files changed, 360 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
 create mode 100644 meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch

diff --git a/meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch b/meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
new file mode 100644
index 0000000..6e2fd7b
--- /dev/null
+++ b/meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
@@ -0,0 +1,242 @@
+From 90881d24d3f6d5fb207e97df3b91bbea8598e84e Mon Sep 17 00:00:00 2001
+From: Martin Matuska <martin@matuska.org>
+Date: Tue, 29 Nov 2016 16:47:37 +0100
+Subject: [PATCH 1/2] archive_write_disk_posix.c: make *_fsobj functions more
+ readable
+
+---
+ libarchive/archive_write_disk_posix.c | 121 +++++++++++++++++-----------------
+ 1 file changed, 61 insertions(+), 60 deletions(-)
+
+diff --git a/libarchive/archive_write_disk_posix.c b/libarchive/archive_write_disk_posix.c
+index 17c23b0..d786bc2 100644
+--- a/libarchive/archive_write_disk_posix.c
++++ b/libarchive/archive_write_disk_posix.c
+@@ -336,6 +336,8 @@ struct archive_write_disk {
+ 
+ #define HFS_BLOCKS(s)	((s) >> 12)
+ 
++static void	fsobj_error(int *, struct archive_string *, int, const char *,
++		    const char *);
+ static int	check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error_string, int flags);
+ static int	check_symlinks(struct archive_write_disk *);
+ static int	create_filesystem_object(struct archive_write_disk *);
+@@ -2005,8 +2007,9 @@ restore_entry(struct archive_write_disk *a)
+ 
+ 	if (en) {
+ 		/* Everything failed; give up here. */
+-		archive_set_error(&a->archive, en, "Can't create '%s'",
+-		    a->name);
++		if ((&a->archive)->error == NULL)
++			archive_set_error(&a->archive, en, "Can't create '%s'",
++			    a->name);
+ 		return (ARCHIVE_FAILED);
+ 	}
+ 
+@@ -2388,6 +2391,17 @@ current_fixup(struct archive_write_disk *a, const char *pathname)
+ 	return (a->current_fixup);
+ }
+ 
++/* Error helper for new *_fsobj functions */
++static void
++fsobj_error(int *a_eno, struct archive_string *a_estr,
++    int err, const char *errstr, const char *path)
++{
++	if (a_eno)
++		*a_eno = err;
++	if (a_estr)
++		archive_string_sprintf(a_estr, errstr, path);
++}
++
+ /*
+  * TODO: Someday, integrate this with the deep dir support; they both
+  * scan the path and both can be optimized by comparing against other
+@@ -2400,7 +2414,7 @@ current_fixup(struct archive_write_disk *a, const char *pathname)
+  * ARCHIVE_OK if there are none, otherwise puts an error in errmsg.
+  */
+ static int
+-check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error_string, int flags)
++check_symlinks_fsobj(char *path, int *a_eno, struct archive_string *a_estr, int flags)
+ {
+ #if !defined(HAVE_LSTAT)
+ 	/* Platform doesn't have lstat, so we can't look for symlinks. */
+@@ -2474,19 +2488,20 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
+ 			if (errno == ENOENT) {
+ 				break;
+ 			} else {
+-				/* Treat any other error as fatal - best to be paranoid here
+-				 * Note: This effectively disables deep directory
+-				 * support when security checks are enabled.
+-				 * Otherwise, very long pathnames that trigger
+-				 * an error here could evade the sandbox.
+-				 * TODO: We could do better, but it would probably
+-				 * require merging the symlink checks with the
+-				 * deep-directory editing. */
+-				if (error_number) *error_number = errno;
+-				if (error_string)
+-					archive_string_sprintf(error_string,
+-							"Could not stat %s",
+-							path);
++				/*
++				 * Treat any other error as fatal - best to be
++				 * paranoid here.
++				 * Note: This effectively disables deep
++				 * directory support when security checks are
++				 * enabled. Otherwise, very long pathnames that
++				 * trigger an error here could evade the
++				 * sandbox.
++				 * TODO: We could do better, but it would
++				 * probably require merging the symlink checks
++				 * with the deep-directory editing.
++				 */
++				fsobj_error(a_eno, a_estr, errno,
++				    "Could not stat %s", path);
+ 				res = ARCHIVE_FAILED;
+ 				break;
+ 			}
+@@ -2494,11 +2509,8 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
+ 			if (!last) {
+ 				if (chdir(head) != 0) {
+ 					tail[0] = c;
+-					if (error_number) *error_number = errno;
+-					if (error_string)
+-						archive_string_sprintf(error_string,
+-								"Could not chdir %s",
+-								path);
++					fsobj_error(a_eno, a_estr, errno,
++					    "Could not chdir %s", path);
+ 					res = (ARCHIVE_FATAL);
+ 					break;
+ 				}
+@@ -2514,11 +2526,9 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
+ 				 */
+ 				if (unlink(head)) {
+ 					tail[0] = c;
+-					if (error_number) *error_number = errno;
+-					if (error_string)
+-						archive_string_sprintf(error_string,
+-								"Could not remove symlink %s",
+-								path);
++					fsobj_error(a_eno, a_estr, errno,
++					    "Could not remove symlink %s",
++					    path);
+ 					res = ARCHIVE_FAILED;
+ 					break;
+ 				}
+@@ -2529,13 +2539,14 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
+ 				 * symlink with another symlink.
+ 				 */
+ 				tail[0] = c;
+-				/* FIXME:  not sure how important this is to restore
++				/*
++				 * FIXME:  not sure how important this is to
++				 * restore
++				 */
++				/*
+ 				if (!S_ISLNK(path)) {
+-					if (error_number) *error_number = 0;
+-					if (error_string)
+-						archive_string_sprintf(error_string,
+-								"Removing symlink %s",
+-								path);
++					fsobj_error(a_eno, a_estr, 0,
++					    "Removing symlink %s", path);
+ 				}
+ 				*/
+ 				/* Symlink gone.  No more problem! */
+@@ -2545,22 +2556,17 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
+ 				/* User asked us to remove problems. */
+ 				if (unlink(head) != 0) {
+ 					tail[0] = c;
+-					if (error_number) *error_number = 0;
+-					if (error_string)
+-						archive_string_sprintf(error_string,
+-								"Cannot remove intervening symlink %s",
+-								path);
++					fsobj_error(a_eno, a_estr, 0,
++					    "Cannot remove intervening "
++					    "symlink %s", path);
+ 					res = ARCHIVE_FAILED;
+ 					break;
+ 				}
+ 				tail[0] = c;
+ 			} else {
+ 				tail[0] = c;
+-				if (error_number) *error_number = 0;
+-				if (error_string)
+-					archive_string_sprintf(error_string,
+-							"Cannot extract through symlink %s",
+-							path);
++				fsobj_error(a_eno, a_estr, 0,
++				    "Cannot extract through symlink %s", path);
+ 				res = ARCHIVE_FAILED;
+ 				break;
+ 			}
+@@ -2577,10 +2583,8 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
+ 	if (restore_pwd >= 0) {
+ 		r = fchdir(restore_pwd);
+ 		if (r != 0) {
+-			if(error_number) *error_number = errno;
+-			if(error_string)
+-				archive_string_sprintf(error_string,
+-						"chdir() failure");
++			fsobj_error(a_eno, a_estr, errno,
++			    "chdir() failure", "");
+ 		}
+ 		close(restore_pwd);
+ 		restore_pwd = -1;
+@@ -2688,17 +2692,16 @@ cleanup_pathname_win(struct archive_write_disk *a)
+  * is set) if the path is absolute.
+  */
+ static int
+-cleanup_pathname_fsobj(char *path, int *error_number, struct archive_string *error_string, int flags)
++cleanup_pathname_fsobj(char *path, int *a_eno, struct archive_string *a_estr,
++    int flags)
+ {
+ 	char *dest, *src;
+ 	char separator = '\0';
+ 
+ 	dest = src = path;
+ 	if (*src == '\0') {
+-		if (error_number) *error_number = ARCHIVE_ERRNO_MISC;
+-		if (error_string)
+-		    archive_string_sprintf(error_string,
+-			    "Invalid empty pathname");
++		fsobj_error(a_eno, a_estr, ARCHIVE_ERRNO_MISC,
++		    "Invalid empty ", "pathname");
+ 		return (ARCHIVE_FAILED);
+ 	}
+ 
+@@ -2708,10 +2711,8 @@ cleanup_pathname_fsobj(char *path, int *error_number, struct archive_string *err
+ 	/* Skip leading '/'. */
+ 	if (*src == '/') {
+ 		if (flags & ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS) {
+-			if (error_number) *error_number = ARCHIVE_ERRNO_MISC;
+-			if (error_string)
+-			    archive_string_sprintf(error_string,
+-				    "Path is absolute");
++			fsobj_error(a_eno, a_estr, ARCHIVE_ERRNO_MISC,
++			    "Path is ", "absolute");
+ 			return (ARCHIVE_FAILED);
+ 		}
+ 
+@@ -2738,11 +2739,11 @@ cleanup_pathname_fsobj(char *path, int *error_number, struct archive_string *err
+ 			} else if (src[1] == '.') {
+ 				if (src[2] == '/' || src[2] == '\0') {
+ 					/* Conditionally warn about '..' */
+-					if (flags & ARCHIVE_EXTRACT_SECURE_NODOTDOT) {
+-						if (error_number) *error_number = ARCHIVE_ERRNO_MISC;
+-						if (error_string)
+-						    archive_string_sprintf(error_string,
+-							    "Path contains '..'");
++					if (flags
++					    & ARCHIVE_EXTRACT_SECURE_NODOTDOT) {
++						fsobj_error(a_eno, a_estr,
++						    ARCHIVE_ERRNO_MISC,
++						    "Path contains ", "'..'");
+ 						return (ARCHIVE_FAILED);
+ 					}
+ 				}
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch b/meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch
new file mode 100644
index 0000000..d4a2d28
--- /dev/null
+++ b/meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch
@@ -0,0 +1,116 @@
+From ece28103885a079a129a23c5001252a1648517af Mon Sep 17 00:00:00 2001
+From: Martin Matuska <martin@matuska.org>
+Date: Tue, 29 Nov 2016 16:55:41 +0100
+Subject: [PATCH 2/2] Fix extracting hardlinks over symlinks
+
+Closes #821
+---
+ libarchive/archive_write_disk_posix.c | 43 +++++++++++++++++++++++++++++++++++
+ tar/test/test_symlink_dir.c           | 18 ++++++++++++++-
+ 2 files changed, 60 insertions(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_write_disk_posix.c b/libarchive/archive_write_disk_posix.c
+index d786bc2..80b03cd 100644
+--- a/libarchive/archive_write_disk_posix.c
++++ b/libarchive/archive_write_disk_posix.c
+@@ -2563,6 +2563,49 @@ check_symlinks_fsobj(char *path, int *a_eno, struct archive_string *a_estr, int
+ 					break;
+ 				}
+ 				tail[0] = c;
++			} else if ((flags &
++			    ARCHIVE_EXTRACT_SECURE_SYMLINKS) == 0) {
++				/*
++				 * We are not the last element and we want to
++				 * follow symlinks if they are a directory.
++				 * 
++				 * This is needed to extract hardlinks over
++				 * symlinks.
++				 */
++				r = stat(head, &st);
++				if (r != 0) {
++					tail[0] = c;
++					if (errno == ENOENT) {
++						break;
++					} else {
++						fsobj_error(a_eno, a_estr,
++						    errno,
++						    "Could not stat %s", path);
++						res = (ARCHIVE_FAILED);
++						break;
++					}
++				} else if (S_ISDIR(st.st_mode)) {
++					if (chdir(head) != 0) {
++						tail[0] = c;
++						fsobj_error(a_eno, a_estr,
++						    errno,
++						    "Could not chdir %s", path);
++						res = (ARCHIVE_FATAL);
++						break;
++					}
++					/*
++					 * Our view is now from inside
++					 * this dir:
++					 */
++					head = tail + 1;
++				} else {
++					tail[0] = c;
++					fsobj_error(a_eno, a_estr, 0,
++					    "Cannot extract through "
++					    "symlink %s", path);
++					res = ARCHIVE_FAILED;
++					break;
++				}
+ 			} else {
+ 				tail[0] = c;
+ 				fsobj_error(a_eno, a_estr, 0,
+diff --git a/tar/test/test_symlink_dir.c b/tar/test/test_symlink_dir.c
+index 25bd8b1..852e00b 100644
+--- a/tar/test/test_symlink_dir.c
++++ b/tar/test/test_symlink_dir.c
+@@ -47,11 +47,18 @@ DEFINE_TEST(test_symlink_dir)
+ 	assertMakeDir("source/dir3", 0755);
+ 	assertMakeDir("source/dir3/d3", 0755);
+ 	assertMakeFile("source/dir3/f3", 0755, "abcde");
++	assertMakeDir("source/dir4", 0755);
++	assertMakeFile("source/dir4/file3", 0755, "abcdef");
++	assertMakeHardlink("source/dir4/file4", "source/dir4/file3");
+ 
+ 	assertEqualInt(0,
+ 	    systemf("%s -cf test.tar -C source dir dir2 dir3 file file2",
+ 		testprog));
+ 
++	/* Second archive with hardlinks */
++	assertEqualInt(0,
++	    systemf("%s -cf test2.tar -C source dir4", testprog));
++
+ 	/*
+ 	 * Extract with -x and without -P.
+ 	 */
+@@ -118,9 +125,15 @@ DEFINE_TEST(test_symlink_dir)
+ 		assertMakeSymlink("dest2/file2", "real_file2");
+ 	assertEqualInt(0, systemf("%s -xPf test.tar -C dest2", testprog));
+ 
+-	/* dest2/dir symlink should be followed */
++	/* "dir4" is a symlink to existing "real_dir" */
++	if (canSymlink())
++		assertMakeSymlink("dest2/dir4", "real_dir");
++	assertEqualInt(0, systemf("%s -xPf test2.tar -C dest2", testprog));
++
++	/* dest2/dir and dest2/dir4 symlinks should be followed */
+ 	if (canSymlink()) {
+ 		assertIsSymlink("dest2/dir", "real_dir");
++		assertIsSymlink("dest2/dir4", "real_dir");
+ 		assertIsDir("dest2/real_dir", -1);
+ 	}
+ 
+@@ -141,4 +154,7 @@ DEFINE_TEST(test_symlink_dir)
+ 	/* dest2/file2 symlink should be removed */
+ 	failure("Symlink to non-existing file should be removed");
+ 	assertIsReg("dest2/file2", -1);
++
++	/* dest2/dir4/file3 and dest2/dir4/file4 should be hard links */
++	assertIsHardlink("dest2/dir4/file3", "dest2/dir4/file4");
+ }
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
index 8ad62ad..387fa9b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
@@ -33,6 +33,8 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://non-recursive-extract-and-list.patch \
+	   file://0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch \
+	   file://0002-Fix-extracting-hardlinks-over-symlinks.patch \
            "
 
 SRC_URI[md5sum] = "1ec00b7dcaf969dd2a5712f85f23c764"
-- 
2.7.4



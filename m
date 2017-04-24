Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 267F16010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 01:16:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18067783"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2017 09:16:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E5ED947E6342
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:16:25 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 24 Apr 2017 09:16:31 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Apr 2017 09:16:12 +0800
Message-ID: <1492996572-11939-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: E5ED947E6342.AC97A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libarchive: 3.2.2 -> 3.3.1
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
X-List-Received-Date: Mon, 24 Apr 2017 01:16:45 -0000
Content-Type: text/plain

1) Upgrade libarchive from 3.2.2 to 3.3.1.
2) Fix an unknown-configure-option "--without-lzmadec" when do_configure. 
3) Delete three patches, since they are integrated upstream. 
   0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
   0002-Fix-extracting-hardlinks-over-symlinks.patch
   non-recursive-extract-and-list.patch

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...te_disk_posix.c-make-_fsobj-functions-mor.patch | 245 ---------------------
 ...02-Fix-extracting-hardlinks-over-symlinks.patch | 120 ----------
 .../files/non-recursive-extract-and-list.patch     | 153 -------------
 .../{libarchive_3.2.2.bb => libarchive_3.3.1.bb}   |  11 +-
 4 files changed, 4 insertions(+), 525 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
 delete mode 100644 meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch
 delete mode 100644 meta/recipes-extended/libarchive/files/non-recursive-extract-and-list.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.2.2.bb => libarchive_3.3.1.bb} (82%)

diff --git a/meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch b/meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
deleted file mode 100644
index e911a7c..0000000
--- a/meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
+++ /dev/null
@@ -1,245 +0,0 @@
-From 90881d24d3f6d5fb207e97df3b91bbea8598e84e Mon Sep 17 00:00:00 2001
-From: Martin Matuska <martin@matuska.org>
-Date: Tue, 29 Nov 2016 16:47:37 +0100
-Subject: [PATCH 1/2] archive_write_disk_posix.c: make *_fsobj functions more
- readable
-
-Upstream-Status: Backported
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
----
- libarchive/archive_write_disk_posix.c | 121 +++++++++++++++++-----------------
- 1 file changed, 61 insertions(+), 60 deletions(-)
-
-diff --git a/libarchive/archive_write_disk_posix.c b/libarchive/archive_write_disk_posix.c
-index 17c23b0..d786bc2 100644
---- a/libarchive/archive_write_disk_posix.c
-+++ b/libarchive/archive_write_disk_posix.c
-@@ -336,6 +336,8 @@ struct archive_write_disk {
- 
- #define HFS_BLOCKS(s)	((s) >> 12)
- 
-+static void	fsobj_error(int *, struct archive_string *, int, const char *,
-+		    const char *);
- static int	check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error_string, int flags);
- static int	check_symlinks(struct archive_write_disk *);
- static int	create_filesystem_object(struct archive_write_disk *);
-@@ -2005,8 +2007,9 @@ restore_entry(struct archive_write_disk *a)
- 
- 	if (en) {
- 		/* Everything failed; give up here. */
--		archive_set_error(&a->archive, en, "Can't create '%s'",
--		    a->name);
-+		if ((&a->archive)->error == NULL)
-+			archive_set_error(&a->archive, en, "Can't create '%s'",
-+			    a->name);
- 		return (ARCHIVE_FAILED);
- 	}
- 
-@@ -2388,6 +2391,17 @@ current_fixup(struct archive_write_disk *a, const char *pathname)
- 	return (a->current_fixup);
- }
- 
-+/* Error helper for new *_fsobj functions */
-+static void
-+fsobj_error(int *a_eno, struct archive_string *a_estr,
-+    int err, const char *errstr, const char *path)
-+{
-+	if (a_eno)
-+		*a_eno = err;
-+	if (a_estr)
-+		archive_string_sprintf(a_estr, errstr, path);
-+}
-+
- /*
-  * TODO: Someday, integrate this with the deep dir support; they both
-  * scan the path and both can be optimized by comparing against other
-@@ -2400,7 +2414,7 @@ current_fixup(struct archive_write_disk *a, const char *pathname)
-  * ARCHIVE_OK if there are none, otherwise puts an error in errmsg.
-  */
- static int
--check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error_string, int flags)
-+check_symlinks_fsobj(char *path, int *a_eno, struct archive_string *a_estr, int flags)
- {
- #if !defined(HAVE_LSTAT)
- 	/* Platform doesn't have lstat, so we can't look for symlinks. */
-@@ -2474,19 +2488,20 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
- 			if (errno == ENOENT) {
- 				break;
- 			} else {
--				/* Treat any other error as fatal - best to be paranoid here
--				 * Note: This effectively disables deep directory
--				 * support when security checks are enabled.
--				 * Otherwise, very long pathnames that trigger
--				 * an error here could evade the sandbox.
--				 * TODO: We could do better, but it would probably
--				 * require merging the symlink checks with the
--				 * deep-directory editing. */
--				if (error_number) *error_number = errno;
--				if (error_string)
--					archive_string_sprintf(error_string,
--							"Could not stat %s",
--							path);
-+				/*
-+				 * Treat any other error as fatal - best to be
-+				 * paranoid here.
-+				 * Note: This effectively disables deep
-+				 * directory support when security checks are
-+				 * enabled. Otherwise, very long pathnames that
-+				 * trigger an error here could evade the
-+				 * sandbox.
-+				 * TODO: We could do better, but it would
-+				 * probably require merging the symlink checks
-+				 * with the deep-directory editing.
-+				 */
-+				fsobj_error(a_eno, a_estr, errno,
-+				    "Could not stat %s", path);
- 				res = ARCHIVE_FAILED;
- 				break;
- 			}
-@@ -2494,11 +2509,8 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
- 			if (!last) {
- 				if (chdir(head) != 0) {
- 					tail[0] = c;
--					if (error_number) *error_number = errno;
--					if (error_string)
--						archive_string_sprintf(error_string,
--								"Could not chdir %s",
--								path);
-+					fsobj_error(a_eno, a_estr, errno,
-+					    "Could not chdir %s", path);
- 					res = (ARCHIVE_FATAL);
- 					break;
- 				}
-@@ -2514,11 +2526,9 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
- 				 */
- 				if (unlink(head)) {
- 					tail[0] = c;
--					if (error_number) *error_number = errno;
--					if (error_string)
--						archive_string_sprintf(error_string,
--								"Could not remove symlink %s",
--								path);
-+					fsobj_error(a_eno, a_estr, errno,
-+					    "Could not remove symlink %s",
-+					    path);
- 					res = ARCHIVE_FAILED;
- 					break;
- 				}
-@@ -2529,13 +2539,14 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
- 				 * symlink with another symlink.
- 				 */
- 				tail[0] = c;
--				/* FIXME:  not sure how important this is to restore
-+				/*
-+				 * FIXME:  not sure how important this is to
-+				 * restore
-+				 */
-+				/*
- 				if (!S_ISLNK(path)) {
--					if (error_number) *error_number = 0;
--					if (error_string)
--						archive_string_sprintf(error_string,
--								"Removing symlink %s",
--								path);
-+					fsobj_error(a_eno, a_estr, 0,
-+					    "Removing symlink %s", path);
- 				}
- 				*/
- 				/* Symlink gone.  No more problem! */
-@@ -2545,22 +2556,17 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
- 				/* User asked us to remove problems. */
- 				if (unlink(head) != 0) {
- 					tail[0] = c;
--					if (error_number) *error_number = 0;
--					if (error_string)
--						archive_string_sprintf(error_string,
--								"Cannot remove intervening symlink %s",
--								path);
-+					fsobj_error(a_eno, a_estr, 0,
-+					    "Cannot remove intervening "
-+					    "symlink %s", path);
- 					res = ARCHIVE_FAILED;
- 					break;
- 				}
- 				tail[0] = c;
- 			} else {
- 				tail[0] = c;
--				if (error_number) *error_number = 0;
--				if (error_string)
--					archive_string_sprintf(error_string,
--							"Cannot extract through symlink %s",
--							path);
-+				fsobj_error(a_eno, a_estr, 0,
-+				    "Cannot extract through symlink %s", path);
- 				res = ARCHIVE_FAILED;
- 				break;
- 			}
-@@ -2577,10 +2583,8 @@ check_symlinks_fsobj(char *path, int *error_number, struct archive_string *error
- 	if (restore_pwd >= 0) {
- 		r = fchdir(restore_pwd);
- 		if (r != 0) {
--			if(error_number) *error_number = errno;
--			if(error_string)
--				archive_string_sprintf(error_string,
--						"chdir() failure");
-+			fsobj_error(a_eno, a_estr, errno,
-+			    "chdir() failure", "");
- 		}
- 		close(restore_pwd);
- 		restore_pwd = -1;
-@@ -2688,17 +2692,16 @@ cleanup_pathname_win(struct archive_write_disk *a)
-  * is set) if the path is absolute.
-  */
- static int
--cleanup_pathname_fsobj(char *path, int *error_number, struct archive_string *error_string, int flags)
-+cleanup_pathname_fsobj(char *path, int *a_eno, struct archive_string *a_estr,
-+    int flags)
- {
- 	char *dest, *src;
- 	char separator = '\0';
- 
- 	dest = src = path;
- 	if (*src == '\0') {
--		if (error_number) *error_number = ARCHIVE_ERRNO_MISC;
--		if (error_string)
--		    archive_string_sprintf(error_string,
--			    "Invalid empty pathname");
-+		fsobj_error(a_eno, a_estr, ARCHIVE_ERRNO_MISC,
-+		    "Invalid empty ", "pathname");
- 		return (ARCHIVE_FAILED);
- 	}
- 
-@@ -2708,10 +2711,8 @@ cleanup_pathname_fsobj(char *path, int *error_number, struct archive_string *err
- 	/* Skip leading '/'. */
- 	if (*src == '/') {
- 		if (flags & ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS) {
--			if (error_number) *error_number = ARCHIVE_ERRNO_MISC;
--			if (error_string)
--			    archive_string_sprintf(error_string,
--				    "Path is absolute");
-+			fsobj_error(a_eno, a_estr, ARCHIVE_ERRNO_MISC,
-+			    "Path is ", "absolute");
- 			return (ARCHIVE_FAILED);
- 		}
- 
-@@ -2738,11 +2739,11 @@ cleanup_pathname_fsobj(char *path, int *error_number, struct archive_string *err
- 			} else if (src[1] == '.') {
- 				if (src[2] == '/' || src[2] == '\0') {
- 					/* Conditionally warn about '..' */
--					if (flags & ARCHIVE_EXTRACT_SECURE_NODOTDOT) {
--						if (error_number) *error_number = ARCHIVE_ERRNO_MISC;
--						if (error_string)
--						    archive_string_sprintf(error_string,
--							    "Path contains '..'");
-+					if (flags
-+					    & ARCHIVE_EXTRACT_SECURE_NODOTDOT) {
-+						fsobj_error(a_eno, a_estr,
-+						    ARCHIVE_ERRNO_MISC,
-+						    "Path contains ", "'..'");
- 						return (ARCHIVE_FAILED);
- 					}
- 				}
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch b/meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch
deleted file mode 100644
index 3741863..0000000
--- a/meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From ece28103885a079a129a23c5001252a1648517af Mon Sep 17 00:00:00 2001
-From: Martin Matuska <martin@matuska.org>
-Date: Tue, 29 Nov 2016 16:55:41 +0100
-Subject: [PATCH 2/2] Fix extracting hardlinks over symlinks
-
-Closes #821
-
-Upstream-Status: Backported
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
----
- libarchive/archive_write_disk_posix.c | 43 +++++++++++++++++++++++++++++++++++
- tar/test/test_symlink_dir.c           | 18 ++++++++++++++-
- 2 files changed, 60 insertions(+), 1 deletion(-)
-
-diff --git a/libarchive/archive_write_disk_posix.c b/libarchive/archive_write_disk_posix.c
-index d786bc2..80b03cd 100644
---- a/libarchive/archive_write_disk_posix.c
-+++ b/libarchive/archive_write_disk_posix.c
-@@ -2563,6 +2563,49 @@ check_symlinks_fsobj(char *path, int *a_eno, struct archive_string *a_estr, int
- 					break;
- 				}
- 				tail[0] = c;
-+			} else if ((flags &
-+			    ARCHIVE_EXTRACT_SECURE_SYMLINKS) == 0) {
-+				/*
-+				 * We are not the last element and we want to
-+				 * follow symlinks if they are a directory.
-+				 * 
-+				 * This is needed to extract hardlinks over
-+				 * symlinks.
-+				 */
-+				r = stat(head, &st);
-+				if (r != 0) {
-+					tail[0] = c;
-+					if (errno == ENOENT) {
-+						break;
-+					} else {
-+						fsobj_error(a_eno, a_estr,
-+						    errno,
-+						    "Could not stat %s", path);
-+						res = (ARCHIVE_FAILED);
-+						break;
-+					}
-+				} else if (S_ISDIR(st.st_mode)) {
-+					if (chdir(head) != 0) {
-+						tail[0] = c;
-+						fsobj_error(a_eno, a_estr,
-+						    errno,
-+						    "Could not chdir %s", path);
-+						res = (ARCHIVE_FATAL);
-+						break;
-+					}
-+					/*
-+					 * Our view is now from inside
-+					 * this dir:
-+					 */
-+					head = tail + 1;
-+				} else {
-+					tail[0] = c;
-+					fsobj_error(a_eno, a_estr, 0,
-+					    "Cannot extract through "
-+					    "symlink %s", path);
-+					res = ARCHIVE_FAILED;
-+					break;
-+				}
- 			} else {
- 				tail[0] = c;
- 				fsobj_error(a_eno, a_estr, 0,
-diff --git a/tar/test/test_symlink_dir.c b/tar/test/test_symlink_dir.c
-index 25bd8b1..852e00b 100644
---- a/tar/test/test_symlink_dir.c
-+++ b/tar/test/test_symlink_dir.c
-@@ -47,11 +47,18 @@ DEFINE_TEST(test_symlink_dir)
- 	assertMakeDir("source/dir3", 0755);
- 	assertMakeDir("source/dir3/d3", 0755);
- 	assertMakeFile("source/dir3/f3", 0755, "abcde");
-+	assertMakeDir("source/dir4", 0755);
-+	assertMakeFile("source/dir4/file3", 0755, "abcdef");
-+	assertMakeHardlink("source/dir4/file4", "source/dir4/file3");
- 
- 	assertEqualInt(0,
- 	    systemf("%s -cf test.tar -C source dir dir2 dir3 file file2",
- 		testprog));
- 
-+	/* Second archive with hardlinks */
-+	assertEqualInt(0,
-+	    systemf("%s -cf test2.tar -C source dir4", testprog));
-+
- 	/*
- 	 * Extract with -x and without -P.
- 	 */
-@@ -118,9 +125,15 @@ DEFINE_TEST(test_symlink_dir)
- 		assertMakeSymlink("dest2/file2", "real_file2");
- 	assertEqualInt(0, systemf("%s -xPf test.tar -C dest2", testprog));
- 
--	/* dest2/dir symlink should be followed */
-+	/* "dir4" is a symlink to existing "real_dir" */
-+	if (canSymlink())
-+		assertMakeSymlink("dest2/dir4", "real_dir");
-+	assertEqualInt(0, systemf("%s -xPf test2.tar -C dest2", testprog));
-+
-+	/* dest2/dir and dest2/dir4 symlinks should be followed */
- 	if (canSymlink()) {
- 		assertIsSymlink("dest2/dir", "real_dir");
-+		assertIsSymlink("dest2/dir4", "real_dir");
- 		assertIsDir("dest2/real_dir", -1);
- 	}
- 
-@@ -141,4 +154,7 @@ DEFINE_TEST(test_symlink_dir)
- 	/* dest2/file2 symlink should be removed */
- 	failure("Symlink to non-existing file should be removed");
- 	assertIsReg("dest2/file2", -1);
-+
-+	/* dest2/dir4/file3 and dest2/dir4/file4 should be hard links */
-+	assertIsHardlink("dest2/dir4/file3", "dest2/dir4/file4");
- }
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/libarchive/files/non-recursive-extract-and-list.patch b/meta/recipes-extended/libarchive/files/non-recursive-extract-and-list.patch
deleted file mode 100644
index 61f8f3e..0000000
--- a/meta/recipes-extended/libarchive/files/non-recursive-extract-and-list.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From d6271709d2deb980804f92e75f9b5cb600dc42ed Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Mon, 24 Oct 2016 12:54:48 +0200
-Subject: [PATCH 1/2] non-recursive extract and list
-
-Sometimes it makes sense to extract or list a directory contained in
-an archive without also doing the same for the content of the
-directory, i.e. allowing -n (= --no-recursion) in combination with the
-x and t modes.
-
-bsdtar uses the match functionality in libarchive to track include
-matches. A new libarchive API call
-archive_match_include_directories_recursively() gets introduced to
-influence the matching behavior, with the default behavior as before.
-
-Non-recursive matching can be achieved by anchoring the path match at
-both start and end. Asking for a directory which itself isn't in the
-archive when in non-recursive mode is an error and handled by the
-existing mechanism for tracking unused inclusion entries.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/812]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-
----
- libarchive/archive.h       |  2 ++
- libarchive/archive_match.c | 30 +++++++++++++++++++++++++++++-
- tar/bsdtar.1               |  3 +--
- tar/bsdtar.c               | 12 ++++++++++--
- 4 files changed, 42 insertions(+), 5 deletions(-)
-
-diff --git a/libarchive/archive.h b/libarchive/archive.h
-index ff401e9..38d8746 100644
---- a/libarchive/archive.h
-+++ b/libarchive/archive.h
-@@ -1085,6 +1085,8 @@ __LA_DECL int	archive_match_excluded(struct archive *,
-  */
- __LA_DECL int	archive_match_path_excluded(struct archive *,
- 		    struct archive_entry *);
-+/* Control recursive inclusion of directory content when directory is included. Default on. */
-+__LA_DECL int	archive_match_include_directories_recursively(struct archive *, int _enabled);
- /* Add exclusion pathname pattern. */
- __LA_DECL int	archive_match_exclude_pattern(struct archive *, const char *);
- __LA_DECL int	archive_match_exclude_pattern_w(struct archive *,
-diff --git a/libarchive/archive_match.c b/libarchive/archive_match.c
-index 0719cbd..6d03a65 100644
---- a/libarchive/archive_match.c
-+++ b/libarchive/archive_match.c
-@@ -93,6 +93,9 @@ struct archive_match {
- 	/* exclusion/inclusion set flag. */
- 	int			 setflag;
- 
-+	/* Recursively include directory content? */
-+	int			 recursive_include;
-+
- 	/*
- 	 * Matching filename patterns.
- 	 */
-@@ -223,6 +226,7 @@ archive_match_new(void)
- 		return (NULL);
- 	a->archive.magic = ARCHIVE_MATCH_MAGIC;
- 	a->archive.state = ARCHIVE_STATE_NEW;
-+	a->recursive_include = 1;
- 	match_list_init(&(a->inclusions));
- 	match_list_init(&(a->exclusions));
- 	__archive_rb_tree_init(&(a->exclusion_tree), &rb_ops_mbs);
-@@ -471,6 +475,28 @@ archive_match_path_excluded(struct archive *_a,
- }
- 
- /*
-+ * When recursive inclusion of directory content is enabled,
-+ * an inclusion pattern that matches a directory will also
-+ * include everything beneath that directory. Enabled by default.
-+ *
-+ * For compatibility with GNU tar, exclusion patterns always
-+ * match if a subset of the full patch matches (i.e., they are
-+ * are not rooted at the beginning of the path) and thus there
-+ * is no corresponding non-recursive exclusion mode.
-+ */
-+int
-+archive_match_include_directories_recursively(struct archive *_a, int _enabled)
-+{
-+	struct archive_match *a;
-+
-+	archive_check_magic(_a, ARCHIVE_MATCH_MAGIC,
-+	    ARCHIVE_STATE_NEW, "archive_match_include_directories_recursively");
-+	a = (struct archive_match *)_a;
-+	a->recursive_include = _enabled;
-+	return (ARCHIVE_OK);
-+}
-+
-+/*
-  * Utilty functions to get statistic information for inclusion patterns.
-  */
- int
-@@ -781,7 +807,9 @@ static int
- match_path_inclusion(struct archive_match *a, struct match *m,
-     int mbs, const void *pn)
- {
--	int flag = PATHMATCH_NO_ANCHOR_END;
-+	int flag = a->recursive_include ?
-+		PATHMATCH_NO_ANCHOR_END : /* Prefix match is good enough. */
-+		0; /* Full match required. */
- 	int r;
- 
- 	if (mbs) {
-diff --git a/tar/bsdtar.1 b/tar/bsdtar.1
-index 9eadaaf..f5d6457 100644
---- a/tar/bsdtar.1
-+++ b/tar/bsdtar.1
-@@ -346,8 +346,7 @@ In extract or list modes, this option is ignored.
- Do not extract modification time.
- By default, the modification time is set to the time stored in the archive.
- .It Fl n , Fl Fl norecurse , Fl Fl no-recursion
--(c, r, u modes only)
--Do not recursively archive the contents of directories.
-+Do not recursively archive (c, r, u), extract (x) or list (t) the contents of directories.
- .It Fl Fl newer Ar date
- (c, r, u modes only)
- Only include files and directories newer than the specified date.
-diff --git a/tar/bsdtar.c b/tar/bsdtar.c
-index 93bf60a..001d5ed 100644
---- a/tar/bsdtar.c
-+++ b/tar/bsdtar.c
-@@ -738,8 +738,6 @@ main(int argc, char **argv)
- 			break;
- 		}
- 	}
--	if (bsdtar->option_no_subdirs)
--		only_mode(bsdtar, "-n", "cru");
- 	if (bsdtar->option_stdout)
- 		only_mode(bsdtar, "-O", "xt");
- 	if (bsdtar->option_unlink_first)
-@@ -788,6 +786,16 @@ main(int argc, char **argv)
- 		only_mode(bsdtar, buff, "cru");
- 	}
- 
-+	/*
-+	 * When creating an archive from a directory tree, the directory
-+	 * walking code will already avoid entering directories when
-+	 * recursive inclusion of directory content is disabled, therefore
-+	 * changing the matching behavior has no effect for creation modes.
-+	 * It is relevant for extraction or listing.
-+	 */
-+	archive_match_include_directories_recursively(bsdtar->matching,
-+						      !bsdtar->option_no_subdirs);
-+
- 	/* Filename "-" implies stdio. */
- 	if (strcmp(bsdtar->filename, "-") == 0)
- 		bsdtar->filename = NULL;
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb b/meta/recipes-extended/libarchive/libarchive_3.3.1.bb
similarity index 82%
rename from meta/recipes-extended/libarchive/libarchive_3.2.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.3.1.bb
index da959a2..7a7da58 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.1.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib,"
 PACKAGECONFIG[bz2] = "--with-bz2lib,--without-bz2lib,${DEPENDS_BZIP2},"
-PACKAGECONFIG[xz] = "--with-lzmadec --with-lzma,--without-lzmadec --without-lzma,xz,"
+PACKAGECONFIG[xz] = "--with-lzmadec --with-lzma,--without-lzma,xz,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[libxml2] = "--with-xml2,--without-xml2,libxml2,"
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat,"
@@ -32,13 +32,10 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
-           file://non-recursive-extract-and-list.patch \
-	   file://0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch \
-	   file://0002-Fix-extracting-hardlinks-over-symlinks.patch \
-           "
+          "
 
-SRC_URI[md5sum] = "1ec00b7dcaf969dd2a5712f85f23c764"
-SRC_URI[sha256sum] = "691c194ee132d1f0f7a42541f091db811bc2e56f7107e9121be2bc8c04f1060f"
+SRC_URI[md5sum] = "d2af45480aa5b0db5b5f3919cd0ea65e"
+SRC_URI[sha256sum] = "29ca5bd1624ca5a007aa57e16080262ab4379dbf8797f5c52f7ea74a3b0424e7"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.7.4





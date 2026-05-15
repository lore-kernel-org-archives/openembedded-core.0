Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95537CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 09:20:01 +0000 (UTC)
Received: from h4.cmg2.smtp.forpsi.com (h4.cmg2.smtp.forpsi.com [185.129.138.189])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31347.1778836790831626044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 02:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=lAoO1XK2;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.189, mailfrom: andrej.v@skyrain.eu)
Received: from localhost.localdomain ([178.143.40.108])
	by cmgsmtp with ESMTPSA
	id NohXwvh7FOZ9ONohwwiw9v; Fri, 15 May 2026 11:19:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1778836788; bh=J6UuMcyaUFHyR0usVnd0E5fL4xjtgRHEfB6kQl2dgTQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=lAoO1XK2SO0gBM6i1OqGSWzJBttE+ehe7RVcwuO4t5K7aD8JUhbOiixmHwanznh30
	 ytR79Unf+anvR8eR3WBWxi3qgxwLa6kd9Yp2foZeCHBdPZtmB8qUQscSki85KJAWqQ
	 +zh+jct8zjtRDRVtZVL5raYWSmK2LZEJaOGdXYlt4GNzK31ImDXuV6qrDcX/X97/Rd
	 V8n98+msNY8yE25APcunwp5b68GgbKFK9ipglmE7gPB1LIKRrFPCTc2KsDi2eNxuSQ
	 FbLbbEM/0eDhpmRbTNXbAj/E9nvHgmlUQqI6VSml4J3VJqjax5wnFUX67DXfUrM0Sl
	 LpVD8lNGbJohQ==
From: Andrej Valek <andrej.v@skyrain.eu>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.v@skyrain.eu>
Subject: [oe][meta][PATCH] busybox: 1.37.0 -> 1.38.0
Date: Fri, 15 May 2026 11:18:50 +0200
Message-Id: <20260515091850.2822301-1-andrej.v@skyrain.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOEOq7JThfARBLXhFLOJXSo6icK45pi9sPe5UCBhDh5MhTdfL3Wnrl8B1KJuxERA4vb9izF3G/UHWKpX1jNtVk7QbISUrOACcnX3oY2BfBZPP0CdfSWI
 qUtImIys5zHEURFhTW5milaINHMCnzI3B0gQkE1m+TkqO4o/BHzgOna/wTo2Zgd8I0UpvGRm5WoV25g3gWQ/8q/DfV9vvcvqiQzDQtXjBpMYqm99cvQgOj4a
 gLpkyKKaFx6AoqoX6SZ7TTi5CJJDH+n1q6gvvGqxFoo=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 09:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237072

- update to next version 1.38.0
 - refresh defconfig
  - disable new applets (SHA384SUM, USE_BB_CRYPT_YES, SSL_SERVER,
    FEATURE_TELNETD_*, VMSTAT, HUSH_*, LSBLK)
  - enable new applets (FEATURE_VERSION, UUIDGEN)
 - remove and refresh already merged patches

Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
---
 ...ab_1.37.0.bb => busybox-inittab_1.38.0.bb} |   0
 ...allow-path-traversals-CVE-2023-39810.patch | 141 -------------
 ...1-cut-Fix-s-flag-to-omit-blank-lines.patch |  66 ------
 ...-hardlink-components-GNU-tar-does-th.patch | 196 ------------------
 .../0002-start-stop-daemon-fix-tests.patch    |   7 +-
 ...nsafe-components-from-hardlinks-not-.patch |  35 ----
 .../busybox/busybox/CVE-2025-46394-01.patch   |  57 -----
 .../busybox/busybox/CVE-2025-46394-02.patch   |  32 ---
 meta/recipes-core/busybox/busybox/defconfig   |  25 ++-
 .../{busybox_1.37.0.bb => busybox_1.38.0.bb}  |  10 +-
 10 files changed, 29 insertions(+), 540 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.37.0.bb => busybox-inittab_1.38.0.bb} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-archival-disallow-path-traversals-CVE-2023-39810.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-cut-Fix-s-flag-to-omit-blank-lines.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
 rename meta/recipes-core/busybox/{busybox_1.37.0.bb => busybox_1.38.0.bb} (85%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.38.0.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.38.0.bb
diff --git a/meta/recipes-core/busybox/busybox/0001-archival-disallow-path-traversals-CVE-2023-39810.patch b/meta/recipes-core/busybox/busybox/0001-archival-disallow-path-traversals-CVE-2023-39810.patch
deleted file mode 100644
index e76a4b128e..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-archival-disallow-path-traversals-CVE-2023-39810.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 42ce7953f48e5542297ff4381086b45ae28a02cf Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Wed, 2 Oct 2024 10:12:05 +0200
-Subject: [PATCH] archival: disallow path traversals (CVE-2023-39810)
-
-Create new configure option for archival/libarchive based extractions to
-disallow path traversals.
-As this is a paranoid option and might introduce backward
-incompatibility, default it to no.
-
-Fixes: CVE-2023-39810
-
-Based on the patch by Peter Kaestle <peter.kaestle@nokia.com>
-
-function                                             old     new   delta
-data_extract_all                                     921     945     +24
-strip_unsafe_prefix                                  101     102      +1
-------------------------------------------------------------------------------
-(add/remove: 0/0 grow/shrink: 2/0 up/down: 25/0)               Total: 25 bytes
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-CVE: CVE-2023-39810
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=9a8796436b9b0641e13480811902ea2ac57881d3]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- archival/Config.src                        | 11 +++++++++++
- archival/libarchive/data_extract_all.c     |  8 ++++++++
- archival/libarchive/unsafe_prefix.c        |  6 +++++-
- scripts/kconfig/lxdialog/check-lxdialog.sh |  2 +-
- testsuite/cpio.tests                       | 23 ++++++++++++++++++++++
- 5 files changed, 48 insertions(+), 2 deletions(-)
-
-diff --git a/archival/Config.src b/archival/Config.src
-index 6f4f30c43..cbcd7217c 100644
---- a/archival/Config.src
-+++ b/archival/Config.src
-@@ -35,4 +35,15 @@ config FEATURE_LZMA_FAST
- 	This option reduces decompression time by about 25% at the cost of
- 	a 1K bigger binary.
- 
-+config FEATURE_PATH_TRAVERSAL_PROTECTION
-+	bool "Prevent extraction of filenames with /../ path component"
-+	default n
-+	help
-+	busybox tar and unzip remove "PREFIX/../" (if it exists)
-+	from extracted names.
-+	This option enables this behavior for all other unpacking applets,
-+	such as cpio, ar, rpm.
-+	GNU cpio 2.15 has NO such sanity check.
-+# try other archivers and document their behavior?
-+
- endmenu
-diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
-index 049c2c156..8a69711c1 100644
---- a/archival/libarchive/data_extract_all.c
-+++ b/archival/libarchive/data_extract_all.c
-@@ -65,6 +65,14 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
- 		} while (--n != 0);
- 	}
- #endif
-+#if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
-+	/* Strip leading "/" and up to last "/../" path component */
-+	dst_name = (char *)strip_unsafe_prefix(dst_name);
-+#endif
-+// ^^^ This may be a problem if some applets do need to extract absolute names.
-+// (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
-+// You might think that rpm needs it, but in my tests rpm's internal cpio
-+// archive has names like "./usr/bin/FOO", not "/usr/bin/FOO".
- 
- 	if (archive_handle->ah_flags & ARCHIVE_CREATE_LEADING_DIRS) {
- 		char *slash = strrchr(dst_name, '/');
-diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
-index 33e487bf9..667081195 100644
---- a/archival/libarchive/unsafe_prefix.c
-+++ b/archival/libarchive/unsafe_prefix.c
-@@ -14,7 +14,11 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
- 			cp++;
- 			continue;
- 		}
--		if (is_prefixed_with(cp, "/../"+1)) {
-+		/* We are called lots of times.
-+		 * is_prefixed_with(cp, "../") is slower than open-coding it,
-+		 * with minimal code growth (~few bytes).
-+		 */
-+		if (cp[0] == '.' && cp[1] == '.' && cp[2] == '/') {
- 			cp += 3;
- 			continue;
- 		}
-diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
-index 7003e026a..b91a54be6 100755
---- a/scripts/kconfig/lxdialog/check-lxdialog.sh
-+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
-@@ -55,7 +55,7 @@ trap "rm -f $tmp" 0 1 2 3 15
- check() {
-         $cc -x c - -o $tmp 2>/dev/null <<'EOF'
- #include CURSES_LOC
--main() {}
-+int main() { return 0; }
- EOF
- 	if [ $? != 0 ]; then
- 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
-diff --git a/testsuite/cpio.tests b/testsuite/cpio.tests
-index 85e746589..a4462c53e 100755
---- a/testsuite/cpio.tests
-+++ b/testsuite/cpio.tests
-@@ -154,6 +154,29 @@ testing "cpio -R with extract" \
- " "" ""
- SKIP=
- 
-+# Create an archive containing a file with "../dont_write" filename.
-+# See that it will not be allowed to unpack.
-+# NB: GNU cpio 2.15 DOES NOT do such checks.
-+optional FEATURE_PATH_TRAVERSAL_PROTECTION
-+rm -rf cpio.testdir
-+mkdir -p cpio.testdir/prepare/inner
-+echo "file outside of destination was written" > cpio.testdir/prepare/dont_write
-+echo "data" > cpio.testdir/prepare/inner/to_extract
-+mkdir -p cpio.testdir/extract
-+testing "cpio extract file outside of destination" "\
-+(cd cpio.testdir/prepare/inner && echo -e '../dont_write\nto_extract' | cpio -o -H newc) | (cd cpio.testdir/extract && cpio -vi 2>&1)
-+echo \$?
-+ls cpio.testdir/dont_write 2>&1" \
-+"\
-+cpio: removing leading '../' from member names
-+../dont_write
-+to_extract
-+1 blocks
-+0
-+ls: cpio.testdir/dont_write: No such file or directory
-+" "" ""
-+SKIP=
-+
- # Clean up
- rm -rf cpio.testdir cpio.testdir2 2>/dev/null
- 
--- 
-2.48.1
-
diff --git a/meta/recipes-core/busybox/busybox/0001-cut-Fix-s-flag-to-omit-blank-lines.patch b/meta/recipes-core/busybox/busybox/0001-cut-Fix-s-flag-to-omit-blank-lines.patch
deleted file mode 100644
index a0a8607b23..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-cut-Fix-s-flag-to-omit-blank-lines.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 199606e960942c29fd8085be812edd3d3697825c Mon Sep 17 00:00:00 2001
-From: Colin McAllister <colinmca242@gmail.com>
-Date: Wed, 17 Jul 2024 07:58:52 -0500
-Subject: [PATCH 1/1] cut: Fix "-s" flag to omit blank lines
-
-Using cut with the delimiter flag ("-d") with the "-s" flag to only
-output lines containing the delimiter will print blank lines. This is
-deviant behavior from cut provided by GNU Coreutils. Blank lines should
-be omitted if "-s" is used with "-d".
-
-This change introduces a somewhat naiive, yet efficient solution, where
-line length is checked before looping though bytes. If line length is
-zero and the "-s" flag is used, the code will jump to parsing the next
-line to avoid printing a newline character.
-
-In addition, a test to cut.tests has been added to ensure that this
-regression is fixed and will not happen again in the future.
-
-Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-July/090834.html]
-
-Signed-off-by: Colin McAllister <colinmca242@gmail.com>
----
- coreutils/cut.c     | 6 ++++++
- testsuite/cut.tests | 9 +++++++++
- 2 files changed, 15 insertions(+)
-
-diff --git a/coreutils/cut.c b/coreutils/cut.c
-index 55bdd9386..b7f986f26 100644
---- a/coreutils/cut.c
-+++ b/coreutils/cut.c
-@@ -152,6 +152,12 @@ static void cut_file(FILE *file, const char *delim, const char *odelim,
- 			unsigned uu = 0, start = 0, end = 0, out = 0;
- 			int dcount = 0;
- 
-+			/* Blank line? */
-+			if (!linelen) {
-+				if (option_mask32 & CUT_OPT_SUPPRESS_FLGS)
-+					goto next_line;
-+			}
-+
- 			/* Loop through bytes, finding next delimiter */
- 			for (;;) {
- 				/* End of current range? */
-diff --git a/testsuite/cut.tests b/testsuite/cut.tests
-index 2458c019c..0b401bc00 100755
---- a/testsuite/cut.tests
-+++ b/testsuite/cut.tests
-@@ -65,6 +65,15 @@ testing "cut with -d -f( ) -s" "cut -d' ' -f3 -s input && echo yes" "yes\n" "$in
- testing "cut with -d -f(a) -s" "cut -da -f3 -s input" "n\nsium:Jim\n\ncion:Ed\n" "$input" ""
- testing "cut with -d -f(a) -s -n" "cut -da -f3 -s -n input" "n\nsium:Jim\n\ncion:Ed\n" "$input" ""
- 
-+input="\
-+
-+foo bar baz
-+
-+bing bong boop
-+
-+"
-+testing "cut with -d -s omits blank lines" "cut -d' ' -f2 -s input" "bar\nbong\n" "$input" ""
-+
- # substitute for awk
- optional FEATURE_CUT_REGEX
- testing "cut -DF" "cut -DF 2,7,5" \
--- 
-2.43.0
-
diff --git a/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch b/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
deleted file mode 100644
index 46e47c5993..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From 3ab1d6c123a6916e7efb821a441164ae56c6cd01 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Thu, 29 Jan 2026 11:48:02 +0100
-Subject: [PATCH] tar: strip unsafe hardlink components - GNU tar does the same
-
-Defends against files like these (python reproducer):
-
-import tarfile
-ti = tarfile.TarInfo("leak_hosts")
-ti.type = tarfile.LNKTYPE
-ti.linkname = "/etc/hosts"  # or "../etc/hosts" or ".."
-ti.size = 0
-with tarfile.open("/tmp/hardlink.tar", "w") as t:
-	t.addfile(ti)
-
-function                                             old     new   delta
-skip_unsafe_prefix                                     -     127    +127
-get_header_tar                                      1752    1754      +2
-.rodata                                           106861  106856      -5
-unzip_main                                          2715    2706      -9
-strip_unsafe_prefix                                  102      18     -84
-------------------------------------------------------------------------------
-(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: 31 bytes
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-CVE: CVE-2026-26157
-CVE: CVE-2026-26158
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3fb6b31c716669e12f75a2accd31bb7685b1a1cb]
-(Alternative mirrored URL: https://gogs.librecmc.org/OWEALS/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb)
-Signed-off-by: Ernst Persson <ernst.persson@non.se.com>
----
- archival/libarchive/data_extract_all.c      |  7 +++--
- archival/libarchive/get_header_tar.c        | 11 ++++++--
- archival/libarchive/unsafe_prefix.c         | 30 +++++++++++++++++----
- archival/libarchive/unsafe_symlink_target.c |  1 +
- archival/tar.c                              |  2 +-
- archival/unzip.c                            |  2 +-
- include/bb_archive.h                        |  3 ++-
- 7 files changed, 42 insertions(+), 14 deletions(-)
-
-diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
-index 8a69711..b84b960 100644
---- a/archival/libarchive/data_extract_all.c
-+++ b/archival/libarchive/data_extract_all.c
-@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
- 	}
- #endif
- #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
--	/* Strip leading "/" and up to last "/../" path component */
--	dst_name = (char *)strip_unsafe_prefix(dst_name);
-+	/* Skip leading "/" and past last ".." path component */
-+	dst_name = (char *)skip_unsafe_prefix(dst_name);
- #endif
- // ^^^ This may be a problem if some applets do need to extract absolute names.
- // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
-@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
- 
- 		/* To avoid a directory traversal attack via symlinks,
- 		 * do not restore symlinks with ".." components
--		 * or symlinks starting with "/", unless a magic
--		 * envvar is set.
-+		 * or symlinks starting with "/"
- 		 *
- 		 * For example, consider a .tar created via:
- 		 *  $ tar cvf bug.tar anything.txt
-diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
-index cc6f3f0..1c40ece 100644
---- a/archival/libarchive/get_header_tar.c
-+++ b/archival/libarchive/get_header_tar.c
-@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
- #endif
- 
- 	/* Everything up to and including last ".." component is stripped */
--	overlapping_strcpy(file_header->name, strip_unsafe_prefix(file_header->name));
--//TODO: do the same for file_header->link_target?
-+	strip_unsafe_prefix(file_header->name);
-+	if (file_header->link_target) {
-+		/* GNU tar 1.34 examples:
-+		 * tar: Removing leading '/' from hard link targets
-+		 * tar: Removing leading '../' from hard link targets
-+		 * tar: Removing leading 'etc/../' from hard link targets
-+		 */
-+		strip_unsafe_prefix(file_header->link_target);
-+	}
- 
- 	/* Strip trailing '/' in directories */
- 	/* Must be done after mode is set as '/' is used to check if it's a directory */
-diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
-index 6670811..89a371a 100644
---- a/archival/libarchive/unsafe_prefix.c
-+++ b/archival/libarchive/unsafe_prefix.c
-@@ -5,11 +5,11 @@
- #include "libbb.h"
- #include "bb_archive.h"
- 
--const char* FAST_FUNC strip_unsafe_prefix(const char *str)
-+const char* FAST_FUNC skip_unsafe_prefix(const char *str)
- {
- 	const char *cp = str;
- 	while (1) {
--		char *cp2;
-+		const char *cp2;
- 		if (*cp == '/') {
- 			cp++;
- 			continue;
-@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
- 			cp += 3;
- 			continue;
- 		}
--		cp2 = strstr(cp, "/../");
-+		cp2 = cp;
-+ find_dotdot:
-+		cp2 = strstr(cp2, "/..");
- 		if (!cp2)
--			break;
--		cp = cp2 + 4;
-+			break; /* No (more) malicious components */
-+
-+		/* We found "/..something" */
-+		cp2 += 3;
-+		if (*cp2 != '/') {
-+			if (*cp2 == '\0') {
-+				/* Trailing "/..": malicious, return "" */
-+				/* (causes harmless errors trying to create or hardlink a file named "") */
-+				return cp2;
-+			}
-+			/* "/..name" is not malicious, look for next "/.." */
-+			goto find_dotdot;
-+		}
-+		/* Found "/../": malicious, advance past it */
-+		cp = cp2 + 1;
- 	}
- 	if (cp != str) {
- 		static smallint warned = 0;
-@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
- 	}
- 	return cp;
- }
-+
-+void FAST_FUNC strip_unsafe_prefix(char *str)
-+{
-+	overlapping_strcpy(str, skip_unsafe_prefix(str));
-+}
-diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/libarchive/unsafe_symlink_target.c
-index f8dc803..d764c89 100644
---- a/archival/libarchive/unsafe_symlink_target.c
-+++ b/archival/libarchive/unsafe_symlink_target.c
-@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
- 				*list->data ? "hard" : "sym",
- 				list->data + 1, target
- 			);
-+			/* Note: GNU tar 1.34 errors out only _after_ all links are (attempted to be) created */
- 		}
- 		list = list->link;
- 	}
-diff --git a/archival/tar.c b/archival/tar.c
-index d6ca6c1..d42dcfc 100644
---- a/archival/tar.c
-+++ b/archival/tar.c
-@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct recursive_state *state,
- 	DBG("writeFileToTarball('%s')", fileName);
- 
- 	/* Strip leading '/' and such (must be before memorizing hardlink's name) */
--	header_name = strip_unsafe_prefix(fileName);
-+	header_name = skip_unsafe_prefix(fileName);
- 
- 	if (header_name[0] == '\0')
- 		return TRUE;
-diff --git a/archival/unzip.c b/archival/unzip.c
-index 71a3029..8a9a90f 100644
---- a/archival/unzip.c
-+++ b/archival/unzip.c
-@@ -860,7 +860,7 @@ int unzip_main(int argc, char **argv)
- 
- 		/* Guard against "/abspath", "/../" and similar attacks */
- // NB: UnZip 6.00 has option -: to disable this
--		overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
-+		strip_unsafe_prefix(dst_fn);
- 
- 		/* Filter zip entries */
- 		if (find_list_entry(zreject, dst_fn)
-diff --git a/include/bb_archive.h b/include/bb_archive.h
-index e0ef8fc..1dc77f3 100644
---- a/include/bb_archive.h
-+++ b/include/bb_archive.h
-@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t *archive_handle) FAST_FUNC;
- void seek_by_jump(int fd, off_t amount) FAST_FUNC;
- void seek_by_read(int fd, off_t amount) FAST_FUNC;
- 
--const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
-+const char *skip_unsafe_prefix(const char *str) FAST_FUNC;
-+void strip_unsafe_prefix(char *str) FAST_FUNC;
- void create_or_remember_link(llist_t **link_placeholders,
- 		const char *target,
- 		const char *linkname,
diff --git a/meta/recipes-core/busybox/busybox/0002-start-stop-daemon-fix-tests.patch b/meta/recipes-core/busybox/busybox/0002-start-stop-daemon-fix-tests.patch
index a5abec4e53..87b40f6fc3 100644
--- a/meta/recipes-core/busybox/busybox/0002-start-stop-daemon-fix-tests.patch
+++ b/meta/recipes-core/busybox/busybox/0002-start-stop-daemon-fix-tests.patch
@@ -19,7 +19,7 @@ diff --git a/testsuite/start-stop-daemon.tests b/testsuite/start-stop-daemon.tes
 index e1e49ab5f..fd59859ef 100755
 --- a/testsuite/start-stop-daemon.tests
 +++ b/testsuite/start-stop-daemon.tests
-@@ -6,24 +6,27 @@
+@@ -6,25 +6,28 @@
  
  # testing "test name" "cmd" "expected result" "file input" "stdin"
  
@@ -44,15 +44,16 @@ index e1e49ab5f..fd59859ef 100755
 +	"$TMP_DIR\n" \
  	"" ""
  
+ optional FEATURE_START_STOP_DAEMON_LONG_OPTIONS
  testing "start-stop-daemon -x with --chdir on existing and check dir" \
 -	'output=$(start-stop-daemon -S --chdir /tmp -x pwd); echo $output' \
 -	"/tmp\n" \
 +	'output=$(start-stop-daemon -S --chdir $TMP_DIR -x pwd); echo $output' \
 +	"$TMP_DIR\n" \
  	"" ""
+ SKIP=""
  
- testing "start-stop-daemon -a without -x" \
-@@ -48,6 +51,7 @@ testing "start-stop-daemon -x with -d on non-existing directory" \
+@@ -50,6 +53,7 @@ testing "start-stop-daemon -x with -d on non-existing directory" \
  #
  # NB: this fails if /bin/false is a busybox symlink:
  # busybox looks at argv[0] and says "qwerty: applet not found"
diff --git a/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch b/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
deleted file mode 100644
index 830082a7d6..0000000000
--- a/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 981479997e29953c1a12c9c7376c9d259d035311 Mon Sep 17 00:00:00 2001
-From: Radoslav Kolev <radoslav.kolev@suse.com>
-Date: Mon, 16 Feb 2026 11:50:04 +0200
-Subject: [PATCH] tar: only strip unsafe components from hardlinks, not
- symlinks
-
-commit 3fb6b31c7 introduced a check for unsafe components in
-tar archive hardlinks, but it was being applied to symlinks too
-which broke "Symlinks and hardlinks coexist" tar test.
-
-Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-CVE: CVE-2026-26157
-CVE: CVE-2026-26158
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=599f5dd8fac390c18b79cba4c14c334957605dae]
-(Alternative mirrored URL: https://gogs.librecmc.org/OWEALS/busybox/commit/599f5dd8fac390c18b79cba4c14c334957605dae)
-Signed-off-by: Ernst Persson <ernst.persson@non.se.com>
----
- archival/libarchive/get_header_tar.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
-index 1c40ece..606d806 100644
---- a/archival/libarchive/get_header_tar.c
-+++ b/archival/libarchive/get_header_tar.c
-@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
- 
- 	/* Everything up to and including last ".." component is stripped */
- 	strip_unsafe_prefix(file_header->name);
--	if (file_header->link_target) {
-+	if (file_header->link_target && !S_ISLNK(file_header->mode)) {
- 		/* GNU tar 1.34 examples:
- 		 * tar: Removing leading '/' from hard link targets
- 		 * tar: Removing leading '../' from hard link targets
diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
deleted file mode 100644
index c95cba3c33..0000000000
--- a/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From f5e1bf966b19ea1821f00a8c9ecd7774598689b4 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Wed, 24 Sep 2025 03:28:47 +0200
-Subject: [PATCH] archival/libarchive: sanitize filenames on output (prevent
- control sequence attacks
-
-This fixes CVE-2025-46394 (terminal escape sequence injection)
-
-Original credit: Ian.Norton at entrust.com
-
-function                                             old     new   delta
-header_list                                            9      15      +6
-header_verbose_list                                  239     244      +5
-------------------------------------------------------------------------------
-(add/remove: 0/0 grow/shrink: 2/0 up/down: 11/0)               Total: 11 bytes
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-CVE: CVE-2025-46394
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=f5e1bf966b19ea1821f00a8c9ecd7774598689b4]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- archival/libarchive/header_list.c         | 2 +-
- archival/libarchive/header_verbose_list.c | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/archival/libarchive/header_list.c b/archival/libarchive/header_list.c
-index 0621aa406..9490b3635 100644
---- a/archival/libarchive/header_list.c
-+++ b/archival/libarchive/header_list.c
-@@ -8,5 +8,5 @@
- void FAST_FUNC header_list(const file_header_t *file_header)
- {
- //TODO: cpio -vp DIR should output "DIR/NAME", not just "NAME" */
--	puts(file_header->name);
-+	puts(printable_string(file_header->name));
- }
-diff --git a/archival/libarchive/header_verbose_list.c b/archival/libarchive/header_verbose_list.c
-index a575a08a0..e7a09430d 100644
---- a/archival/libarchive/header_verbose_list.c
-+++ b/archival/libarchive/header_verbose_list.c
-@@ -57,13 +57,13 @@ void FAST_FUNC header_verbose_list(const file_header_t *file_header)
- 		ptm->tm_hour,
- 		ptm->tm_min,
- 		ptm->tm_sec,
--		file_header->name);
-+		printable_string(file_header->name));
- 
- #endif /* FEATURE_TAR_UNAME_GNAME */
- 
- 	/* NB: GNU tar shows "->" for symlinks and "link to" for hardlinks */
- 	if (file_header->link_target) {
--		printf(" -> %s", file_header->link_target);
-+		printf(" -> %s", printable_string(file_header->link_target));
- 	}
- 	bb_putchar('\n');
- }
diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
deleted file mode 100644
index ec17b9285a..0000000000
--- a/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7378db981d87b4a2264e14d60340a7fb5c67ae59 Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Fri, 3 Oct 2025 16:12:56 +0200
-Subject: [PATCH] testsuite/tar.tests: fix test after CVE-2025-46394
-
-tar now sanitizes output and this test needs to expect that.
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
-
-CVE: CVE-2025-46394
-Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-October/091743.html]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- testsuite/tar.tests | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testsuite/tar.tests b/testsuite/tar.tests
-index 0f2e89112..48fc38114 100755
---- a/testsuite/tar.tests
-+++ b/testsuite/tar.tests
-@@ -325,9 +325,9 @@ unset LANG
- rm -rf etc usr
- ' "\
- etc/ssl/certs/3b2716e5.0
--etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
-+etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.pem
- etc/ssl/certs/f80cc7f6.0
--usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
-+usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.crt
- 0
- etc/ssl/certs/3b2716e5.0 -> EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
- etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem -> /usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 22c9dafcb3..93d9207c82 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.37.0
+# Busybox version: 1.38.0
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -26,6 +26,7 @@ CONFIG_PID_FILE_PATH="/var/run"
 CONFIG_BUSYBOX=y
 # CONFIG_FEATURE_SHOW_SCRIPT is not set
 # CONFIG_FEATURE_INSTALLER is not set
+CONFIG_FEATURE_VERSION=y
 # CONFIG_INSTALL_NO_USR is not set
 CONFIG_FEATURE_SUID=y
 CONFIG_FEATURE_SUID_CONFIG=y
@@ -196,6 +197,7 @@ CONFIG_FEATURE_UNZIP_CDF=y
 # CONFIG_FEATURE_UNZIP_LZMA is not set
 # CONFIG_FEATURE_UNZIP_XZ is not set
 # CONFIG_FEATURE_LZMA_FAST is not set
+# CONFIG_FEATURE_PATH_TRAVERSAL_PROTECTION is not set
 
 #
 # Coreutils
@@ -283,11 +285,12 @@ CONFIG_FEATURE_LS_COLOR=y
 CONFIG_MD5SUM=y
 # CONFIG_SHA1SUM is not set
 # CONFIG_SHA256SUM is not set
+# CONFIG_SHA384SUM is not set
 # CONFIG_SHA512SUM is not set
 # CONFIG_SHA3SUM is not set
 
 #
-# Common options for md5sum, sha1sum, sha256sum, sha512sum, sha3sum
+# Common options for md5sum, sha1sum, sha256sum, ..., sha3sum
 #
 CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
 CONFIG_MKDIR=y
@@ -529,6 +532,7 @@ CONFIG_INIT_TERMINAL_TYPE=""
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
+# CONFIG_USE_BB_CRYPT_YES is not set
 # CONFIG_ADD_SHELL is not set
 # CONFIG_REMOVE_SHELL is not set
 # CONFIG_ADDGROUP is not set
@@ -622,6 +626,7 @@ CONFIG_FEATURE_FBSET_READMODE=y
 # CONFIG_FDFORMAT is not set
 CONFIG_FDISK=y
 # CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
+CONFIG_FEATURE_FDISK_BLKSIZE=y
 CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_AIX_LABEL is not set
 # CONFIG_FEATURE_SGI_LABEL is not set
@@ -649,6 +654,7 @@ CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
 # CONFIG_LAST is not set
 # CONFIG_FEATURE_LAST_FANCY is not set
 CONFIG_LOSETUP=y
+# CONFIG_LSBLK is not set
 # CONFIG_LSPCI is not set
 # CONFIG_LSUSB is not set
 # CONFIG_MDEV is not set
@@ -714,6 +720,7 @@ CONFIG_SWITCH_ROOT=y
 CONFIG_UMOUNT=y
 CONFIG_FEATURE_UMOUNT_ALL=y
 # CONFIG_UNSHARE is not set
+CONFIG_UUIDGEN=y
 # CONFIG_WALL is not set
 
 #
@@ -723,6 +730,10 @@ CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
 # CONFIG_VOLUMEID is not set
+
+#
+# Filesystem/Volume identification
+#
 # CONFIG_FEATURE_VOLUMEID_BCACHE is not set
 # CONFIG_FEATURE_VOLUMEID_BTRFS is not set
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
@@ -967,6 +978,7 @@ CONFIG_FEATURE_FANCY_PING=y
 # CONFIG_ROUTE is not set
 # CONFIG_SLATTACH is not set
 # CONFIG_SSL_CLIENT is not set
+# CONFIG_SSL_SERVER is not set
 # CONFIG_TC is not set
 # CONFIG_FEATURE_TC_INGRESS is not set
 # CONFIG_TCPSVD is not set
@@ -976,6 +988,7 @@ CONFIG_TELNET=y
 CONFIG_FEATURE_TELNET_AUTOLOGIN=y
 CONFIG_FEATURE_TELNET_WIDTH=y
 # CONFIG_TELNETD is not set
+# CONFIG_FEATURE_TELNETD_SELFTEST_DEBUG is not set
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
 CONFIG_FEATURE_TELNETD_PORT_DEFAULT=0
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
@@ -1094,6 +1107,7 @@ CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
 # CONFIG_FEATURE_TOPMEM is not set
 CONFIG_UPTIME=y
 # CONFIG_FEATURE_UPTIME_UTMP_SUPPORT is not set
+# CONFIG_VMSTAT is not set
 CONFIG_WATCH=y
 
 #
@@ -1157,6 +1171,7 @@ CONFIG_ASH_CMDCMD=y
 # CONFIG_CTTYHACK is not set
 # CONFIG_HUSH is not set
 # CONFIG_SHELL_HUSH is not set
+# CONFIG_HUSH_NEED_FOR_SPEED is not set
 # CONFIG_HUSH_BASH_COMPAT is not set
 # CONFIG_HUSH_BRACE_EXPANSION is not set
 # CONFIG_HUSH_BASH_SOURCE_CURDIR is not set
@@ -1168,7 +1183,9 @@ CONFIG_ASH_CMDCMD=y
 # CONFIG_HUSH_IF is not set
 # CONFIG_HUSH_LOOPS is not set
 # CONFIG_HUSH_CASE is not set
+# CONFIG_HUSH_ALIAS is not set
 # CONFIG_HUSH_FUNCTIONS is not set
+# CONFIG_HUSH_FUNCTION_KEYWORD is not set
 # CONFIG_HUSH_LOCAL is not set
 # CONFIG_HUSH_RANDOM_SUPPORT is not set
 # CONFIG_HUSH_MODE_X is not set
@@ -1210,6 +1227,10 @@ CONFIG_FEATURE_SH_HISTFILESIZE=y
 # System Logging Utilities
 #
 CONFIG_KLOGD=y
+
+#
+# klogd should not be used together with syslog to kernel printk buffer
+#
 CONFIG_FEATURE_KLOGD_KLOGCTL=y
 CONFIG_LOGGER=y
 # CONFIG_LOGREAD is not set
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.38.0.bb
similarity index 85%
rename from meta/recipes-core/busybox/busybox_1.37.0.bb
rename to meta/recipes-core/busybox/busybox_1.38.0.bb
index 4790899684..48b5e687b8 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.38.0.bb
@@ -50,22 +50,16 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            file://busybox-1.36.1-no-cbq.patch \
-           file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
            file://0001-syslogd-fix-wrong-OPT_locallog-flag-detection.patch \
            file://0002-start-stop-daemon-fix-tests.patch \
            file://0003-start-stop-false.patch \
-           file://0001-archival-disallow-path-traversals-CVE-2023-39810.patch \
            file://0001-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch \
            file://0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch \
-           file://CVE-2025-46394-01.patch \
-           file://CVE-2025-46394-02.patch \
-           file://CVE-2025-60876.patch \
            file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch \
-           file://0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch \
-           file://0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch \
+           file://CVE-2025-60876.patch \
            file://CVE-2024-58251.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
 
-SRC_URI[tarball.sha256sum] = "3311dff32e746499f4df0d5df04d7eb396382d7e108bb9250e7b519b837043a4"
+SRC_URI[tarball.sha256sum] = "34f9ea6ff8636f2c9241153b9114eefa9e65674a45318ae1ef95bb5f31c53bb2"
-- 
2.34.1



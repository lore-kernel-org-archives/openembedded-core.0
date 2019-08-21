Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0FB7C377
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 01:58:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Aug 2019 18:58:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,410,1559545200"; d="scan'208";a="178365476"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by fmsmga008.fm.intel.com with ESMTP; 20 Aug 2019 18:58:25 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2019 09:58:18 +0800
Message-Id: <20190821015818.18971-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821015818.18971-1-anuj.mittal@intel.com>
References: <20190821015818.18971-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [warrior][PATCH 3/3] patch: backport fixes
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
X-List-Received-Date: Wed, 21 Aug 2019 01:58:25 -0000
Content-Transfer-Encoding: 8bit

The original fix for CVE-2018-1000156 was incomplete. Backport more
fixes done later for a complete fix.

Also see:
https://savannah.gnu.org/bugs/index.php?53820

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...porary-file-on-failed-ed-style-patch.patch | 93 +++++++++++++++++++
 ...mporary-file-on-failed-multi-file-ed.patch | 80 ++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  2 +
 3 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch

diff --git a/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch b/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
new file mode 100644
index 0000000000..9891526e4e
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
@@ -0,0 +1,93 @@
+From 7f770b9c20da1a192dad8cb572a6391f2773285a Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Thu, 3 May 2018 14:31:55 +0200
+Subject: [PATCH 1/2] Don't leak temporary file on failed ed-style patch
+
+Now that we write ed-style patches to a temporary file before we
+apply them, we need to ensure that the temporary file is removed
+before we leave, even on fatal error.
+
+* src/pch.c (do_ed_script): Use global TMPEDNAME instead of local
+  tmpname. Don't unlink the file directly, instead tag it for removal
+  at exit time.
+* src/patch.c (cleanup): Unlink TMPEDNAME at exit.
+
+This closes bug #53820:
+https://savannah.gnu.org/bugs/index.php?53820
+
+Fixes: 123eaff0d5d1 ("Fix arbitrary command execution in ed-style patches (CVE-2018-1000156)")
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=19599883ffb6a450d2884f081f8ecf68edbed7ee]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ src/common.h |  2 ++
+ src/pch.c    | 12 +++++-------
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/common.h b/src/common.h
+index ec50b40..22238b5 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -94,10 +94,12 @@ XTERN char const *origsuff;
+ XTERN char const * TMPINNAME;
+ XTERN char const * TMPOUTNAME;
+ XTERN char const * TMPPATNAME;
++XTERN char const * TMPEDNAME;
+ 
+ XTERN bool TMPINNAME_needs_removal;
+ XTERN bool TMPOUTNAME_needs_removal;
+ XTERN bool TMPPATNAME_needs_removal;
++XTERN bool TMPEDNAME_needs_removal;
+ 
+ #ifdef DEBUGGING
+ XTERN int debug;
+diff --git a/src/pch.c b/src/pch.c
+index 16e001a..c1a62cf 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -2392,7 +2392,6 @@ do_ed_script (char const *inname, char const *outname,
+     file_offset beginning_of_this_line;
+     size_t chars_read;
+     FILE *tmpfp = 0;
+-    char const *tmpname;
+     int tmpfd;
+     pid_t pid;
+ 
+@@ -2404,12 +2403,13 @@ do_ed_script (char const *inname, char const *outname,
+ 	   invalid commands and treats the next line as a new command, which
+ 	   can lead to arbitrary command execution.  */
+ 
+-	tmpfd = make_tempfile (&tmpname, 'e', NULL, O_RDWR | O_BINARY, 0);
++	tmpfd = make_tempfile (&TMPEDNAME, 'e', NULL, O_RDWR | O_BINARY, 0);
+ 	if (tmpfd == -1)
+-	  pfatal ("Can't create temporary file %s", quotearg (tmpname));
++        pfatal ("Can't create temporary file %s", quotearg (TMPEDNAME));
++        TMPEDNAME_needs_removal = true;
+ 	tmpfp = fdopen (tmpfd, "w+b");
+ 	if (! tmpfp)
+-	  pfatal ("Can't open stream for file %s", quotearg (tmpname));
++        pfatal ("Can't open stream for file %s", quotearg (TMPEDNAME));
+       }
+ 
+     for (;;) {
+@@ -2449,8 +2449,7 @@ do_ed_script (char const *inname, char const *outname,
+       write_fatal ();
+ 
+     if (lseek (tmpfd, 0, SEEK_SET) == -1)
+-      pfatal ("Can't rewind to the beginning of file %s", quotearg (tmpname));
+-
++        pfatal ("Can't rewind to the beginning of file %s", quotearg (TMPEDNAME));
+     if (! dry_run && ! skip_rest_of_patch) {
+ 	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
+ 	*outname_needs_removal = true;
+@@ -2482,7 +2481,6 @@ do_ed_script (char const *inname, char const *outname,
+     }
+ 
+     fclose (tmpfp);
+-    safe_unlink (tmpname);
+ 
+     if (ofp)
+       {
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch b/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch
new file mode 100644
index 0000000000..d6a219a1b1
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch
@@ -0,0 +1,80 @@
+From 369dcccdfa6336e5a873d6d63705cfbe04c55727 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Mon, 7 May 2018 15:14:45 +0200
+Subject: Don't leak temporary file on failed multi-file ed-style patch
+
+The previous fix worked fine with single-file ed-style patches, but
+would still leak temporary files in the case of multi-file ed-style
+patch. Fix that case as well, and extend the test case to check for
+it.
+
+* src/patch.c (main): Unlink TMPEDNAME if needed before moving to
+  the next file in a patch.
+
+This closes bug #53820:
+https://savannah.gnu.org/bugs/index.php?53820
+
+Fixes: 123eaff0d5d1 ("Fix arbitrary command execution in ed-style patches (CVE-2018-1000156)")
+Fixes: 19599883ffb6 ("Don't leak temporary file on failed ed-style patch")
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=369dcccdfa6336e5a873d6d63705cfbe04c55727]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ src/patch.c    |  1 +
+ tests/ed-style | 31 +++++++++++++++++++++++++++++++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/src/patch.c b/src/patch.c
+index 9146597..81c7a02 100644
+--- a/src/patch.c
++++ b/src/patch.c
+@@ -236,6 +236,7 @@ main (int argc, char **argv)
+ 	    }
+ 	  remove_if_needed (TMPOUTNAME, &TMPOUTNAME_needs_removal);
+ 	}
++      remove_if_needed (TMPEDNAME, &TMPEDNAME_needs_removal);
+ 
+       if (! skip_rest_of_patch && ! file_type)
+ 	{
+diff --git a/tests/ed-style b/tests/ed-style
+index 6b6ef9d..504e6e5 100644
+--- a/tests/ed-style
++++ b/tests/ed-style
+@@ -38,3 +38,34 @@ EOF
+ check 'cat foo' <<EOF
+ foo
+ EOF
++
++# Test the case where one ed-style patch modifies several files
++
++cat > ed3.diff <<EOF
++--- foo
+++++ foo
++1c
++bar
++.
++--- baz
+++++ baz
++0a
++baz
++.
++EOF
++
++# Apparently we can't create a file with such a patch, while it works fine
++# when the file name is provided on the command line
++cat > baz <<EOF
++EOF
++
++check 'patch -e -i ed3.diff' <<EOF
++EOF
++
++check 'cat foo' <<EOF
++bar
++EOF
++
++check 'cat baz' <<EOF
++baz
++EOF
+-- 
+cgit v1.0-41-gc330
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index 8908910f74..5d7f55f8dc 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -8,6 +8,8 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0001-Fix-swapping-fake-lines-in-pch_swap.patch \
             file://CVE-2019-13636.patch \
             file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch \
+            file://0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch \
+            file://0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.21.0



Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F5C771957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 06:59:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3B6xe7F026248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 23:59:40 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 10 Apr 2018 23:59:40 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2018 14:56:10 +0800
Message-ID: <561910e8bc69018f0f6aae2a4d813d704bf0da88.1523429249.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1523429249.git.jackie.huang@windriver.com>
References: <cover.1523429249.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] patch: fix CVE-2018-1000156
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
X-List-Received-Date: Wed, 11 Apr 2018 06:59:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* CVE detail: https://nvd.nist.gov/vuln/detail/CVE-2018-1000156

* upstream tracking: https://savannah.gnu.org/bugs/index.php?53566

* Fix arbitrary command execution in ed-style patches:
  - src/pch.c (do_ed_script): Write ed script to a temporary file instead
    of piping it to ed: this will cause ed to abort on invalid commands
    instead of rejecting them and carrying on.
  - tests/ed-style: New test case.
  - tests/Makefile.am (TESTS): Add test case.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...-files-to-be-missing-for-ed-style-patches.patch |  38 ++++
 ...ry-command-execution-in-ed-style-patches-.patch | 215 +++++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb         |   2 +
 3 files changed, 255 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch

diff --git a/meta/recipes-devtools/patch/patch/0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch b/meta/recipes-devtools/patch/patch/0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch
new file mode 100644
index 0000000000..2a09d0c03b
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch
@@ -0,0 +1,38 @@
+From b5a91a01e5d0897facdd0f49d64b76b0f02b43e1 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Fri, 6 Apr 2018 11:34:51 +0200
+Subject: [PATCH] Allow input files to be missing for ed-style patches
+
+* src/pch.c (do_ed_script): Allow input files to be missing so that new
+files will be created as with non-ed-style patches.
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=b5a91a01e5d0897facdd0f49d64b76b0f02b43e1]
+CVE: CVE-2018-1000156
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/pch.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index bc6278c..0c5cc26 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -2394,9 +2394,11 @@ do_ed_script (char const *inname, char const *outname,
+ 
+     if (! dry_run && ! skip_rest_of_patch) {
+ 	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
+-	assert (! inerrno);
+-	*outname_needs_removal = true;
+-	copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
++	if (inerrno != ENOENT)
++	  {
++	    *outname_needs_removal = true;
++	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
++	  }
+ 	sprintf (buf, "%s %s%s", editor_program,
+ 		 verbosity == VERBOSE ? "" : "- ",
+ 		 outname);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/patch/patch/0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch b/meta/recipes-devtools/patch/patch/0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
new file mode 100644
index 0000000000..d74c2f182e
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
@@ -0,0 +1,215 @@
+From 123eaff0d5d1aebe128295959435b9ca5909c26d Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Fri, 6 Apr 2018 12:14:49 +0200
+Subject: [PATCH] Fix arbitrary command execution in ed-style patches (CVE-2018-1000156)
+
+* src/pch.c (do_ed_script): Write ed script to a temporary file instead
+of piping it to ed: this will cause ed to abort on invalid commands
+instead of rejecting them and carrying on.
+* tests/ed-style: New test case.
+* tests/Makefile.am (TESTS): Add test case.
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=123eaff0d5d1aebe128295959435b9ca5909c26d]
+CVE: CVE-2018-1000156
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/pch.c         | 91 ++++++++++++++++++++++++++++++++++++++++---------------
+ tests/Makefile.am |  1 +
+ tests/ed-style    | 41 +++++++++++++++++++++++++
+ 3 files changed, 108 insertions(+), 25 deletions(-)
+ create mode 100644 tests/ed-style
+
+diff --git a/src/pch.c b/src/pch.c
+index 0c5cc26..4fd5a05 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -33,6 +33,7 @@
+ # include <io.h>
+ #endif
+ #include <safe.h>
++#include <sys/wait.h>
+ 
+ #define INITHUNKMAX 125			/* initial dynamic allocation size */
+ 
+@@ -2389,24 +2390,28 @@ do_ed_script (char const *inname, char const *outname,
+     static char const editor_program[] = EDITOR_PROGRAM;
+ 
+     file_offset beginning_of_this_line;
+-    FILE *pipefp = 0;
+     size_t chars_read;
++    FILE *tmpfp = 0;
++    char const *tmpname;
++    int tmpfd;
++    pid_t pid;
++
++    if (! dry_run && ! skip_rest_of_patch)
++      {
++	/* Write ed script to a temporary file.  This causes ed to abort on
++	   invalid commands such as when line numbers or ranges exceed the
++	   number of available lines.  When ed reads from a pipe, it rejects
++	   invalid commands and treats the next line as a new command, which
++	   can lead to arbitrary command execution.  */
++
++	tmpfd = make_tempfile (&tmpname, 'e', NULL, O_RDWR | O_BINARY, 0);
++	if (tmpfd == -1)
++	  pfatal ("Can't create temporary file %s", quotearg (tmpname));
++	tmpfp = fdopen (tmpfd, "w+b");
++	if (! tmpfp)
++	  pfatal ("Can't open stream for file %s", quotearg (tmpname));
++      }
+ 
+-    if (! dry_run && ! skip_rest_of_patch) {
+-	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
+-	if (inerrno != ENOENT)
+-	  {
+-	    *outname_needs_removal = true;
+-	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
+-	  }
+-	sprintf (buf, "%s %s%s", editor_program,
+-		 verbosity == VERBOSE ? "" : "- ",
+-		 outname);
+-	fflush (stdout);
+-	pipefp = popen(buf, binary_transput ? "wb" : "w");
+-	if (!pipefp)
+-	  pfatal ("Can't open pipe to %s", quotearg (buf));
+-    }
+     for (;;) {
+ 	char ed_command_letter;
+ 	beginning_of_this_line = file_tell (pfp);
+@@ -2417,14 +2422,14 @@ do_ed_script (char const *inname, char const *outname,
+ 	}
+ 	ed_command_letter = get_ed_command_letter (buf);
+ 	if (ed_command_letter) {
+-	    if (pipefp)
+-		if (! fwrite (buf, sizeof *buf, chars_read, pipefp))
++	    if (tmpfp)
++		if (! fwrite (buf, sizeof *buf, chars_read, tmpfp))
+ 		    write_fatal ();
+ 	    if (ed_command_letter != 'd' && ed_command_letter != 's') {
+ 	        p_pass_comments_through = true;
+ 		while ((chars_read = get_line ()) != 0) {
+-		    if (pipefp)
+-			if (! fwrite (buf, sizeof *buf, chars_read, pipefp))
++		    if (tmpfp)
++			if (! fwrite (buf, sizeof *buf, chars_read, tmpfp))
+ 			    write_fatal ();
+ 		    if (chars_read == 2  &&  strEQ (buf, ".\n"))
+ 			break;
+@@ -2437,13 +2442,49 @@ do_ed_script (char const *inname, char const *outname,
+ 	    break;
+ 	}
+     }
+-    if (!pipefp)
++    if (!tmpfp)
+       return;
+-    if (fwrite ("w\nq\n", sizeof (char), (size_t) 4, pipefp) == 0
+-	|| fflush (pipefp) != 0)
++    if (fwrite ("w\nq\n", sizeof (char), (size_t) 4, tmpfp) == 0
++	|| fflush (tmpfp) != 0)
+       write_fatal ();
+-    if (pclose (pipefp) != 0)
+-      fatal ("%s FAILED", editor_program);
++
++    if (lseek (tmpfd, 0, SEEK_SET) == -1)
++      pfatal ("Can't rewind to the beginning of file %s", quotearg (tmpname));
++
++    if (! dry_run && ! skip_rest_of_patch) {
++	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
++	*outname_needs_removal = true;
++	if (inerrno != ENOENT)
++	  {
++	    *outname_needs_removal = true;
++	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
++	  }
++	sprintf (buf, "%s %s%s", editor_program,
++		 verbosity == VERBOSE ? "" : "- ",
++		 outname);
++	fflush (stdout);
++
++	pid = fork();
++	if (pid == -1)
++	  pfatal ("Can't fork");
++	else if (pid == 0)
++	  {
++	    dup2 (tmpfd, 0);
++	    execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
++	    _exit (2);
++	  }
++	else
++	  {
++	    int wstatus;
++	    if (waitpid (pid, &wstatus, 0) == -1
++	        || ! WIFEXITED (wstatus)
++		|| WEXITSTATUS (wstatus) != 0)
++	      fatal ("%s FAILED", editor_program);
++	  }
++    }
++
++    fclose (tmpfp);
++    safe_unlink (tmpname);
+ 
+     if (ofp)
+       {
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 6b6df63..16f8693 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -32,6 +32,7 @@ TESTS = \
+ 	crlf-handling \
+ 	dash-o-append \
+ 	deep-directories \
++	ed-style \
+ 	empty-files \
+ 	false-match \
+ 	fifo \
+diff --git a/tests/ed-style b/tests/ed-style
+new file mode 100644
+index 0000000..d8c0689
+--- /dev/null
++++ b/tests/ed-style
+@@ -0,0 +1,41 @@
++# Copyright (C) 2018 Free Software Foundation, Inc.
++#
++# Copying and distribution of this file, with or without modification,
++# in any medium, are permitted without royalty provided the copyright
++# notice and this notice are preserved.
++
++. $srcdir/test-lib.sh
++
++require cat
++use_local_patch
++use_tmpdir
++
++# ==============================================================
++
++cat > ed1.diff <<EOF
++0a
++foo
++.
++EOF
++
++check 'patch -e foo -i ed1.diff' <<EOF
++EOF
++
++check 'cat foo' <<EOF
++foo
++EOF
++
++cat > ed2.diff <<EOF
++1337a
++r !echo bar
++,p
++EOF
++
++check 'patch -e foo -i ed2.diff 2> /dev/null || echo "Status: $?"' <<EOF
++?
++Status: 2
++EOF
++
++check 'cat foo' <<EOF
++foo
++EOF
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index 19ddf34981..823486dd0a 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -3,6 +3,8 @@ LICENSE = "GPLv3"
 
 SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0002-Fix-segfault-with-mangled-rename-patch.patch \
+            file://0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch \
+            file://0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.11.0



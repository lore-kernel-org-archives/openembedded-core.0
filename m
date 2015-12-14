Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 384906AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064124"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:06 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:17 +0200
Message-Id: <c3f074dce99f13357c4195b698a89d44a455c513.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/20] cpio: update to 2.12
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:06 -0000

Drop backported patches:
Fix-symlink-bad-length-test-for-64-bit-architectures.patch
fix-memory-overrun.patch
fix-testcase-symlink-bad-lengths.patch
0001-fix-testcase-of-symlink-bad-length.patch

statdef.patch is fixing code that doesn't exist anymore.
The problem handled by remove-gets.patch has been fixed differently.

The CVE-2015-1197 has been ignored by upstream and had to be rebased:
http://lists.gnu.org/archive/html/bug-cpio/2015-09/msg00007.html

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-fix-testcase-of-symlink-bad-length.patch  |  57 ------
 ...-bad-length-test-for-64-bit-architectures.patch |  36 ----
 .../cpio/cpio-2.11/fix-memory-overrun.patch        | 220 ---------------------
 .../fix-testcase-symlink-bad-lengths.patch         |  33 ----
 .../cpio/cpio-2.11/remove-gets.patch               |  20 --
 meta/recipes-extended/cpio/cpio-2.11/statdef.patch |  17 --
 .../0001-Fix-CVE-2015-1197.patch}                  | 103 ++++++----
 ...need_charset_alias-when-building-for-musl.patch |   0
 meta/recipes-extended/cpio/cpio_2.11.bb            |  18 --
 meta/recipes-extended/cpio/cpio_2.12.bb            |  12 ++
 meta/recipes-extended/cpio/cpio_2.8.bb             |   4 +-
 meta/recipes-extended/cpio/cpio_v2.inc             |   1 -
 12 files changed, 78 insertions(+), 443 deletions(-)
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/statdef.patch
 rename meta/recipes-extended/cpio/{cpio-2.11/cpio-CVE-2015-1197.patch => cpio-2.12/0001-Fix-CVE-2015-1197.patch} (57%)
 rename meta/recipes-extended/cpio/{cpio-2.11 => cpio-2.12}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 delete mode 100644 meta/recipes-extended/cpio/cpio_2.11.bb
 create mode 100644 meta/recipes-extended/cpio/cpio_2.12.bb

diff --git a/meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch b/meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch
deleted file mode 100644
index 642f557..0000000
--- a/meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Upstream-Status: Backport
-
-Subject: fix testcase of symlink-bad-length
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- tests/symlink-bad-length.at | 24 ++++++++++++++++++++----
- 1 file changed, 20 insertions(+), 4 deletions(-)
-
-diff --git a/tests/symlink-bad-length.at b/tests/symlink-bad-length.at
-index 74208ce..11fc6ce 100644
---- a/tests/symlink-bad-length.at
-+++ b/tests/symlink-bad-length.at
-@@ -1,5 +1,5 @@
- # Process this file with autom4te to create testsuite.  -*- Autotest -*-
--# Copyright (C) 2014 Free Software Foundation, Inc.
-+# Copyright (C) 2014-2015 Free Software Foundation, Inc.
- 
- # This program is free software; you can redistribute it and/or modify
- # it under the terms of the GNU General Public License as published by
-@@ -35,14 +35,30 @@ AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
- AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
- ])
- 
-+# The exact error message and exit status depend on the host architecture,
-+# therefore strderr is filtered out and error code is not checked.
-+
-+# So far the only case when cpio would exit with code 0 is when it skips
-+# several bytes and encounters a valid record header.  Perhaps it should
-+# exit with code 2 (non-critical error), if at least one byte was skipped,
-+# but that could hurt backward compatibility.
-+
- AT_CHECK([
- base64 -d ARCHIVE.base64 > ARCHIVE || AT_SKIP_TEST
--cpio -ntv < ARCHIVE
--test $? -eq 2
-+TZ=UTC cpio -ntv < ARCHIVE 2>stderr 
-+cat stderr | grep -v \
-+    -e 'stored filename length is out of range' \
-+    -e 'premature end of file' \
-+    -e 'archive header has reverse byte-order' \
-+    -e 'memory exhausted' \
-+    -e 'skipped [[0-9][0-9]*] bytes of junk' \
-+    -e '[[0-9][0-9]*] block' \
-+    >&2
-+echo >&2 STDERR
- ],
- [0],
- [-rw-rw-r--   1 10029    10031          13 Nov 25  2014 FILE
--],[cpio: premature end of file
-+],[STDERR
- ])
- 
- AT_CLEANUP
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch b/meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch
deleted file mode 100644
index c2da9e1..0000000
--- a/meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0e8d8ed494433237cff0ad6c513c40f025005e8c Mon Sep 17 00:00:00 2001
-From: Jun Zhang <jun.zhang@windriver.com>
-Date: Fri, 16 Oct 2015 10:48:21 +0800
-Subject: [PATCH] Fix symlink-bad-length test for 64-bit architectures.
-
-* src/util.c: Return non-zero exit code if EOF is hit prematurely.
-
-Backport commit:
-http://git.savannah.gnu.org/cgit/cpio.git/commit/src/util.c?id=f6a8a2cbd2d5ca40ea94900b55b845dd5ca87328
-
-Upstream-Status: Backport
-
-Signed-off-by: Jun Zhang <jun.zhang@windriver.com>
----
- src/util.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/util.c b/src/util.c
-index 00953d5..b536d82 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -206,10 +206,7 @@ tape_fill_input_buffer (int in_des, int num_bytes)
-   if (input_size < 0)
-     error (1, errno, _("read error"));
-   if (input_size == 0)
--    {
--      error (0, 0, _("premature end of file"));
--      exit (1);
--    }
-+    error (PAXEXIT_FAILURE, 0, _("premature end of file"));
-   input_bytes += input_size;
- }
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch b/meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch
deleted file mode 100644
index 89cd3cf..0000000
--- a/meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch
+++ /dev/null
@@ -1,220 +0,0 @@
-cpio: Fix memory overrun on reading improperly created link records
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
-
-http://git.savannah.gnu.org/cgit/cpio.git/commit/?id=746f3ff670dcfcdd28fcc990e79cd6fccc7ae48d
-
-  * src/copyin.c (get_link_name): New function.
-  (list_file, copyin_link): use get_link_name
-
-  * tests/symlink-bad-length.at: New file.
-  * tests/symlink-long.at: New file.
-  * tests/Makefile.am: Add new files.
-  * tests/testsuite.at: Likewise.
-
-  See http://lists.gnu.org/archive/html/bug-cpio/2014-11/msg00007.html
-
-Upstream-Status: Backport
-
-Signed-off-by: Sergey Poznyakoff <gray@gnu.org.ua>
-
-diff -Nurp cpio-2.11.orig/src/copyin.c cpio-2.11/src/copyin.c
---- cpio-2.11.orig/src/copyin.c	2010-02-15 18:02:23.000000000 +0800
-+++ cpio-2.11/src/copyin.c	2014-12-08 13:14:04.355547508 +0800
-@@ -126,6 +126,28 @@ tape_skip_padding (int in_file_des, off_
- }
- 
- 
-+static char *
-+get_link_name (struct cpio_file_stat *file_hdr, int in_file_des)
-+{
-+  off_t n = file_hdr->c_filesize + 1;
-+  char *link_name;
-+
-+  if (n == 0 || n > SIZE_MAX)
-+    {
-+      error (0, 0, _("%s: stored filename length too big"), file_hdr->c_name);
-+      link_name = NULL;
-+    }
-+  else
-+    {
-+      link_name = xmalloc (n);
-+      tape_buffered_read (link_name, in_file_des, file_hdr->c_filesize);
-+      link_name[file_hdr->c_filesize] = '\0';
-+      tape_skip_padding (in_file_des, file_hdr->c_filesize);
-+    }
-+  return link_name;
-+}
-+
-+
- static void
- list_file(struct cpio_file_stat* file_hdr, int in_file_des)
- {
-@@ -136,21 +158,16 @@ list_file(struct cpio_file_stat* file_hd
- 	{
- 	  if (archive_format != arf_tar && archive_format != arf_ustar)
- 	    {
--	      char *link_name = NULL;	/* Name of hard and symbolic links.  */
--
--	      link_name = (char *) xmalloc ((unsigned int) file_hdr->c_filesize + 1);
--	      link_name[file_hdr->c_filesize] = '\0';
--	      tape_buffered_read (link_name, in_file_des, file_hdr->c_filesize);
--	      long_format (file_hdr, link_name);
--	      free (link_name);
--	      tape_skip_padding (in_file_des, file_hdr->c_filesize);
--	      return;
-+	      char *link_name = get_link_name (file_hdr, in_file_des);
-+	      if (link_name)
-+		{
-+		  long_format (file_hdr, link_name);
-+		  free (link_name);
-+		}
- 	    }
- 	  else
--	    {
- 	      long_format (file_hdr, file_hdr->c_tar_linkname);
--	      return;
--	    }
-+	  return;
- 	}
-       else
- #endif
-@@ -650,10 +667,7 @@ copyin_link(struct cpio_file_stat *file_
- 
-   if (archive_format != arf_tar && archive_format != arf_ustar)
-     {
--      link_name = (char *) xmalloc ((unsigned int) file_hdr->c_filesize + 1);
--      link_name[file_hdr->c_filesize] = '\0';
--      tape_buffered_read (link_name, in_file_des, file_hdr->c_filesize);
--      tape_skip_padding (in_file_des, file_hdr->c_filesize);
-+      link_name = get_link_name (file_hdr, in_file_des);
-     }
-   else
-     {
-diff -Nurp cpio-2.11.orig/tests/Makefile.am cpio-2.11/tests/Makefile.am
---- cpio-2.11.orig/tests/Makefile.am	2010-02-15 18:02:23.000000000 +0800
-+++ cpio-2.11/tests/Makefile.am	2014-12-08 13:14:49.931545727 +0800
-@@ -52,6 +52,8 @@ TESTSUITE_AT = \
-  setstat04.at\
-  setstat05.at\
-  symlink.at\
-+ symlink-bad-length.at\
-+ symlink-long.at\
-  version.at
- 
- TESTSUITE = $(srcdir)/testsuite
-diff -Nurp cpio-2.11.orig/tests/symlink-bad-length.at cpio-2.11/tests/symlink-bad-length.at
---- cpio-2.11.orig/tests/symlink-bad-length.at	1970-01-01 08:00:00.000000000 +0800
-+++ cpio-2.11/tests/symlink-bad-length.at	2014-12-08 13:17:45.979538847 +0800
-@@ -0,0 +1,49 @@
-+# Process this file with autom4te to create testsuite.  -*- Autotest -*-
-+# Copyright (C) 2014 Free Software Foundation, Inc.
-+
-+# This program is free software; you can redistribute it and/or modify
-+# it under the terms of the GNU General Public License as published by
-+# the Free Software Foundation; either version 3, or (at your option)
-+# any later version.
-+
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+
-+# You should have received a copy of the GNU General Public License
-+# along with this program; if not, write to the Free Software
-+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-+# 02110-1301 USA.
-+
-+# Cpio v2.11 did segfault with badly set symlink length.
-+# References:
-+# http://lists.gnu.org/archive/html/bug-cpio/2014-11/msg00007.html
-+
-+AT_SETUP([symlink-bad-length])
-+AT_KEYWORDS([symlink-long copyout])
-+
-+AT_DATA([ARCHIVE.base64],
-+[x3EjAIBAtIEtJy8nAQAAAHRUYW0FAAAADQBGSUxFAABzb21lIGNvbnRlbnQKAMdxIwBgQ/+hLScv
-+JwEAAAB0VEhuBQD/////TElOSwAARklMRcdxAAAAAAAAAAAAAAEAAAAAAAAACwAAAAAAVFJBSUxF
-+UiEhIQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
-+])
-+
-+AT_CHECK([
-+base64 -d ARCHIVE.base64 > ARCHIVE || AT_SKIP_TEST
-+cpio -ntv < ARCHIVE
-+test $? -eq 2
-+],
-+[0],
-+[-rw-rw-r--   1 10029    10031          13 Nov 25 13:52 FILE
-+],[cpio: LINK: stored filename length too big
-+cpio: premature end of file
-+])
-+
-+AT_CLEANUP
-diff -Nurp cpio-2.11.orig/tests/symlink-long.at cpio-2.11/tests/symlink-long.at
---- cpio-2.11.orig/tests/symlink-long.at	1970-01-01 08:00:00.000000000 +0800
-+++ cpio-2.11/tests/symlink-long.at	2014-12-08 13:17:57.219538408 +0800
-@@ -0,0 +1,46 @@
-+# Process this file with autom4te to create testsuite.  -*- Autotest -*-
-+# Copyright (C) 2014 Free Software Foundation, Inc.
-+
-+# This program is free software; you can redistribute it and/or modify
-+# it under the terms of the GNU General Public License as published by
-+# the Free Software Foundation; either version 3, or (at your option)
-+# any later version.
-+
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+
-+# You should have received a copy of the GNU General Public License
-+# along with this program; if not, write to the Free Software
-+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-+# 02110-1301 USA.
-+
-+# Cpio v2.11.90 changed the way symlink name is read from archive.
-+# References:
-+# http://lists.gnu.org/archive/html/bug-cpio/2014-11/msg00007.html
-+
-+AT_SETUP([symlink-long])
-+AT_KEYWORDS([symlink-long copyout])
-+
-+AT_CHECK([
-+
-+# len(dirname) > READBUFSIZE
-+dirname=
-+for i in {1..52}; do
-+    dirname="xxxxxxxxx/$dirname"
-+    mkdir "$dirname"
-+done
-+ln -s "$dirname" x || AT_SKIP_TEST
-+
-+echo x | cpio -o > ar
-+list=`cpio -tv < ar | sed 's|.*-> ||'`
-+test "$list" = "$dirname" && echo success || echo fail
-+],
-+[0],
-+[success
-+],[2 blocks
-+2 blocks
-+])
-+
-+AT_CLEANUP
-diff -Nurp cpio-2.11.orig/tests/testsuite.at cpio-2.11/tests/testsuite.at
---- cpio-2.11.orig/tests/testsuite.at	2010-02-15 18:02:23.000000000 +0800
-+++ cpio-2.11/tests/testsuite.at	2014-12-08 13:15:13.515544805 +0800
-@@ -31,6 +31,8 @@ m4_include([version.at])
- 
- m4_include([inout.at])
- m4_include([symlink.at])
-+m4_include([symlink-bad-length.at])
-+m4_include([symlink-long.at])
- m4_include([interdir.at])
- 
- m4_include([setstat01.at])
diff --git a/meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch b/meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch
deleted file mode 100644
index a325f4b..0000000
--- a/meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c213ffa2e0ba6677e0dfade9c67b91446c70c8bd Mon Sep 17 00:00:00 2001
-From: Jun Zhang <jun.zhang@windriver.com>
-Date: Fri, 16 Oct 2015 21:25:17 +0800
-Subject: [PATCH] cpio: fix testcase symlink-bad-lengths
-
-* fix the output of stderr & stdout to meet latest cpio
-
-Upstream-Status: Pending
-
-Signed-off-by: Jun Zhang <jun.zhang@windriver.com>
----
- tests/symlink-bad-length.at | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/tests/symlink-bad-length.at b/tests/symlink-bad-length.at
-index 6f804b1..74208ce 100644
---- a/tests/symlink-bad-length.at
-+++ b/tests/symlink-bad-length.at
-@@ -41,9 +41,8 @@ cpio -ntv < ARCHIVE
- test $? -eq 2
- ],
- [0],
--[-rw-rw-r--   1 10029    10031          13 Nov 25 13:52 FILE
--],[cpio: LINK: stored filename length too big
--cpio: premature end of file
-+[-rw-rw-r--   1 10029    10031          13 Nov 25  2014 FILE
-+],[cpio: premature end of file
- ])
- 
- AT_CLEANUP
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch b/meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
deleted file mode 100644
index b4d113d..0000000
--- a/meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: cpio-2.11/gnu/stdio.in.h
-===================================================================
---- cpio-2.11.orig/gnu/stdio.in.h	2012-07-04 12:13:43.133066247 -0700
-+++ cpio-2.11/gnu/stdio.in.h	2012-07-04 12:14:10.189067564 -0700
-@@ -138,8 +138,10 @@
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
-+#if defined gets
- #undef gets
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
diff --git a/meta/recipes-extended/cpio/cpio-2.11/statdef.patch b/meta/recipes-extended/cpio/cpio-2.11/statdef.patch
deleted file mode 100644
index a6b8e82..0000000
--- a/meta/recipes-extended/cpio/cpio-2.11/statdef.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Avoid multiple stat definitions
-Patch taken from cpio mailing list posting 2010-03-19
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -urN cpio-2.11.orig/src/filetypes.h cpio-2.11/src/filetypes.h
---- cpio-2.11.orig/src/filetypes.h	2010-02-12 02:19:23.000000000 -0800
-+++ cpio-2.11/src/filetypes.h	2010-07-23 13:17:25.000000000 -0700
-@@ -82,4 +82,6 @@
- #define lstat stat
- #endif
- int lstat ();
-+#ifndef stat
- int stat ();
-+#endif
diff --git a/meta/recipes-extended/cpio/cpio-2.11/cpio-CVE-2015-1197.patch b/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-CVE-2015-1197.patch
similarity index 57%
rename from meta/recipes-extended/cpio/cpio-2.11/cpio-CVE-2015-1197.patch
rename to meta/recipes-extended/cpio/cpio-2.12/0001-Fix-CVE-2015-1197.patch
index b54afb8..8f719ad 100644
--- a/meta/recipes-extended/cpio/cpio-2.11/cpio-CVE-2015-1197.patch
+++ b/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-CVE-2015-1197.patch
@@ -1,28 +1,44 @@
-Description: CVE-2015-1197
- Apply patch by Vitezslav Cizek of SuSE to fix CVE-2015-1197.
- Upstream is dormant or no longer existing. To restore the old
- behaviour use --extract-over-symlinks (Closes: #774669)
- This issue has been discovered by Alexander Cherepanov.
+From dcee489f821c1260a0136fcdfdb6ff4dd11086ac Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 9 Dec 2015 17:58:03 +0200
+Subject: [PATCH] Fix CVE-2015-1197
+
+Apply patch by Vitezslav Cizek of SuSE to fix CVE-2015-1197.
+Upstream is dormant or no longer existing. To restore the old
+behaviour use --extract-over-symlinks (Closes: #774669)
+This issue has been discovered by Alexander Cherepanov.
 Author: Vitezslav Cizek <vcizek@suse.cz>
 Bug-Debian: https://bugs.debian.org/774669
 
-Upstream-Status: Backport
-
+Upstream-Status: Pending
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ doc/cpio.1   |  1 +
+ src/copyin.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/extern.h |  1 +
+ src/global.c |  3 +++
+ src/main.c   |  7 +++++++
+ 5 files changed, 74 insertions(+)
 
---- cpio-2.11+dfsg.orig/doc/cpio.1
-+++ cpio-2.11+dfsg/doc/cpio.1
-@@ -22,6 +22,7 @@ cpio \- copy files to and from archives
- [\-\-owner=[user][:.][group]] [\-\-no-preserve-owner] [\-\-message=message]
- [\-\-force\-local] [\-\-no\-absolute\-filenames] [\-\-sparse]
- [\-\-only\-verify\-crc] [\-\-to\-stdout] [\-\-quiet] [\-\-rsh-command=command]
-+[\-\-extract\-over\-symlinks]
- [\-\-help] [\-\-version] [pattern...] [< archive]
+diff --git a/doc/cpio.1 b/doc/cpio.1
+index 2a68241..dc4676c 100644
+--- a/doc/cpio.1
++++ b/doc/cpio.1
+@@ -49,6 +49,7 @@ cpio \- copy files to and from archives
+ [\fB\-\-no\-preserve\-owner\fR] [\fB\-\-message=\fIMESSAGE\fR]
+ [\fB\-\-force\-local\fR] [\fB\-\-no\-absolute\-filenames\fR] [\fB\-\-sparse\fR]
+ [\fB\-\-only\-verify\-crc\fR] [\fB\-\-to\-stdout\fR] [\fB\-\-quiet\fR]
++[\fB\-\-extract\-over\-symlinks\fR]
+ [\fB\-\-rsh\-command=\fICOMMAND\fR]
+ [\fIpattern\fR...] [\fB<\fR \fIarchive\fR]
  
- .B cpio
---- cpio-2.11+dfsg.orig/src/copyin.c
-+++ cpio-2.11+dfsg/src/copyin.c
-@@ -700,6 +700,51 @@ copyin_link (struct cpio_file_stat *file
+diff --git a/src/copyin.c b/src/copyin.c
+index cde911e..053afe7 100644
+--- a/src/copyin.c
++++ b/src/copyin.c
+@@ -695,6 +695,51 @@ copyin_link (struct cpio_file_stat *file_hdr, int in_file_des)
    free (link_name);
  }
  
@@ -74,7 +90,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  static void
  copyin_file (struct cpio_file_stat *file_hdr, int in_file_des)
  {
-@@ -1471,6 +1516,23 @@ process_copy_in ()
+@@ -1468,6 +1513,23 @@ process_copy_in ()
  	{
  	  /* Copy the input file into the directory structure.  */
  
@@ -98,18 +114,22 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  	  /* Do we need to rename the file? */
  	  if (rename_flag || rename_batch_file)
  	    {
---- cpio-2.11+dfsg.orig/src/extern.h
-+++ cpio-2.11+dfsg/src/extern.h
-@@ -95,6 +95,7 @@ extern char input_is_special;
+diff --git a/src/extern.h b/src/extern.h
+index e27d662..d864bde 100644
+--- a/src/extern.h
++++ b/src/extern.h
+@@ -96,6 +96,7 @@ extern char input_is_special;
  extern char output_is_special;
  extern char input_is_seekable;
  extern char output_is_seekable;
 +extern bool extract_over_symlinks;
  extern int (*xstat) ();
  extern void (*copy_function) ();
- 
---- cpio-2.11+dfsg.orig/src/global.c
-+++ cpio-2.11+dfsg/src/global.c
+ extern char *change_directory_option;
+diff --git a/src/global.c b/src/global.c
+index 57e505a..336fce4 100644
+--- a/src/global.c
++++ b/src/global.c
 @@ -187,6 +187,9 @@ bool to_stdout_option = false;
  /* The name this program was run with.  */
  char *program_name;
@@ -120,19 +140,19 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  /* A pointer to either lstat or stat, depending on whether
     dereferencing of symlinks is done for input files.  */
  int (*xstat) ();
---- cpio-2.11+dfsg.orig/src/main.c
-+++ cpio-2.11+dfsg/src/main.c
-@@ -57,7 +57,8 @@ enum cpio_options {
-   FORCE_LOCAL_OPTION,            
+diff --git a/src/main.c b/src/main.c
+index a13861f..87cb309 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -59,6 +59,7 @@ enum cpio_options {
    DEBUG_OPTION,                  
    BLOCK_SIZE_OPTION,             
--  TO_STDOUT_OPTION
-+  TO_STDOUT_OPTION,
-+  EXTRACT_OVER_SYMLINKS
- };
- 
- const char *program_authors[] =
-@@ -222,6 +223,8 @@ static struct argp_option options[] = {
+   TO_STDOUT_OPTION,
++  EXTRACT_OVER_SYMLINKS,
+   RENUMBER_INODES_OPTION,
+   IGNORE_DEVNO_OPTION,
+   DEVICE_INDEPENDENT_OPTION
+@@ -243,6 +244,8 @@ static struct argp_option options[] = {
     N_("Create leading directories where needed"), GRID+1 },
    {"no-preserve-owner", NO_PRESERVE_OWNER_OPTION, 0, 0,
     N_("Do not change the ownership of the files"), GRID+1 },
@@ -141,14 +161,17 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
    {"unconditional", 'u', NULL, 0,
     N_("Replace all files unconditionally"), GRID+1 },
    {"sparse", SPARSE_OPTION, NULL, 0,
-@@ -412,6 +415,10 @@ crc newc odc bin ustar tar (all-caps als
+@@ -432,6 +435,10 @@ crc newc odc bin ustar tar (all-caps also recognized)"), arg));
        no_chown_flag = true;
        break;
  
-+    case EXTRACT_OVER_SYMLINKS:		        /* --extract-over-symlinks */
++    case EXTRACT_OVER_SYMLINKS:                        /* --extract-over-symlinks */
 +      extract_over_symlinks = true;
 +      break;
 +
      case 'o':		/* Copy-out mode.  */
        if (copy_function != 0)
- 	error (PAXEXIT_FAILURE, 0, _("Mode already defined"));
+ 	USAGE_ERROR ((0, 0, _("Mode already defined")));
+-- 
+2.6.2
+
diff --git a/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/cpio/cpio-2.12/0001-Unset-need_charset_alias-when-building-for-musl.patch
similarity index 100%
rename from meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch
rename to meta/recipes-extended/cpio/cpio-2.12/0001-Unset-need_charset_alias-when-building-for-musl.patch
diff --git a/meta/recipes-extended/cpio/cpio_2.11.bb b/meta/recipes-extended/cpio/cpio_2.11.bb
deleted file mode 100644
index 9a6a50e..0000000
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-include cpio_v2.inc
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
-
-PR = "r5"
-
-SRC_URI += "file://remove-gets.patch \
-        file://fix-memory-overrun.patch \
-        file://cpio-CVE-2015-1197.patch \
-        file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-        file://Fix-symlink-bad-length-test-for-64-bit-architectures.patch \
-        file://fix-testcase-symlink-bad-lengths.patch \
-        file://0001-fix-testcase-of-symlink-bad-length.patch \
-        "
-
-SRC_URI[md5sum] = "1112bb6c45863468b5496ba128792f6c"
-SRC_URI[sha256sum] = "601b1d774cd6e4cd39416203c91ec59dbd65dd27d79d75e1a9b89497ea643978"
diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
new file mode 100644
index 0000000..e743999
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio_2.12.bb
@@ -0,0 +1,12 @@
+include cpio_v2.inc
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0001-Fix-CVE-2015-1197.patch \
+           "
+
+SRC_URI[md5sum] = "fc207561a86b63862eea4b8300313e86"
+SRC_URI[sha256sum] = "08a35e92deb3c85d269a0059a27d4140a9667a6369459299d08c17f713a92e73"
diff --git a/meta/recipes-extended/cpio/cpio_2.8.bb b/meta/recipes-extended/cpio/cpio_2.8.bb
index 3f97dbe..624906b 100644
--- a/meta/recipes-extended/cpio/cpio_2.8.bb
+++ b/meta/recipes-extended/cpio/cpio_2.8.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b7f772ea3a2489231cb4872656cac34b"
 
 PR = "r4"
 
-SRC_URI += "file://m4extensions.patch \
+SRC_URI += " \
+	    file://statdef.patch \
+	    file://m4extensions.patch \
 	    file://avoid_heap_overflow.patch \
 	    file://fix-memory-overrun.patch \
 	   "
diff --git a/meta/recipes-extended/cpio/cpio_v2.inc b/meta/recipes-extended/cpio/cpio_v2.inc
index 8520ff2..1bdc617 100644
--- a/meta/recipes-extended/cpio/cpio_v2.inc
+++ b/meta/recipes-extended/cpio/cpio_v2.inc
@@ -7,7 +7,6 @@ SECTION = "base"
 DEPENDS = "texinfo-native"
 
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
-    file://statdef.patch \
     "
 
 inherit autotools gettext texinfo
-- 
2.6.2



Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4C41272425
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 05:48:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44649583"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Dec 2014 13:45:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB85lvnd013983
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Dec 2014 13:47:57 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 8 Dec 2014 13:48:19 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Dec 2014 13:45:06 +0800
Message-ID: <1418017507-64551-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1418017507-64551-1-git-send-email-biannm@cn.fujitsu.com>
References: <1418017507-64551-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 1/2] cpio: fix bug CVE-2014-9112 for cpio-2.8
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
X-List-Received-Date: Mon, 08 Dec 2014 05:48:23 -0000
Content-Type: text/plain

Obtain detain from following URL.
http://lists.gnu.org/archive/html/bug-cpio/2014-12/msg00000.html
http://git.savannah.gnu.org/cgit/cpio.git/commit/?id=746f3ff670dcfcdd28fcc990e79cd6fccc7ae48d

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../cpio/cpio-2.8/fix-memory-overrun.patch         | 217 +++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.8.bb             |   7 +-
 2 files changed, 221 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.8/fix-memory-overrun.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.8/fix-memory-overrun.patch b/meta/recipes-extended/cpio/cpio-2.8/fix-memory-overrun.patch
new file mode 100644
index 0000000..0148e70
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.8/fix-memory-overrun.patch
@@ -0,0 +1,217 @@
+cpio: Fix memory overrun on reading improperly created link records
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+http://git.savannah.gnu.org/cgit/cpio.git/commit/?id=746f3ff670dcfcdd28fcc990e79cd6fccc7ae48d
+
+  * src/copyin.c (get_link_name): New function.
+  (list_file, copyin_link): use get_link_name
+
+  * tests/symlink-bad-length.at: New file.
+  * tests/symlink-long.at: New file.
+  * tests/Makefile.am: Add new files.
+  * tests/testsuite.at: Likewise.
+
+  See http://lists.gnu.org/archive/html/bug-cpio/2014-11/msg00007.html
+
+Upstream-Status: Backport
+
+Signed-off-by: Sergey Poznyakoff <gray@gnu.org.ua>
+
+diff -Nurp cpio-2.8.orig/src/copyin.c cpio-2.8/src/copyin.c
+--- cpio-2.8.orig/src/copyin.c	2007-06-07 19:58:03.000000000 +0800
++++ cpio-2.8/src/copyin.c	2014-12-08 11:30:01.159791484 +0800
+@@ -126,6 +126,28 @@ tape_skip_padding (int in_file_des, int
+ }
+ 
+ 
++static char *
++get_link_name (struct cpio_file_stat *file_hdr, int in_file_des)
++{
++  off_t n = file_hdr->c_filesize + 1;
++  char *link_name;
++
++  if (n == 0 || n > SIZE_MAX)
++    {
++      error (0, 0, _("%s: stored filename length too big"), file_hdr->c_name);
++      link_name = NULL;
++    }
++  else
++    {
++      link_name = xmalloc (n);
++      tape_buffered_read (link_name, in_file_des, file_hdr->c_filesize);
++      link_name[file_hdr->c_filesize] = '\0';
++      tape_skip_padding (in_file_des, file_hdr->c_filesize);
++    }
++  return link_name;
++}
++
++
+ static void
+ list_file(struct cpio_file_stat* file_hdr, int in_file_des)
+ {
+@@ -136,21 +158,16 @@ list_file(struct cpio_file_stat* file_hd
+ 	{
+ 	  if (archive_format != arf_tar && archive_format != arf_ustar)
+ 	    {
+-	      char *link_name = NULL;	/* Name of hard and symbolic links.  */
+-
+-	      link_name = (char *) xmalloc ((unsigned int) file_hdr->c_filesize + 1);
+-	      link_name[file_hdr->c_filesize] = '\0';
+-	      tape_buffered_read (link_name, in_file_des, file_hdr->c_filesize);
+-	      long_format (file_hdr, link_name);
+-	      free (link_name);
+-	      tape_skip_padding (in_file_des, file_hdr->c_filesize);
+-	      return;
++	      char *link_name = get_link_name (file_hdr, in_file_des);
++	      if (link_name)
++		{
++		  long_format (file_hdr, link_name);
++		  free (link_name);
++		}
+ 	    }
+ 	  else
+-	    {
+ 	      long_format (file_hdr, file_hdr->c_tar_linkname);
+-	      return;
+-	    }
++	  return;
+ 	}
+       else
+ #endif
+@@ -732,10 +749,7 @@ copyin_link(struct cpio_file_stat *file_
+ 
+   if (archive_format != arf_tar && archive_format != arf_ustar)
+     {
+-      link_name = (char *) xmalloc ((unsigned int) file_hdr->c_filesize + 1);
+-      link_name[file_hdr->c_filesize] = '\0';
+-      tape_buffered_read (link_name, in_file_des, file_hdr->c_filesize);
+-      tape_skip_padding (in_file_des, file_hdr->c_filesize);
++      link_name = get_link_name (file_hdr, in_file_des);
+     }
+   else
+     {
+diff -Nurp cpio-2.8.orig/tests/Makefile.am cpio-2.8/tests/Makefile.am
+--- cpio-2.8.orig/tests/Makefile.am	2006-10-24 18:32:13.000000000 +0800
++++ cpio-2.8/tests/Makefile.am	2014-12-08 11:30:52.387789482 +0800
+@@ -45,6 +45,8 @@ TESTSUITE_AT = \
+  testsuite.at\
+  inout.at\
+  symlink.at\
++ symlink-bad-length.at\
++ symlink-long.at\
+  version.at
+ 
+ TESTSUITE = $(srcdir)/testsuite
+diff -Nurp cpio-2.8.orig/tests/symlink-bad-length.at cpio-2.8/tests/symlink-bad-length.at
+--- cpio-2.8.orig/tests/symlink-bad-length.at	1970-01-01 08:00:00.000000000 +0800
++++ cpio-2.8/tests/symlink-bad-length.at	2014-12-08 11:33:25.283783507 +0800
+@@ -0,0 +1,49 @@
++# Process this file with autom4te to create testsuite.  -*- Autotest -*-
++# Copyright (C) 2014 Free Software Foundation, Inc.
++
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3, or (at your option)
++# any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
++# 02110-1301 USA.
++
++# Cpio v2.11 did segfault with badly set symlink length.
++# References:
++# http://lists.gnu.org/archive/html/bug-cpio/2014-11/msg00007.html
++
++AT_SETUP([symlink-bad-length])
++AT_KEYWORDS([symlink-long copyout])
++
++AT_DATA([ARCHIVE.base64],
++[x3EjAIBAtIEtJy8nAQAAAHRUYW0FAAAADQBGSUxFAABzb21lIGNvbnRlbnQKAMdxIwBgQ/+hLScv
++JwEAAAB0VEhuBQD/////TElOSwAARklMRcdxAAAAAAAAAAAAAAEAAAAAAAAACwAAAAAAVFJBSUxF
++UiEhIQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
++])
++
++AT_CHECK([
++base64 -d ARCHIVE.base64 > ARCHIVE || AT_SKIP_TEST
++cpio -ntv < ARCHIVE
++test $? -eq 2
++],
++[0],
++[-rw-rw-r--   1 10029    10031          13 Nov 25 13:52 FILE
++],[cpio: LINK: stored filename length too big
++cpio: premature end of file
++])
++
++AT_CLEANUP
+diff -Nurp cpio-2.8.orig/tests/symlink-long.at cpio-2.8/tests/symlink-long.at
+--- cpio-2.8.orig/tests/symlink-long.at	1970-01-01 08:00:00.000000000 +0800
++++ cpio-2.8/tests/symlink-long.at	2014-12-08 11:34:28.807781024 +0800
+@@ -0,0 +1,46 @@
++# Process this file with autom4te to create testsuite.  -*- Autotest -*-
++# Copyright (C) 2014 Free Software Foundation, Inc.
++
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3, or (at your option)
++# any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
++# 02110-1301 USA.
++
++# Cpio v2.11.90 changed the way symlink name is read from archive.
++# References:
++# http://lists.gnu.org/archive/html/bug-cpio/2014-11/msg00007.html
++
++AT_SETUP([symlink-long])
++AT_KEYWORDS([symlink-long copyout])
++
++AT_CHECK([
++
++# len(dirname) > READBUFSIZE
++dirname=
++for i in {1..52}; do
++    dirname="xxxxxxxxx/$dirname"
++    mkdir "$dirname"
++done
++ln -s "$dirname" x || AT_SKIP_TEST
++
++echo x | cpio -o > ar
++list=`cpio -tv < ar | sed 's|.*-> ||'`
++test "$list" = "$dirname" && echo success || echo fail
++],
++[0],
++[success
++],[2 blocks
++2 blocks
++])
++
++AT_CLEANUP
+diff -Nurp cpio-2.8.orig/tests/testsuite.at cpio-2.8/tests/testsuite.at
+--- cpio-2.8.orig/tests/testsuite.at	2006-10-24 18:32:13.000000000 +0800
++++ cpio-2.8/tests/testsuite.at	2014-12-08 11:34:56.515779942 +0800
+@@ -31,3 +31,5 @@ m4_include([version.at])
+ 
+ m4_include([inout.at])
+ m4_include([symlink.at])
++m4_include([symlink-bad-length.at])
++m4_include([symlink-long.at])
diff --git a/meta/recipes-extended/cpio/cpio_2.8.bb b/meta/recipes-extended/cpio/cpio_2.8.bb
index b6da207..3f97dbe 100644
--- a/meta/recipes-extended/cpio/cpio_2.8.bb
+++ b/meta/recipes-extended/cpio/cpio_2.8.bb
@@ -3,11 +3,12 @@ require cpio_v2.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b7f772ea3a2489231cb4872656cac34b"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://m4extensions.patch \
-    file://avoid_heap_overflow.patch \
-    "
+	    file://avoid_heap_overflow.patch \
+	    file://fix-memory-overrun.patch \
+	   "
 
 SRC_URI[md5sum] = "0caa356e69e149fb49b76bacc64615a1"
 SRC_URI[sha256sum] = "1b203248874c3b5a728b351f06513e5282f73e0170b7f207fbf8c39f28f6b4ad"
-- 
1.9.1



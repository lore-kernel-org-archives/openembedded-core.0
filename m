Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id F09817253A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 17:10:50 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id v10so11856574pde.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 09:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=wqAPnxqYkdxuBmy94HX2dxVjgLm8uA6bgqz++B6gKiM=;
	b=jVLBZ6og1RtQXwxDw1VHHfrnD9j7uXI1yHgGp3QnA44Yhrw0go4xulrK3Naw0mSAIL
	cxth574l2z3S8w7ghsmOTlebjXDm79ASAs8/HLgfXkCxv5zxJvPP0bHaMvmvlP1dBsZJ
	QtNsMWt92KbYPhi0UONhAgQy3BhYYnmmEoAYjPvqNTLxVpr/BNoHB092JCa2aG2Eyi0V
	Y5J/KS9d2nd8pyqhH1ndGoZ4Atwfx08LNKRBS+wGK4KrW11VdSEFdGwNKtjubSvv8bfd
	SjpoZijArzrqcuC+beMmwuN1XlfNYWSu4gdLoQPHC0sVVgcYB/UHBM1X6iX6Ne/e5gKd
	H/EQ==
X-Received: by 10.68.69.80 with SMTP id c16mr52746035pbu.125.1418663450597;
	Mon, 15 Dec 2014 09:10:50 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id a13sm9805551pdm.44.2014.12.15.09.10.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 09:10:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Dec 2014 09:10:36 -0800
Message-Id: <22af9154ebaf84f17b9356f593b8f5f5ada7ef81.1418663308.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418663308.git.akuster808@gmail.com>
References: <cover.1418663308.git.akuster808@gmail.com>
In-Reply-To: <cover.1418663308.git.akuster808@gmail.com>
References: <cover.1418663308.git.akuster808@gmail.com>
Subject: [PATCH 2/3] cpio: fix bug CVE-2014-9112 for cpio-2.11
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
X-List-Received-Date: Mon, 15 Dec 2014 17:10:52 -0000

From: Bian Naimeng <biannm@cn.fujitsu.com>

Obtain detain from following URL.
  http://lists.gnu.org/archive/html/bug-cpio/2014-12/msg00000.html
  http://git.savannah.gnu.org/cgit/cpio.git/commit/?id=746f3ff670dcfcdd28fcc990e79cd6fccc7ae48d

(From OE-Core rev: 9a32da05f5a9bc62c592fd2d6057dc052e363261)

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../cpio/cpio-2.11/fix-memory-overrun.patch        | 220 +++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |   3 +-
 2 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch b/meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch
new file mode 100644
index 0000000..89cd3cf
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch
@@ -0,0 +1,220 @@
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
+diff -Nurp cpio-2.11.orig/src/copyin.c cpio-2.11/src/copyin.c
+--- cpio-2.11.orig/src/copyin.c	2010-02-15 18:02:23.000000000 +0800
++++ cpio-2.11/src/copyin.c	2014-12-08 13:14:04.355547508 +0800
+@@ -126,6 +126,28 @@ tape_skip_padding (int in_file_des, off_
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
+@@ -650,10 +667,7 @@ copyin_link(struct cpio_file_stat *file_
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
+diff -Nurp cpio-2.11.orig/tests/Makefile.am cpio-2.11/tests/Makefile.am
+--- cpio-2.11.orig/tests/Makefile.am	2010-02-15 18:02:23.000000000 +0800
++++ cpio-2.11/tests/Makefile.am	2014-12-08 13:14:49.931545727 +0800
+@@ -52,6 +52,8 @@ TESTSUITE_AT = \
+  setstat04.at\
+  setstat05.at\
+  symlink.at\
++ symlink-bad-length.at\
++ symlink-long.at\
+  version.at
+ 
+ TESTSUITE = $(srcdir)/testsuite
+diff -Nurp cpio-2.11.orig/tests/symlink-bad-length.at cpio-2.11/tests/symlink-bad-length.at
+--- cpio-2.11.orig/tests/symlink-bad-length.at	1970-01-01 08:00:00.000000000 +0800
++++ cpio-2.11/tests/symlink-bad-length.at	2014-12-08 13:17:45.979538847 +0800
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
+diff -Nurp cpio-2.11.orig/tests/symlink-long.at cpio-2.11/tests/symlink-long.at
+--- cpio-2.11.orig/tests/symlink-long.at	1970-01-01 08:00:00.000000000 +0800
++++ cpio-2.11/tests/symlink-long.at	2014-12-08 13:17:57.219538408 +0800
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
+diff -Nurp cpio-2.11.orig/tests/testsuite.at cpio-2.11/tests/testsuite.at
+--- cpio-2.11.orig/tests/testsuite.at	2010-02-15 18:02:23.000000000 +0800
++++ cpio-2.11/tests/testsuite.at	2014-12-08 13:15:13.515544805 +0800
+@@ -31,6 +31,8 @@ m4_include([version.at])
+ 
+ m4_include([inout.at])
+ m4_include([symlink.at])
++m4_include([symlink-bad-length.at])
++m4_include([symlink-long.at])
+ m4_include([interdir.at])
+ 
+ m4_include([setstat01.at])
diff --git a/meta/recipes-extended/cpio/cpio_2.11.bb b/meta/recipes-extended/cpio/cpio_2.11.bb
index 5f88b30..c42db6f 100644
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ b/meta/recipes-extended/cpio/cpio_2.11.bb
@@ -3,9 +3,10 @@ include cpio_v2.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI += "file://remove-gets.patch \
+	    file://fix-memory-overrun.patch \
            "
 
 SRC_URI[md5sum] = "1112bb6c45863468b5496ba128792f6c"
-- 
1.9.1



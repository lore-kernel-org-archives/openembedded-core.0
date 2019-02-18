Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4337C88E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 22:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 094F240BBB;
	Mon, 18 Feb 2019 22:49:24 +0000 (UTC)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id MpIY5DqDw9Yq; Mon, 18 Feb 2019 22:49:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E059140B53;
	Mon, 18 Feb 2019 22:49:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 47A5216B4D4;
	Mon, 18 Feb 2019 17:49:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 17:49:06 -0500
Message-Id: <ec17ccc2ef55bb220deb6202cd0f2b34dcfca3fa.1550529998.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550529998.git.denys@ti.com>
References: <cover.1550529998.git.denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <cover.1550529998.git.denys@ti.com>
References: <cover.1550529998.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 5/6] gzip: upgrade 1.9 -> 1.10
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
X-List-Received-Date: Mon, 18 Feb 2019 22:57:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denys Dmytriyenko <denys@ti.com>

gnulib.patch for glibc-2.28+ has been upstreamed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{gzip-1.9 => gzip-1.10}/wrong-path-fix.patch   |   0
 meta/recipes-extended/gzip/gzip-1.9/gnulib.patch   | 189 ---------------------
 .../gzip/{gzip_1.9.bb => gzip_1.10.bb}             |   6 +-
 3 files changed, 2 insertions(+), 193 deletions(-)
 rename meta/recipes-extended/gzip/{gzip-1.9 => gzip-1.10}/wrong-path-fix.patch (100%)
 delete mode 100644 meta/recipes-extended/gzip/gzip-1.9/gnulib.patch
 rename meta/recipes-extended/gzip/{gzip_1.9.bb => gzip_1.10.bb} (88%)

diff --git a/meta/recipes-extended/gzip/gzip-1.9/wrong-path-fix.patch b/meta/recipes-extended/gzip/gzip-1.10/wrong-path-fix.patch
similarity index 100%
rename from meta/recipes-extended/gzip/gzip-1.9/wrong-path-fix.patch
rename to meta/recipes-extended/gzip/gzip-1.10/wrong-path-fix.patch
diff --git a/meta/recipes-extended/gzip/gzip-1.9/gnulib.patch b/meta/recipes-extended/gzip/gzip-1.9/gnulib.patch
deleted file mode 100644
index c3cdd72..0000000
--- a/meta/recipes-extended/gzip/gzip-1.9/gnulib.patch
+++ /dev/null
@@ -1,189 +0,0 @@
-From 1831628c0630ae96a43586b2a25ca51cbdba3e53 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <address@hidden>
-Date: Mon, 5 Mar 2018 10:56:29 -0800
-Subject: [PATCH] fflush: adjust to glibc 2.28 libio.h removal
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Daniel P. Berrangé in:
-https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
-* lib/fbufmode.c (fbufmode):
-* lib/fflush.c (clear_ungetc_buffer_preserving_position)
-(disable_seek_optimization, rpl_fflush):
-* lib/fpending.c (__fpending):
-* lib/fpurge.c (fpurge):
-* lib/freadable.c (freadable):
-* lib/freadahead.c (freadahead):
-* lib/freading.c (freading):
-* lib/freadptr.c (freadptr):
-* lib/freadseek.c (freadptrinc):
-* lib/fseeko.c (fseeko):
-* lib/fseterr.c (fseterr):
-* lib/fwritable.c (fwritable):
-* lib/fwriting.c (fwriting):
-Check _IO_EOF_SEEN instead of _IO_ftrylockfile.
-* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
-Define if not already defined.
----
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- ChangeLog        | 23 +++++++++++++++++++++++
- lib/fbufmode.c   |  2 +-
- lib/fflush.c     |  6 +++---
- lib/fpending.c   |  2 +-
- lib/fpurge.c     |  2 +-
- lib/freadable.c  |  2 +-
- lib/freadahead.c |  2 +-
- lib/freading.c   |  2 +-
- lib/freadptr.c   |  2 +-
- lib/freadseek.c  |  2 +-
- lib/fseeko.c     |  4 ++--
- lib/fseterr.c    |  2 +-
- lib/fwritable.c  |  2 +-
- lib/fwriting.c   |  2 +-
- lib/stdio-impl.h |  6 ++++++
- 15 files changed, 45 insertions(+), 16 deletions(-)
-
-Index: gzip-1.9/ChangeLog
-===================================================================
---- gzip-1.9.orig/ChangeLog
-+++ gzip-1.9/ChangeLog
-@@ -1,3 +1,26 @@
-+2018-03-05  Paul Eggert  <address@hidden>
-+
-+	fflush: adjust to glibc 2.28 libio.h removal
-+	Problem reported by Daniel P. Berrangé in:
-+	https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
-+	* lib/fbufmode.c (fbufmode):
-+	* lib/fflush.c (clear_ungetc_buffer_preserving_position)
-+	(disable_seek_optimization, rpl_fflush):
-+	* lib/fpending.c (__fpending):
-+	* lib/fpurge.c (fpurge):
-+	* lib/freadable.c (freadable):
-+	* lib/freadahead.c (freadahead):
-+	* lib/freading.c (freading):
-+	* lib/freadptr.c (freadptr):
-+	* lib/freadseek.c (freadptrinc):
-+	* lib/fseeko.c (fseeko):
-+	* lib/fseterr.c (fseterr):
-+	* lib/fwritable.c (fwritable):
-+	* lib/fwriting.c (fwriting):
-+	Check _IO_EOF_SEEN instead of _IO_ftrylockfile.
-+	* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
-+	Define if not already defined.
-+
- 2018-01-07  Jim Meyering  <meyering@fb.com>
- 
- 	version 1.9
-Index: gzip-1.9/lib/fflush.c
-===================================================================
---- gzip-1.9.orig/lib/fflush.c
-+++ gzip-1.9/lib/fflush.c
-@@ -33,7 +33,7 @@
- #undef fflush
- 
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
- 
- /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).  */
- static void
-@@ -72,7 +72,7 @@ clear_ungetc_buffer (FILE *fp)
- 
- #endif
- 
--#if ! (defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
-+#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
- 
- # if (defined __sferror || defined __DragonFly__ || defined __ANDROID__) && defined __SNPT
- /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
-@@ -148,7 +148,7 @@ rpl_fflush (FILE *stream)
-   if (stream == NULL || ! freading (stream))
-     return fflush (stream);
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
- 
-   clear_ungetc_buffer_preserving_position (stream);
- 
-Index: gzip-1.9/lib/fpurge.c
-===================================================================
---- gzip-1.9.orig/lib/fpurge.c
-+++ gzip-1.9/lib/fpurge.c
-@@ -62,7 +62,7 @@ fpurge (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_IO_read_end = fp->_IO_read_ptr;
-   fp->_IO_write_ptr = fp->_IO_write_base;
-   /* Avoid memory leak when there is an active ungetc buffer.  */
-Index: gzip-1.9/lib/freading.c
-===================================================================
---- gzip-1.9.orig/lib/freading.c
-+++ gzip-1.9/lib/freading.c
-@@ -31,7 +31,7 @@ freading (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   return ((fp->_flags & _IO_NO_WRITES) != 0
-           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
-               && fp->_IO_read_base != NULL));
-Index: gzip-1.9/lib/fseeko.c
-===================================================================
---- gzip-1.9.orig/lib/fseeko.c
-+++ gzip-1.9/lib/fseeko.c
-@@ -47,7 +47,7 @@ fseeko (FILE *fp, off_t offset, int when
- #endif
- 
-   /* These tests are based on fpurge.c.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_read_end == fp->_IO_read_ptr
-       && fp->_IO_write_ptr == fp->_IO_write_base
-       && fp->_IO_save_base == NULL)
-@@ -123,7 +123,7 @@ fseeko (FILE *fp, off_t offset, int when
-           return -1;
-         }
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-       fp->_flags &= ~_IO_EOF_SEEN;
-       fp->_offset = pos;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-Index: gzip-1.9/lib/fseterr.c
-===================================================================
---- gzip-1.9.orig/lib/fseterr.c
-+++ gzip-1.9/lib/fseterr.c
-@@ -29,7 +29,7 @@ fseterr (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_flags |= _IO_ERR_SEEN;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
-Index: gzip-1.9/lib/stdio-impl.h
-===================================================================
---- gzip-1.9.orig/lib/stdio-impl.h
-+++ gzip-1.9/lib/stdio-impl.h
-@@ -18,6 +18,12 @@
-    the same implementation of stdio extension API, except that some fields
-    have different naming conventions, or their access requires some casts.  */
- 
-+/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
-+   problem by defining it ourselves.  FIXME: Do not rely on glibc
-+   internals.  */
-+#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
-+# define _IO_IN_BACKUP 0x100
-+#endif
- 
- /* BSD stdio derived implementations.  */
- 
diff --git a/meta/recipes-extended/gzip/gzip_1.9.bb b/meta/recipes-extended/gzip/gzip_1.10.bb
similarity index 88%
rename from meta/recipes-extended/gzip/gzip_1.9.bb
rename to meta/recipes-extended/gzip/gzip_1.10.bb
index 19f6586..75de970 100644
--- a/meta/recipes-extended/gzip/gzip_1.9.bb
+++ b/meta/recipes-extended/gzip/gzip_1.10.bb
@@ -4,7 +4,6 @@ LICENSE = "GPLv3+"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
-           file://gnulib.patch \
           "
 SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
@@ -35,6 +34,5 @@ do_install_ptest() {
             ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
 }
 
-SRC_URI[md5sum] = "929d6a6b832f75b28e3eeeafb30c1d9b"
-SRC_URI[sha256sum] = "5d2d3a3432ef32f24cdb060d278834507b481a75adeca18850c73592f778f6ad"
-
+SRC_URI[md5sum] = "cf9ee51aff167ff69844d5d7d71c8b20"
+SRC_URI[sha256sum] = "c91f74430bf7bc20402e1f657d0b252cb80aa66ba333a25704512af346633c68"
-- 
2.7.4



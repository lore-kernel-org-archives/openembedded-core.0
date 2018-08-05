Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id E292C78BF4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 02:07:15 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z8-v6so4598112pgu.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2018 19:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P80zQGv64hLsUWXwg8MePo1LgIVHhFsSZuYLmNw29W0=;
	b=EmGD2Dv2LI1adTDmlVIpDyjl9z3+M2vyjS+fd9PtfozzAr6hoe7sQIylXw/RvCJStM
	M+/4w8V9QHqesA1NaN7vv9ap4oF8LPcf/rl/bI1NWO4D7x3J8ndvSujxHOxhA8ii9R+V
	JDz9OTBB+V4w74BEwmoGKHudg0soa2Hk5W+ioFV650DxR/slDrNgfjVuzwBN7GEpZRfs
	wQnJ0jeKDNqSrFwkNkQr0TA6EwzMdcUqA+omUxrYurzVHIYauR4eQI/Y6MxQ4wgIIJrC
	shei7gFgzhZszQxiRTYHtHlJRFa9KjXoFMWw5DFRm/KpO507VxKZwt9/yXOfg+XPbnF/
	2BTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P80zQGv64hLsUWXwg8MePo1LgIVHhFsSZuYLmNw29W0=;
	b=GvGxUMQpCutApq0TUQ7PMFHnPe2bK0JESH/N2Reb9KWd5BtrY9RykuBjbhNnpIh++B
	GTWU9aJAJUnByfQ3TyTwTu1iUdaWw2en6QGqQU2uwyj0zCJ7spkUgOrUriWTDVmRsgjF
	1PNcFd2RBR9TkSfDTZKWV2UzucXzJH6kEuo6+1QOdaSiCepz592yeFJqxUihlzab5R7a
	+diKSR2PY/ggt7g1JQ1Bt5umMJLOtn1i1NTD/fvoMCwaMR1fJ0alGuUwtxBaQ6n9ymNQ
	wkBSb8Pfpnp7Y87UosEYVsVed+lOIKoBmayv3YHLYvXFwA6GhfgTL1cbuadAA0GjpvsD
	Z1VA==
X-Gm-Message-State: AOUpUlEx0Sz2+1uVCh1fH5h4x9fMsDPuXxJktmCGIkrMZtmGnO3LMY/7
	Uf3pERXjWCbyKOyFMTJR6XMrFwnP
X-Google-Smtp-Source: AAOMgpeGYrqIj8yPKaYEnMiowo9+s3SY5pcaInImbbjmiWW90GRroMajCAsW2i5S5F8fX69zL3CB+A==
X-Received: by 2002:a63:d309:: with SMTP id
	b9-v6mr9395938pgg.163.1533434836602; 
	Sat, 04 Aug 2018 19:07:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	b195-v6sm4486021pfb.2.2018.08.04.19.07.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Aug 2018 19:07:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Aug 2018 19:06:58 -0700
Message-Id: <2d88901e525ff3995d5e87cba0b0bfb20876654a.1533434674.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533434674.git.raj.khem@gmail.com>
References: <cover.1533434674.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] gzip: Fix build with glibc 2.28
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
X-List-Received-Date: Sun, 05 Aug 2018 02:07:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gzip/gzip-1.9/gnulib.patch                | 189 ++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.9.bb        |   4 +-
 2 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.9/gnulib.patch

diff --git a/meta/recipes-extended/gzip/gzip-1.9/gnulib.patch b/meta/recipes-extended/gzip/gzip-1.9/gnulib.patch
new file mode 100644
index 0000000000..c3cdd72b64
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.9/gnulib.patch
@@ -0,0 +1,189 @@
+From 1831628c0630ae96a43586b2a25ca51cbdba3e53 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <address@hidden>
+Date: Mon, 5 Mar 2018 10:56:29 -0800
+Subject: [PATCH] fflush: adjust to glibc 2.28 libio.h removal
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Daniel P. Berrangé in:
+https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
+* lib/fbufmode.c (fbufmode):
+* lib/fflush.c (clear_ungetc_buffer_preserving_position)
+(disable_seek_optimization, rpl_fflush):
+* lib/fpending.c (__fpending):
+* lib/fpurge.c (fpurge):
+* lib/freadable.c (freadable):
+* lib/freadahead.c (freadahead):
+* lib/freading.c (freading):
+* lib/freadptr.c (freadptr):
+* lib/freadseek.c (freadptrinc):
+* lib/fseeko.c (fseeko):
+* lib/fseterr.c (fseterr):
+* lib/fwritable.c (fwritable):
+* lib/fwriting.c (fwriting):
+Check _IO_EOF_SEEN instead of _IO_ftrylockfile.
+* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
+Define if not already defined.
+---
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ ChangeLog        | 23 +++++++++++++++++++++++
+ lib/fbufmode.c   |  2 +-
+ lib/fflush.c     |  6 +++---
+ lib/fpending.c   |  2 +-
+ lib/fpurge.c     |  2 +-
+ lib/freadable.c  |  2 +-
+ lib/freadahead.c |  2 +-
+ lib/freading.c   |  2 +-
+ lib/freadptr.c   |  2 +-
+ lib/freadseek.c  |  2 +-
+ lib/fseeko.c     |  4 ++--
+ lib/fseterr.c    |  2 +-
+ lib/fwritable.c  |  2 +-
+ lib/fwriting.c   |  2 +-
+ lib/stdio-impl.h |  6 ++++++
+ 15 files changed, 45 insertions(+), 16 deletions(-)
+
+Index: gzip-1.9/ChangeLog
+===================================================================
+--- gzip-1.9.orig/ChangeLog
++++ gzip-1.9/ChangeLog
+@@ -1,3 +1,26 @@
++2018-03-05  Paul Eggert  <address@hidden>
++
++	fflush: adjust to glibc 2.28 libio.h removal
++	Problem reported by Daniel P. Berrangé in:
++	https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
++	* lib/fbufmode.c (fbufmode):
++	* lib/fflush.c (clear_ungetc_buffer_preserving_position)
++	(disable_seek_optimization, rpl_fflush):
++	* lib/fpending.c (__fpending):
++	* lib/fpurge.c (fpurge):
++	* lib/freadable.c (freadable):
++	* lib/freadahead.c (freadahead):
++	* lib/freading.c (freading):
++	* lib/freadptr.c (freadptr):
++	* lib/freadseek.c (freadptrinc):
++	* lib/fseeko.c (fseeko):
++	* lib/fseterr.c (fseterr):
++	* lib/fwritable.c (fwritable):
++	* lib/fwriting.c (fwriting):
++	Check _IO_EOF_SEEN instead of _IO_ftrylockfile.
++	* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
++	Define if not already defined.
++
+ 2018-01-07  Jim Meyering  <meyering@fb.com>
+ 
+ 	version 1.9
+Index: gzip-1.9/lib/fflush.c
+===================================================================
+--- gzip-1.9.orig/lib/fflush.c
++++ gzip-1.9/lib/fflush.c
+@@ -33,7 +33,7 @@
+ #undef fflush
+ 
+ 
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+ 
+ /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).  */
+ static void
+@@ -72,7 +72,7 @@ clear_ungetc_buffer (FILE *fp)
+ 
+ #endif
+ 
+-#if ! (defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
++#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
+ 
+ # if (defined __sferror || defined __DragonFly__ || defined __ANDROID__) && defined __SNPT
+ /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
+@@ -148,7 +148,7 @@ rpl_fflush (FILE *stream)
+   if (stream == NULL || ! freading (stream))
+     return fflush (stream);
+ 
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+ 
+   clear_ungetc_buffer_preserving_position (stream);
+ 
+Index: gzip-1.9/lib/fpurge.c
+===================================================================
+--- gzip-1.9.orig/lib/fpurge.c
++++ gzip-1.9/lib/fpurge.c
+@@ -62,7 +62,7 @@ fpurge (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->_IO_read_end = fp->_IO_read_ptr;
+   fp->_IO_write_ptr = fp->_IO_write_base;
+   /* Avoid memory leak when there is an active ungetc buffer.  */
+Index: gzip-1.9/lib/freading.c
+===================================================================
+--- gzip-1.9.orig/lib/freading.c
++++ gzip-1.9/lib/freading.c
+@@ -31,7 +31,7 @@ freading (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   return ((fp->_flags & _IO_NO_WRITES) != 0
+           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
+               && fp->_IO_read_base != NULL));
+Index: gzip-1.9/lib/fseeko.c
+===================================================================
+--- gzip-1.9.orig/lib/fseeko.c
++++ gzip-1.9/lib/fseeko.c
+@@ -47,7 +47,7 @@ fseeko (FILE *fp, off_t offset, int when
+ #endif
+ 
+   /* These tests are based on fpurge.c.  */
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   if (fp->_IO_read_end == fp->_IO_read_ptr
+       && fp->_IO_write_ptr == fp->_IO_write_base
+       && fp->_IO_save_base == NULL)
+@@ -123,7 +123,7 @@ fseeko (FILE *fp, off_t offset, int when
+           return -1;
+         }
+ 
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+       fp->_flags &= ~_IO_EOF_SEEN;
+       fp->_offset = pos;
+ #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
+Index: gzip-1.9/lib/fseterr.c
+===================================================================
+--- gzip-1.9.orig/lib/fseterr.c
++++ gzip-1.9/lib/fseterr.c
+@@ -29,7 +29,7 @@ fseterr (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->_flags |= _IO_ERR_SEEN;
+ #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
+   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
+Index: gzip-1.9/lib/stdio-impl.h
+===================================================================
+--- gzip-1.9.orig/lib/stdio-impl.h
++++ gzip-1.9/lib/stdio-impl.h
+@@ -18,6 +18,12 @@
+    the same implementation of stdio extension API, except that some fields
+    have different naming conventions, or their access requires some casts.  */
+ 
++/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
++   problem by defining it ourselves.  FIXME: Do not rely on glibc
++   internals.  */
++#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
++# define _IO_IN_BACKUP 0x100
++#endif
+ 
+ /* BSD stdio derived implementations.  */
+ 
diff --git a/meta/recipes-extended/gzip/gzip_1.9.bb b/meta/recipes-extended/gzip/gzip_1.9.bb
index a8eeba1380..19f6586526 100644
--- a/meta/recipes-extended/gzip/gzip_1.9.bb
+++ b/meta/recipes-extended/gzip/gzip_1.9.bb
@@ -3,7 +3,9 @@ require gzip.inc
 LICENSE = "GPLv3+"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
-            file://run-ptest"
+           file://run-ptest \
+           file://gnulib.patch \
+          "
 SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-- 
2.18.0



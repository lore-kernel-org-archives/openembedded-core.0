Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 135A478ABA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:27 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id z8-v6so6859644pgu.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NdVgus2w9BStKdpZY32wDMII2P1dof+dvDoWVm9jIFQ=;
	b=S2KrQXLdz5MoxsWOc0gDNg2q0X1hAePqIgEXK4jNQLWK1synQYGCDWXzqnDtmZuCX5
	vN7vk95gX07dsEJ6mEVDWS9q1nyDUffi8x3IXxPkzwsweNUDEFY7Zszn5HMknao5lLZk
	QRH/UdQ9o+rtXoacVr3N8m2atl7Wtpnr9x9Q7yH7iy1aS/nc1AxEGVvS0bd0MR/IsKR8
	O1NvGU1XTQNu+9uqkBZPmu1tN0hly/KkAUw4MbUxD5xD8KUIM9Jh/qU1UkCOAYOZKl0z
	xU2Un990/meoa1h9EbbWNaJaBt368W10RaA7GfF69h0FW+mOobZGf02Op4xqV0UmD5il
	4Qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NdVgus2w9BStKdpZY32wDMII2P1dof+dvDoWVm9jIFQ=;
	b=lH0vSMf7WFIBcS/aUsKoHsnjt7xjNNWQ7D++V0sOo9V6Xq0kRDv33D0UxGiUU2saI1
	lpXWxM8iX9YxIIeDPGpIMPREZdrT4BfcxGBhq988h6K+nIN1uFZLYGu4Waw0pq+JsGpS
	gLBb2MKJwHRP6iWf2Lr8COxJPWJlwGsUWZu+jIzPUldixdv2Ygu/8xM/EdlI9yhkef4p
	zP3cQFfHdQ7PdZF4uQICOvnaGGCYbXOBWRl1ygagjxROgQY1kp8RB7djfLHAFSmW4UcE
	+lfJE7jta1esZSdtwV87uHT9osSfo7gDM4xXshNXNs/7yDAzbrXvUKtjsujap5fg3UXG
	+vvA==
X-Gm-Message-State: AOUpUlGlwfhHN34LgiHf+GXW9OD0giS16/eBoTDl/oKH1mIuRVBpuHd+
	M7Be0lyzKyMygRrpU6FStxwDYCqW
X-Google-Smtp-Source: AAOMgpcO+gQLC0EWTLyBfXQsXcGsfekwcVZUGlG+HKop6QohLSy0aWWSA1JuljrNxH124G4dds0ZKQ==
X-Received: by 2002:a63:ea0c:: with SMTP id
	c12-v6mr16384465pgi.158.1533596247779; 
	Mon, 06 Aug 2018 15:57:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:01 -0700
Message-Id: <17bf06e859082ab6c1526d377e363c3e46755c76.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/18] findutils: Fix build with glibc 2.28
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix foe gnulib bug and makedev header move in glibc 2.25+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../findutils-4.6.0-gnulib-fflush.patch       | 140 ++++++++++++++++++
 .../findutils-4.6.0-gnulib-makedev.patch      |  78 ++++++++++
 .../findutils/findutils_4.6.0.bb              |   2 +
 3 files changed, 220 insertions(+)
 create mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch
 create mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch

diff --git a/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch b/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch
new file mode 100644
index 0000000000..d13e8ed3cf
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch
@@ -0,0 +1,140 @@
+From 80cdfba079627e15129a926a133825b961d41e36 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 5 Mar 2018 10:56:29 -0800
+Subject: [PATCH] fflush: adjust to glibc 2.28 libio.h removal
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Daniel P. Berrangé in:
+https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
+* lib/fflush.c (clear_ungetc_buffer_preserving_position)
+(disable_seek_optimization, rpl_fflush):
+* lib/fpurge.c (fpurge):
+* lib/freadahead.c (freadahead):
+* lib/freading.c (freading):
+* lib/fseeko.c (fseeko):
+* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
+Define if not already defined.
+
+Upstream-commit: 4af4a4a71827c0bc5e0ec67af23edef4f15cee8e
+Signed-off-by: Kamil Dudka <kdudka@redhat.com>
+Upstream-Status: Backport [4af4a4a71827c0bc5e0ec67af23edef4f15cee8e]
+---
+ gl/lib/fflush.c     | 6 +++---
+ gl/lib/fpurge.c     | 2 +-
+ gl/lib/freadahead.c | 2 +-
+ gl/lib/freading.c   | 2 +-
+ gl/lib/fseeko.c     | 4 ++--
+ gl/lib/stdio-impl.h | 6 ++++++
+ 6 files changed, 14 insertions(+), 8 deletions(-)
+
+Index: findutils-4.6.0/gl/lib/fflush.c
+===================================================================
+--- findutils-4.6.0.orig/gl/lib/fflush.c
++++ findutils-4.6.0/gl/lib/fflush.c
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
+ /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
+@@ -148,7 +148,7 @@ rpl_fflush (FILE *stream)
+   if (stream == NULL || ! freading (stream))
+     return fflush (stream);
+ 
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+ 
+   clear_ungetc_buffer_preserving_position (stream);
+ 
+Index: findutils-4.6.0/gl/lib/fpurge.c
+===================================================================
+--- findutils-4.6.0.orig/gl/lib/fpurge.c
++++ findutils-4.6.0/gl/lib/fpurge.c
+@@ -62,7 +62,7 @@ fpurge (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->_IO_read_end = fp->_IO_read_ptr;
+   fp->_IO_write_ptr = fp->_IO_write_base;
+   /* Avoid memory leak when there is an active ungetc buffer.  */
+Index: findutils-4.6.0/gl/lib/freadahead.c
+===================================================================
+--- findutils-4.6.0.orig/gl/lib/freadahead.c
++++ findutils-4.6.0/gl/lib/freadahead.c
+@@ -25,7 +25,7 @@
+ size_t
+ freadahead (FILE *fp)
+ {
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   if (fp->_IO_write_ptr > fp->_IO_write_base)
+     return 0;
+   return (fp->_IO_read_end - fp->_IO_read_ptr)
+Index: findutils-4.6.0/gl/lib/freading.c
+===================================================================
+--- findutils-4.6.0.orig/gl/lib/freading.c
++++ findutils-4.6.0/gl/lib/freading.c
+@@ -31,7 +31,7 @@ freading (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   return ((fp->_flags & _IO_NO_WRITES) != 0
+           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
+               && fp->_IO_read_base != NULL));
+Index: findutils-4.6.0/gl/lib/fseeko.c
+===================================================================
+--- findutils-4.6.0.orig/gl/lib/fseeko.c
++++ findutils-4.6.0/gl/lib/fseeko.c
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
+Index: findutils-4.6.0/gl/lib/stdio-impl.h
+===================================================================
+--- findutils-4.6.0.orig/gl/lib/stdio-impl.h
++++ findutils-4.6.0/gl/lib/stdio-impl.h
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
diff --git a/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch b/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch
new file mode 100644
index 0000000000..0fb3953cf3
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch
@@ -0,0 +1,78 @@
+From 80628047a6cc83f82e0c410a82b8f7facd9d50f2 Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Wed, 14 Sep 2016 19:21:42 -0500
+Subject: [PATCH] mountlist: include sysmacros.h for glibc
+
+On Fedora rawhide (glibc 2.25), './gnulib-tool --test mountlist'
+reports:
+../../gllib/mountlist.c: In function 'read_file_system_list':
+../../gllib/mountlist.c:534:13: warning: '__makedev_from_sys_types' is deprecated:
+  In the GNU C Library, `makedev' is defined by <sys/sysmacros.h>.
+  For historical compatibility, it is currently defined by
+  <sys/types.h> as well, but we plan to remove this soon.
+  To use `makedev', include <sys/sysmacros.h> directly.
+  If you did not intend to use a system-defined macro `makedev',
+  you should #undef it after including <sys/types.h>.
+  [-Wdeprecated-declarations]
+             me->me_dev = makedev (devmaj, devmin);
+             ^~
+In file included from /usr/include/features.h:397:0,
+                 from /usr/include/sys/types.h:25,
+                 from ./sys/types.h:28,
+                 from ../../gllib/mountlist.h:23,
+                 from ../../gllib/mountlist.c:20:
+/usr/include/sys/sysmacros.h:89:1: note: declared here
+ __SYSMACROS_DEFINE_MAKEDEV (__SYSMACROS_FST_IMPL_TEMPL)
+ ^
+
+Fix it by including the right headers.  We also need a fix to
+autoconf's AC_HEADER_MAJOR, but that's a separate patch.
+
+* m4/mountlist.m4 (gl_PREREQ_MOUTLIST_EXTRA): Include
+AC_HEADER_MAJOR.
+* lib/mountlist.c (includes): Use correct headers.
+
+Signed-off-by: Eric Blake <eblake@redhat.com>
+
+Upstream-commit: 4da63c5881f60f71999a943612da9112232b9161
+Signed-off-by: Kamil Dudka <kdudka@redhat.com>
+Upstream-Status: Backport [4da63c5881f60f71999a943612da9112232b9161]
+---
+ gl/lib/mountlist.c | 6 ++++++
+ gl/m4/mountlist.m4 | 3 ++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+Index: findutils-4.6.0/gl/lib/mountlist.c
+===================================================================
+--- findutils-4.6.0.orig/gl/lib/mountlist.c
++++ findutils-4.6.0/gl/lib/mountlist.c
+@@ -37,6 +37,12 @@
+ # include <sys/param.h>
+ #endif
+ 
++#if MAJOR_IN_MKDEV
++# include <sys/mkdev.h>
++#elif MAJOR_IN_SYSMACROS
++# include <sys/sysmacros.h>
++#endif
++
+ #if defined MOUNTED_GETFSSTAT   /* OSF_1 and Darwin1.3.x */
+ # if HAVE_SYS_UCRED_H
+ #  include <grp.h> /* needed on OSF V4.0 for definition of NGROUPS,
+Index: findutils-4.6.0/gl/m4/mountlist.m4
+===================================================================
+--- findutils-4.6.0.orig/gl/m4/mountlist.m4
++++ findutils-4.6.0/gl/m4/mountlist.m4
+@@ -1,4 +1,4 @@
+-# serial 11
++# serial 12
+ dnl Copyright (C) 2002-2006, 2009-2015 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+@@ -15,5 +15,6 @@ AC_DEFUN([gl_PREREQ_MOUNTLIST_EXTRA],
+ [
+   dnl Note gl_LIST_MOUNTED_FILE_SYSTEMS checks for mntent.h, not sys/mntent.h.
+   AC_CHECK_HEADERS([sys/mntent.h])
++  AC_HEADER_MAJOR()dnl for use of makedev ()
+   gl_FSTYPENAME
+ ])
diff --git a/meta/recipes-extended/findutils/findutils_4.6.0.bb b/meta/recipes-extended/findutils/findutils_4.6.0.bb
index db03252f54..5e4ca94868 100644
--- a/meta/recipes-extended/findutils/findutils_4.6.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.6.0.bb
@@ -8,6 +8,8 @@ DEPENDS = "bison-native"
 
 SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch \
+            file://findutils-4.6.0-gnulib-fflush.patch \
+            file://findutils-4.6.0-gnulib-makedev.patch \
 "
 
 SRC_URI[md5sum] = "9936aa8009438ce185bea2694a997fc1"
-- 
2.18.0



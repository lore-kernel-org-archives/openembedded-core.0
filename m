Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4F52378A40
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:25 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s17-v6so6240547plp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BG70gfLAQXd8cJZ12vh01J1F9LLOMlU7cDUKM+Gihwk=;
	b=DtSgvGqtjEzuNFOTzMIKzCJ4Yv12PNEu7st23owwXqzLhhdEG+WakbQWXQNydVIjvf
	E04sLYWT1AvLe41UpfTVJ1YNL5Tst5DTj+m2vx2u/OYlkAAzfgmLPM5exCjqBMW1geGe
	hrTazy6cK2UwVgpMT+A8bc9pc0rty1qXt3aA03OF40zFR8egYO7OSOyhZ49gpS78pSto
	BHFU8URHrZL2lydl4PiEi/G+j9WWto3Od3uE4FeJk+klq7lwJeo/uhZ4mShDz/sQyG70
	Lub5NDsouPVcEQ19QZzgNsrj7hyL1bIq9T1lKOc6IveFsg5AkD+vx9Zyox01mOOmJT1f
	asrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BG70gfLAQXd8cJZ12vh01J1F9LLOMlU7cDUKM+Gihwk=;
	b=eGVFqUK6zTJ96dTctqoSitgGF/gKinhVdc10bFU6nfqndbEmhfcpX3M1lST+xAK08W
	SgSiWwP6pmg3npEKITYDZAar48ptPZIXGYcuHpUHLhElYZFCLVw28zl1/cdjA8W19lN8
	dzFvqk8WXzsfw1HCf3ukD/0hB9aZts5UcBjNgNn+WAWQ0ikEsQMi0w9L87K5VxHL9FTx
	zIAHJSaNDFXUY4HH67jekej2svP66kL8CqrhGNrXiK6mJ3Azu3lcuIHQCsr4Vc/04FGt
	GID1CCb5yj3aa43KAcC6co2rbjiV8iNNrtAYTcaNs7udUfPmQh2zglrpHBcRK43rqzoE
	fROA==
X-Gm-Message-State: AOUpUlEDlU4TSpcrvgolhfHRi4KNIhM7TdRFze4vYzmMyzs6xdtYAlgB
	JrnDh4nH0KChN473nOaQjdMKFfUn
X-Google-Smtp-Source: AAOMgpcX+JxDmBnvwDuVSS8PGaDQKMXhcOEPLnty418ZJlJOApB5Cs/3ReiPRNbdMr2LYpUucvBjVw==
X-Received: by 2002:a17:902:e28b:: with SMTP id
	cf11-v6mr15737737plb.86.1533596246080; 
	Mon, 06 Aug 2018 15:57:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:00 -0700
Message-Id: <565404454e982159ac8e042fcdee9eed6a208d36.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 03/18] m4: Workaround gnulib's fseeko.c implementation
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:25 -0000

exposed by glibc 2.28 for details see
https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.18.inc        |   1 +
 .../m4-1.4.18-glibc-change-work-around.patch  | 129 ++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
index ee8bee446b..a6cef6f328 100644
--- a/meta/recipes-devtools/m4/m4-1.4.18.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
@@ -9,6 +9,7 @@ inherit autotools texinfo
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://ac_config_links.patch \
            file://remove-gets.patch \
+           file://m4-1.4.18-glibc-change-work-around.patch \
            "
 
 SRC_URI_append_class-target = " file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
diff --git a/meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch b/meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
new file mode 100644
index 0000000000..72e7ae2080
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
@@ -0,0 +1,129 @@
+update for glibc libio.h removal in 2.28+
+
+see
+https://src.fedoraproject.org/rpms/m4/c/814d592134fad36df757f9a61422d164ea2c6c9b?branch=master
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: m4-1.4.18/lib/fflush.c
+===================================================================
+--- m4-1.4.18.orig/lib/fflush.c
++++ m4-1.4.18/lib/fflush.c
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
+Index: m4-1.4.18/lib/fpending.c
+===================================================================
+--- m4-1.4.18.orig/lib/fpending.c
++++ m4-1.4.18/lib/fpending.c
+@@ -32,7 +32,7 @@ __fpending (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   return fp->_IO_write_ptr - fp->_IO_write_base;
+ #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
+   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
+Index: m4-1.4.18/lib/fpurge.c
+===================================================================
+--- m4-1.4.18.orig/lib/fpurge.c
++++ m4-1.4.18/lib/fpurge.c
+@@ -62,7 +62,7 @@ fpurge (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->_IO_read_end = fp->_IO_read_ptr;
+   fp->_IO_write_ptr = fp->_IO_write_base;
+   /* Avoid memory leak when there is an active ungetc buffer.  */
+Index: m4-1.4.18/lib/freadahead.c
+===================================================================
+--- m4-1.4.18.orig/lib/freadahead.c
++++ m4-1.4.18/lib/freadahead.c
+@@ -25,7 +25,7 @@
+ size_t
+ freadahead (FILE *fp)
+ {
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   if (fp->_IO_write_ptr > fp->_IO_write_base)
+     return 0;
+   return (fp->_IO_read_end - fp->_IO_read_ptr)
+Index: m4-1.4.18/lib/freading.c
+===================================================================
+--- m4-1.4.18.orig/lib/freading.c
++++ m4-1.4.18/lib/freading.c
+@@ -31,7 +31,7 @@ freading (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   return ((fp->_flags & _IO_NO_WRITES) != 0
+           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
+               && fp->_IO_read_base != NULL));
+Index: m4-1.4.18/lib/fseeko.c
+===================================================================
+--- m4-1.4.18.orig/lib/fseeko.c
++++ m4-1.4.18/lib/fseeko.c
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
+Index: m4-1.4.18/lib/stdio-impl.h
+===================================================================
+--- m4-1.4.18.orig/lib/stdio-impl.h
++++ m4-1.4.18/lib/stdio-impl.h
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
-- 
2.18.0



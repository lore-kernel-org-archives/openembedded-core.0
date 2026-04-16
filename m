Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9B0F88084
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:42 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7581.1776322114029430931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FxPOP1HJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43d7650202fso3335745f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322112; x=1776926912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg97HcAxyKl7CWH+m5fikwRL/8UGeav6UcucMGD73Ys=;
        b=FxPOP1HJQCnIr5p1GjJ+Dt9KomTEAkgC7Nd7Mz2tlrsDvnxJszlQoxDoJvwLaR0vdq
         mQ3eo3H+0bfXPn+ynH6NFTZ06f7dyEixpAXkmB3CChoTW9t8fwUvqPtvqd4FGMaZ8XWb
         Lb0iDr/Onph22IQIjBBaM7wLx3QoGxqt7/peg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322112; x=1776926912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xg97HcAxyKl7CWH+m5fikwRL/8UGeav6UcucMGD73Ys=;
        b=I6DhDmYqKZKzOR928Lgv4imXSzLBFj/g/up0YLqA/XGzQTHi32M1YYU5NfM1rDHW9n
         rftwb3XTqcCSVbzjhU7luGjIB8iHanVK3zqEYZ785VOYOtDCLVV1tfatBClsVr1vNoZ7
         A3wbhuFIj3HTei+YCT+ud4ydrEXqWkjPoFr0io2nihDMf2YSWSHQ9Qq7w3hI30bDg1YE
         v2fljfPTlNqjZnI661BjTfIYHx4UuiMtHy0oTdRTtFwRTt6UBAE+ldWRdu5rIsgrISHE
         Ydz8uAYPvBRy8iMqhHt/3TxFCOa1hXvNT4uyhEDjNu/TPtO26hFWtdR9O2Rb8hMhTna8
         WhxQ==
X-Gm-Message-State: AOJu0YyMNGtPovOTNN2UVeRPn7UiK8zokETXAlYockfUDWic21AC1FSw
	FJuWtWAyzWgSUP2N3C0CYmx+uiGBxnVP1bEHNChUWJPsos5KZggdUE8WO0Wo4gjJcX2XXOAp0v4
	KkY3aOF8yJKsb
X-Gm-Gg: AeBDieszLYRP5CNOtto0WQV71ByIIXb8l0PKiujGhHxZM2KZHjfaVWwmJajGFVAtQ4l
	BxGhikTIf+3W2aNCH64Hpx6tLDnXLnxsYd/BsI8W5MXel3sbQxO2IPH6Deei7rAAimYmAX1v9HC
	rvrQQhdwmcN6tQI3mqNtMzz2PogX6+dxQcC4jsA+EjW7OKpvkWzWNBzuIvZipjqBDXCijtYZ0sn
	6OH1Tg9hlgWMjN5cybda/3BBvTMzVCsopQ8hfXQIYi/RxMTgF2+gNRa05hqByXPXRPBerfXx3zK
	vqbiOKn/LpfAvZercb4GaWYKXL4cHk/IMC21rrZ1RJkQOY5ZagNhqCjDy8ChLQD9ewD48JPLGBr
	1Bk1ZB1t4HGNC2rV2KwCc32hymRd+jL+McwPqLn70cVrz6/eWPushfZeqhjqvpzlRsnhh1lYk5s
	JGLQXI5a8Y2O/2JSkWxLtw8YiTanK4MaQd1GeZOEcfJ3LtCc3lsOTalfUl6RvO2YIgKpAMM8tpJ
	2IvTlUU8tAOaoHJvAaV7xNUbK8ducWNNTHpXw==
X-Received: by 2002:a05:6000:144d:b0:43e:a69b:d803 with SMTP id ffacd0b85a97d-43ea69bda93mr13821221f8f.47.1776322111670;
        Wed, 15 Apr 2026 23:48:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 21/47] m4: backport 3 gnulib changes to fix build with glibc-2.43 on host
Date: Thu, 16 Apr 2026 08:47:22 +0200
Message-ID: <7daef08b2bd4fb852169939e0eaa0486e204d230.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235363

From: Martin Jansa <martin.jansa@gmail.com>

All 3 are already included in m4-1.4.21 used in master.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/m4/m4-1.4.20.inc        |   3 +
 ...-Fix-some-g-Wsystem-headers-warnings.patch | 135 ++++++++++++
 ...pilation-error-on-macOS-with-fortify.patch | 126 ++++++++++++
 ...23-qualifier-generic-fns-like-strchr.patch | 194 ++++++++++++++++++
 4 files changed, 458 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-string-h-wchar-h-Fix-some-g-Wsystem-headers-warnings.patch
 create mode 100644 meta/recipes-devtools/m4/m4/0002-string-h-Fix-compilation-error-on-macOS-with-fortify.patch
 create mode 100644 meta/recipes-devtools/m4/m4/0003-Port-to-C23-qualifier-generic-fns-like-strchr.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-devtools/m4/m4-1.4.20.inc
index 5c4ba09288c..df47e1e1881 100644
--- a/meta/recipes-devtools/m4/m4-1.4.20.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.20.inc
@@ -8,6 +8,9 @@ inherit autotools texinfo ptest gettext
 
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch \
+           file://0001-string-h-wchar-h-Fix-some-g-Wsystem-headers-warnings.patch \
+           file://0002-string-h-Fix-compilation-error-on-macOS-with-fortify.patch \
+           file://0003-Port-to-C23-qualifier-generic-fns-like-strchr.patch \
            "
 SRC_URI:append:class-target = " file://run-ptest \
                                 file://0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch \
diff --git a/meta/recipes-devtools/m4/m4/0001-string-h-wchar-h-Fix-some-g-Wsystem-headers-warnings.patch b/meta/recipes-devtools/m4/m4/0001-string-h-wchar-h-Fix-some-g-Wsystem-headers-warnings.patch
new file mode 100644
index 00000000000..63495a8443e
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-string-h-wchar-h-Fix-some-g-Wsystem-headers-warnings.patch
@@ -0,0 +1,135 @@
+From a9ff1a1ea55bee12751c751460a0102493fa65aa Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Mon, 12 May 2025 03:05:51 +0200
+Subject: [PATCH] string-h, wchar-h: Fix some g++ -Wsystem-headers warnings.
+
+* lib/string.in.h (memcpy, memccpy, memmove, strncpy, strndup, strncat,
+memcmp, strncmp, memset): On glibc systems, declare with
+_GL_ATTRIBUTE_NOTHROW.
+* lib/wchar.in.h (wmemcpy, wmemmove, wcsncpy, wcsncat, wmemcmp, wcsncmp,
+wmemset): Likewise.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gnulib.git/commit/?id=0614c2db34f65c595d85be4adc5628778905855a]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ lib/string.in.h | 27 +++++++++++++++++++++++++++
+ lib/wchar.in.h  | 21 +++++++++++++++++++++
+ 2 files changed, 48 insertions(+)
+
+diff --git a/lib/string.in.h b/lib/string.in.h
+index e764221..e3d94b7 100644
+--- a/lib/string.in.h
++++ b/lib/string.in.h
+@@ -215,25 +215,49 @@ _GL_EXTERN_C void free (void *);
+ /* Declarations for ISO C N3322.  */
+ #if defined __GNUC__ && __GNUC__ >= 15 && !defined __clang__
+ _GL_EXTERN_C void *memcpy (void *__dest, const void *__src, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ _GL_EXTERN_C void *memccpy (void *__dest, const void *__src, int __c, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 4)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 4);
+ _GL_EXTERN_C void *memmove (void *__dest, const void *__src, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ _GL_EXTERN_C char *strncpy (char *__dest, const char *__src, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ _GL_EXTERN_C char *strndup (const char *__s, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 2);
+ _GL_EXTERN_C char *strncat (char *__dest, const char *__src, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ARG_NONNULL ((1)) _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ _GL_EXTERN_C int memcmp (const void *__s1, const void *__s2, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ _GL_EXTERN_C int strncmp (const char *__s1, const char *__s2, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ # ifndef __cplusplus
+@@ -243,6 +267,9 @@ _GL_EXTERN_C void *memrchr (const void *__s, int __c, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
+ _GL_EXTERN_C void *memset (void *__s, int __c, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ _GL_EXTERN_C void *memset_explicit (void *__s, int __c, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+diff --git a/lib/wchar.in.h b/lib/wchar.in.h
+index 8836ed1..a6c52eb 100644
+--- a/lib/wchar.in.h
++++ b/lib/wchar.in.h
+@@ -281,20 +281,38 @@ _GL_EXTERN_C void free (void *);
+ /* Declarations for ISO C N3322.  */
+ #if defined __GNUC__ && __GNUC__ >= 15 && !defined __clang__
+ _GL_EXTERN_C wchar_t *wmemcpy (wchar_t *__dest, const wchar_t *__src, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ _GL_EXTERN_C wchar_t *wmemmove (wchar_t *__dest, const wchar_t *__src, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ _GL_EXTERN_C wchar_t *wcsncpy (wchar_t *__dest, const wchar_t *__src, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ _GL_EXTERN_C wchar_t *wcsncat (wchar_t *__dest, const wchar_t *__src, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ARG_NONNULL ((1)) _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ _GL_EXTERN_C int wmemcmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ _GL_EXTERN_C int wcsncmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ # ifndef __cplusplus
+@@ -302,6 +320,9 @@ _GL_EXTERN_C wchar_t *wmemchr (const wchar_t *__s, wchar_t __wc, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
+ _GL_EXTERN_C wchar_t *wmemset (wchar_t *__s, wchar_t __wc, size_t __n)
++# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++  _GL_ATTRIBUTE_NOTHROW
++# endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ #endif
+ 
diff --git a/meta/recipes-devtools/m4/m4/0002-string-h-Fix-compilation-error-on-macOS-with-fortify.patch b/meta/recipes-devtools/m4/m4/0002-string-h-Fix-compilation-error-on-macOS-with-fortify.patch
new file mode 100644
index 00000000000..ef7117997b5
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0002-string-h-Fix-compilation-error-on-macOS-with-fortify.patch
@@ -0,0 +1,126 @@
+From 84b6bcb2c691796d87b47bfcf815409ca2b9e461 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Thu, 10 Jul 2025 11:04:50 +0200
+Subject: [PATCH] string-h: Fix compilation error on macOS with fortify.
+
+Reported by Pierre Ossman <ossman@cendio.se> at
+<https://savannah.gnu.org/bugs/?67300>.
+
+* lib/string.in.h (memcpy etc.): Don't redeclare functions that are
+declared as macros.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gnulib.git/commit/?id=c44fe03b72687c9e913727724c29bdb49c1f86e3]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ lib/string.in.h | 58 +++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 39 insertions(+), 19 deletions(-)
+
+diff --git a/lib/string.in.h b/lib/string.in.h
+index e3d94b7..9a039c7 100644
+--- a/lib/string.in.h
++++ b/lib/string.in.h
+@@ -214,65 +214,85 @@ _GL_EXTERN_C void free (void *);
+ 
+ /* Declarations for ISO C N3322.  */
+ #if defined __GNUC__ && __GNUC__ >= 15 && !defined __clang__
++# ifndef memcpy
+ _GL_EXTERN_C void *memcpy (void *__dest, const void *__src, size_t __n)
+-# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++#  if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+-# endif
++#  endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
++# endif
++# ifndef memccpy
+ _GL_EXTERN_C void *memccpy (void *__dest, const void *__src, int __c, size_t __n)
+-# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++#  if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+-# endif
++#  endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 4)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 4);
++# endif
++# ifndef memmove
+ _GL_EXTERN_C void *memmove (void *__dest, const void *__src, size_t __n)
+-# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++#  if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+-# endif
++#  endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
++# endif
++# ifndef strncpy
+ _GL_EXTERN_C char *strncpy (char *__dest, const char *__src, size_t __n)
+-# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++#  if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+-# endif
++#  endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
++# endif
++# ifndef strndup
+ _GL_EXTERN_C char *strndup (const char *__s, size_t __n)
+-# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++#  if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+-# endif
++#  endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 2);
++# endif
++# ifndef strncat
+ _GL_EXTERN_C char *strncat (char *__dest, const char *__src, size_t __n)
+-# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++#  if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+-# endif
++#  endif
+   _GL_ARG_NONNULL ((1)) _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
++# endif
++# ifndef memcmp
+ _GL_EXTERN_C int memcmp (const void *__s1, const void *__s2, size_t __n)
+-# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++#  if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+-# endif
++#  endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
++# endif
++# ifndef strncmp
+ _GL_EXTERN_C int strncmp (const char *__s1, const char *__s2, size_t __n)
+-# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++#  if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+-# endif
++#  endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+-# ifndef __cplusplus
++# endif
++# if !defined memchr && !defined __cplusplus
+ _GL_EXTERN_C void *memchr (const void *__s, int __c, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ _GL_EXTERN_C void *memrchr (const void *__s, int __c, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
++# ifndef memset
+ _GL_EXTERN_C void *memset (void *__s, int __c, size_t __n)
+-# if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
++#  if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+-# endif
++#  endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
++# endif
++# ifndef memset_explicit
+ _GL_EXTERN_C void *memset_explicit (void *__s, int __c, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
++# endif
+ #endif
+ 
+ 
diff --git a/meta/recipes-devtools/m4/m4/0003-Port-to-C23-qualifier-generic-fns-like-strchr.patch b/meta/recipes-devtools/m4/m4/0003-Port-to-C23-qualifier-generic-fns-like-strchr.patch
new file mode 100644
index 00000000000..7d88e45fa58
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0003-Port-to-C23-qualifier-generic-fns-like-strchr.patch
@@ -0,0 +1,194 @@
+From 100cbc40da39dcdf259ebce2bd0f2b4889cf2204 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sun, 23 Nov 2025 00:50:40 -0800
+Subject: [PATCH] Port to C23 qualifier-generic fns like strchr
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This ports Gnulib to strict C23 platforms that reject code
+like ‘char *q = strchr (P, 'x');’ when P is a pointer to const,
+because in C23 strchr is a qualifier-generic function so
+strchr (P, 'x') returns char const *.
+This patch does not attempt to do the following two things,
+which might be useful in the future:
+1. When compiling on non-C23 platforms, check user code for
+portability to platforms that define qualifier-generic functions.
+2. Port Gnulib to platforms that have qualifier-generic functions
+not listed in the C23 standard, e.g., strchrnul.  I don’t know
+of any such platforms.
+* lib/argp-help.c (argp_doc):
+* lib/c-strstr.c (c_strstr):
+* lib/dfa.c (comsubs):
+* lib/mbschr.c (mbschr):
+* lib/mbspbrk.c (mbspbrk):
+* lib/mbsrchr.c (mbsrchr):
+* lib/memchr2.c (memchr2):
+* lib/string-desc.c (_sd_index):
+* tests/test-bsearch.c (lib_bsearch):
+* tests/test-memchr.c (lib_memchr):
+* tests/test-wmemchr.c (lib_wmemchr):
+Port to C23, where functions like strchr are qualifier-generic.
+* lib/c++defs.h (_GL_FUNCDECL_SYS_NAME): New macro.
+* lib/c++defs.h (_GL_FUNCDECL_SYS):
+* lib/stdlib.in.h (bsearch):
+Use it, to prevent C23 names like strchr from acting like macros.
+* lib/string.in.h (memchr, strchr, strpbrk, strrchr):
+Do not #undef when GNULIB_POSIXCHECK is defined, as this could
+cause conforming C23 code to fail to conform.  It’s not clear why
+_GL_WARN_ON_USE_CXX; perhaps it was needed but isn’t any more?
+But for now, limit the removal of #undef to these four functions
+where #undeffing is clearly undesirable in C23.
+* lib/wchar.in.h (wmemchr): Parenthesize function name in decl,
+to prevent it from acting like a macro.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gnulib.git/commit/?id=df17f4f37ed3ca373d23ad42eae51122bdb96626]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ lib/c++defs.h   | 12 +++++++++++-
+ lib/memchr2.c   |  2 +-
+ lib/stdlib.in.h |  6 +++---
+ lib/string.in.h |  4 ----
+ lib/wchar.in.h  |  2 +-
+ tests/c++defs.h | 12 +++++++++++-
+ 6 files changed, 27 insertions(+), 11 deletions(-)
+
+diff --git a/lib/c++defs.h b/lib/c++defs.h
+index df98a5a..d3dfabd 100644
+--- a/lib/c++defs.h
++++ b/lib/c++defs.h
+@@ -127,6 +127,16 @@
+ #define _GL_FUNCDECL_RPL_1(rpl_func,rettype,parameters,...) \
+   _GL_EXTERN_C_FUNC __VA_ARGS__ rettype rpl_func parameters
+ 
++/* _GL_FUNCDECL_SYS_NAME (func) expands to plain func if C++, and to
++   parenthsized func otherwise.  Parenthesization is needed in C23 if
++   the function is like strchr and so is a qualifier-generic macro
++   that expands to something more complicated.  */
++#ifdef __cplusplus
++# define _GL_FUNCDECL_SYS_NAME(func) func
++#else
++# define _GL_FUNCDECL_SYS_NAME(func) (func)
++#endif
++
+ /* _GL_FUNCDECL_SYS (func, rettype, parameters, [attributes]);
+    declares the system function, named func, with the given prototype,
+    consisting of return type, parameters, and attributes.
+@@ -139,7 +149,7 @@
+      _GL_FUNCDECL_SYS (posix_openpt, int, (int flags), _GL_ATTRIBUTE_NODISCARD);
+  */
+ #define _GL_FUNCDECL_SYS(func,rettype,parameters,...) \
+-  _GL_EXTERN_C_FUNC __VA_ARGS__ rettype func parameters
++  _GL_EXTERN_C_FUNC __VA_ARGS__ rettype _GL_FUNCDECL_SYS_NAME (func) parameters
+ 
+ /* _GL_CXXALIAS_RPL (func, rettype, parameters);
+    declares a C++ alias called GNULIB_NAMESPACE::func
+diff --git a/lib/memchr2.c b/lib/memchr2.c
+index 7493823..d7724ae 100644
+--- a/lib/memchr2.c
++++ b/lib/memchr2.c
+@@ -55,7 +55,7 @@ memchr2 (void const *s, int c1_in, int c2_in, size_t n)
+   c2 = (unsigned char) c2_in;
+ 
+   if (c1 == c2)
+-    return memchr (s, c1, n);
++    return (void *) memchr (s, c1, n);
+ 
+   /* Handle the first few bytes by reading one byte at a time.
+      Do this until VOID_PTR is aligned on a longword boundary.  */
+diff --git a/lib/stdlib.in.h b/lib/stdlib.in.h
+index 1342db4..3548d6e 100644
+--- a/lib/stdlib.in.h
++++ b/lib/stdlib.in.h
+@@ -237,9 +237,9 @@ _GL_INLINE_HEADER_BEGIN
+ 
+ /* Declarations for ISO C N3322.  */
+ #if defined __GNUC__ && __GNUC__ >= 15 && !defined __clang__
+-_GL_EXTERN_C void *bsearch (const void *__key,
+-                            const void *__base, size_t __nmemb, size_t __size,
+-                            int (*__compare) (const void *, const void *))
++_GL_EXTERN_C void *_GL_FUNCDECL_SYS_NAME (bsearch)
++  (const void *__key, const void *__base, size_t __nmemb, size_t __size,
++   int (*__compare) (const void *, const void *))
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3) _GL_ARG_NONNULL ((5));
+ _GL_EXTERN_C void qsort (void *__base, size_t __nmemb, size_t __size,
+                          int (*__compare) (const void *, const void *))
+diff --git a/lib/string.in.h b/lib/string.in.h
+index 9a039c7..bc44f81 100644
+--- a/lib/string.in.h
++++ b/lib/string.in.h
+@@ -403,7 +403,6 @@ _GL_CXXALIASWARN1 (memchr, void const *,
+ _GL_CXXALIASWARN (memchr);
+ # endif
+ #elif defined GNULIB_POSIXCHECK
+-# undef memchr
+ /* Assume memchr is always declared.  */
+ _GL_WARN_ON_USE (memchr, "memchr has platform-specific bugs - "
+                  "use gnulib module memchr for portability" );
+@@ -653,7 +652,6 @@ _GL_WARN_ON_USE (stpncpy, "stpncpy is unportable - "
+ #if defined GNULIB_POSIXCHECK
+ /* strchr() does not work with multibyte strings if the locale encoding is
+    GB18030 and the character to be searched is a digit.  */
+-# undef strchr
+ /* Assume strchr is always declared.  */
+ _GL_WARN_ON_USE_CXX (strchr,
+                      const char *, char *, (const char *, int),
+@@ -945,7 +943,6 @@ _GL_CXXALIASWARN (strpbrk);
+    Even in this simple case, it does not work with multibyte strings if the
+    locale encoding is GB18030 and one of the characters to be searched is a
+    digit.  */
+-#  undef strpbrk
+ _GL_WARN_ON_USE_CXX (strpbrk,
+                      const char *, char *, (const char *, const char *),
+                      "strpbrk cannot work correctly on character strings "
+@@ -975,7 +972,6 @@ _GL_WARN_ON_USE (strspn, "strspn cannot work correctly on character strings "
+ #if defined GNULIB_POSIXCHECK
+ /* strrchr() does not work with multibyte strings if the locale encoding is
+    GB18030 and the character to be searched is a digit.  */
+-# undef strrchr
+ /* Assume strrchr is always declared.  */
+ _GL_WARN_ON_USE_CXX (strrchr,
+                      const char *, char *, (const char *, int),
+diff --git a/lib/wchar.in.h b/lib/wchar.in.h
+index a6c52eb..b4de385 100644
+--- a/lib/wchar.in.h
++++ b/lib/wchar.in.h
+@@ -316,7 +316,7 @@ _GL_EXTERN_C int wcsncmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ # ifndef __cplusplus
+-_GL_EXTERN_C wchar_t *wmemchr (const wchar_t *__s, wchar_t __wc, size_t __n)
++_GL_EXTERN_C wchar_t *(wmemchr) (const wchar_t *__s, wchar_t __wc, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
+ _GL_EXTERN_C wchar_t *wmemset (wchar_t *__s, wchar_t __wc, size_t __n)
+diff --git a/tests/c++defs.h b/tests/c++defs.h
+index df98a5a..d3dfabd 100644
+--- a/tests/c++defs.h
++++ b/tests/c++defs.h
+@@ -127,6 +127,16 @@
+ #define _GL_FUNCDECL_RPL_1(rpl_func,rettype,parameters,...) \
+   _GL_EXTERN_C_FUNC __VA_ARGS__ rettype rpl_func parameters
+ 
++/* _GL_FUNCDECL_SYS_NAME (func) expands to plain func if C++, and to
++   parenthsized func otherwise.  Parenthesization is needed in C23 if
++   the function is like strchr and so is a qualifier-generic macro
++   that expands to something more complicated.  */
++#ifdef __cplusplus
++# define _GL_FUNCDECL_SYS_NAME(func) func
++#else
++# define _GL_FUNCDECL_SYS_NAME(func) (func)
++#endif
++
+ /* _GL_FUNCDECL_SYS (func, rettype, parameters, [attributes]);
+    declares the system function, named func, with the given prototype,
+    consisting of return type, parameters, and attributes.
+@@ -139,7 +149,7 @@
+      _GL_FUNCDECL_SYS (posix_openpt, int, (int flags), _GL_ATTRIBUTE_NODISCARD);
+  */
+ #define _GL_FUNCDECL_SYS(func,rettype,parameters,...) \
+-  _GL_EXTERN_C_FUNC __VA_ARGS__ rettype func parameters
++  _GL_EXTERN_C_FUNC __VA_ARGS__ rettype _GL_FUNCDECL_SYS_NAME (func) parameters
+ 
+ /* _GL_CXXALIAS_RPL (func, rettype, parameters);
+    declares a C++ alias called GNULIB_NAMESPACE::func


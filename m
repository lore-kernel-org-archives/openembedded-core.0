Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE1FF8808E
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:43 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7582.1776322114813685152
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gTmTEdkt;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso6944222f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322113; x=1776926913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xkN5pXYq4S9tJ6G2jyPolGCL8m5EMu7PU/ueOMMNCk=;
        b=gTmTEdkthhJ28n7d7BseB4hSDiYD6NjoF8g1OWK8skknlZmTIyRiXdmBRUcXRDDvfi
         8xb7pH8cYCs3pOjMsoGAWVPb/0BiK4VIa40FqrzhvX8LX1u8ej4JzLcx7h2+wqUmNcg6
         rrL48YnemsGpKWek7WPay5k4MQqhs8aMkWpFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322113; x=1776926913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0xkN5pXYq4S9tJ6G2jyPolGCL8m5EMu7PU/ueOMMNCk=;
        b=oFrN10hZ6xy/g7FNjmhByVq3sZcj1ByT+cQ/krgeO6gMfQzhEDp8JMlIyfstkBuGv1
         hh3YQIBLXJFi9Y1JM9WkVl0ta16qhnC/ZUo6t/wUsK0ER2/nuYn8yhIW9upd7bF0IWzs
         Ijlfhbh6XMHDxC20Ukm5NUxxfaFhLrQmOE+a4+B+d717Vo1InIMvH2fPSam9b2KSbeWY
         7+6z9O8MD2q1eH333FZ+NhBITO4D1DCTb3RJ41z2hblJ5XCykV66RfvAy+Xhkx7aScQk
         5D51y6YKfdazGERo+SkdtITzelxW9XWUanoYUTYINV5JGZuVICdCpHBNxppb85/kbY3g
         0f2w==
X-Gm-Message-State: AOJu0YwVvIrp3/3izoOiWHYWdZio/hGhtCHIfAbEKmGlwK7Q/vRJwUoU
	5OTtbIrsQ5eTIKeSHKIJJvazrWOhCzP4DXrBbXaPYONiwfnqwOMqJOVdTn0S8WI8EuYNT0nuWvA
	CTTbiMEN9Qnz5
X-Gm-Gg: AeBDiesX0v5T8ZURV2svw6I4xb8IEMrvbH7Mu8tgWScN78EhxYPeGBuWoREt4SGag/w
	lIG5xZ2Q/xMnTHev2Y/U2++ytQ3tkf2KpgXa12rFWU7KKTR6LnUbvcaDwwCmgub9AX+9CUsZ7ay
	heoHv3Uq9f/H0SGD+BQE1p6Ofbw/jG76j8J5BORn0sntyq7RHS1fT0yyD3H60nulPqMwl/b7MDb
	/v2+D9dd1Nwsal/zwT/nxUbbByrqWuuNvkOm4eCIomZ6h+uUBmZYqJprO9Fdyg4OSRrSCVmyEAP
	QjHTEMGIbj44sBoUCbhQ1APIVyWMGLK/9FomcuZ4RxVhY9D3cr2gVr4wsW4dLd80gHT/3j85mV5
	AdiN6AY/mBb6Fo6NWrHYaNi6c1kRzTr6WO9sl9UNA68zdx25dzVFafj1JLawHWVnMFtGzP++9GZ
	j6PvNZmJOVjW7y1zAX16kIRCLTYN9yblAg8fQPmf3ZVWoFV2vEd2VUfF9L1LrJg7mxpJWulePih
	77UMmYCgkuNDB2ME9yaGttBoBkd2MscztxuBQ==
X-Received: by 2002:a05:6000:186e:b0:43e:a70d:7622 with SMTP id ffacd0b85a97d-43ea70d791amr13787197f8f.22.1776322112348;
        Wed, 15 Apr 2026 23:48:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 22/47] gettext: backport gnulib changes to fix build with glibc-2.43 on host
Date: Thu, 16 Apr 2026 08:47:23 +0200
Message-ID: <1d44eef557bbac27a527a4f37eb80badedcb9082.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235364

From: Martin Jansa <martin.jansa@gmail.com>

It's already included in gettext-1.0 used in master.

Unfortunately this need to be applied in 6 different copies of gnulib
inside gettext repo.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...23-qualifier-generic-fns-like-strchr.patch | 626 ++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.26.bb     |   1 +
 2 files changed, 627 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext/0001-Port-to-C23-qualifier-generic-fns-like-strchr.patch

diff --git a/meta/recipes-core/gettext/gettext/0001-Port-to-C23-qualifier-generic-fns-like-strchr.patch b/meta/recipes-core/gettext/gettext/0001-Port-to-C23-qualifier-generic-fns-like-strchr.patch
new file mode 100644
index 00000000000..634e17ea788
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext/0001-Port-to-C23-qualifier-generic-fns-like-strchr.patch
@@ -0,0 +1,626 @@
+From 64c9525e8664ec3b89475100cbeda06ed916e707 Mon Sep 17 00:00:00 2001
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
+ gettext-runtime/gnulib-lib/c++defs.h         | 12 +++++++++++-
+ gettext-runtime/gnulib-lib/stdlib.in.h       |  6 +++---
+ gettext-runtime/gnulib-lib/string.in.h       |  4 ----
+ gettext-runtime/gnulib-lib/wchar.in.h        |  2 +-
+ gettext-runtime/intl/gnulib-lib/c++defs.h    | 12 +++++++++++-
+ gettext-runtime/intl/gnulib-lib/stdlib.in.h  |  6 +++---
+ gettext-runtime/intl/gnulib-lib/string.in.h  |  4 ----
+ gettext-runtime/intl/gnulib-lib/wchar.in.h   |  2 +-
+ gettext-tools/gnulib-lib/c++defs.h           | 12 +++++++++++-
+ gettext-tools/gnulib-lib/stdlib.in.h         |  6 +++---
+ gettext-tools/gnulib-lib/string.in.h         |  4 ----
+ gettext-tools/gnulib-lib/wchar.in.h          |  2 +-
+ gettext-tools/libgettextpo/c++defs.h         | 12 +++++++++++-
+ gettext-tools/libgettextpo/stdlib.in.h       |  6 +++---
+ gettext-tools/libgettextpo/string.in.h       |  4 ----
+ gettext-tools/libgettextpo/wchar.in.h        |  2 +-
+ gettext-tools/libgrep/gnulib-lib/c++defs.h   | 12 +++++++++++-
+ gettext-tools/libgrep/gnulib-lib/memchr2.c   |  2 +-
+ gettext-tools/libgrep/gnulib-lib/stdlib.in.h |  6 +++---
+ gettext-tools/libgrep/gnulib-lib/wchar.in.h  |  2 +-
+ libtextstyle/lib/c++defs.h                   | 12 +++++++++++-
+ libtextstyle/lib/stdlib.in.h                 |  6 +++---
+ libtextstyle/lib/string.in.h                 |  4 ----
+ libtextstyle/lib/wchar.in.h                  |  2 +-
+ 24 files changed, 91 insertions(+), 51 deletions(-)
+
+diff --git a/gettext-runtime/gnulib-lib/c++defs.h b/gettext-runtime/gnulib-lib/c++defs.h
+index df98a5a..d3dfabd 100644
+--- a/gettext-runtime/gnulib-lib/c++defs.h
++++ b/gettext-runtime/gnulib-lib/c++defs.h
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
+diff --git a/gettext-runtime/gnulib-lib/stdlib.in.h b/gettext-runtime/gnulib-lib/stdlib.in.h
+index 1342db4..3548d6e 100644
+--- a/gettext-runtime/gnulib-lib/stdlib.in.h
++++ b/gettext-runtime/gnulib-lib/stdlib.in.h
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
+diff --git a/gettext-runtime/gnulib-lib/string.in.h b/gettext-runtime/gnulib-lib/string.in.h
+index 9a039c7..bc44f81 100644
+--- a/gettext-runtime/gnulib-lib/string.in.h
++++ b/gettext-runtime/gnulib-lib/string.in.h
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
+diff --git a/gettext-runtime/gnulib-lib/wchar.in.h b/gettext-runtime/gnulib-lib/wchar.in.h
+index a6c52eb..b4de385 100644
+--- a/gettext-runtime/gnulib-lib/wchar.in.h
++++ b/gettext-runtime/gnulib-lib/wchar.in.h
+@@ -316,7 +316,7 @@ _GL_EXTERN_C int wcsncmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ # ifndef __cplusplus
+-_GL_EXTERN_C wchar_t *wmemchr (const wchar_t *__s, wchar_t __wc, size_t __n)
++_GL_EXTERN_C wchar_t *(wmemchr) (const wchar_t *__s, wchar_t __wc, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
+ _GL_EXTERN_C wchar_t *wmemset (wchar_t *__s, wchar_t __wc, size_t __n)
+diff --git a/gettext-runtime/intl/gnulib-lib/c++defs.h b/gettext-runtime/intl/gnulib-lib/c++defs.h
+index df98a5a..d3dfabd 100644
+--- a/gettext-runtime/intl/gnulib-lib/c++defs.h
++++ b/gettext-runtime/intl/gnulib-lib/c++defs.h
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
+diff --git a/gettext-runtime/intl/gnulib-lib/stdlib.in.h b/gettext-runtime/intl/gnulib-lib/stdlib.in.h
+index 1342db4..3548d6e 100644
+--- a/gettext-runtime/intl/gnulib-lib/stdlib.in.h
++++ b/gettext-runtime/intl/gnulib-lib/stdlib.in.h
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
+diff --git a/gettext-runtime/intl/gnulib-lib/string.in.h b/gettext-runtime/intl/gnulib-lib/string.in.h
+index 9a039c7..bc44f81 100644
+--- a/gettext-runtime/intl/gnulib-lib/string.in.h
++++ b/gettext-runtime/intl/gnulib-lib/string.in.h
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
+diff --git a/gettext-runtime/intl/gnulib-lib/wchar.in.h b/gettext-runtime/intl/gnulib-lib/wchar.in.h
+index a6c52eb..b4de385 100644
+--- a/gettext-runtime/intl/gnulib-lib/wchar.in.h
++++ b/gettext-runtime/intl/gnulib-lib/wchar.in.h
+@@ -316,7 +316,7 @@ _GL_EXTERN_C int wcsncmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ # ifndef __cplusplus
+-_GL_EXTERN_C wchar_t *wmemchr (const wchar_t *__s, wchar_t __wc, size_t __n)
++_GL_EXTERN_C wchar_t *(wmemchr) (const wchar_t *__s, wchar_t __wc, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
+ _GL_EXTERN_C wchar_t *wmemset (wchar_t *__s, wchar_t __wc, size_t __n)
+diff --git a/gettext-tools/gnulib-lib/c++defs.h b/gettext-tools/gnulib-lib/c++defs.h
+index df98a5a..d3dfabd 100644
+--- a/gettext-tools/gnulib-lib/c++defs.h
++++ b/gettext-tools/gnulib-lib/c++defs.h
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
+diff --git a/gettext-tools/gnulib-lib/stdlib.in.h b/gettext-tools/gnulib-lib/stdlib.in.h
+index 1342db4..3548d6e 100644
+--- a/gettext-tools/gnulib-lib/stdlib.in.h
++++ b/gettext-tools/gnulib-lib/stdlib.in.h
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
+diff --git a/gettext-tools/gnulib-lib/string.in.h b/gettext-tools/gnulib-lib/string.in.h
+index 9a039c7..bc44f81 100644
+--- a/gettext-tools/gnulib-lib/string.in.h
++++ b/gettext-tools/gnulib-lib/string.in.h
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
+diff --git a/gettext-tools/gnulib-lib/wchar.in.h b/gettext-tools/gnulib-lib/wchar.in.h
+index a6c52eb..b4de385 100644
+--- a/gettext-tools/gnulib-lib/wchar.in.h
++++ b/gettext-tools/gnulib-lib/wchar.in.h
+@@ -316,7 +316,7 @@ _GL_EXTERN_C int wcsncmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ # ifndef __cplusplus
+-_GL_EXTERN_C wchar_t *wmemchr (const wchar_t *__s, wchar_t __wc, size_t __n)
++_GL_EXTERN_C wchar_t *(wmemchr) (const wchar_t *__s, wchar_t __wc, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
+ _GL_EXTERN_C wchar_t *wmemset (wchar_t *__s, wchar_t __wc, size_t __n)
+diff --git a/gettext-tools/libgettextpo/c++defs.h b/gettext-tools/libgettextpo/c++defs.h
+index df98a5a..d3dfabd 100644
+--- a/gettext-tools/libgettextpo/c++defs.h
++++ b/gettext-tools/libgettextpo/c++defs.h
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
+diff --git a/gettext-tools/libgettextpo/stdlib.in.h b/gettext-tools/libgettextpo/stdlib.in.h
+index 1342db4..3548d6e 100644
+--- a/gettext-tools/libgettextpo/stdlib.in.h
++++ b/gettext-tools/libgettextpo/stdlib.in.h
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
+diff --git a/gettext-tools/libgettextpo/string.in.h b/gettext-tools/libgettextpo/string.in.h
+index 9a039c7..bc44f81 100644
+--- a/gettext-tools/libgettextpo/string.in.h
++++ b/gettext-tools/libgettextpo/string.in.h
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
+diff --git a/gettext-tools/libgettextpo/wchar.in.h b/gettext-tools/libgettextpo/wchar.in.h
+index a6c52eb..b4de385 100644
+--- a/gettext-tools/libgettextpo/wchar.in.h
++++ b/gettext-tools/libgettextpo/wchar.in.h
+@@ -316,7 +316,7 @@ _GL_EXTERN_C int wcsncmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ # ifndef __cplusplus
+-_GL_EXTERN_C wchar_t *wmemchr (const wchar_t *__s, wchar_t __wc, size_t __n)
++_GL_EXTERN_C wchar_t *(wmemchr) (const wchar_t *__s, wchar_t __wc, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
+ _GL_EXTERN_C wchar_t *wmemset (wchar_t *__s, wchar_t __wc, size_t __n)
+diff --git a/gettext-tools/libgrep/gnulib-lib/c++defs.h b/gettext-tools/libgrep/gnulib-lib/c++defs.h
+index df98a5a..d3dfabd 100644
+--- a/gettext-tools/libgrep/gnulib-lib/c++defs.h
++++ b/gettext-tools/libgrep/gnulib-lib/c++defs.h
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
+diff --git a/gettext-tools/libgrep/gnulib-lib/memchr2.c b/gettext-tools/libgrep/gnulib-lib/memchr2.c
+index 7493823..d7724ae 100644
+--- a/gettext-tools/libgrep/gnulib-lib/memchr2.c
++++ b/gettext-tools/libgrep/gnulib-lib/memchr2.c
+@@ -55,7 +55,7 @@ memchr2 (void const *s, int c1_in, int c2_in, size_t n)
+   c2 = (unsigned char) c2_in;
+ 
+   if (c1 == c2)
+-    return memchr (s, c1, n);
++    return (void *) memchr (s, c1, n);
+ 
+   /* Handle the first few bytes by reading one byte at a time.
+      Do this until VOID_PTR is aligned on a longword boundary.  */
+diff --git a/gettext-tools/libgrep/gnulib-lib/stdlib.in.h b/gettext-tools/libgrep/gnulib-lib/stdlib.in.h
+index 1342db4..3548d6e 100644
+--- a/gettext-tools/libgrep/gnulib-lib/stdlib.in.h
++++ b/gettext-tools/libgrep/gnulib-lib/stdlib.in.h
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
+diff --git a/gettext-tools/libgrep/gnulib-lib/wchar.in.h b/gettext-tools/libgrep/gnulib-lib/wchar.in.h
+index a6c52eb..b4de385 100644
+--- a/gettext-tools/libgrep/gnulib-lib/wchar.in.h
++++ b/gettext-tools/libgrep/gnulib-lib/wchar.in.h
+@@ -316,7 +316,7 @@ _GL_EXTERN_C int wcsncmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ # ifndef __cplusplus
+-_GL_EXTERN_C wchar_t *wmemchr (const wchar_t *__s, wchar_t __wc, size_t __n)
++_GL_EXTERN_C wchar_t *(wmemchr) (const wchar_t *__s, wchar_t __wc, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
+ _GL_EXTERN_C wchar_t *wmemset (wchar_t *__s, wchar_t __wc, size_t __n)
+diff --git a/libtextstyle/lib/c++defs.h b/libtextstyle/lib/c++defs.h
+index df98a5a..d3dfabd 100644
+--- a/libtextstyle/lib/c++defs.h
++++ b/libtextstyle/lib/c++defs.h
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
+diff --git a/libtextstyle/lib/stdlib.in.h b/libtextstyle/lib/stdlib.in.h
+index 1342db4..3548d6e 100644
+--- a/libtextstyle/lib/stdlib.in.h
++++ b/libtextstyle/lib/stdlib.in.h
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
+diff --git a/libtextstyle/lib/string.in.h b/libtextstyle/lib/string.in.h
+index 9a039c7..bc44f81 100644
+--- a/libtextstyle/lib/string.in.h
++++ b/libtextstyle/lib/string.in.h
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
+diff --git a/libtextstyle/lib/wchar.in.h b/libtextstyle/lib/wchar.in.h
+index a6c52eb..b4de385 100644
+--- a/libtextstyle/lib/wchar.in.h
++++ b/libtextstyle/lib/wchar.in.h
+@@ -316,7 +316,7 @@ _GL_EXTERN_C int wcsncmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ # ifndef __cplusplus
+-_GL_EXTERN_C wchar_t *wmemchr (const wchar_t *__s, wchar_t __wc, size_t __n)
++_GL_EXTERN_C wchar_t *(wmemchr) (const wchar_t *__s, wchar_t __wc, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
+ _GL_EXTERN_C wchar_t *wmemset (wchar_t *__s, wchar_t __wc, size_t __n)
diff --git a/meta/recipes-core/gettext/gettext_0.26.bb b/meta/recipes-core/gettext/gettext_0.26.bb
index b99b301af48..bb730154497 100644
--- a/meta/recipes-core/gettext/gettext_0.26.bb
+++ b/meta/recipes-core/gettext/gettext_0.26.bb
@@ -26,6 +26,7 @@ SRC_URI += " \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
+           file://0001-Port-to-C23-qualifier-generic-fns-like-strchr.patch \
            "
 SRC_URI:append:libc-musl = " file://0001-Ignore-failing-tests-needing-BIG5-encoding-on-musl.patch"
 


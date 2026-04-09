Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEF6F31E39
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:28:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.135342.1775748527720023090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IZdxt3dn;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so10086725e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748526; x=1776353326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlHn83iwvUkVFVK/6fbYCO3lVqeK3DbRFxJzWNIqc64=;
        b=IZdxt3dnNaWMxwHPdPB0pAKrIcl8cdnvH5eWfmsiX5SQ/ugsBFEAfhw4w9RniK9Sro
         OvGN7SRxtKU2yuDaN9KoDhJSIyq4tA9DyhkLfx3E3H0IBFa8NPPDQKXb3O9SelpRt8gj
         GqXMJtdtMeDxFfmpVXp6+Do7ynZeQTVvbHeXD8EFYHpAGtzALosiT+407EuctgPvbNjV
         6Gr9abGU5U3QtyZs/EM2PtyT4MECslPsqsxzgzaCizzBwdVYegnOv4EHM1fBmIb5Yj4y
         oZMCQ55hlUVIVu4h5MBZY8WGoowYmdId6kDTELOZ5dIXFA18O0Kh2vyqsHUzySgnSQ8B
         mcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748526; x=1776353326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TlHn83iwvUkVFVK/6fbYCO3lVqeK3DbRFxJzWNIqc64=;
        b=ntPUaXEJf9pa9HQjP47+kuemmZWyMwzFoQmh7SjNZlJbgsBVco96QNamNRb6qHwddm
         CaefbO2JJ40iZoNDaqJFoL8hEGsKrqRDrWrYEH3GyT7MyQCvcXPbB7LKyynr5jTqoqv1
         oZkPgD4w5KJGGC6Go5bqw7MojU7D8w29cp27Zgd28P1RgRD1Sq7v3gIfGSPtTGjPA9/b
         +p9p2kP+ZiwQUJktYVBf4rqCzcSH71yYfBVz28yJXEOXdChtOgH/D8G7KWvAfkiNNCJC
         ogNNzRv3XD1elxplXKetkRKtPiCO+UpAq2uQteU04dQYqT9Fmw6LQvCyb0YejmWGpop2
         nFrQ==
X-Gm-Message-State: AOJu0YxIKdWWCP0VHpqnzh3gzyE9QzJtB4cZUax3Vym0Eh8jb9cdujLa
	qV7mtkC7wbfs7Dnhs4nUIg+2pNAIdSj3f0l+46QUn6JAjEV7hsgGSe2h4kUKXQ==
X-Gm-Gg: AeBDiet0b51K6RfZobSkKtO7waCw397MMvnh7Xwwt5JJKQx8rol5L0Y2JllrdoJTVQL
	oGXoHQTViTE3or9EQ7kRWr/pbSv6+9bOSsbzvxgjry34acdb2UklEzprFBRL2cZCcwepT1osH/o
	B3QQKAfFuRtFYJQrJ//euSiQ1sqQylbducHcJ7RI0uxIZVtEq6jllNeaes/A7ChTcrDzNdLXsE2
	Mtxi3nnPfngn+EKFHJBJcGm4Lm0XqhYqcS1QnKBBykNWM148Dk6dnx5SXzp57DctQ4M0ourEWe+
	Oto/b32BBiwiDrvMPBqi2XFQrD3p9Nfrw92CdayjZQiY+eueELFwmsjuppYpPCvKmT5z8tAAtkg
	Grq8UdgLwofpFuiE1/yGwcnCTFKytjIKUnXeBfkk+EbJ++BpugJBBWhuueMhkW3lphWl6kz8JXc
	lGqDgHBhdxgMHiEWcGHNVa7BaQBwG0yfx/CBWx
X-Received: by 2002:a05:600c:4751:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-488ccf3e8c2mr55283875e9.5.1775748525383;
        Thu, 09 Apr 2026 08:28:45 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd10b1dbsm58154415e9.2.2026.04.09.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:28:45 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [whinlatter][PATCH 5/9] gettext: backport gnulib changes to fix build with glibc-2.43 on host
Date: Thu,  9 Apr 2026 17:28:24 +0200
Message-ID: <20260409152839.2894434-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409152839.2894434-1-martin.jansa@gmail.com>
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234921

From: Martin Jansa <martin.jansa@gmail.com>

It's already included in gettext-1.0 used in master.

Unfortunately this need to be applied in 6 different copies of gnulib
inside gettext repo.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...23-qualifier-generic-fns-like-strchr.patch | 626 ++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.26.bb     |   1 +
 2 files changed, 627 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext/0001-Port-to-C23-qualifier-generic-fns-like-strchr.patch

diff --git a/meta/recipes-core/gettext/gettext/0001-Port-to-C23-qualifier-generic-fns-like-strchr.patch b/meta/recipes-core/gettext/gettext/0001-Port-to-C23-qualifier-generic-fns-like-strchr.patch
new file mode 100644
index 0000000000..634e17ea78
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
index b99b301af4..bb73015449 100644
--- a/meta/recipes-core/gettext/gettext_0.26.bb
+++ b/meta/recipes-core/gettext/gettext_0.26.bb
@@ -26,6 +26,7 @@ SRC_URI += " \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
+           file://0001-Port-to-C23-qualifier-generic-fns-like-strchr.patch \
            "
 SRC_URI:append:libc-musl = " file://0001-Ignore-failing-tests-needing-BIG5-encoding-on-musl.patch"
 


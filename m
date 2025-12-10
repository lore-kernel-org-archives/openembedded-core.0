Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71214D3C527
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 03:34:49 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6153.1765337683893701105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 19:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AveaM2e2;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-343dfb673a8so6453421a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 19:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765337683; x=1765942483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2YTttafrM1hyVQQoh85ENgYup8cmVPY6o7iRD/E7HOk=;
        b=AveaM2e2t4pPvDLERWHA5KBOJ2lJttALyF779y3RT90CI6ILhwcpx0uMdWqkMRcz2Q
         SSgQKWKsenGDbvhFqCVkro+R7K3LuTLI8b7uvjW2OsD6pkt3ti2VkDNxRS/xAa1peNYY
         wXQVeBSgeDgbH//QN9475cj6QZ21i7SbTb/QTNq5PFC8aALrEiIrWrYqECucFWmWdqlX
         33C9NOtMLTl1z1eauutEhybnyzngBX50NhJv2XlRa6S1dJZd8HKTo4Uq7fH/uQQENULG
         kPwNGNcwtyf46HyfwCFY8+aBSUgNOj7lXrHY/SykjJu391nmf5niZw4un+GvAR3FljY9
         Yb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765337683; x=1765942483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YTttafrM1hyVQQoh85ENgYup8cmVPY6o7iRD/E7HOk=;
        b=iz5XitPbTkfP15SOFn+9TfOI9o/lEIOxVpe55BTJVesb6RoJYj97cG3v9S4uZnmUei
         yXGZVPqVHeOyjxApL30fnasw7CMffhwVBtrIA6aehV9uvN+W2FjPEyERXYx/zHXnpqE9
         lUKjRJ6BMyjaGqrkb9D9YNzc5fzAKcebMOlihEHum7BFv4i5SBNrgnFZdwM3NPVjExH8
         uGtM5Ye6CMzsi0DJZ7iE/JE4TFSfgNKrpBJ0TMGR7pBlJXt+qBq93R3gk9PxsXe+h7Pf
         RSVxx6BrX56VTME6yOpxlofe2YKXhIpGwTN1X5N4SL77FYWpYJvf4XV779l/Uhdui8xJ
         IREg==
X-Gm-Message-State: AOJu0YxT8JF3FiuUw+XxOx/ThagysKXqN/tyfbkT2f1cZJ7R+RC0mgTn
	uCR36EbHvuk5Af1BpTS7A9Fmz8QaHu2U+4IVBhRPdA7XcMfQKoZk3DCc/GAlG0PQ
X-Gm-Gg: ASbGncsDAm9Na8YvkBAh1sYzmd7VZVjPpHkU2d7t4DNF38cD+66DkCJMjhFk4orYF4Q
	eofwJ7RKUWUjgvtoeR8Qn3etgM7JWyvo9woUoKJW+0zztu5myew3IaXc9USUabN6wvZ1UWU8nDt
	O/BC1fttgncoqYjpZL9cQ1D1roe1tAG3om0cUphkMCzAwqggPGul6UjWuS1MxqCvVHdfpmyqaV3
	ZQH9iG5spE1jZJYvKFp5YlPpUBuN2IRGDLGxwkgBrTpKHYl/v+uofWIiHmLfuUWAMKvdyXs3Scf
	9V2wXUDFGCNvseJS8S/4d/RsWBM9JEdMb3hRLNiwyD76NXk4PpukkNnCz5zy7hREGvZyVJIrJOi
	W1Ywcu4r1t0CdkP/hbV9ep1707n67keDvPzpzyReYmF1lu27/pKP+ayamwBg/ZWt9Dwv9a2r33z
	0eMi0KV9nR4Gqt0Bj7DUl8v6K8psgINH2mGVYQb6l7GhXkWr2oCEInOuIMWfnoxclLTtzkAskZ5
	plUKW9sklEiqnITL8G6iAXamYjw27kC
X-Google-Smtp-Source: AGHT+IHusJ3YOiuL/mShoYocdil64KDJ/G+QrZZXwOJF/uV1QQMLnqG8XQFmDA4vbRNiubefaNXayg==
X-Received: by 2002:a05:7022:2521:b0:11b:8161:5cfc with SMTP id a92af1059eb24-11f296dbf4emr885933c88.36.1765337682811;
        Tue, 09 Dec 2025 19:34:42 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7552defsm77038432c88.2.2025.12.09.19.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 19:34:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] nasm: Fix build with musl+clang
Date: Tue,  9 Dec 2025 19:34:40 -0800
Message-ID: <20251210033440.3042656-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 03:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227453

Fixes `bool` related errors w.r.t. C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Re-instate strlcat changes accidentally removed in v1

 ...0001-compiler.h-Backport-C23-support.patch | 96 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_3.01.bb       |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch

diff --git a/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch b/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch
new file mode 100644
index 0000000000..25722b2d75
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch
@@ -0,0 +1,96 @@
+From e402e82d34569b4642ffbb3344c7240d1ea07776 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Dec 2025 17:17:36 -0800
+Subject: [PATCH] compiler.h: Backport C23 support
+
+These is a collection of changes done to compiler.h post
+3.01 release. It fixes build with non-glibc ( musl )
+builds especially with clang compiler which is more
+fussy
+
+Brings in squashed changed for compiler.h from
+
+https://github.com/netwide-assembler/nasm/commit/44e89ba9b650b5e1533bca43682e167f51a3511f
+https://github.com/netwide-assembler/nasm/commit/746e7c9efa37cec9a44d84a1e96b8c38f385cc1f
+https://github.com/netwide-assembler/nasm/commit/44ec97993a28ba109f98c4514e27cef813720399#diff-8e3e9367147ea2bbe07af8d84c1e07f80f5e19ca23282426324e396ee05947ba
+https://github.com/netwide-assembler/nasm/commit/f4f7d18c06449a1859a62a10e7e24ca644032dff#diff-8e3e9367147ea2bbe07af8d84c1e07f80f5e19ca23282426324e396ee05947ba
+
+Upstream-Status: Backport [Above patches from master branch]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/compiler.h | 42 ++++++++++++++++++------------------------
+ 1 file changed, 18 insertions(+), 24 deletions(-)
+
+--- a/include/compiler.h
++++ b/include/compiler.h
+@@ -185,19 +185,10 @@ char * pure_func strrchrnul(const char *
+ size_t strlcat(char *, const char *, size_t);
+ #endif
+
+-#if !defined(__cplusplus) || (__STDC_VERSION >= 202311L)
+ /* C++ and C23 have bool, false, and true as proper keywords */
++#if !defined(__cplusplus) && (__STDC_VERSION__ < 202311L)
+ # ifdef HAVE_STDBOOL_H
+-/* If <stdbool.h> exists, include it explicitly to prevent it from
+-   begin included later, causing the "bool" macro to be defined. */
+ #  include <stdbool.h>
+-#  ifdef bool
+-/* Force bool to be a typedef instead of a macro. What a "clever" hack
+-   this is... */
+-    typedef bool                /* The macro definition of bool */
+-#  undef bool
+-        bool;                   /* No longer the macro definition */
+-#  endif
+ # elif defined(HAVE___BOOL)
+    typedef _Bool bool;
+ #  define false 0
+@@ -205,14 +196,10 @@ size_t strlcat(char *, const char *, siz
+ # else
+ /* This is a bit dangerous, because casting to this ersatz bool
+    will not produce the same result as the standard (bool) cast.
+-   Instead, use the bool() constructor-style macro defined below. */
++   Instead, use the explicit construct !!x instead of relying on
++   implicit conversions or casts. */
+ typedef enum bool { false, true } bool;
+ # endif
+-/* This amounts to a C++-style conversion cast to bool.  This works
+-   because C ignores an argument-taking macro when used without an
+-   argument and because bool was redefined as a typedef if it previously
+-   was defined as a macro (see above.) */
+-# define bool(x) ((bool)!!(x))
+ #endif
+
+ /* Create a NULL pointer of the same type as the address of
+@@ -325,11 +312,11 @@ static inline void *mempset(void *dst, i
+  * less likely to be taken.
+  */
+ #ifdef HAVE___BUILTIN_EXPECT
+-# define likely(x)	__builtin_expect(bool(x), true)
+-# define unlikely(x)	__builtin_expect(bool(x), false)
++# define likely(x)	__builtin_expect(!!(x), true)
++# define unlikely(x)	__builtin_expect(!!(x), false)
+ #else
+-# define likely(x)	bool(x)
+-# define unlikely(x)	bool(x)
++# define likely(x)	(!!(x))
++# define unlikely(x)	(!!(x))
+ #endif
+
+ #ifdef HAVE___BUILTIN_PREFETCH
+@@ -486,4 +473,15 @@ static inline unsigned int watcom_switch
+ # define default case BOGUS_CASE: default
+ #endif
+
++#ifndef unreachable              /* C23 defines as a macro in <stddef.h> */
++# ifdef HAVE___BUILTIN_UNREACHABLE
++#  define unreachable() __builtin_unreachable()
++# else
++#  define unreachable() do { abort(); } while(1)
++# endif
++#endif
++
++/* This should be set from main() */
++extern const char *_progname;
++
+ #endif	/* NASM_COMPILER_H */
diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devtools/nasm/nasm_3.01.bb
index 4f4b47d665..1e4719000f 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6178dc4f5355e40552448080e67a214b"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://0001-compiler.h-Backport-C23-support.patch \
            "

 SRC_URI[sha256sum] = "7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af7979eba84a9d045c0b1"


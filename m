Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E464ED3B9BA
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 01:25:58 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4062.1765329956158592636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 17:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6TxDhyV;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c026e074373so2257404a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 17:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765329955; x=1765934755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jhpGNs2hhdw9kHAbCheUY2vUai/P8oMPXeiw/ilRDk0=;
        b=H6TxDhyVb2Szfttok0lvgtvH0w4HBjYQc04X5RJMjEvLRhbIYeFFjEtXI0jx3NeL2m
         YqiHLGu9ngOlh+MDulM+hYYqxHWcG8v9p6EPktDBR7w5xDBaiKvP7mxOpQf4QZ9BGtIJ
         GVRjgJYq5fH2uc5mVqdP8tnvGU3kbdZEnR6C9rYxxvp19O3vsge7MKMY1JVmsD8s6Y02
         ZXNZl2RC6A4j8+vtv30IRVtVHVqTYP8s0X9Pz5qwO11rJnTRU26B7NnZ6zhAPNmDF9Cm
         FFz9pd10zC6kPN1yeMrUGPvH1+oJ18Zsk7EnwUWPTdzNtiKZBUlznQPmCUB9O4AK4Xhq
         tDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765329955; x=1765934755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhpGNs2hhdw9kHAbCheUY2vUai/P8oMPXeiw/ilRDk0=;
        b=bBmVi9cS41KdWbNugzUdYep8p1JzGJfToL5F4/lR9V+tlDPGvzGe+aQUraYEJcMThv
         Qe8nYlePs2kCqfg5Yc2zejCRRwrmiVvmKE/RBQ2ahUzk/89Fnjts1uVP9w3+Dos6Do8x
         u1/fWl1PxhMAPppOe/dRmy0acVNzpc8uFTt1qYSaSTutNRKvbCrKTcLPuJziuTRCFvpk
         H7h803OUWpv7TDLLYHgPYTKgsCsFfYTZttVbj+Td64tEkbK3ngp98mDBYra3QHv4VtAL
         hC4H+NtdhDL4EHkKCPyGE0REnw2MVX6kVBRTOHyUyECOX7k0ZKziOl2FQAx3o7X03kuF
         1rvg==
X-Gm-Message-State: AOJu0Yy9g5VLPOKw0C124WV5MDBb7eq7w94ksyrEEwtP1qP1/T+61BEl
	Zbg8RuYC2+RRtbiJh/8w0Ld9E77/jAWbnpw7/bJU8wa/0e424sS9ohJ04ULvCAvA
X-Gm-Gg: AY/fxX46fY0sroXk6o4iXeHm55nMxGA1OxRMBTbbzHVMyG4dnEyO7AgqKMOB/7WXLF9
	OKWMS8xcQTkItQ2AVZlz3zHrJyCnOsz4Aa1ATlQfh5ymS8LU0VNGjwJ0g37hR8XtiBCVgvem6Uv
	gWMF7my88QZ3YaEgxZ1i6R36IMfUtB+6NARdqvoWqLv9NfBpNVK+OvZ0DTPhvavJ/OcF3WPhU2Q
	TvNXPQouJZlaamYhk8lijQSVl95LCAE02siDM1gJeSGa6cwWdSFMJSvcs1Ab8bO+HFpdTGRYvpS
	JSA7cTYXDBqHDhMUbLzAXSCY94+WraQ9GozwGL8WwQZ+vGiUeu+ywwcDnssQ7Yhk6T2mEU+Et+v
	6Xk+bvaomxBoZY1hNpZI+Td4M7nITDmAa7uKo5gR0HD0LH3Jm559tytFcTeqbAn/ulDYeV3hUOp
	u773b2egQHvFFHgyoRMGDyJz5M98bqqTWQxjE4YXi0cjBPgtJcZ4nllHeGy1LpJGu2MKiWvuS1g
	DPZ7E9T6Tg5xi/dQB9s79kdqZTrq092
X-Google-Smtp-Source: AGHT+IHOJd2yMjOuvduQDrM/vVBWLwo8Ai1fXnBpWAxM4uGTTC91XtW0KSczxIzgHhjbZqbPv+leNA==
X-Received: by 2002:a05:7301:fc0b:b0:2a4:3594:d552 with SMTP id 5a478bee46e88-2ac055763cbmr762068eec.31.1765329954963;
        Tue, 09 Dec 2025 17:25:54 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm47863265eec.3.2025.12.09.17.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:25:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] nasm: Fix build with musl+clang
Date: Tue,  9 Dec 2025 17:25:47 -0800
Message-ID: <20251210012547.1262043-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 01:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227452

Fixes `bool` related errors w.r.t. C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-compiler.h-Backport-C23-support.patch | 102 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_3.01.bb       |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch

diff --git a/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch b/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch
new file mode 100644
index 0000000000..946450f2e1
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch
@@ -0,0 +1,102 @@
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
+diff --git a/include/compiler.h b/include/compiler.h
+index 41c1cbf..df66880 100644
+--- a/include/compiler.h
++++ b/include/compiler.h
+@@ -181,23 +181,10 @@ size_t strlcpy(char *, const char *, size_t);
+ char * pure_func strrchrnul(const char *, int);
+ #endif
+ 
+-#if !defined(HAVE_STRLCAT) || !HAVE_DECL_STRLCAT
+-size_t strlcat(char *, const char *, size_t);
+-#endif
+-
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
+@@ -205,14 +192,10 @@ size_t strlcat(char *, const char *, size_t);
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
+@@ -325,11 +308,11 @@ static inline void *mempset(void *dst, int c, size_t n)
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
+@@ -486,4 +469,15 @@ static inline unsigned int watcom_switch_hack(uint64_t x)
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


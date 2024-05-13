Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D63C25B75
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 12:18:29 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.58757.1715602708919914292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 05:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RqABP6+Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ed835f3c3cso37544265ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715602708; x=1716207508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTsWvdcpwjQ2hC3R4U3yF5DLeemUW9e7p/z/pRWJVdc=;
        b=RqABP6+ZXPpn2yrjng1ikb0lD6RSEFyDKQSKm51oE6SaRxhodE45BU97VsB9NKckPS
         6EEvHgl6qNfTxb/lfNUuibxH5U2Ma2HrhUS+qTQ6So2cF8C6JSGMS4wyr6uK7LHv5Y6B
         A4lDiDG+ytn/mwdZFbCFT7c8TntQy9OiDbnYuJy/An0mMVjiHPkrtkz9j27jp3ov5Fx2
         o3Y+E6Py9A1GMBHOMhwmwq2W4W7KPndLTcN5+R0xoby9t0MKhFvh1unK/UijHWGiMKMe
         z7QHs/x9OQyEYLU7VINdGzMOekLhSfvegjACcCFEJH1C55v6/8YgqtsoGTXsekfdp2hC
         wSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715602708; x=1716207508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTsWvdcpwjQ2hC3R4U3yF5DLeemUW9e7p/z/pRWJVdc=;
        b=cwIGgo55bY/q7BJ1D0Hw1MCMmvvcEgngkqNSq6qvhd306slMtoHQvuLdTVg8Q4TD5U
         Wcsh2IjpOdhh6xgdJjM501nFjRMVD1FTxT6WyZSaGJKpzE/frs/5PXeokcCzKMpxuDHo
         aIuSPYAgXJxX2OpkIsr4zMgBDHOLKM4FHo02qAps2oDC53FJY1Vt7Y12SSM/kKunjI7T
         GbGc3F3Uomgu6Y5mZGFVbNYjwHRhbUskO67K+Kd8ZU8Mn4+QyJGH45BbPqcA2x8sISAv
         zxcKaNFx1uE7GExw+N/FY3dDGSGjPH2bnwiuqBlbSG21iGnmRDDVl5A9Owgo1/2DhHRl
         harw==
X-Gm-Message-State: AOJu0YxKn79hQni0tPEysVvi5O0RNpHr6tWjZ3veyuKFri957wENwAy5
	UmUVwtHI4iIYnH3Xe7uU8U8TaRS+gW6ZPBR0P/UDt/h3ZRRM0na2OUk4YTPARBJap8Wp5wk/w11
	1T5I=
X-Google-Smtp-Source: AGHT+IFJI23FHJpjj+G3jpaJ1nzGJeJv8hk/CBhQMZmEy8i4zO3tz9qALXyv9oXzFkAE1FgbTBuohA==
X-Received: by 2002:a17:902:ecc7:b0:1e8:c994:b55b with SMTP id d9443c01a7336-1ef43d15786mr140205995ad.7.1715602705579;
        Mon, 13 May 2024 05:18:25 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b85sm77599225ad.181.2024.05.13.05.18.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:18:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] glibc: Update to latest on stable 2.35 branch
Date: Mon, 13 May 2024 05:18:11 -0700
Message-Id: <10b57ae56e6205414a44531728f691fda59a16c7.1715602539.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715602539.git.steve@sakoman.com>
References: <cover.1715602539.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 12:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199238

From: Peter Marko <peter.marko@siemens.com>

Adresses CVEs: CVE-2024-33599, CVE-2024-33600, CVE-2024-33601, CVE-2024-33602

Changes:
54a666dc5c elf: Disable some subtests of ifuncmain1, ifuncmain5 for !PIE
3a38600cc7 malloc: Exit early on test failure in tst-realloc
924a98402a nscd: Use time_t for return type of addgetnetgrentX
396f065496 login: structs utmp, utmpx, lastlog _TIME_BITS independence (bug 30701)
77d8f49058 login: Check default sizes of structs utmp, utmpx, lastlog
8e7f0eba01 sparc: Remove 64 bit check on sparc32 wordsize (BZ 27574)
55771aba9d elf: Also compile dl-misc.os with $(rtld-early-cflags)
7a5864cac6 CVE-2024-33601, CVE-2024-33602: nscd: netgroup: Use two buffers in addgetnetgrentX (bug 31680)
bafadc589f CVE-2024-33600: nscd: Avoid null pointer crashes after notfound response (bug 31678)
4370bef52b CVE-2024-33600: nscd: Do not send missing not-found response in addgetnetgrentX (bug 31678)
7a95873543 CVE-2024-33599: nscd: Stack-based buffer overflow in netgroup cache (bug 31677)

Since glibc introduced file sysdeps/arm/bits/wordsize.h
our multilib patch needed to be updated.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 ...y-the-header-between-arm-and-aarch64.patch | 64 +++++++++++--------
 meta/recipes-core/glibc/glibc_2.35.bb         |  5 +-
 3 files changed, 41 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index cd8c7ecf94..1a8d51ef63 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "36280d1ce5e245aabefb877fe4d3c6cff95dabfa"
+SRCREV_glibc ?= "54a666dc5c94897dab63856ba264ab2c53503303"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 3b2d638b5f..789d2edf23 100644
--- a/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -11,16 +11,15 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/bits/wordsize.h          |  8 ++++++--
- sysdeps/{aarch64 => arm}/bits/wordsize.h | 10 +++++++---
- 2 files changed, 13 insertions(+), 5 deletions(-)
- copy sysdeps/{aarch64 => arm}/bits/wordsize.h (80%)
+ sysdeps/aarch64/bits/wordsize.h | 11 +++++++++--
+ sysdeps/arm/bits/wordsize.h     | 16 +++++++++++++++-
+ 2 files changed, 24 insertions(+), 3 deletions(-)
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
-index 4635431f0e..5ef0ed21f3 100644
+index 4635431f0e..1639bcb063 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/aarch64/bits/wordsize.h
-@@ -17,12 +17,16 @@
+@@ -17,12 +17,19 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
  
@@ -33,38 +32,47 @@ index 4635431f0e..5ef0ed21f3 100644
  # define __WORDSIZE32_SIZE_ULONG	1
  # define __WORDSIZE32_PTRDIFF_LONG	1
 +#else
-+# define __WORDSIZE			32
-+# define __WORDSIZE32_SIZE_ULONG	0
-+# define __WORDSIZE32_PTRDIFF_LONG	0
++#define __WORDSIZE			32
++#define __WORDSIZE_TIME64_COMPAT32	1
++#define __WORDSIZE32_SIZE_ULONG		0
++#define __WORDSIZE32_PTRDIFF_LONG	0
  #endif
  
++#ifdef __aarch64__
  #define __WORDSIZE_TIME64_COMPAT32	0
-diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
-similarity index 80%
-copy from sysdeps/aarch64/bits/wordsize.h
-copy to sysdeps/arm/bits/wordsize.h
-index 4635431f0e..34fcdef1f1 100644
---- a/sysdeps/aarch64/bits/wordsize.h
++#endif
+diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
+index 6ecbfe7c86..1639bcb063 100644
+--- a/sysdeps/arm/bits/wordsize.h
 +++ b/sysdeps/arm/bits/wordsize.h
-@@ -17,12 +17,16 @@
+@@ -1,4 +1,6 @@
+-/* Copyright (C) 1999-2024 Free Software Foundation, Inc.
++/* Determine the wordsize from the preprocessor defines.
++
++   Copyright (C) 2016-2022 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -15,7 +17,19 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
  
--#ifdef __LP64__
 +#if defined (__aarch64__) && defined (__LP64__)
- # define __WORDSIZE			64
--#else
++# define __WORDSIZE			64
 +#elif defined (__aarch64__)
- # define __WORDSIZE			32
- # define __WORDSIZE32_SIZE_ULONG	1
- # define __WORDSIZE32_PTRDIFF_LONG	1
-+#else
 +# define __WORDSIZE			32
-+# define __WORDSIZE32_SIZE_ULONG	0
-+# define __WORDSIZE32_PTRDIFF_LONG	0
- #endif
- 
- #define __WORDSIZE_TIME64_COMPAT32	0
++# define __WORDSIZE32_SIZE_ULONG	1
++# define __WORDSIZE32_PTRDIFF_LONG	1
++#else
+ #define __WORDSIZE			32
+ #define __WORDSIZE_TIME64_COMPAT32	1
+ #define __WORDSIZE32_SIZE_ULONG		0
+ #define __WORDSIZE32_PTRDIFF_LONG	0
++#endif
++
++#ifdef __aarch64__
++#define __WORDSIZE_TIME64_COMPAT32	0
++#endif
 -- 
 2.34.1
 
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 74d7f753d8..9400e1e920 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -24,7 +24,10 @@ CVE_CHECK_IGNORE += "CVE-2019-1010025"
 CVE_CHECK_IGNORE += "CVE-2023-4527"
 
 # To avoid these in cve-check reports since the recipe version did not change
-CVE_CHECK_IGNORE += "CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156 CVE-2024-2961"
+CVE_CHECK_IGNORE += " \
+    CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156 \
+    CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 \
+"
 
 DEPENDS += "gperf-native bison-native"
 
-- 
2.34.1



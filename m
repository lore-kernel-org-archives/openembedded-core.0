Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F52C4345F
	for <webhook@archiver.kernel.org>; Sat,  4 May 2024 19:06:19 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.4438.1714849569404523994
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 May 2024 12:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=a8qM0IOd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202405041906076b80d14957111fc148-g81vk3@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202405041906076b80d14957111fc148
        for <openembedded-core@lists.openembedded.org>;
        Sat, 04 May 2024 21:06:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MIyXWTr2s1ZHmfvcKdIBvb8w+wIDPu5iIJTMUHYw7os=;
 b=a8qM0IOdj1ew6t4Dxk54poj6idh/YwCIubjENFWrx1L+2tKJh0QUyZtK6Aj2DxZJ53djyH
 p+W8SuTozZ1SI9UWTGl/FnUGz/DX7mzbFoOGjZ1xeTC5ZRD8EkPHwuZtHE/Zfx63KbmbgBuE
 pIMq8RChAYb8TbWg5Ep6grUefIDjI=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glibc: Update to latest on stable 2.35 branch
Date: Sat,  4 May 2024 21:05:17 +0200
Message-Id: <20240504190517.3245357-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 May 2024 19:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199015

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
2.30.2



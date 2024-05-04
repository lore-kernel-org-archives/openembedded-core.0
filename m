Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD316C4345F
	for <webhook@archiver.kernel.org>; Sat,  4 May 2024 19:04:39 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.4368.1714849469857187351
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 May 2024 12:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OxHrQD6F;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20240504190426d44a920b911cee4ba4-ha5wyz@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20240504190426d44a920b911cee4ba4
        for <openembedded-core@lists.openembedded.org>;
        Sat, 04 May 2024 21:04:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6fIm1/7xpouRkl+KfvYegjsCjcdfZsnvCN5wkn6hpxs=;
 b=OxHrQD6FlK/lXQt5fqMUxgcLMeu/ly8dxU+EjPKiQBGHbfdNqBVEHUPCUGZwa7c5aJmu9V
 ZiMlMTITVD6djkLV99NLvMw+rJrQWSBJjKYBKmDdhRVrkuuJxhKze4ERXFiUENEtMvFMPTyy
 fCf/Es2ceErUTiJ+QddKyOvx/aJn8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][scarthgap][PATCH] glibc: Update to latest on stable 2.39 branch
Date: Sat,  4 May 2024 21:03:34 +0200
Message-Id: <20240504190334.3245119-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 May 2024 19:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199014

From: Peter Marko <peter.marko@siemens.com>

Adresses CVEs: CVE-2024-33599, CVE-2024-33600, CVE-2024-33601, CVE-2024-33602

Changes:
273a835fe7 time: Allow later version licensing.
acc56074b0 nscd: Use time_t for return type of addgetnetgrentX
836d43b989 login: structs utmp, utmpx, lastlog _TIME_BITS independence (bug 30701)
9831f98c26 login: Check default sizes of structs utmp, utmpx, lastlog
fd658f026f elf: Also compile dl-misc.os with $(rtld-early-cflags)
a9a8d3eebb CVE-2024-33601, CVE-2024-33602: nscd: netgroup: Use two buffers in addgetnetgrentX (bug 31680)
c99f886de5 CVE-2024-33600: nscd: Avoid null pointer crashes after notfound response (bug 31678)
5a508e0b50 CVE-2024-33600: nscd: Do not send missing not-found response in addgetnetgrentX (bug 31678)
1263d583d2 CVE-2024-33599: nscd: Stack-based buffer overflow in netgroup cache (bug 31677)
2f8f157eb0 x86: Define MINIMUM_X86_ISA_LEVEL in config.h [BZ #31676]
e701c7d761 i386: ulp update for SSE2 --disable-multi-arch configurations
e828914cf9 nptl: Fix tst-cancel30 on kernels without ppoll_time64 support

Since glibc introduced file sysdeps/arm/bits/wordsize.h
our multilib patch needed to be updated.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 ...y-the-header-between-arm-and-aarch64.patch | 47 +++++++++++++++----
 meta/recipes-core/glibc/glibc_2.39.bb         |  2 +-
 3 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 4fc6986ffc..1e4a323d64 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "31da30f23cddd36db29d5b6a1c7619361b271fb4"
+SRCREV_glibc ?= "273a835fe7c685cc54266bb8b502787bad5e9bae"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 066c3b1ea2..9bdfa76318 100644
--- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -11,16 +11,15 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/bits/wordsize.h | 8 ++++++--
- sysdeps/arm/bits/wordsize.h     | 1 +
- 2 files changed, 7 insertions(+), 2 deletions(-)
- create mode 120000 sysdeps/arm/bits/wordsize.h
+ sysdeps/aarch64/bits/wordsize.h | 11 +++++++++--
+ sysdeps/arm/bits/wordsize.h     | 22 +---------------------
+ 2 files changed, 10 insertions(+), 23 deletions(-)
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
-index 118e59172d..b4b0692eb5 100644
+index 118e59172d..ff86359fe8 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/aarch64/bits/wordsize.h
-@@ -17,12 +17,16 @@
+@@ -17,12 +17,19 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
  
@@ -33,12 +32,42 @@ index 118e59172d..b4b0692eb5 100644
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
++#endif
+diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
+deleted file mode 100644
+index 6ecbfe7c86..0000000000
+--- a/sysdeps/arm/bits/wordsize.h
++++ /dev/null
+@@ -1,21 +0,0 @@
+-/* Copyright (C) 1999-2024 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <https://www.gnu.org/licenses/>.  */
+-
+-#define __WORDSIZE			32
+-#define __WORDSIZE_TIME64_COMPAT32	1
+-#define __WORDSIZE32_SIZE_ULONG		0
+-#define __WORDSIZE32_PTRDIFF_LONG	0
 diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
 new file mode 120000
 index 0000000000..4c4a788ec2
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 988e43c014..2484ae1cd9 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"
-- 
2.30.2



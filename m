Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3830CC25B7A
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:56 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.61053.1716212027274502582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vyRANfpe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f4603237e0so1658130b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212026; x=1716816826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPqMadNSlhUCEFvo+JZgka2v+Hib/gWDAWto1GLFa3U=;
        b=vyRANfpeeVlEsKOYngWyNq0Z6Lyr5oCDOvECtjWTdXbCyHloZzGuRaAj8gPW/R2EmB
         37pdmPhwsSYWcdL0JDw7Weg00wtrWD+fIkUMR1h58UvGIDiRgqRAYSdXE0eyRVqq9tWU
         +vCf2hiLNDa6ejQyhpwznXKE9vOC2QFjRruPb785x99DnOwpLMP4aYiX2yG6IOWHIPtE
         J/sjLVkMZyzeAamVcMY+Vpjz9dPAjinUxBnzz4ACPy7TL1VCz1Bq6v4H4aqGLy/BAcZ9
         7KloK6kQGrW2uVxsV9qCAEmIKkv+d87mujBl3hSWAfYAq6Y2kDkM/vkQJvnZL8wi3klZ
         MfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212026; x=1716816826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPqMadNSlhUCEFvo+JZgka2v+Hib/gWDAWto1GLFa3U=;
        b=QlqD9AaPAHwxE1mWmHruXdsvlFXk9jrFW3YCmtuSTgFnMwFSwbt/jZUq4pU1Nc156L
         0LB7ZuwXsm9m+hsFxIsZA4R3hQvLVePuOUY3OR1C3aHFLHM9mRl6dtPuxJCoSCl+0Dpa
         giNUeoj3pP/EDPyoNlxRUm6+RMjj8YYNQoajvxTO2fmib2nuOE71mECPErruexaaL7SX
         T6Co3s2dZwV4hrx3nV7rmpRBcLiVMoumuI5lNt6uus9IqiP6akqHepWu8XFioUlHQn51
         ppWv+LRUeu7jwbYgETvcF+dB98zl2OQsv2GkT75vJKtDenWPKZdpUtWPM+uBdj0BjdtW
         1WoQ==
X-Gm-Message-State: AOJu0Yw0vwaECB3Pq80tRRcRcAPBdADSsFZpPJnRGSaeNxTOlfTqyOG1
	lPq/sR2A2GLd1A42eVcPJ2cG4UkKSXDgz5O2pc4q8lwQX64454/xtQGIfVztBjh8Qh0uKPvOZGw
	F
X-Google-Smtp-Source: AGHT+IETd9XYnD36/SC/6+9VAl1ycbcEclKu1+svWVgqR0g4vbJ5Ptf21cp1WgsrKLMBZS/7C+74aQ==
X-Received: by 2002:a05:6a00:3b05:b0:6f4:463f:af87 with SMTP id d2e1a72fcca58-6f69fbe02bfmr7442958b3a.10.1716212026433;
        Mon, 20 May 2024 06:33:46 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/21] glibc: Update to latest on stable 2.39 branch
Date: Mon, 20 May 2024 06:33:17 -0700
Message-Id: <a8b1034d978e745951d5f690c89b9fca4e01e72e.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199577

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1



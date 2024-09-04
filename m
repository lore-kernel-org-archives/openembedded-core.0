Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D091CD4846
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 03:18:05 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.41927.1725419883445370650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 20:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IaUwY7VE;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7143165f23fso4841383b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 20:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725419882; x=1726024682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hpq8Byk3JAqM0K6I0uYqYVzwzx5ly/mWwqON2nnrgag=;
        b=IaUwY7VEIiS+5zqmwMHDy0lClW1gg1k/dt650cmPj4g4BPQ+hlQG50G1/3FGs1ReBc
         zwTne8PNf6mVmA19w9gXjRHfCSo+sw+R8LOKjLaTD3ve2+sGHapVV0fG0X5A1YRiEaK/
         jfuQWpueFCyVFMbQCW10GvNG8UfvEN02XzVcclLoNiPTT6jmpJzOeJnNMrXWnKifPOBg
         2jYHfKgMWznx6c/9TliTsxajAert6aCS+TuUCc+cf/idGuibk4I0XTW/Nm6asYNBxrOK
         /YwOe1Zhr1SZND/yEd72zx0KRMBoNGbW9EQa4B4vYUDV0nDMUu35vzp9pl21pqgfpcEx
         2itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725419882; x=1726024682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hpq8Byk3JAqM0K6I0uYqYVzwzx5ly/mWwqON2nnrgag=;
        b=V1o+4CbnYykjHnXFXfoYGwZpvwtUeRsOkiYrXQG1MdOQIO/Lp1f0hS/hu5L7/bBDsR
         De0YqV5ITzeuenYjAr8ESwPB2bpcUXM7gT9BfxFrIRUMW1xZq7SF4kLQXpC126OhqDy3
         H2Pj0RjlNcgOgQiBxvXLliALVsL/rZH6CtxUeH2BPE5VJRRW9QNSV7nwes/sZBkwON09
         +GxW4bvshjuXOUdr42iZjo4to2GVIn3rRTNUcWgLhorw6l30vJbcVhgBKv4USCfdO97M
         YiyhDOK0qek1eweD4unNUXIalt5z7Z5vG3VmVXvzhH0oELakcpkZfVwgXzkFyd0lRVgu
         i8tw==
X-Gm-Message-State: AOJu0YwLsSRJy++ZOXunYMDxXdcfu2TrAyb3Smkm109dvhYZnZbCxVFn
	rgEA7RHrMtuABRA4ohniv/vTqGzQdBFttLTA0+gbkArhgCfdizXndnbYL9VR
X-Google-Smtp-Source: AGHT+IHanTbTVAiocKa8slBMIl8oadCG/B5KdnxRUDzVmyknvFxq5Wu/6Mlxc//2VWSWOrInPvAepA==
X-Received: by 2002:a05:6a00:1ac6:b0:714:28eb:ff5d with SMTP id d2e1a72fcca58-7173c1f51e9mr10700427b3a.8.1725419882478;
        Tue, 03 Sep 2024 20:18:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778520e66sm596619b3a.21.2024.09.03.20.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 20:18:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Maohui Lei <leimaohui@fujitsu.com>
Subject: [RFT][PATCH] glibc: Fix the arm/arm64 worsize.h uniificationb patch
Date: Tue,  3 Sep 2024 20:17:59 -0700
Message-ID: <20240904031759.1891128-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 03:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204184

The symlink got mangled during the 2.40 upgrade

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Maohui Lei <leimaohui@fujitsu.com>
---
 ...y-the-header-between-arm-and-aarch64.patch | 50 +++++++++++++++++--
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index d269b6f0af6..87bc7a840ec 100644
--- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,4 +1,4 @@
-From 3be9d4a66f83a64b26ffa0869385e4a0f623dd44 Mon Sep 17 00:00:00 2001
+From 4dd93c44d85ad04343daa9933edfb6ae59863095 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
 Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
@@ -11,14 +11,16 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/bits/wordsize.h | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
+ sysdeps/aarch64/bits/wordsize.h | 11 +++++++++--
+ sysdeps/arm/bits/wordsize.h     | 22 +---------------------
+ 2 files changed, 10 insertions(+), 23 deletions(-)
+ mode change 100644 => 120000 sysdeps/arm/bits/wordsize.h
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
-index 118e59172d..b4b0692eb5 100644
+index 118e59172d..c6278c6afa 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/aarch64/bits/wordsize.h
-@@ -17,12 +17,16 @@
+@@ -17,12 +17,19 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
  
@@ -32,8 +34,46 @@ index 118e59172d..b4b0692eb5 100644
  # define __WORDSIZE32_PTRDIFF_LONG	1
 +#else
 +# define __WORDSIZE			32
++# define __WORDSIZE_TIME64_COMPAT32	1
 +# define __WORDSIZE32_SIZE_ULONG	0
 +# define __WORDSIZE32_PTRDIFF_LONG	0
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
+diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
+new file mode 120000
+index 0000000000..4c4a788ec2
+--- /dev/null
++++ b/sysdeps/arm/bits/wordsize.h
+@@ -0,0 +1 @@
++../../aarch64/bits/wordsize.h
+\ No newline at end of file


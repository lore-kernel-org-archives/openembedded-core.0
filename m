Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D6DC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.4638.1642588900814776416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AD+gx3lY;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so5074095wme.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r1Xan9kqAsF+1p4om9lj0XonOpcVJu2mCmE40wSh57M=;
        b=AD+gx3lY1r6AQmqLH/RLCmLxk6dr0/MoSctWVi27iJt8yRpjkhXlqj/ZdyojH02IwQ
         kmtEjx55HOkmvrDa4pyXW8ZWcn0eE0V8+Ivx/TbjZoUsZbJyzJvszgtkvfF3nWDDpaic
         NAQ1TrXxSvFCK+Ob+NVs39d/gn8uGjb7OylvuToRMX+GhzQaEqWxds2nMorCTq9F7bPj
         K/B0uV9/kjKrFwd4VFJ1sJsoXlc8vmRS8ZyW8IVh6lsM6BOBosd31e/YmxHZIqZz37pv
         8mFtzFvdA0Eh5YsYzP5rl9MyL/kZteG3sYMfpNlFESNPXVpLDMXANjFMnJAMlApsuNsS
         Tvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r1Xan9kqAsF+1p4om9lj0XonOpcVJu2mCmE40wSh57M=;
        b=rmCV0rucWsipMSK6kycGnWxz+G+E9wd/U6k4FpkDBXBHCJqb0Iqe2N7yXAeF06h2Mi
         kgzJOgGxteQzR8el38BrHHFiY8Ejpl436iXpxtSE7ECPnkejh/FeZihCsDA4dsFAPjAY
         TuLzJFt4z/Vf3qMWURmOY6QdTjZ0SI9vDtRngIGM7pkLNStYuKZqJugQHsSRAkhpo7M+
         M5jCQQ9hfg1gNcztGYGzsPQf4MTnu2rNTHUbwCWje3p3vkTZp7Ib9oNcWs5BVuUg6pU7
         D8VkQAvz/TukvVAFxG93MZ5qyxh+YstujX1MOoPTzXN4BWwdm47GnJw7ycTysV761wWK
         gzAQ==
X-Gm-Message-State: AOAM5313uPSe3hzGav2L/DBV/r8LDcPLPT23BqvnvV4mJbzfx26Pkiu+
	36YizhDh/QVuD7KBzRm4ZUzm6/1iCc4=
X-Google-Smtp-Source: 
 ABdhPJxGThGY4UYmhcVGhlCACK4238kQkAmvrVcgzVq0nlYs+frguDs4KekMCoMRHPvvhw2x/HZ3EA==
X-Received: by 2002:a5d:54ca:: with SMTP id x10mr6413993wrv.557.1642588899417;
        Wed, 19 Jan 2022 02:41:39 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 19/39] btrfs-tools: upgrade 5.15.1 -> 5.16
Date: Wed, 19 Jan 2022 11:40:57 +0100
Message-Id: <20220119104117.2120127-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160710

From: Alexander Kanavin <alex.kanavin@gmail.com>

Replace a patch with an upstream fix.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ude-linux-const.h-to-fix-build-with-.patch | 42 -----------------
 ...e12c4d4b8b4ef335cdf4ddefcbdcd1b70d58.patch | 45 +++++++++++++++++++
 ...fs-tools_5.15.1.bb => btrfs-tools_5.16.bb} |  4 +-
 3 files changed, 47 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.15.1.bb => btrfs-tools_5.16.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
deleted file mode 100644
index be942388a5..0000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3d19b0fb882c5e195362a9f0909c474e60070ca0 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Fri, 18 Jun 2021 11:10:36 -0400
-Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
- headers
-
-btrfs-tools compile fails with mips, musl and 5.12+ headers.
-
-The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
-add an explicit include of const.h to pickup the macro:
-
-  | make: *** [Makefile:595: mkfs.btrfs] Error 1
-  | make: *** Waiting for unfinished jobs....
-  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
-  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
-  | collect2: error: ld returned 1 exit status
-
-This is safe for older kernel's as well, since the header still
-exists, and is valid to include.
-
-Upstream-Status: Inappropriate [mips64 + musl + libc-headers]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- kerncompat.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index df167fe6..254235bd 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -30,6 +30,7 @@
- #include <linux/types.h>
- #include <linux/kernel.h>
- #include <stdint.h>
-+#include <linux/const.h>
- 
- #include <features.h>
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58.patch
new file mode 100644
index 0000000000..6bf5f4314e
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58.patch
@@ -0,0 +1,45 @@
+From b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58 Mon Sep 17 00:00:00 2001
+From: David Sterba <dsterba@suse.com>
+Date: Thu, 13 Jan 2022 14:47:08 +0100
+Subject: [PATCH] btrfs-progs: kerncompat: add local definition for alignment
+ macros
+
+There's still problem left with compilation on musl and kernel < 5.11,
+because __ALIGN_KERNEL is not defined anymore:
+
+../bin/ld: kernel-shared/volumes.o: in function `create_chunk':
+volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'
+
+Due to the entangled includes and unconditional definition of
+__ALIGN_KERNEL, we can't use #ifdef in kerncompat.h to define it
+eventually (as kerncompat.h is the first include). Instead add local
+definitions of the macros and rename them to avoid name clashes.
+
+Pull-request: #433
+Signed-off-by: David Sterba <dsterba@suse.com>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ kerncompat.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/kerncompat.h b/kerncompat.h
+index 6ca1526e2..f0a6e196e 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -359,7 +359,14 @@ do {					\
+ 
+ /* Alignment check */
+ #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
+-#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
++
++/*
++ * Alignment, copied and renamed from /usr/include/linux/const.h to work around
++ * issues caused by moving the definition in 5.12
++ */
++#define __ALIGN_KERNEL__(x, a)		__ALIGN_KERNEL_MASK__(x, (typeof(x))(a) - 1)
++#define __ALIGN_KERNEL_MASK__(x, mask)	(((x) + (mask)) & ~(mask))
++#define ALIGN(x, a)		__ALIGN_KERNEL__((x), (a))
+ 
+ static inline int is_power_of_2(unsigned long n)
+ {
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
index 3cf216724e..c6867c158f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
@@ -17,9 +17,9 @@ DEPENDS = "lzo util-linux zlib"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
+           file://b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58.patch \
            "
-SRCREV = "c0ad9bde429196db7e8710ea1abfab7a2bca2e43"
+SRCREV = "8ad326b2f28c044cb6ed9016d7c3285e23b673c8"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.20.1



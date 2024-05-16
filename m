Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA15FC25B7C
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:27:07 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.11216.1715858821341255383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iBsdhXcj;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59a387fbc9so332849166b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858820; x=1716463620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEoBuDt/Ic/qJgdlcmlSXw8b+Rheum4J8ncS5btfDmQ=;
        b=iBsdhXcjO7+WS0L6IVExPjdSwWgX681UmzUFoBcjXTsmxraMNqV+ZiM5q7IxzfnSeY
         2Hb50cYAdVcN5qwjjfmfMZx1OgUPKa5ABPFoJGpOR2/hM101bZE56IOoBW+dAJDkd54D
         pPQ4Pf79zf58QyMzC2tuFm6z7WRop7O9hVFL8/NQ2L818pzIsWBw1CpJBK3V556Uhm4O
         UInzGgRhC4ufZcF1es62n7+GQh2xL1rR37tdu7pVlMp+u4tkkiPK8p+YWzkmQP4nQy/J
         ffKDnYuqkczP+cc1pI6A/2EfMBhh5HJx9P9iK73xBqfxNCLbzCOCub1SsGuBlPqtRAu3
         iJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858820; x=1716463620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEoBuDt/Ic/qJgdlcmlSXw8b+Rheum4J8ncS5btfDmQ=;
        b=ESOnvHzZVHXJgiyJPxcN6OHDwshCXB808M93SELnxGrLiXIhgwaa2FhzYJk4FMRmb1
         WiqSz1mbqg1xg+73d0m+ybm/aaV+3vgyFSXJRpBsJBkklgv1JMsCvYg+H+2zprguG31/
         LM/hLNa/9geDKX0QvF7UDqej46MkjMsCetET7XHPYZEAzUXHL1AsiUbuKIhCJX32ScL+
         gjLgTtrk9kJZhx5DkK+c8xPvGK03EWdBfNUZXrwPAR6XaBuXah3FFfemAyoZ9H6cRLax
         7DAiWlZ67sSUAOgaLvkj0DPWP0cNV18QVkUVb/rDIPHZu/UL9qIUY9UGOdOBL3Gd4KNX
         Pcxg==
X-Gm-Message-State: AOJu0YzddAw04TBDcwiVK0030IHzE/0OQADPVreRHIrw2ee7jew7uE5D
	3S7spcGLgDBiIgiX8wt5eMAAo7dweECCrNCOoU0CycBjkMTZ1ge4pl8iXA==
X-Google-Smtp-Source: AGHT+IHeBIQsnGytXU76LvnZNd8mULLse8fbPddBOV9c/jLi/07Eof3O5IJWf8TlvbpDKTNl35U58w==
X-Received: by 2002:a17:906:b79a:b0:a59:aa69:9790 with SMTP id a640c23a62f3a-a5a2d54c87fmr1161498966b.8.1715858819761;
        Thu, 16 May 2024 04:26:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/13] x264: update to latest revision on official git
Date: Thu, 16 May 2024 13:26:39 +0200
Message-Id: <20240516112640.2145789-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199479

From: Alexander Kanavin <alex@linutronix.de>

The mirror was out of date; meanwhile x264 remains in active development.

Drop unsuitable x32 patch and declare x264 incompatible with the target
(by every sign it's an extinct target; if not so please work with upstream
to develop a solution there).

Replace don-t-default-to-cortex-a9-with-neon.patch with a configure
option passing in target compiler options so that configure can make
correct decisions and we don't have to patch it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../x264/Fix-X32-build-by-disabling-asm.patch | 51 -------------------
 ...don-t-default-to-cortex-a9-with-neon.patch | 33 ------------
 meta/recipes-multimedia/x264/x264_git.bb      |  9 ++--
 3 files changed, 5 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
 delete mode 100644 meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch

diff --git a/meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch b/meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
deleted file mode 100644
index cb771fb0bf8..00000000000
--- a/meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 7bc25f4d1aaa5186d2eff3e2326c7245fcd7e7f3 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Tue, 13 Dec 2016 14:22:32 -0700
-Subject: [PATCH] Fix X32 build by disabling asm
-
-This applies gentoo's x32 patch, adjusted slightly, which disables asm support
-for x32 as well as correcting -m.
-
-Debian has a different patch which does the same, and there's a superior yet
-out of date patch series on the x264 list which keeps asm support enabled, but
-doesn't successfully build at this time, and my assembly is very rusty.
-
-Upstream-Status: Pending
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
----
- configure | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 51b128d..6ea9469 100755
---- a/configure
-+++ b/configure
-@@ -754,7 +754,13 @@ case $host_cpu in
-         AS_EXT=".asm"
-         ASFLAGS="$ASFLAGS -DARCH_X86_64=1 -I\$(SRCPATH)/common/x86/"
-         stack_alignment=16
--        [ $compiler = GNU ] && CFLAGS="-m64 $CFLAGS" && LDFLAGS="-m64 $LDFLAGS"
-+        if [ $compiler = GNU ]; then
-+            if cpp_check "" "" "__ILP32__" ; then
-+                CFLAGS="-mx32 $CFLAGS" && LDFLAGS="-mx32 $LDFLAGS"
-+            else
-+                CFLAGS="-m64 $CFLAGS" && LDFLAGS="-m64 $LDFLAGS"
-+            fi
-+        fi
-         if [ "$SYS" = MACOSX ]; then
-             ASFLAGS="$ASFLAGS -f macho64 -DPREFIX"
-             if cc_check '' "-arch x86_64"; then
-@@ -773,7 +779,11 @@ case $host_cpu in
-                 RCFLAGS="--target=pe-x86-64 $RCFLAGS"
-             fi
-         else
--            ASFLAGS="$ASFLAGS -f elf64"
-+            if cpp_check "" "" "__ILP32__" ; then
-+                asm=no
-+            else
-+                ASFLAGS="$ASFLAGS -f elf64"
-+            fi
-         fi
-         ;;
-     powerpc*)
diff --git a/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch b/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
deleted file mode 100644
index 065e3b35b7c..00000000000
--- a/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a72bf499a0674fc75eedf15008b424e28f67e4bd Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei@gherzan.ro>
-Date: Fri, 2 Feb 2018 15:10:08 +0200
-Subject: [PATCH] dont default to cortex-a9 with neon
-
--march flag is not in CFLAGS so this will always default to
- -mcpu=cortex-a8 -mfpu=neon.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- configure | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/configure b/configure
-index 0e3ef23..955b993 100755
---- a/configure
-+++ b/configure
-@@ -911,9 +911,6 @@ if [ $asm = auto -a \( $ARCH = X86 -o $ARCH = X86_64 \) ] ; then
- fi
- 
- if [ $asm = auto -a $ARCH = ARM ] ; then
--    # set flags so neon is built by default
--    [ $compiler == CL ] || echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu)' || CFLAGS="$CFLAGS -mcpu=cortex-a8 -mfpu=neon"
--
-     cc_check '' '' '__asm__("add r0, r1, r2");' && define HAVE_ARM_INLINE_ASM
-     if [ $compiler = CL ] && cpp_check '' '' 'defined(_M_ARM) && _M_ARM >= 7' ; then
-         define HAVE_ARMV6
--- 
-2.4.0
-
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index e7d9e75e8de..fae88d24d13 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -8,13 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "nasm-native"
 
-SRC_URI = "git://github.com/mirror/x264;branch=stable;protocol=https \
-           file://don-t-default-to-cortex-a9-with-neon.patch \
-           file://Fix-X32-build-by-disabling-asm.patch \
+SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=stable;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "baee400fa9ced6f5481a728138fed6e867b0ff7f"
+SRCREV = "31e19f92f00c7003fa115047ce50978bc98c3a0d"
 
 PV = "r3039+git"
 
@@ -41,6 +39,7 @@ EXTRA_OECONF = '--prefix=${prefix} \
                 --disable-opencl \
                 --enable-pic \
                 ${X264_DISABLE_ASM} \
+                --extra-cflags="${TUNE_CCARGS}" \
                '
 
 do_configure() {
@@ -54,3 +53,5 @@ do_install() {
 }
 
 AS[unexport] = "1"
+
+COMPATIBLE_HOST:x86-x32 = "null"
-- 
2.39.2



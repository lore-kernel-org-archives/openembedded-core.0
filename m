Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74006C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 06:32:10 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.69823.1747117926749004848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 23:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k8eLAypO;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2317d94c9cdso4453025ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 23:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747117926; x=1747722726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eN0BetYTDypJ1IudgQtYvYluRA+Kx9M6sqiV+X5hVqs=;
        b=k8eLAypO5P7VYRM3XPm2hOfnz4h4TWlIWLArBpEQskUzLuhDIlxuTesNjSvm6g8/2H
         w8J+FgPQTAqsl3c/Y7mfYx1lX/dhpcCe23LgL5MNYNg9yMECmZjsbs/36VRlnhgxyRiU
         ilgU7dg4dqHLgxuxjiQkArLATK02FiSFTxEifvG94FAQBWc1u4RXoTd/OPO0P3CqS89r
         9ZScvIGU26Cf5fkIVBsHkIEW3XafODoYPq2P1etkRXIAvgHanM4PKFPr8u9/l5pR9EAQ
         f3nQYfgSfuozlhbHJDoOSxYvqsVSnWrm/nQi9TQvO+xOJMwuLR2BE3Rqmb8kW3lauItE
         9B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747117926; x=1747722726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eN0BetYTDypJ1IudgQtYvYluRA+Kx9M6sqiV+X5hVqs=;
        b=skZpiAt6J2gj7ziiuIYcj2TyIwDo47fY8uGanjxEVGjhhYEZ47V8zuJsXXZGvt/60P
         gK+UWehyAsc6tb7aglRG3oeADdeUvL4cUYd34VX51lPSfoMTQiL5Fi1lnt9hUj63xUa/
         RWrdUe1q8uuBGrFZ2gnOXIMum3RS972sHpe1aqKM6n6YPXTtba7x/dbMKCrbFH0reDj0
         6++QDb/s3nAfQGmI3BpYExslYwl2JkcyopaVsd4RreBmEVOztUCI8hIoHuJWsxUPy7D/
         ye8aR/BNHVqOql9VBwWNR4JCofnn7hSeQe9bqnUkzqmlbVVdmGz5BpkgIpkEQKe/HGdK
         0acQ==
X-Gm-Message-State: AOJu0YwYGMWmBQUvIo1i84aRCZTGS5S90JRXL28l8XFPjR33JhNtA6qr
	+FrgfsDGgRfjVr8gg/5N4iwi0ik/mZo4YaP21X3Gt2R2sAOs5CVOTOU9PadP
X-Gm-Gg: ASbGnct9U3QMdGeWR6tT/NPC9SUG9d6LR5ENcm4ivScAAcE2+RIPaXkH27GMkRbvo5j
	WMPpjuI8vZeH667x7BGuUbKjyoAKFEO4H8LBnZVork3YpaTMlHWxS80IMZyRHOxX4KtvsAGkDwm
	vifX65vcN/gri0GHh5xSXaYHyUTZM90DpMFGpY7nuRoPEZDz79GXIijtp9d7DU+EL0NZA2Ki/nj
	Ryxl9GmQynQPhPzdnjGtVKj3V3jNJPo+Osvcl3STO5UZkcuKFxYv30xX8Iq0Z1YVTZR7m80idS0
	DEYNozBXA9no/ID+btVHRMF2D9FlYizX/ovsVf1WuqY=
X-Google-Smtp-Source: AGHT+IGF8P4bGs8by0k3rNCeHVcr76QWOnfAb3W1szTL4E6PVbeQaiakhL6WtV0H8+o1nDoqq7BQIA==
X-Received: by 2002:a17:902:e88d:b0:210:fce4:11ec with SMTP id d9443c01a7336-22fc8b1b0f5mr226035515ad.1.1747117925817;
        Mon, 12 May 2025 23:32:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b42dsm73098245ad.188.2025.05.12.23.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:32:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] compiler-rt-sanitizers: Fix native builds on aarch64 build hosts
Date: Mon, 12 May 2025 23:32:03 -0700
Message-ID: <20250513063203.2101399-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 06:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216397

Add logic to deduce compiler-rt target architecture based on tune
features

Cleanup the cmake options for native/nativesdk/target recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clang/compiler-rt-sanitizers_git.bb         | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index bb3c8aa20a4..f8e7bb13d2b 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -14,6 +14,14 @@ BPN = "compiler-rt-sanitizers"
 
 inherit cmake pkgconfig python3native
 
+def get_compiler_rt_arch(bb, d):
+    if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True, False, d):
+        return 'armv5te'
+    elif bb.utils.contains('TUNE_FEATURES', 'armv4 thumb', True, False, d):
+        return 'armv4t'
+    elif bb.utils.contains('TUNE_FEATURES', 'arm vfp callconvention-hard', True, False, d):
+        return 'armhf'
+    return d.getVar('HOST_ARCH')
 
 LIC_FILES_CHKSUM = "file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a"
 
@@ -56,6 +64,7 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
                   -DCOMPILER_RT_BUILD_LIBFUZZER=ON \
                   -DCOMPILER_RT_BUILD_PROFILE=ON \
                   -DCOMPILER_RT_BUILD_MEMPROF=ON \
+                  -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${@get_compiler_rt_arch(bb, d)} \
                   -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=OFF \
@@ -64,16 +73,13 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
 
 EXTRA_OECMAKE:append:class-native = "\
                -DCOMPILER_RT_USE_BUILTINS_LIBRARY=OFF \
-               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS} \
-               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
-               -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
 "
 
 EXTRA_OECMAKE:append:class-target = "\
                -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
                -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
                -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
-               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS} \
+               -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
                -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 "
@@ -84,12 +90,11 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
                -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
-               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS} \
+               -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
 "
 
 EXTRA_OECMAKE:append:libc-musl = " -DLIBCXX_HAS_MUSL_LIBC=ON "
-EXTRA_OECMAKE:append:powerpc = " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=powerpc "
 
 do_install:append () {
     mkdir -p ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib


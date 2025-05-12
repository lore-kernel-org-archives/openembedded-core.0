Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD02C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 04:11:00 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.42590.1747023051081905132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 21:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I6Ijsu6o;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30ac268a8e0so3747006a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 21:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747023050; x=1747627850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c6BdTLtptNrPoHYjW92hC8O6F3RRBxo6XrWXYdCBp0I=;
        b=I6Ijsu6oP9cNjaFnPeLN2p+7Mr5yTgk8tSrS6O5iDf8lLwU99/aVhI/bgOQ4o78WzZ
         WXPt82H7pBZHrAfn4+BE8gPCuyiHgKzox/6NzwtTyEY69i0IC572VbuLxP2Psry3DkPy
         9f0tU8YQ+NPr1Nsg5tkTi9XGMc3FWEoCMoWUdpw0LSf5684Iyb2+7tOk154vbKZkeu4/
         ZXFrWKpCMUmESU4yZ4BMnSdhlueQ2f6hkHto5DpNZEOaH1j/uTvVfdViZUhWnvyp+bHh
         9SD8bKkRGbEZSdwJt5nHMY69UdfP1VhTBuNI7UqC2mIFI9NeslBPwga4NKrdzYvr51BN
         fy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747023050; x=1747627850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6BdTLtptNrPoHYjW92hC8O6F3RRBxo6XrWXYdCBp0I=;
        b=CQo9jbYqQ1+eq2QSZ84XOfAqBB96vZFP5fQNwr4HCnaSO8jOKltAl007RojsyK3+nL
         AwdaLXkWo+fKszLcr3/WupcLwex8sEy6Z5svEOnq09hJTUkpFf1KprjURDGVg+EHLRIb
         cnwZfQtdili7WP9uK7WvRFbDuS7sH6ISr3f+Efyu9Rjmdmnim3ANojgZBslTGzYgKf93
         Q5pcwpJkegzXiyF3QrZjuuRlIB4r4TmiyySjkRt3GcaIox5V2Eew99c2LsKLTzRiNwLb
         HHa5CLttqwCgcEGngjEQpSHgyyeDMDx1F+RHqXxSIcGjlBldWBkEL1pnDVD9daqHhEq1
         mPfA==
X-Gm-Message-State: AOJu0YzeE/bSxze7Y+ZcV2mvKtcqXEEjsiOlRG79zS+xzOsXWQzNzl8G
	Rn6QtGI+1/Xjo4aFzfuYau7Xd4R1kjZsLwmHgMojEOy969vWP5B8B+9BsvmY
X-Gm-Gg: ASbGncsTEm78p7tb/PXEjVSuoMg/BBU6+Y+YRILVAHrkGQzRIQ0yTHcxHEplso0oKdd
	5Xx5s4H5pFYDwrHVnsigIP2M7pJea81e7US+fWn3EpocUy448TtPtO+l5/0cy7EkYECUV9TcR0l
	wFoC+66RUB7kPKMZ0eSZfL4C+0wOqUITtaQ4pgVC1TggzDmkvXDGORxhxNV+1D/2uaTcFbYE+H1
	5fTWDDTs+/csGi3D0WpW85pc9z1QM1sKrP9So5kU+c01NEb0+sWgIA58ZUJuHlw0Hyb45QFWliR
	zDH4ETuRnrBMixTDQZA+WmE3UODdFz3KWSu/bXrYkGk=
X-Google-Smtp-Source: AGHT+IF6UUwx9Y0DNMi8VFTXAHNTR83Sz/dwKN+CzDr1xgGdpAqcdgnUJR1obdygbwuWBeQGCTA0uw==
X-Received: by 2002:a17:90b:520d:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30c4000fa4emr18742884a91.13.1747023050015;
        Sun, 11 May 2025 21:10:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e76039sm5686372a91.43.2025.05.11.21.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 21:10:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] compile-rt: Fix building compiler-native on aarch64 build hosts.
Date: Sun, 11 May 2025 21:10:47 -0700
Message-ID: <20250512041047.991955-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 04:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216295

Using target triple confuses the native system compiler to find
libgcc and C runtime during compiler-rt-native build

Fixes
|     /home/khem/yoe/build/tmp/hosttools/ld: cannot find crtbeginS.o: No such file or directory
|     /home/khem/yoe/build/tmp/hosttools/ld: cannot find -lgcc: No such file or directory
|     /home/khem/yoe/build/tmp/hosttools/ld: cannot find -lgcc_s: No such file or directory
|     clang: error: linker command failed with exit code 1 (use -v to see invocation)
|     ninja: build stopped: subcommand failed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 5044db6249d..ad145f86446 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -71,7 +71,6 @@ OECMAKE_TARGET_COMPILE = "compiler-rt"
 OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
 OECMAKE_SOURCEPATH = "${S}/llvm"
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
-                  -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                   -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
                   -DCOMPILER_RT_STANDALONE_BUILD=ON \
                   -DCOMPILER_RT_INCLUDE_TESTS=OFF \
@@ -83,7 +82,6 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
                   -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=OFF \
-                  -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
                   -S ${S}/runtimes \
 "
 
@@ -91,6 +89,8 @@ EXTRA_OECMAKE:append:class-target = "\
                -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
                -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
                -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
+               -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
+               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
                -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 "
 
@@ -100,6 +100,8 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
                -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
+               -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
+               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
 "
 
 do_install:append () {


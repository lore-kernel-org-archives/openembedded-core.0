Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62667C87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 13:37:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.17910.1754314625443088228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 06:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eSwttgoy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b783ea5014so1920261f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754314623; x=1754919423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fqK9KnzmFU6bha/Mf7bkWKy2Dr6XW7f2tOuKZ373v04=;
        b=eSwttgoydR28LqskCTihp/Kvfkca6dgB4F8M23jqtBSWagPoDUpY/aZdBPBF4B2l+7
         HJDgyPPIdSQyHaTc/1TTOZ6fMGwevd/k/b2sxygLzbEH3Xjm4h1+X19dRw2cFacU7KFn
         SPyp9+9EqB0mzbJrtUYCRZTa0qWpUaGPI66hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754314623; x=1754919423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fqK9KnzmFU6bha/Mf7bkWKy2Dr6XW7f2tOuKZ373v04=;
        b=e6g+JT7ZOps1noOG4cLn1Tn+aLwGWiHAkTN9bjsNprE1AQ1pfucMHOzQ7EUzGBQTnq
         fbKEFKgDASiLXHi7As51OR4BLWyJoLhX5cT3zmHA/gFbeCk72dRi9DxgS9bgZ/3vI96u
         I8gtttYLt9ibrS/LJc69btCPl2y+44Aqyrt8QT8XC9izLRIaO3mqM/2uOEuQZcNoycUU
         DumJ3O0SZRfVvpWNyxtHMm2TYwjh13u0sicO6HOws40bZwstqDhviLdinwwEEy0pmpr6
         k3ThCwCoU1rmTtHjAfV4AWmNVNFfZzzN2waNCS3WkpqcrYnfBOjRWQSwrwNKtb/xJ/AP
         iBNQ==
X-Gm-Message-State: AOJu0YymcFi8jCvaE4RSNRgE5oVc8nCUrCzxVg+tNJ7jbNcHecdM9l0v
	9WFh+g/wQKlKACS/aypvsfKDQ6MfIOAfHTgDK60CR/WaeNTmyFETe4tcl2SOZ4YVuiHqGzbgwWM
	50NnK
X-Gm-Gg: ASbGncvVhf9Um8eKHUnYM6QaZZhLjXx5+wL3JKFqYzmyigjAjsHSxlaXQ6pEcp+k+75
	ysKXJVPdfm7HCn7MqtsI+2M9fQJH5pcQQLrKaQ7Lx0A+xD2Rw7Z+CgzMBrHFDzqz6VJkwMngV3s
	lKwRFsAa9XpvsIJuG/v1yNRwqLt1LzNEsEK7w5KdnB72c8U4FTiuv6/BxDfr1nJqNu7I2DPadaA
	JMGp19rr/je29OZtarXnFYNf5E9MCv7qNhTCooK5QXR3UTF9QBqc53kp3fX0zgCXFon8FGNofOb
	ZLtAbN7xLn881lf1UoIRy1Ljen7FeI7nc6nlqnHpB0xPOSTn/8VN/tuAOa4DuVUT4Dv1GzJe50Z
	bWDiQhA7LaG8lWOjmSSHIkPPe3YGjiolp++EV6CCjg6Kvrsx2ANMSYfcwqXoY0g==
X-Google-Smtp-Source: AGHT+IFhlDobX39WnaBUgeu/ordhgGD2s5mM5laTqPfu4TIGiXEJqG0gdPFQQe2uM8TS/YWvbti5ZA==
X-Received: by 2002:a5d:5f87:0:b0:3b7:994b:8409 with SMTP id ffacd0b85a97d-3b8d94ba170mr7031711f8f.39.1754314623217;
        Mon, 04 Aug 2025 06:37:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2c76:58bb:66fc:3164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0683045sm5776508f8f.41.2025.08.04.06.37.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:37:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] clang/meta-ide-support/meta-extsdk-toolchain: Add missing MLPREFIX
Date: Mon,  4 Aug 2025 14:37:01 +0100
Message-ID: <20250804133701.1410694-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 13:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221427

'cross' dependencies are hard, the code currently handles adding MLPREFIX
in these cases but may not in future depending upon implementation.

Add the correct value explictly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/meta-extsdk-toolchain.bb           | 2 +-
 meta/recipes-core/meta/meta-ide-support.bb                | 2 +-
 meta/recipes-devtools/clang/clang_git.bb                  | 2 +-
 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 2 +-
 meta/recipes-devtools/clang/compiler-rt_git.bb            | 2 +-
 meta/recipes-devtools/clang/libcxx_git.bb                 | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 0df681ac738..16fe185964a 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -2,7 +2,7 @@ SUMMARY = "Extensible SDK toolchain meta-recipe"
 DESCRIPTION = "Meta-recipe for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
 
-DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
+DEPENDS = "virtual/libc ${MLPREFIX}gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
 
 do_populate_sysroot[deptask] = "do_populate_sysroot"
 
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 7ed422ce4dd..c4493029236 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Meta package for ensuring the build directory contains all approp
 LICENSE = "MIT"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native cmake-native autoconf-native automake-native meson-native intltool-native pkgconfig-native"
+DEPENDS = "virtual/libc ${MLPREFIX}gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native cmake-native autoconf-native automake-native meson-native intltool-native pkgconfig-native"
 RM_WORK_EXCLUDE += "${PN}"
 
 inherit toolchain-scripts nopackages deploy testsdk
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 6c5987a74ad..0009a95628d 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -142,7 +142,7 @@ EXTRA_OECMAKE:append:class-target = "\
 
 DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native llvm-tblgen-native"
 DEPENDS:append:class-nativesdk = " clang-crosssdk-${SDK_SYS} virtual/nativesdk-cross-binutils"
-DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH} ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
+DEPENDS:append:class-target = " ${MLPREFIX}clang-cross-${TARGET_ARCH} ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
 
 RDEPENDS:${PN}:append:class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' lld', '', d)}"
 RRECOMMENDS:${PN}:append:class-target = "binutils ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index c8bc42c4eb8..588320a1407 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -42,7 +42,7 @@ TOOLCHAIN_NATIVE = "clang"
 DEPENDS += "virtual/crypt compiler-rt"
 DEPENDS:append:class-native = " clang-native libxcrypt-native libcxx-native"
 DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-libxcrypt nativesdk-gcc-runtime"
-DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
+DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 0179dc55592..8cf11edf85f 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -26,7 +26,7 @@ TUNE_CCARGS:remove = "-no-integrated-as"
 INHIBIT_DEFAULT_DEPS = "1"
 
 DEPENDS += "libgcc"
-DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
+DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
 DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-gcc-runtime"
 DEPENDS:append:class-native = " clang-native"
 DEPENDS:remove:class-native = "libcxx-native compiler-rt-native"
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index 6c584decc74..d6bacc33d6b 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[no-atomics] = "-D_LIBCXXABI_HAS_ATOMIC_BUILTINS=OFF -DCMAKE_SHARED
 PACKAGECONFIG[compiler-rt] = "-DLIBCXX_USE_COMPILER_RT=ON -DLIBCXXABI_USE_COMPILER_RT=ON -DLIBUNWIND_USE_COMPILER_RT=ON,,compiler-rt"
 PACKAGECONFIG[unwind-shared] = "-DLIBUNWIND_ENABLE_SHARED=ON,-DLIBUNWIND_ENABLE_SHARED=OFF,,"
 
-DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc virtual/${MLPREFIX}compilerlibs"
+DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc virtual/${MLPREFIX}compilerlibs"
 DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-crosssdk-${SDK_SYS} nativesdk-compiler-rt"
 DEPENDS:append:class-native = " clang-native compiler-rt-native"
 DEPENDS:remove:class-native = "libcxx-native"


Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA098C46467
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.57312.1671559638624404252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kVyIN+pw;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so11779252wma.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FagPer16TqSGKfWM657hm6JiI+yBiVBCvqxCOmlxkMA=;
        b=kVyIN+pwoAHWJODr9Rf96si+4MKvsNfKYVMWuR/tZnsLwlPYlNEWOOXmHNfWRGYHy+
         Oo/H5pCq5aJ78qOuDWV3QF4X5mMnN57hBAWSW2ePxKqose572LyvHeYHsHbGz5cQLccr
         2HOnP8L9J+7qC1e7LDknCHwgyZnPj6RhvvxQ5w9IIEae2/6rHvt08fIfUGMQN1Ca9tZm
         pTtjuNWcK0KmO3vkJPNMYk3lJZEdcIu3WcG0cPFpHF4rgQuauntLnYKrGCD5OpHG/54y
         DS9eJfZvQCrV3rrw79CGYW9iWPSTmSpQ5QgVshmaaSC6YIfFa/MVUvjYoOFhmF8wLYF3
         3AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FagPer16TqSGKfWM657hm6JiI+yBiVBCvqxCOmlxkMA=;
        b=G6TSBBw2p+Sjw0S5yDwmEq+23Ev2VFVw7HNaYU7VSiQnvwtqQH049FQinHgfaTPyps
         vVVPwVb4EPKITbtDQGjLc5tL/DxBGIX+dliH2pAXooQdEhqV/AYGbENtCB/jI/HsrXSD
         ROwvOnZrxh3enfnXKrIxDG8P/a7GmFM8MrVCJKHrwtWJEy6ZPi6K8+3hTPKkeCEtSX4n
         V4GtkoO/nuY93qWCOVHDcl0/g8SiENaut/SP/5ApMlUQ1PTYfjAd3dmQx53nfQ/9cWJN
         JJ5WQ2TfvoVVqHMAg8P6kqg/xCU/9NqUvmXrbVODTZl7TFmI1s2dwWhL2SBY/MiAz7vF
         Cnkg==
X-Gm-Message-State: AFqh2koql0FAyeyFYziE/LB85Inb4oUD5o2fKp+C+STtqkgRchvewDSx
	a1JgvXhz4RwFUxFrOMLJOtaHZrelUO4=
X-Google-Smtp-Source: AMrXdXtoos1zEcrEwTG+s/dQJzfEq/j4IIkOYFXa78Rv8rmniG6PT67vrwx3st/b7FmPjdMHnWXgRQ==
X-Received: by 2002:a1c:4b06:0:b0:3cf:5e42:de64 with SMTP id y6-20020a1c4b06000000b003cf5e42de64mr2314421wma.39.1671559637042;
        Tue, 20 Dec 2022 10:07:17 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:07:16 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 04/11] rust-llvm: Merge .inc into .bb
Date: Tue, 20 Dec 2022 18:06:05 +0000
Message-Id: <20221220180612.24555-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220180612.24555-1-alex.kiernan@gmail.com>
References: <20221220180612.24555-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174864

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/rust-llvm.inc      | 78 ------------------
 .../recipes-devtools/rust/rust-llvm_1.66.0.bb | 80 ++++++++++++++++++-
 2 files changed, 79 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm.inc

diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtools/rust/rust-llvm.inc
deleted file mode 100644
index 625eb5704166..000000000000
--- a/meta/recipes-devtools/rust/rust-llvm.inc
+++ /dev/null
@@ -1,78 +0,0 @@
-SUMMARY = "LLVM compiler framework (packaged with rust)"
-LICENSE ?= "Apache-2.0-with-LLVM-exception"
-HOMEPAGE = "http://www.rust-lang.org"
-
-SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2"
-
-S = "${RUSTSRC}/src/llvm-project/llvm"
-
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
-
-inherit cmake python3native
-
-DEPENDS += "ninja-native rust-llvm-native"
-
-ARM_INSTRUCTION_SET:armv5 = "arm"
-ARM_INSTRUCTION_SET:armv4t = "arm"
-
-# rustc_llvm with debug info is not recognized as a valid crate that's
-# generated by rust-llvm-native.
-CFLAGS:remove = "-g"
-CXXFLAGS:remove = "-g"
-
-LLVM_DIR = "llvm${LLVM_RELEASE}"
-
-EXTRA_OECMAKE = " \
-    -DCMAKE_BUILD_TYPE=Release \
-    -DLLVM_TARGETS_TO_BUILD='ARM;AArch64;Mips;PowerPC;RISCV;X86' \
-    -DLLVM_BUILD_DOCS=OFF \
-    -DLLVM_ENABLE_TERMINFO=OFF \
-    -DLLVM_ENABLE_ZLIB=OFF \
-    -DLLVM_ENABLE_LIBXML2=OFF \
-    -DLLVM_ENABLE_FFI=OFF \
-    -DLLVM_INSTALL_UTILS=ON \
-    -DLLVM_BUILD_EXAMPLES=OFF \
-    -DLLVM_INCLUDE_EXAMPLES=OFF \
-    -DLLVM_BUILD_TESTS=OFF \
-    -DLLVM_INCLUDE_TESTS=OFF \
-    -DLLVM_TARGET_ARCH=${TARGET_ARCH} \
-    -DCMAKE_INSTALL_PREFIX:PATH=${libdir}/llvm-rust \
-"
-EXTRA_OECMAKE:append:class-target = "\
-    -DCMAKE_CROSSCOMPILING:BOOL=ON \
-    -DLLVM_BUILD_TOOLS=OFF \
-    -DLLVM_TABLEGEN=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen \
-    -DLLVM_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config \
-"
-
-EXTRA_OECMAKE:append:class-nativesdk = "\
-    -DCMAKE_CROSSCOMPILING:BOOL=ON \
-    -DLLVM_BUILD_TOOLS=OFF \
-    -DLLVM_TABLEGEN=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen \
-    -DLLVM_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config \
-"
-
-# The debug symbols are huge here (>2GB) so suppress them since they
-# provide almost no value. If you really need them then override this
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
-
-do_install:append () {
-    # we don't need any of this stuff to build Rust
-    rm -rf "${D}/usr/lib/cmake"
-}
-
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
-
-# Add the extra locations to avoid the complaints about unpackaged files
-FILES:${PN}-bugpointpasses = "${libdir}/llvm-rust/lib/BugpointPasses.so"
-FILES:${PN}-llvmhello = "${libdir}/llvm-rust/lib/LLVMHello.so"
-FILES:${PN}-liblto = "${libdir}/llvm-rust/lib/libLTO.so.*"
-FILES:${PN}-staticdev =+ "${libdir}/llvm-rust/*/*.a"
-FILES:${PN} += "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.* ${libdir}/llvm-rust/bin"
-FILES:${PN}-dev += "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${libdir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cmake"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
index 396f741953ed..e1baeb78574f 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
@@ -1,6 +1,84 @@
+SUMMARY = "LLVM compiler framework (packaged with rust)"
+LICENSE ?= "Apache-2.0-with-LLVM-exception"
+HOMEPAGE = "http://www.rust-lang.org"
+
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
 LLVM_RELEASE = "14.0.5"
+
 require rust-source.inc
-require rust-llvm.inc
 
+SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
+            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2"
+
+S = "${RUSTSRC}/src/llvm-project/llvm"
+
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
+
+inherit cmake python3native
+
+DEPENDS += "ninja-native rust-llvm-native"
+
+ARM_INSTRUCTION_SET:armv5 = "arm"
+ARM_INSTRUCTION_SET:armv4t = "arm"
+
+# rustc_llvm with debug info is not recognized as a valid crate that's
+# generated by rust-llvm-native.
+CFLAGS:remove = "-g"
+CXXFLAGS:remove = "-g"
+
+LLVM_DIR = "llvm${LLVM_RELEASE}"
+
+EXTRA_OECMAKE = " \
+    -DCMAKE_BUILD_TYPE=Release \
+    -DLLVM_TARGETS_TO_BUILD='ARM;AArch64;Mips;PowerPC;RISCV;X86' \
+    -DLLVM_BUILD_DOCS=OFF \
+    -DLLVM_ENABLE_TERMINFO=OFF \
+    -DLLVM_ENABLE_ZLIB=OFF \
+    -DLLVM_ENABLE_LIBXML2=OFF \
+    -DLLVM_ENABLE_FFI=OFF \
+    -DLLVM_INSTALL_UTILS=ON \
+    -DLLVM_BUILD_EXAMPLES=OFF \
+    -DLLVM_INCLUDE_EXAMPLES=OFF \
+    -DLLVM_BUILD_TESTS=OFF \
+    -DLLVM_INCLUDE_TESTS=OFF \
+    -DLLVM_TARGET_ARCH=${TARGET_ARCH} \
+    -DCMAKE_INSTALL_PREFIX:PATH=${libdir}/llvm-rust \
+"
+EXTRA_OECMAKE:append:class-target = "\
+    -DCMAKE_CROSSCOMPILING:BOOL=ON \
+    -DLLVM_BUILD_TOOLS=OFF \
+    -DLLVM_TABLEGEN=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen \
+    -DLLVM_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config \
+"
+
+EXTRA_OECMAKE:append:class-nativesdk = "\
+    -DCMAKE_CROSSCOMPILING:BOOL=ON \
+    -DLLVM_BUILD_TOOLS=OFF \
+    -DLLVM_TABLEGEN=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen \
+    -DLLVM_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config \
+"
+
+# The debug symbols are huge here (>2GB) so suppress them since they
+# provide almost no value. If you really need them then override this
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
+
+do_install:append () {
+    # we don't need any of this stuff to build Rust
+    rm -rf "${D}/usr/lib/cmake"
+}
+
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
+
+# Add the extra locations to avoid the complaints about unpackaged files
+FILES:${PN}-bugpointpasses = "${libdir}/llvm-rust/lib/BugpointPasses.so"
+FILES:${PN}-llvmhello = "${libdir}/llvm-rust/lib/LLVMHello.so"
+FILES:${PN}-liblto = "${libdir}/llvm-rust/lib/libLTO.so.*"
+FILES:${PN}-staticdev =+ "${libdir}/llvm-rust/*/*.a"
+FILES:${PN} += "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.* ${libdir}/llvm-rust/bin"
+FILES:${PN}-dev += "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${libdir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cmake"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.0



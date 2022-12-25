Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A0AC4708D
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:36 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.126056.1672005573088389717
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jzmcNUDa;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ud5so23126459ejc.4
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVEzvAqn1upnavbNTfqGymSJOsGp+qz/Lv+uZdYdre8=;
        b=jzmcNUDa8FAS+sa47khUvwE1i6FBxmgm9U3jfx8oC+aXbs2/UwCAbyVO6TRLkQzpqB
         dhjLKTp2FOnFwJ+WxARSNMeaZuAe+e5zRgbCvMNkH3TpWSdfksc7X5IfGOxCufNxpuqR
         1z7yg8bin1PRCTe8vaJiZh6j99GNJZ09zII8ngCv2jzCAYmAOMOONkkanpraPhas3h9b
         qtq9VI4FbxLt0r+tCGcO+hCUd452yZ4eHlgSV7AhfeZXE5js5lODS6D0rQADGlLIfUmi
         Jl3SnOr871W4Gq0YhUt7emw8h0M2dkeU5RtVhTU8Amc9M2tISA/JSjtEo2u8OL+4ezXi
         I4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVEzvAqn1upnavbNTfqGymSJOsGp+qz/Lv+uZdYdre8=;
        b=Ba1qbcDRyeKAoY8cKrBijFS+NxT38+DJDxWWR26mRiTgcb4F61AKgv0EncHSjXRaT0
         kxkp+oVVXFNAjDQoqqw1IMk1e9kpXshtLGM7Ok4okJ7cOMWbjAmhzUetk2po84dC/flq
         CAuz4st1nPq2lD8BtMaswX7PvvL7NWFuOqXbCN2yJV02FG62JYBsJ9Aj4kMAWPiQNeiX
         /pEpUviyoOm/mwV5/E38nCF7dzg2a/fSMWFnsRYOj4ZCm16JY+eKKvZTSDB+OG6eNotj
         RyuStqHguQNU9+cLXd3/xrzRrZO4RHLIaYwzgX4+fJn0JLzB5PiTYRsL77XH045h/lY1
         OYRQ==
X-Gm-Message-State: AFqh2koekZk+XgSm0PY7N0Lcs8d/x6NtK+QIcltDs49YzAZmQ21AagQt
	zHJXvzmvV2r+KSLr5CV2JkT5z8TC2Vw=
X-Google-Smtp-Source: AMrXdXsMWzu6e6AJ+4ut4nZqmEA2keAk+hCOxeZd2zFYlaYUlwe8AKfYwIYM0yUdaJtw4FG6z7J9gg==
X-Received: by 2002:a17:907:c71b:b0:7c1:67ca:56f5 with SMTP id ty27-20020a170907c71b00b007c167ca56f5mr18989476ejc.15.1672005571266;
        Sun, 25 Dec 2022 13:59:31 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:30 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 01/11] rust-llvm: Merge .inc into .bb
Date: Sun, 25 Dec 2022 21:59:11 +0000
Message-Id: <20221225215921.12868-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174996

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v2)

Changes in v2:
- Drop rust.inc/rust.bb merge, not actually made use of in the change
  set
- Reorder so cargo test goes after build fixes

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



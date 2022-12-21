Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720B4C46467
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.30958.1671657440239179906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YLCL8MMu;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id h7so16204770wrs.6
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ut1aiMdzTisZiqksv21t+MHqZQCsufFeklbDKVth+Po=;
        b=YLCL8MMuvZeNhds/21GoA9cdDx1zgVGMfH0BGVGfjlucIB/xH2T3Ic3XFTNVJg4MbB
         5w13z1O9nlWDO0WjxUpYC0heBAweTnlK05//pbWlOygcxG71eqX/H8r7aDtzTnNuQMt0
         CuVyoeRVBcvYB7jv2uvEQNfqGlLluPXoft+IifS2kcHHvTh56xE0+5evJTvtbfeidnD7
         JM2APHJeRsIPNTV5s9/afsytZV5m476fjViZenvLe92YtDZxK7x/7mnOrywMmN8P/D0M
         CMFypEyR2OSTudd8RalzKokvRMEaEQXzdLMirZd3lJL4kuODnZHWc0/izswoqXFjeOww
         03AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ut1aiMdzTisZiqksv21t+MHqZQCsufFeklbDKVth+Po=;
        b=QtUhlRDAcVh68c627ysJLxUWOrdEk8QfUaRiSwAZHsaGgg9KLFBPioYjl26P6ewdZs
         8wGzXkcIobmB55vNU2+CTs6/rxdxBwfi8xtqInSqCMnmQGlIMdo+0461+wgu4Amf8hD+
         1klzrIjRbH7LBvICOTeIYi6hMLIWgOUmTELR5tG8nrOpYXNH8aSj11fdvBNYDEPDZMd/
         sRtwR8nG/QZhDpB3dwETyEjbFrNyWaN1m2TUHb5i5taxkumZwchsryIlmJnn6k/bEp2M
         TeHT/XBpWbjSKZZ5JuSHaJouIlcwfSpem8+jGMsjWZEERPrTOGPiS4XcNS1ayhnVXZrr
         Qtag==
X-Gm-Message-State: AFqh2kpZ+bEnzZHRZNhY4R4tyxCTwvHBBC3hPOz5NUVPSxWOlsqL4YJE
	7a6+KXC/Judhxo1VqWBtrtxL/U9xOyI=
X-Google-Smtp-Source: AMrXdXsQbqIpdW7U9BpmwFKInLSP/BAZNIYzXUfvSXZ7JM8MHOSjJhYCzPiZMP2NwzPljYPLtp4uvQ==
X-Received: by 2002:a5d:66ce:0:b0:242:7c7a:7ee7 with SMTP id k14-20020a5d66ce000000b002427c7a7ee7mr4478611wrw.53.1671657438223;
        Wed, 21 Dec 2022 13:17:18 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:17 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 04/10] rust-llvm: Merge .inc into .bb
Date: Wed, 21 Dec 2022 21:17:00 +0000
Message-Id: <20221221211706.25347-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221211706.25347-1-alex.kiernan@gmail.com>
References: <20221221211706.25347-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174944

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

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



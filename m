Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F20C41535
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:53:23 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.17634.1671627200304839881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dejCNt+t;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id ja17so11073953wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ut1aiMdzTisZiqksv21t+MHqZQCsufFeklbDKVth+Po=;
        b=dejCNt+tJuLeljgBJHJQX+U17lFzbQe8/YgAMcLn+dLLRxffbEo+oJx+B8rIsdBoda
         H8mwtpYIbCyDXgNC2Z+XAq7fwr/DWPKTCoJ3NoCZciu/heSbXK9iBq8wKcxo1hujJMjZ
         7dt1ok4FFRi80Br7IVS5yLQiltHQmn96Xyf2HhkOH0rY/Z40AYSMW573axrLQar/Dl0S
         eTZrVmgrARI7fBLTOWVabRzPeb92aoJHV8i7RNJaxa9FWrzTBLGFA8SYTTrONZHEJ1J6
         cw+NGXLR/8W2xTDy6lQNcPAwymc/z+HtgLllEe2GkGIpdqQzG5GILNdjwE9bvpqY3/bF
         oZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ut1aiMdzTisZiqksv21t+MHqZQCsufFeklbDKVth+Po=;
        b=cSQW9JBM7fB8TvKlE2ZqJS87J3Yowm+NjPm2XuMRHMp0BRfLHeESkvGm/mzpnlfF+1
         b3xVreIE80YDvFQFMGTzlKSrrNIYCi9PIny7Kv+oz2t8L3UdOZtWDJPIFc+jpbQ18Jny
         SPP7bH328pYL2OzCQfYOGaLOXfCO9aByHvMIkWbgcz6UIogQOSBGiwTAuINFnf+d6XnP
         PcKoTpbqMUJ+un1lr3o58RrBlM6EeH39fikfyFRHBfV3NZ4EKm3nWlq4yqX1DG51WkoP
         R/5HSOegPx2yZJ8K0jVzIIHkmDQ1tMI71qZmRtjfCu7RRMA9+GLKoAePo4UisL0lP/q8
         KS4w==
X-Gm-Message-State: AFqh2kqPVNue6rf8YCJp2ZOtYCwk2Zxx9P1dKMYJ3pctD3LJV4NyOaKM
	EitsSZVrAtnmkx2z57p0QR9cWEtf7dc=
X-Google-Smtp-Source: AMrXdXvueEIcfjMSQmy1d8MVwyGf+wTvACBJVhSpdKZXrxbzgngi4wPMdjCEXT1oWRqGUuwhXrQDpw==
X-Received: by 2002:a05:600c:2247:b0:3d3:4b1a:6ff9 with SMTP id a7-20020a05600c224700b003d34b1a6ff9mr1597888wmm.26.1671627198545;
        Wed, 21 Dec 2022 04:53:18 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003b47ff307e1sm2124097wmi.31.2022.12.21.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:53:18 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 04/10] rust-llvm: Merge .inc into .bb
Date: Wed, 21 Dec 2022 12:52:59 +0000
Message-Id: <20221221125306.13779-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221125306.13779-1-alex.kiernan@gmail.com>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 12:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174910

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



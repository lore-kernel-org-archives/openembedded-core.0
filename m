Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB0DCD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 11:38:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33118.1782473894865047819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 04:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VBN5pg9A;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso4561815e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782473893; x=1783078693; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ai8l/1xM4QYfHkDGs80zRn1KEtuxv1XO+nmZ1abeN8o=;
        b=VBN5pg9AE6KmcXbQl/MReTO11xrRlmrDIpnyPUu6Q5EF73djC3rrV2KbC7D2Oa07d+
         /T04c04ICFqFlBvkUZa4YJMhJgO5U2dbjxYoq45pLJg5cc4pMUTnxRRJo7r7auBWS5sq
         iaZAT4UZUQGiEic5+QPRAAjN8p1BqcUe4lhVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473893; x=1783078693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ai8l/1xM4QYfHkDGs80zRn1KEtuxv1XO+nmZ1abeN8o=;
        b=QciuVv+FdeIljYbvu8pozj3kGsYV692p85J9qY6N5Yrp6PPRDZCL4REUFVC4LY4GPX
         HDg4ddGtL/5W3SKib3fyNsANsXcDozc/TB79cOJdC/hcKnFl7etR6epILr8GX/tTiUwM
         l71NJEc2wFkN+zsPo8jci+Yrz7OW2Duor2CcjN7ro1mA51OYUswyZtkSmWRY9R1ZClF3
         7HQcLo2OXWqunYXgv6iQY6e19DXkvYpMhPdUYXubASEPf+rzZiYlnL7hl78erNRJjCtw
         oziQWETa/wyKLB0VtoH2ecnidwhjOO7W47cQpaIDTHE5TLbT8onp6l5WH0w1EV0+kQTG
         +2yQ==
X-Gm-Message-State: AOJu0YyQWo1TYis6rMtmpgR6OFN9m99dEpCtz7+eK/X08B1/aFpyuxom
	t6u2eSDa8I9RE9/M17Vq7+l4kLfnvuDbE0mxTs/Ows32c7YsUsRkpzZBBC2ET3hQswM=
X-Gm-Gg: AfdE7cmGKmZHTbwMMl5Tj0e3IUki+f/6HFjaPs1bWcampDB57XIV5p1ZSPxrzIyoOG1
	lwtiyi1PPuQRF+EWFtdTCGYSQ3AUyZtbPKp2mfoVpWVe5USfF1u4lUfAEcBfI8Apj/b9ZB2DcKa
	8bB+9FjIgdZhDrlJz0RLkG0JQhLK51ViZQf3HuVYgGjuoilhHLlIW/j/ZuX/Nny/JtQgxyrsM0A
	LbavVQjwGZMrpWwkxMjBgPMRfd5SqeSkkzsUVwPpYZeusyc3M4rpb9UH6pA4W598auxVXR/tN4Z
	58NKIIabNbkr0ACtvUSEKGmwGGpwXL7qDZuTGbHAEoJp+kxhPD1BGBrg4V63Z6IgNkZWCtLIQnu
	fVZ6R8UfmiGEtpDqp9vGPomSbJlvObrmJhuz56na/qHjNgVaXGlr+sx0NvCPR3/5ufBCZXSFeY0
	VMzdFKIx6vn2wq9r4dX3bCMq1O80lTB/+8wrHDqYq7KW+wIUJth9Q9/nKXzCYQOv2HOkrkIoZes
	sGnUsOvNA==
X-Received: by 2002:a05:600c:3f18:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-4926fc919c3mr5434805e9.28.1782473892999;
        Fri, 26 Jun 2026 04:38:12 -0700 (PDT)
Received: from [10.1.75.39] (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49270208b29sm421345e9.10.2026.06.26.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:38:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 26 Jun 2026 13:37:56 +0200
Subject: [PATCH RFC 3/3] WIP backport: rust: enable dynamic LLVM linking by
 default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-ycongal-scarthgap-rust-segfault-v1-3-97df64b7b298@smile.fr>
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
In-Reply-To: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, ccasciato@21sw.us, paul@pbarker.dev, 
 randy.macleod@windriver.com, ross.burton@arm.com, 
 sundeep.kokkonda@windriver.com, SunilKumar.Dora@windriver.com, 
 Yoann Congal <yoann.congal@smile.fr>, 
 Sunil Dora <sunilkumar.dora@windriver.com>, 
 Alexander Kanavin <alex@linutronix.de>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782473890; l=6202;
 i=yoann.congal@smile.fr; s=20260527; h=from:subject:message-id;
 bh=gPnqYF2++NojPo+pBfFATG6X6CxcVl5y8bdlUh5a1vQ=;
 b=VPfQpfrFmwU+vQWlsN/OP5gGmqbbN/8ZJnTFiKJ9mdv84D4t7JwlMqQSOmv+kyUpI5SBun1KG
 5H6W6HcwXmHBg3zhrX+N67Dof2nacXFbhrnUcPwu9p5O3noJ19dq3SY
X-Developer-Key: i=yoann.congal@smile.fr; a=ed25519;
 pk=AccXM/XSn9zzv1zYXEM/MdcAaQ7cluqUBg1xzwrqNts=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 11:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239629

From: Sunil Dora <sunilkumar.dora@windriver.com>

Fixes [YOCTO #16058]

Enable dynamic linking with LLVM (link-shared) for all rust variants
(native, nativesdk and target) via a PACKAGECONFIG option, enabled
by default. This prevents segmentation faults when reusing sstate
artifacts built with different host toolchains.

Update multilib library symlinking to include shared libraries and
adjust the rust selftest to install llvm so the dynamically linked
compiler can run correctly.

Suggested-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0671c3dad87a063b3a41dd07cde89b5684e692c)
[YC: WIP Backport:
* moveid from llvm to rust-llvm (llvm unification has not happened on
  scarthgap
* made changes limited to -native/nativesdk- to avoid changing target
  output without reason
* Redid FILES* packaging around $PN/$PN-dev split to handle LLVM.so files]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/rust.py           |  2 +-
 meta/recipes-devtools/rust/rust-llvm_1.75.0.bb | 39 ++++++++++++++++++++++++--
 meta/recipes-devtools/rust/rust_1.75.0.bb      |  8 ++++--
 3 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 26f132edc4d55f260f835a996181834588249d13..b6912f646e37d0edb07bb178d2d3671ac1a67542 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -51,7 +51,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "llvm"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
index 4adaf5fbf6d31b1984a81e864285c1e06218e325..b32d3ee38cd2be3fa2dde1b8720f59c0b4b13c90 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
@@ -56,6 +56,9 @@ EXTRA_OECMAKE = " \
     -DCMAKE_INSTALL_PREFIX:PATH=${libdir}/llvm-rust \
 "
 
+EXTRA_OECMAKE:append:class-native = " -DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON"
+EXTRA_OECMAKE:append:class-nativesdk = " -DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON"
+
 # Forcibly disable the detection of these packages as otherwise
 # it will look at the host Python install
 EXTRA_OECMAKE += "\
@@ -87,6 +90,24 @@ do_install:append () {
     rm -rf "${D}/usr/lib/cmake"
 }
 
+symlink_llvm_libs() {
+    # Create symlinks in ${libdir} so that dynamic libraries can be found in standard paths
+    install -d ${D}${libdir}
+    for lib in ${D}${libdir}/llvm-rust/lib/libLLVM-*.so*; do
+        if [ -e "$lib" ]; then
+            ln -sf llvm-rust/lib/$(basename $lib) ${D}${libdir}/$(basename $lib)
+        fi
+    done
+}
+
+do_install:append:class-native () {
+    symlink_llvm_libs
+}
+
+do_install:append:class-nativesdk () {
+    symlink_llvm_libs
+}
+
 PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
 
 # Add the extra locations to avoid the complaints about unpackaged files
@@ -94,7 +115,21 @@ FILES:${PN}-bugpointpasses = "${libdir}/llvm-rust/lib/BugpointPasses.so"
 FILES:${PN}-llvmhello = "${libdir}/llvm-rust/lib/LLVMHello.so"
 FILES:${PN}-liblto = "${libdir}/llvm-rust/lib/libLTO.so.*"
 FILES:${PN}-staticdev =+ "${libdir}/llvm-rust/*/*.a"
-FILES:${PN} += "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.* ${libdir}/llvm-rust/bin"
-FILES:${PN}-dev += "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${libdir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cmake"
+FILES:${PN} += "${libdir}/libLLVM*.so* ${libdir}/llvm-rust/lib/libLLVM*.so* ${libdir}/llvm-rust/lib/libRemarks.so* ${libdir}/llvm-rust/bin"
+FILES:${PN}-dev += "${datadir}/llvm ${libdir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cmake"
+
+# Prevent -dev from matching versioned libs ending in .so
+FILES:${PN}-dev:remove = "${libdir}/lib*.so"
+
+# Package unversioned dev symlinks in -dev
+FILES:${PN}-dev += " \
+    ${libdir}/llvm-rust/lib/libLLVM.so \
+    ${libdir}/llvm-rust/lib/libLTO.so \
+    ${libdir}/llvm-rust/lib/libRemarks.so \
+"
+
+# libLLVM-17.so ends in .so; skip dev-so check for host builds
+INSANE_SKIP:${PN}:class-native += "dev-so"
+INSANE_SKIP:${PN}:class-nativesdk += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index f037bb33715dc4ba7cbb489ab1599ac6c8c875a4..b11f0ddd2816569e08e6cf908786ee32d49b79e1 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -20,6 +20,11 @@ DEPENDS += "rust-llvm (=${PV})"
 
 RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG:class-native ??= "llvm-shared"
+PACKAGECONFIG:class-nativesdk ??= "llvm-shared"
+PACKAGECONFIG[llvm-shared] = ",,,"
+
 # Otherwise we'll depend on what we provide
 INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
 # We don't need to depend on gcc-native because yocto assumes it exists
@@ -128,8 +133,7 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
-    if d.getVar('PN') == "rust-native":
-        config.set("llvm", "link-shared", e(True))
+    config.set("llvm", "link-shared", e(bb.utils.contains('PACKAGECONFIG', 'llvm-shared', True, False, d)))
     config.set("llvm", "static-libstdcpp", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
         config.set("llvm", "use-libcxx", e(True))

-- 
2.47.3



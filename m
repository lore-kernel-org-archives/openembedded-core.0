Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9EEC25B06
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.6782.1659705187235305448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NWpvg9hX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id n4so1463766wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=YvVtFmNbCCIGtfv/oEpDjZ3dJLERO4sxs9W/GGL7i2c=;
        b=NWpvg9hXxzkQ+158eOX5hXB1jV400bGkOhnK8+KCdJAHQtH+r4SYemp/M7XMvsJGgp
         uFrXxqJ6nrP/CU/Ch9EDQy2sGAvYZEaADTVgu49R2dKi8F+CeLvNImiywKiQxJG0FKDi
         SE3rkwHLYRMQX2Ske3U8ezLuvoAX4qy3HEjtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=YvVtFmNbCCIGtfv/oEpDjZ3dJLERO4sxs9W/GGL7i2c=;
        b=uQPS37rp+BN/UbyoucCSgC2xY9Ndwoo69vYzOEkFoeOO3GmvtonWBkjci4Y/NcHZyg
         kj+/vMaOMJEz/75VFgEjZyB3/XrEv+CSIRAsjFJFD7GfY1ClMpqGWywA1pJgapqyCnbd
         1eWYokk8m4obo2MAjhGVbF6RcVbxtWRUT4u1pKzlNp+42M6EK5N2UWhcxhshONhPzB/2
         N+HAk0T1+S1Ca2PWB48xlqmjbMctdUU8bdBZbH6m6QdD0FzPluNzER4XWI1CKJePKBVW
         FhlNxTbftmL+9GQnRuexLf51UZZUefM8h6+sgGBeEgLlSIVgld3rS35u+l6h4ZX2vlbM
         OwTw==
X-Gm-Message-State: ACgBeo3wWrjTELpgy+P6hpv+6VDIBkHDvPaQgZTFt1cj9ITz0dM4qzAm
	JEn/yVZmxZ+x+fFLeFRYrsMO4LU0+fdmSw==
X-Google-Smtp-Source: 
 AA6agR52iPFexd9DcuxoJTH8A8jOUnqK0TPuVitkhPp9UVPHdun2MxcUiQBVmdR7xzp3oFpxp/w/XA==
X-Received: by 2002:a05:6000:3c6:b0:220:5efd:423c with SMTP id
 b6-20020a05600003c600b002205efd423cmr4475663wrg.214.1659705200201;
        Fri, 05 Aug 2022 06:13:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/29] rust: Drop cross/crosssdk
Date: Fri,  5 Aug 2022 14:12:49 +0100
Message-Id: <20220805131252.3706794-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168960

Now that target config json is provided by rust-target-config.bbclass,
the need for the cross and crosssdk recipes is removed. Drop them and
simplify dependencies accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cargo.bbclass                    |  4 +-
 meta/classes/rust.bbclass                     |  2 +-
 meta/conf/distro/include/maintainers.inc      |  2 -
 meta/recipes-devtools/rust/rust-cross.inc     | 47 -------------------
 .../rust/rust-cross_1.62.0.bb                 |  8 ----
 .../rust/rust-crosssdk_1.62.0.bb              |  8 ----
 6 files changed, 3 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-cross.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-cross_1.62.0.bb
 delete mode 100644 meta/recipes-devtools/rust/rust-crosssdk_1.62.0.bb

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
index 2475d05b3d2..4bfcfe5fc65 100644
--- a/meta/classes/cargo.bbclass
+++ b/meta/classes/cargo.bbclass
@@ -13,8 +13,8 @@ CARGO = "cargo"
 BASEDEPENDS:append = " cargo-native"
 
 # Ensure we get the right rust variant
-DEPENDS:append:class-target = " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
-DEPENDS:append:class-nativesdk = " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
+DEPENDS:append:class-target = " rust-native ${RUSTLIB_DEP}"
+DEPENDS:append:class-nativesdk = " rust-native ${RUSTLIB_DEP}"
 DEPENDS:append:class-native = " rust-native"
 
 # Enable build separation
diff --git a/meta/classes/rust.bbclass b/meta/classes/rust.bbclass
index f20e063c5be..2639cecfd43 100644
--- a/meta/classes/rust.bbclass
+++ b/meta/classes/rust.bbclass
@@ -10,7 +10,7 @@ def rust_base_dep(d):
     deps = ""
     if not d.getVar('INHIBIT_DEFAULT_RUST_DEPS'):
         if (d.getVar('HOST_SYS') != d.getVar('BUILD_SYS')):
-            deps += " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
+            deps += " rust-native ${RUSTLIB_DEP}"
         else:
             deps += " rust-native"
     return deps
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b563c517962..80dfd6eb473 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -717,8 +717,6 @@ RECIPE_MAINTAINER:pn-rt-tests = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-cross-${TUNE_PKGARCH}-${TCLIBC} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-crosssdk-${SDK_ARCH}-glibc = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-llvm = "Randy MacLeod <Randy.MacLeod@windriver.com>"
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
deleted file mode 100644
index ab538e6659b..00000000000
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ /dev/null
@@ -1,47 +0,0 @@
-RUST_TARGETGENS = "BUILD HOST TARGET"
-
-# Otherwise we'll depend on what we provide
-INHIBIT_DEFAULT_RUST_DEPS = "1"
-
-# Unlike native (which nicely maps it's DEPENDS) cross wipes them out completely.
-# Generally, we (and cross in general) need the same things that native needs,
-# so it might make sense to take it's mapping. For now, though, we just mention
-# the bits we need explicitly.
-DEPENDS += "rust-llvm-native"
-DEPENDS += "rust-native"
-
-# In the cross compilation case, rustc doesn't seem to get the rpath quite
-# right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
-# include the '../../lib' (ie: relative path from cross_bindir to normal
-# libdir. As a result, we end up not being able to properly reference files in normal ${libdir}.
-# Most of the time this happens to work fine as the systems libraries are
-# subsituted, but sometimes a host system will lack a library, or the right
-# version of a library (libtinfo was how I noticed this).
-#
-# FIXME: this should really be fixed in rust itself.
-# FIXME: using hard-coded relative paths is wrong, we should ask bitbake for
-#        the relative path between 2 of it's vars.
-HOST_POST_LINK_ARGS:append = " -Wl,-rpath=../../lib"
-BUILD_POST_LINK_ARGS:append = " -Wl,-rpath=../../lib"
-
-# We need the same thing for the calls to the compiler when building the runtime crap
-TARGET_CC_ARCH:append = " --sysroot=${STAGING_DIR_TARGET}"
-
-do_rust_setup_snapshot () {
-}
-
-do_configure () {
-}
-
-do_compile () {
-}
-
-do_install () {
-	mkdir -p ${D}${prefix}/${base_libdir_native}/rustlib
-	cp ${WORKDIR}/targets/${TARGET_SYS}.json ${D}${prefix}/${base_libdir_native}/rustlib
-}
-
-rust_cross_sysroot_preprocess() {
-    sysroot_stage_dir ${D}${prefix}/${base_libdir_native}/rustlib ${SYSROOT_DESTDIR}${prefix}/${base_libdir_native}/rustlib
-}
-SYSROOT_PREPROCESS_FUNCS += "rust_cross_sysroot_preprocess"
diff --git a/meta/recipes-devtools/rust/rust-cross_1.62.0.bb b/meta/recipes-devtools/rust/rust-cross_1.62.0.bb
deleted file mode 100644
index 5358d98da85..00000000000
--- a/meta/recipes-devtools/rust/rust-cross_1.62.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require rust.inc
-inherit cross
-require rust-cross.inc
-require rust-source.inc
-
-DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
-PROVIDES = "virtual/${TARGET_PREFIX}rust"
-PN = "rust-cross-${TUNE_PKGARCH}-${TCLIBC}"
diff --git a/meta/recipes-devtools/rust/rust-crosssdk_1.62.0.bb b/meta/recipes-devtools/rust/rust-crosssdk_1.62.0.bb
deleted file mode 100644
index 6ea8cb09b21..00000000000
--- a/meta/recipes-devtools/rust/rust-crosssdk_1.62.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require rust.inc
-inherit crosssdk
-require rust-cross.inc
-require rust-source.inc
-
-DEPENDS += "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/nativesdk-libc"
-PROVIDES = "virtual/nativesdk-${TARGET_PREFIX}rust"
-PN = "rust-crosssdk-${TUNE_PKGARCH}-${RUST_LIBC}"
-- 
2.34.1



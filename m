Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A510FC3F6B0
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.6587.1659705194196225206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cS2pF62y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z12so3198939wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=y0ve12D39bRmmYrhsYXl/+Abja7M75/GLceNbyjevrA=;
        b=cS2pF62yXF1KcShSrW8gkFy9v77fQXmfLV2UVnHdUpP5+EXixwC1WkWDu8dvW1+c27
         MfUlRfEvETQO/QOt0MNmmGLX7iq1FsBAEkolwRZujmg6dr0C2jN6FN5VSZel8ZJ9WZe7
         GQg8GghFh7arcWU8reeMRwsZQsseyG3qVKatw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=y0ve12D39bRmmYrhsYXl/+Abja7M75/GLceNbyjevrA=;
        b=DzAw1hkWZ1z61hXiYwbwsudtlQrDCDGHh8VCqC6A4IomMbh4T42EI7l+5h/O4pb+0d
         kQ0JjZVGQxxeunN0bApzZrgwTooapBHVnXimtL0Jh4uxSEXFQ9ufCd9PJAXJ2mDza9F0
         yiihbkhukeeuo3WHrkGr/RBc4M2Z/2aSfCmxnWAWwvUBWDByJiO1vLmRxJH9C41dXAZ9
         xy5BLcjR2WidU25WEx0VAdHsyYK2P7GFPUqDhyoYZINCvsKQh7M+d1++/am1z3CCiSd+
         f0HOX8pf23ihFOUH4lnoKTOMatlT5nYrURDx7e6FTekEAyIDwktoaoqAtXjKYfQyZWDT
         HxOA==
X-Gm-Message-State: ACgBeo3EBdnbrcpdR0Y2PQVC5Nkfvg/tT308sJq13BW2h9+rC91v1vs4
	zh5zEL9X5Kg8bXC0awryyjCFj0LnOURYVg==
X-Google-Smtp-Source: 
 AA6agR5RtR437MpWdmxsUfOStjDW6Udy45PftGPf4ESlHrGH8lQfC9kuBqw+PyaGZbKNJjoSc300OA==
X-Received: by 2002:a5d:4b03:0:b0:220:6b87:8f0f with SMTP id
 v3-20020a5d4b03000000b002206b878f0fmr4378566wrq.534.1659705201493;
        Fri, 05 Aug 2022 06:13:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/29] rust: Enable nativesdk and target builds + replace
 rust-tools-cross-canadian
Date: Fri,  5 Aug 2022 14:12:50 +0100
Message-Id: <20220805131252.3706794-27-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/168961

Enable rust target builds as well as nativesdk-rust for the sdk. Merge
the builds of rust-tools components into the rust build, packaged separately
since this is a lot more efficient and saves rebuilding core rust multiple
times. The tools are not target specific so nativesdk-rust-tools suffices
and we can drop the cross canadian piece.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../packagegroup-rust-cross-canadian.bb       |  6 +-
 meta/recipes-devtools/rust/rust-target.inc    |  2 +-
 .../rust/rust-tools-cross-canadian.inc        | 38 ----------
 .../rust/rust-tools-cross-canadian_1.62.0.bb  |  6 --
 meta/recipes-devtools/rust/rust.inc           | 13 +---
 meta/recipes-devtools/rust/rust_1.62.0.bb     | 69 +++++++++++++++++--
 7 files changed, 70 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-tools-cross-canadian.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 80dfd6eb473..c0c38dfc165 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -720,7 +720,6 @@ RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-llvm = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-tools-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-sato-icon-theme = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
index 6d324002a1a..42f85f0eb38 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
@@ -6,12 +6,12 @@ inherit cross-canadian packagegroup
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 RUST="rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-RUST_TOOLS="rust-tools-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 RDEPENDS:${PN} = " \
     ${@all_multilib_tune_values(d, 'RUST')} \
+    nativesdk-rust \
     nativesdk-cargo \
-    rust-cross-canadian-src \
-    ${@all_multilib_tune_values(d, 'RUST_TOOLS')} \
+    nativesdk-rust-tools-clippy \
+    nativesdk-rust-tools-rustfmt \
 "
 
diff --git a/meta/recipes-devtools/rust/rust-target.inc b/meta/recipes-devtools/rust/rust-target.inc
index 3f637b3ba54..dce2b47517b 100644
--- a/meta/recipes-devtools/rust/rust-target.inc
+++ b/meta/recipes-devtools/rust/rust-target.inc
@@ -7,4 +7,4 @@ INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
 # We don't need to depend on gcc-native because yocto assumes it exists
 PROVIDES:class-native = "virtual/${TARGET_PREFIX}rust"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian.inc b/meta/recipes-devtools/rust/rust-tools-cross-canadian.inc
deleted file mode 100644
index f0358551ae2..00000000000
--- a/meta/recipes-devtools/rust/rust-tools-cross-canadian.inc
+++ /dev/null
@@ -1,38 +0,0 @@
-
-require rust-cross-canadian-common.inc
-
-RUST_TOOLS_CLIPPY_PN = "rust-tools-clippy-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-RUST_TOOLS_RUSTFMT_PN = "rust-tools-rustfmt-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-RUST_TOOLS_PKGS = "${RUST_TOOLS_CLIPPY_PN} ${RUST_TOOLS_RUSTFMT_PN}"
-PN = "rust-tools-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-PACKAGES = "${RUST_TOOLS_CLIPPY_PN} ${RUST_TOOLS_RUSTFMT_PN} ${PN}"
-RDEPENDS:${PN} += "${RUST_TOOLS_PKGS}"
-
-do_compile () {
-    rust_runx build --stage 2 src/tools/clippy
-    rust_runx build --stage 2 src/tools/rustfmt
-}
-
-do_install () {
-    SYS_BINDIR=$(dirname ${D}${bindir})
-
-    install -d "${SYS_BINDIR}"
-    cp build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/* ${SYS_BINDIR}
-    for i in ${SYS_BINDIR}/*; do
-	chrpath -r "\$ORIGIN/../lib" ${i}
-    done
-
-    chown -R root.root ${D}
-}
-
-ALLOW_EMPTY:${PN} = "1"
-
-PKG_SYS_BINDIR = "${SDKPATHNATIVE}/usr/bin"
-FILES:${RUST_TOOLS_CLIPPY_PN} = "${PKG_SYS_BINDIR}/cargo-clippy ${PKG_SYS_BINDIR}/clippy-driver"
-FILES:${RUST_TOOLS_RUSTFMT_PN} = "${PKG_SYS_BINDIR}/rustfmt"
-
-SUMMARY:${PN} = "Rust helper tools"
-SUMMARY:${RUST_TOOLS_CLIPPY_PN} = "A collection of lints to catch common mistakes and improve your Rust code"
-SUMMARY:${RUST_TOOLS_RUSTFMT_PN} = "A tool for formatting Rust code according to style guidelines"
-
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.0.bb b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.0.bb
deleted file mode 100644
index 2d809d68f52..00000000000
--- a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require rust-tools-cross-canadian.inc
-require rust-source.inc
-require rust-snapshot.inc
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/rust:"
-
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 7c16b8165bb..1c8fe225fd4 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -9,6 +9,7 @@ inherit cargo_common
 
 DEPENDS += "file-native python3-native"
 DEPENDS:append:class-native = " rust-llvm-native"
+DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"
 
 S = "${RUSTSRC}"
 
@@ -202,18 +203,6 @@ rust_do_install () {
     rm -f ${D}${libdir}/rustlib/src/rust
 }
 
-rust_install_targets() {
-    # Install our custom target.json files
-    local td="${D}${libdir}/rustlib/"
-    install -d "$td"
-    for tgt in "${WORKDIR}/targets/"* ; do
-        install -m 0644 "$tgt" "$td"
-    done
-}
-
-
 do_install () {
     rust_do_install
-    rust_install_targets
 }
-# ex: sts=4 et sw=4 ts=8
diff --git a/meta/recipes-devtools/rust/rust_1.62.0.bb b/meta/recipes-devtools/rust/rust_1.62.0.bb
index b505ad46caf..81923c33313 100644
--- a/meta/recipes-devtools/rust/rust_1.62.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.62.0.bb
@@ -3,19 +3,80 @@ require rust-source.inc
 require rust-snapshot.inc
 
 INSANE_SKIP:${PN}:class-native = "already-stripped"
+FILES:${PN} += "${libdir}/rustlib"
+FILES:${PN} += "${libdir}/*.so"
+FILES:${PN}-dev = ""
 
 do_compile () {
     rust_runx build --stage 2
 }
 
+do_compile:append:class-target () {
+    rust_runx build --stage 2 src/tools/clippy
+    rust_runx build --stage 2 src/tools/rustfmt
+}
+
+do_compile:append:class-nativesdk () {
+    rust_runx build --stage 2 src/tools/clippy
+    rust_runx build --stage 2 src/tools/rustfmt
+}
+
+ALLOW_EMPTY:${PN} = "1"
+
+PACKAGES =+ "${PN}-tools-clippy ${PN}-tools-rustfmt"
+FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
+FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
+RDEPENDS:${PN}-tools-clippy = "${PN}"
+RDEPENDS:${PN}-tools-rustfmt = "${PN}"
+
+SUMMARY:${PN}-tools-clippy = "A collection of lints to catch common mistakes and improve your Rust code"
+SUMMARY:${PN}-tools-rustfmt = "A tool for formatting Rust code according to style guidelines"
+
 rust_do_install() {
     rust_runx install
 }
 
-python () {
-    pn = d.getVar('PN')
+rust_do_install:class-nativesdk() {
+    export PSEUDO_UNLOAD=1
+    rust_runx install
+    unset PSEUDO_UNLOAD
+
+    install -d ${D}${bindir}
+    for i in cargo-clippy clippy-driver rustfmt; do
+        cp build/${RUST_BUILD_SYS}/stage2-tools-bin/$i ${D}${bindir}
+        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+    done
 
-    if not pn.endswith("-native"):
-        raise bb.parse.SkipRecipe("Rust recipe doesn't work for target builds at this time. Fixes welcome.")
+    chown root:root ${D}/ -R
+    rm ${D}${libdir}/rustlib/uninstall.sh
+    rm ${D}${libdir}/rustlib/install.log
+    rm ${D}${libdir}/rustlib/manifest*
 }
 
+rust_do_install:class-target() {
+    export PSEUDO_UNLOAD=1
+    rust_runx install
+    unset PSEUDO_UNLOAD
+
+    install -d ${D}${bindir}
+    for i in cargo-clippy clippy-driver rustfmt; do
+        cp build/${RUST_BUILD_SYS}/stage2-tools-bin/$i ${D}${bindir}
+        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+    done
+
+    chown root:root ${D}/ -R
+    rm ${D}${libdir}/rustlib/uninstall.sh
+    rm ${D}${libdir}/rustlib/install.log
+    rm ${D}${libdir}/rustlib/manifest*
+}
+
+# see recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+# we need to link with ssp_nonshared on musl to avoid "undefined reference to `__stack_chk_fail_local'"
+# when building MACHINE=qemux86 for musl
+WRAPPER_TARGET_EXTRALD:libc-musl = "-lssp_nonshared"
+
+RUSTLIB_DEP:class-nativesdk = ""
+
+# musl builds include libunwind.a
+INSANE_SKIP:${PN} = "staticdev"
+
-- 
2.34.1



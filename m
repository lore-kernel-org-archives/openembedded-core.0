Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CF1C48BE4
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.6776.1659705189866605746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V03xi43v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 n20-20020a05600c3b9400b003a4f2261a7eso1275538wms.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=xwz4nNvg+Wh/omYyioIBC0OJ1tzyPFMZqGCd6h3uqGI=;
        b=V03xi43vU4l82v7REQyUTzcE8SO8XdYJk3UeseBFOmBI6EqQIbqS97gzxIJyBJYmIT
         Tu6rDVGFySxeyu24/golyGyqRfq+p8WhJY+eVkGTDNvWDv4sAhaLvl9t0CfIFyLmKtrV
         NmT5rRunufBAT9eYLzcMi3vpBNo+VBzBrtriA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=xwz4nNvg+Wh/omYyioIBC0OJ1tzyPFMZqGCd6h3uqGI=;
        b=sWxxfUPYVvtQCLmdHKkUGnM5hR2MzkFgivtrz6p/P4zS83NHeoJTijTvZuxbV4p+pD
         iPqYq9rhnXIxy3z/mF7EbmtVz/pTSnA6tfFwYtkDY/KSCkwY9nJtn1ks0yeSLODPP8U/
         544Ppda0tt8y+FLasAIAyWC8VcU41nari2zQGs+/aa/nLUE3+HMrjQVU63MLQMYWiPxI
         lWXr5IFoQ5JyUZ3tsOtXtVrxniM2SMLMiho4JsX3mW606NINsx0vRjt8OQpkzHQ3KpYU
         tF9NIcR7TzBRM6igAogaZZNu829Mg4BTfWoZLnYwBOMlIWqkXoq8WRCKQpu9SrqGa98A
         ewXg==
X-Gm-Message-State: ACgBeo1bbh1bq4PrOok52kcUAkD0VjdNKYHf6LqcJ38m/rRrjWFYEPxB
	dhjIgpqcALefAcZUxn7l29qve5WVYREIwg==
X-Google-Smtp-Source: 
 AA6agR7wESSr7p9CJBvkKFTu6Qzr1Xo6FZdmaGodOXxBV1B+tPqIE07K3siWVb5e6s/Li9NItVxUig==
X-Received: by 2002:a05:600c:3d0d:b0:3a3:7a1a:326a with SMTP id
 bh13-20020a05600c3d0d00b003a37a1a326amr9418124wmb.127.1659705187857;
        Fri, 05 Aug 2022 06:13:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/29] rust: Generate per recipe target configuration files
Date: Fri,  5 Aug 2022 14:12:38 +0100
Message-Id: <20220805131252.3706794-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168949

Instead of generating target configuration files centrally and often getting
it wrong, or having trouble finding the right set, generate them dynamically
from the bbclass into WORKDIR per recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cargo.bbclass                   |  3 ++-
 meta/classes/rust-bin.bbclass                |  1 -
 meta/classes/rust-common.bbclass             |  2 +-
 meta/classes/rust-target-config.bbclass      | 18 +++++++++---------
 meta/recipes-devtools/cargo/cargo.inc        |  2 ++
 meta/recipes-devtools/rust/libstd-rs.inc     |  3 +++
 meta/recipes-devtools/rust/rust.inc          |  5 ++---
 meta/recipes-gnome/librsvg/librsvg_2.54.4.bb | 14 +++++++-------
 8 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
index 539ff03ec7d..2475d05b3d2 100644
--- a/meta/classes/cargo.bbclass
+++ b/meta/classes/cargo.bbclass
@@ -4,6 +4,7 @@
 ## Cargo.
 
 inherit cargo_common
+inherit rust-target-config
 
 # the binary we will use
 CARGO = "cargo"
@@ -40,7 +41,7 @@ BUILD_DIR = "${@['release', 'debug'][d.getVar('DEBUG_BUILD') == '1']}"
 CARGO_TARGET_SUBDIR="${RUST_HOST_SYS}/${BUILD_DIR}"
 oe_cargo_build () {
 	export RUSTFLAGS="${RUSTFLAGS}"
-	export RUST_TARGET_PATH="${RUST_TARGET_PATH}"
+	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
 	bbnote "cargo = $(which ${CARGO})"
 	bbnote "rustc = $(which ${RUSTC})"
 	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
diff --git a/meta/classes/rust-bin.bbclass b/meta/classes/rust-bin.bbclass
index c87343b3cff..7a70a7b6ba3 100644
--- a/meta/classes/rust-bin.bbclass
+++ b/meta/classes/rust-bin.bbclass
@@ -93,7 +93,6 @@ do_configure () {
 }
 
 oe_runrustc () {
-	export RUST_TARGET_PATH="${RUST_TARGET_PATH}"
 	bbnote ${RUSTC} ${RUSTC_ARCHFLAGS} ${RUSTC_FLAGS} "$@"
 	"${RUSTC}" ${RUSTC_ARCHFLAGS} ${RUSTC_FLAGS} "$@"
 }
diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 1bce7761ab0..adcf96f0cd9 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -1,4 +1,5 @@
 inherit python3native
+inherit rust-target-config
 
 # Common variables used by all Rust builds
 export rustlibdir = "${libdir}/rust"
@@ -10,7 +11,6 @@ RUSTLIB = "-L ${STAGING_LIBDIR}/rust"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ?= "libstd-rs"
-export RUST_TARGET_PATH = "${STAGING_LIBDIR_NATIVE}/rustlib"
 RUST_PANIC_STRATEGY ?= "unwind"
 
 # Native builds are not effected by TCLIBC. Without this, rust-native
diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-target-config.bbclass
index ab177cf59f4..bc6bd77abbf 100644
--- a/meta/classes/rust-target-config.bbclass
+++ b/meta/classes/rust-target-config.bbclass
@@ -292,6 +292,7 @@ def rust_gen_target(d, thing, wd, arch):
     import json
     sys = d.getVar('{}_SYS'.format(thing))
     prefix = d.getVar('{}_PREFIX'.format(thing))
+    rustsys = d.getVar('RUST_{}_SYS'.format(thing))
 
     abi = None
     cpu = "generic"
@@ -318,13 +319,9 @@ def rust_gen_target(d, thing, wd, arch):
     features = features or d.getVarFlag('FEATURES', arch_abi) or ""
     features = features.strip()
 
-    llvm_target = d.getVar('RUST_TARGET_SYS')
-    if thing == "BUILD":
-        llvm_target = d.getVar('RUST_HOST_SYS')
-
     # build tspec
     tspec = {}
-    tspec['llvm-target'] = llvm_target
+    tspec['llvm-target'] = rustsys
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
     if tspec['data-layout'] is None:
         bb.fatal("No rust target defined for %s" % arch_abi)
@@ -358,7 +355,7 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['panic-strategy'] = d.getVar("RUST_PANIC_STRATEGY")
 
     # write out the target spec json file
-    with open(wd + sys + '.json', 'w') as f:
+    with open(wd + rustsys + '.json', 'w') as f:
         json.dump(tspec, f, indent=4)
 
 # These are accounted for in tmpdir path names so don't need to be in the task sig
@@ -366,10 +363,13 @@ rust_gen_target[vardepsexclude] += "ABIEXTENSION llvm_cpu"
 
 do_rust_gen_targets[vardeps] += "DATA_LAYOUT TARGET_ENDIAN TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
 
-RUST_TARGETGENS = "BUILD"
+RUST_TARGETS_DIR = "${WORKDIR}/rust-targets/"
+export RUST_TARGET_PATH = "${RUST_TARGETS_DIR}"
+
+RUST_TARGETGENS = "BUILD HOST TARGET"
 
 python do_rust_gen_targets () {
-    wd = d.getVar('WORKDIR') + '/targets/'
+    wd = d.getVar('RUST_TARGETS_DIR')
     # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
     rust_gen_target(d, 'BUILD', wd, d.getVar('BUILD_ARCH'))
     if "HOST" in d.getVar("RUST_TARGETGENS"):
@@ -379,5 +379,5 @@ python do_rust_gen_targets () {
 }
 
 addtask rust_gen_targets after do_patch before do_compile
-do_rust_gen_targets[dirs] += "${WORKDIR}/targets"
+do_rust_gen_targets[dirs] += "${RUST_TARGETS_DIR}"
 
diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
index 607c51fc3d1..978504052b9 100644
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -18,6 +18,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit cargo pkgconfig
 
+RUST_TARGETGENS = "BUILD HOST TARGET"
+
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
 	# Need to use uninative's loader if enabled/present since the library paths
diff --git a/meta/recipes-devtools/rust/libstd-rs.inc b/meta/recipes-devtools/rust/libstd-rs.inc
index d49383ced58..1498b88f0e2 100644
--- a/meta/recipes-devtools/rust/libstd-rs.inc
+++ b/meta/recipes-devtools/rust/libstd-rs.inc
@@ -12,6 +12,9 @@ DEPENDS:append:libc-musl = " libunwind"
 DEPENDS:remove:riscv32 = "libunwind"
 DEPENDS:remove:riscv64 = "libunwind"
 
+
+RUST_TARGETGENS = "BUILD HOST TARGET"
+
 # Embed bitcode in order to allow compiling both with and without LTO
 RUSTFLAGS += "-Cembed-bitcode=yes"
 # Needed so cargo can find libbacktrace
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 7d1f5347ea7..172cd22657d 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -12,9 +12,6 @@ DEPENDS:append:class-native = " rust-llvm-native"
 
 S = "${RUSTSRC}"
 
-# We generate local targets, and need to be able to locate them
-export RUST_TARGET_PATH="${WORKDIR}/targets/"
-
 export FORCE_CRATE_HASH="${BB_TASKHASH}"
 
 RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
@@ -40,6 +37,8 @@ setup_cargo_environment () {
 
 inherit rust-target-config
 
+RUST_TARGETGENS = "BUILD HOST TARGET"
+
 do_rust_setup_snapshot () {
     for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
         "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
index f3bbeb74ebe..82b1bf9bcef 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
@@ -14,7 +14,7 @@ SECTION = "x11/utils"
 DEPENDS = "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-native"
 BBCLASSEXTEND = "native nativesdk"
 
-inherit gnomebase pixbufcache upstream-version-is-even gobject-introspection rust vala gi-docgen
+inherit cargo_common gnomebase pixbufcache upstream-version-is-even gobject-introspection rust vala gi-docgen
 
 SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch \
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
@@ -29,7 +29,6 @@ BASEDEPENDS:append = " cargo-native"
 
 export RUST_BACKTRACE = "full"
 export RUSTFLAGS
-export RUST_TARGET_PATH
 
 export RUST_TARGET = "${RUST_HOST_SYS}"
 
@@ -38,16 +37,17 @@ RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"
 
+CARGO_DISABLE_BITBAKE_VENDORING = "1"
+do_configure[postfuncs] += "cargo_common_do_configure"
+
+inherit rust-target-config
+
 # rust-cross writes the target linker binary into target json definition without any flags.
 # This breaks here because the linker isn't going to work without at least knowing where
 # the sysroot is. So copy the json to workdir, and patch in the path to wrapper from rust class
 # which supplies the needed flags.
 do_compile:prepend() {
-    cp ${STAGING_LIBDIR_NATIVE}/rustlib/${HOST_SYS}.json ${WORKDIR}
-    cp ${STAGING_LIBDIR_NATIVE}/rustlib/${BUILD_SYS}.json ${WORKDIR}
-    sed -ie 's,"linker": ".*","linker": "${RUST_TARGET_CC}",g' ${WORKDIR}/${RUST_HOST_SYS}.json
-    RUST_TARGET_PATH="${WORKDIR}"
-    export RUST_TARGET_PATH
+    sed -ie 's,"linker": ".*","linker": "${RUST_TARGET_CC}",g' ${RUST_TARGETS_DIR}/${RUST_HOST_SYS}.json
 }
 
 # Issue only on windows
-- 
2.34.1



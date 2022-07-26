Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6B2C00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 14:02:43 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.6975.1658844156744072591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 07:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CEvbz64V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id k11so19842356wrx.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lAKwJa4CMe3kY1CEzzkM+srvCJODwegiwca/ZmooNJk=;
        b=CEvbz64V+M6mvpptjLpBiFn7PR0EYc5VcnXfdb2KQHi+ISjnlEC+Q1AcyYplF+1c+0
         ig5uRM/ziw7Fbvuj0Iva4mpBuSGjkjMu7gbA3g4GTcBXjLwOnJ2pRE3B0+9aBxbqS+pG
         teixxltf+Y2v16xdEGzkvTUrjvwCl/s1f0tbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lAKwJa4CMe3kY1CEzzkM+srvCJODwegiwca/ZmooNJk=;
        b=efcVdyjhZIhMR5tZxMTDfbQWW0Oe9tdTu+SgltaVhxCsEyTBKqFyGOBDtzjjTf3Hab
         sHz6ppK+EI4VUbrtDfFquOZpl8o4lO/SqQzSUjnvfL9tZ/5fbhszUsMnP8ngBm8vHwuE
         ash9VH9cNgc5qVDk/mBAAEy3iU0oeMusiaGdG9frCRtaAqMHjaxZHzhj/tGyKNo5GFsO
         tK8v4zily5fiOiRhKBR/4luzJIlzLKzdKxhq7ecxoRxDL8vYsjyG3sJ4tT8bOhZnNc7r
         U5Hy/o/t77KoDrB6IVNQPaf45jwbdtgFHWNbZIvG7lNRYmq23YyxmkmHk7l8mKa2qEsW
         dTMA==
X-Gm-Message-State: AJIora+DtG/jcl3pyFsH17pW0h6jEtTTeH7GvLqu0wY+JwuHr2SY7iUZ
	WBxCvCrBcDfWa+sPutzuzareuan/4y8Iww==
X-Google-Smtp-Source: 
 AGRyM1uG09r6DK7LlbIk+uCCTUq0EDn7TKtsgkvmx3mAp2U8IIxrw6ryxMZWPwG0ox6UCj6islreJQ==
X-Received: by 2002:a05:6000:15c6:b0:21d:a96b:8ffd with SMTP id
 y6-20020a05600015c600b0021da96b8ffdmr11665967wry.610.1658844153793;
        Tue, 26 Jul 2022 07:02:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:289a:8162:dbfe:813c])
        by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b0021e4829d359sm14467577wrx.39.2022.07.26.07.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:02:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: [PATCH RFC v2] rust: Rework and improve so SDK and target versions
 work
Date: Tue, 26 Jul 2022 15:02:31 +0100
Message-Id: <20220726140231.2259380-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 14:02:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168506

This patch:
* Uses RUST_{BUILD|HOST|TARGET}_SYS everywhere consistently within rust context
* Moves the on target libraries to rust's "sysroot" layout so the SDK can find
  libraries without prompting
* Moves the target SDK libraries into the target sysroot rather than the native one
* Enables the target rustc compiler to be built
* Replaces cargo-cross-canadian with nativesdk-cargo

* Drops rust-cross-XXX and uses rust-target-config to generate json config
  in each WORKDIR
* Add nativeksdk-rust as the SDK compiler
* Simplifies rust-cross-canadian-XXX to be the environment and json config
  for the target only (no binaries)
* Drop rust-crosssdk since it isnt needed now
* Drop a lot of the virtual/ compiler dependency mess since we don't need it
* Cargo cross-canadian environment config is compiled with rust-cross-canadian
* Adds RUST_{BUILD|HOST|TARGET}_SYS to the variable ignore list for hash purposes
  (since it should be accounted for in the build paths)
* Adds a slightly hacky approach to make target llvm-config work which removes
  the need for patching llvm.
* Drop rust-tools-cross-canadian and just build the tools as part of the main
  rust/nativesdk-rust recipe to avoid rebuilding large chunks of the toolchain

Work still remaining:
* Fully clean up the dependency simplification and removal of the virutal/
  code.
* Remove RUST_TARGETGENS since I think it is the same everywhere now
* The rust recipe doesn't need to always build stage0
* The rust recipe doesn't need to always build libstd-rs since
  we have a separate recipe. May drop the separate recipe and just copy
  the pieces out of the target rust build
* Maybe drop RUSTC variable, not sure it is used?
* Delete now unneeded rust-llvm llcm-config patch

Adding to an SDK looks like: TOOLCHAIN_LANGS += "rust"

Known issues:
* rust target compiler fails for musl:
  https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5574
  https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5588
* rust target packages have buildpaths warnings:
  https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5585/steps/11/logs/stdio
* mips n32 target rust config and libstd-rs fails:
  https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5607
* May be multilib variant issues:
  https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/5503
  https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3280
* Sundeep reported ld loader symbol relocation issues for libstdc++
* Breaks mingw build as currently configured
  https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/5591

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cargo.bbclass                    | 11 ++-
 meta/classes/cargo_common.bbclass             | 15 ++-
 meta/classes/python_pyo3.bbclass              |  2 +-
 meta/classes/rust-bin.bbclass                 |  1 -
 meta/classes/rust-common.bbclass              | 56 ++++-------
 meta/classes/rust-target-config.bbclass       | 30 +++---
 meta/classes/rust.bbclass                     |  6 +-
 meta/conf/bitbake.conf                        |  2 +-
 meta/conf/distro/include/maintainers.inc      |  4 -
 .../packagegroup-rust-cross-canadian.bb       |  9 +-
 .../cargo/cargo-cross-canadian.inc            | 85 ----------------
 .../cargo/cargo-cross-canadian_1.62.0.bb      |  6 --
 meta/recipes-devtools/cargo/cargo.inc         |  7 ++
 meta/recipes-devtools/cargo/cargo_1.62.0.bb   |  1 +
 meta/recipes-devtools/rust/libstd-rs.inc      |  9 +-
 .../rust/rust-cross-canadian-common.inc       | 49 ----------
 .../rust/rust-cross-canadian.inc              | 96 +++++++++----------
 .../rust/rust-cross-canadian_1.62.0.bb        |  8 +-
 meta/recipes-devtools/rust/rust-cross.inc     | 47 ---------
 .../rust/rust-cross_1.62.0.bb                 |  8 --
 .../rust/rust-crosssdk_1.62.0.bb              |  8 --
 meta/recipes-devtools/rust/rust-llvm.inc      |  9 +-
 meta/recipes-devtools/rust/rust-target.inc    |  2 +-
 .../rust/rust-tools-cross-canadian.inc        | 38 --------
 .../rust/rust-tools-cross-canadian_1.62.0.bb  |  6 --
 meta/recipes-devtools/rust/rust.inc           | 73 +++++++-------
 meta/recipes-devtools/rust/rust_1.62.0.bb     | 52 +++++++++-
 meta/recipes-gnome/librsvg/librsvg_2.54.4.bb  | 16 ++--
 28 files changed, 226 insertions(+), 430 deletions(-)
 delete mode 100644 meta/recipes-devtools/cargo/cargo-cross-canadian.inc
 delete mode 100644 meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb
 delete mode 100644 meta/recipes-devtools/rust/rust-cross-canadian-common.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-cross.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-cross_1.62.0.bb
 delete mode 100644 meta/recipes-devtools/rust/rust-crosssdk_1.62.0.bb
 delete mode 100644 meta/recipes-devtools/rust/rust-tools-cross-canadian.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.0.bb

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
index 4a780a501ff..4438d654f40 100644
--- a/meta/classes/cargo.bbclass
+++ b/meta/classes/cargo.bbclass
@@ -4,6 +4,7 @@
 ## Cargo.
 
 inherit cargo_common
+inherit rust-target-config
 
 # the binary we will use
 CARGO = "cargo"
@@ -12,8 +13,8 @@ CARGO = "cargo"
 BASEDEPENDS:append = " cargo-native"
 
 # Ensure we get the right rust variant
-DEPENDS:append:class-target = " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
-DEPENDS:append:class-nativesdk = " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
+DEPENDS:append:class-target = " rust-native ${RUSTLIB_DEP}"
+DEPENDS:append:class-nativesdk = " rust-native ${RUSTLIB_DEP}"
 DEPENDS:append:class-native = " rust-native"
 
 # Enable build separation
@@ -32,17 +33,17 @@ MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_BUILD_FLAGS = "-v --target ${HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
+CARGO_BUILD_FLAGS = "-v --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
 BUILD_DIR = "${@['release', 'debug'][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_TARGET_SUBDIR="${HOST_SYS}/${BUILD_DIR}"
+CARGO_TARGET_SUBDIR="${RUST_HOST_SYS}/${BUILD_DIR}"
 oe_cargo_build () {
 	export RUSTFLAGS="${RUSTFLAGS}"
 	export RUST_TARGET_PATH="${RUST_TARGET_PATH}"
 	bbnote "cargo = $(which ${CARGO})"
-	bbnote "rustc = $(which ${RUSTC})"
+	bbnote $RUST_TARGET_PATH
 	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
 	"${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
 }
diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
index 39f32829fd4..4a419cdd0a3 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -69,19 +69,28 @@ cargo_common_do_configure () {
 	cat <<- EOF >> ${CARGO_HOME}/config
 
 	# HOST_SYS
-	[target.${HOST_SYS}]
+	[target.${RUST_HOST_SYS}]
 	linker = "${CARGO_RUST_TARGET_CCLD}"
 	EOF
 
-	if [ "${HOST_SYS}" != "${BUILD_SYS}" ]; then
+	if [ "${RUST_HOST_SYS}" != "${RUST_BUILD_SYS}" ]; then
 		cat <<- EOF >> ${CARGO_HOME}/config
 
 		# BUILD_SYS
-		[target.${BUILD_SYS}]
+		[target.${RUST_BUILD_SYS}]
 		linker = "${RUST_BUILD_CCLD}"
 		EOF
 	fi
 
+	if [ "${RUST_TARGET_SYS}" != "${RUST_BUILD_SYS}" -a "${RUST_TARGET_SYS}" != "${RUST_HOST_SYS}"]; then
+		cat <<- EOF >> ${CARGO_HOME}/config
+
+		# TARGET_SYS
+		[target.${RUST_TARGET_SYS}]
+		linker = "${RUST_TARGET_CCLD}"
+		EOF
+	fi
+
 	# Put build output in build directory preferred by bitbake instead of
 	# inside source directory unless they are the same
 	if [ "${B}" != "${S}" ]; then
diff --git a/meta/classes/python_pyo3.bbclass b/meta/classes/python_pyo3.bbclass
index 10cc3a06457..b41e3ba0752 100644
--- a/meta/classes/python_pyo3.bbclass
+++ b/meta/classes/python_pyo3.bbclass
@@ -8,7 +8,7 @@ inherit cargo python3-dir siteinfo
 export PYO3_CROSS="1"
 export PYO3_CROSS_PYTHON_VERSION="${PYTHON_BASEVERSION}"
 export PYO3_CROSS_LIB_DIR="${STAGING_LIBDIR}"
-export CARGO_BUILD_TARGET="${HOST_SYS}"
+export CARGO_BUILD_TARGET="${RUST_HOST_SYS}"
 export RUSTFLAGS
 export PYO3_PYTHON="${PYTHON}"
 export PYO3_CONFIG_FILE="${WORKDIR}/pyo3.config"
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
index cb811ac5da7..d6a6cb0b1e1 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -1,39 +1,18 @@
 inherit python3native
+inherit rust-target-config
 
 # Common variables used by all Rust builds
-export rustlibdir = "${libdir}/rust"
+export rustlibdir = "${libdir}/rustlib/${RUST_HOST_SYS}/lib"
 FILES:${PN} += "${rustlibdir}/*.so"
 FILES:${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg += "${rustlibdir}/.debug"
 
-RUSTLIB = "-L ${STAGING_LIBDIR}/rust"
+RUSTLIB = "-L ${STAGING_DIR_HOST}${rustlibdir}"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ?= "libstd-rs"
-export RUST_TARGET_PATH = "${STAGING_LIBDIR_NATIVE}/rustlib"
 RUST_PANIC_STRATEGY ?= "unwind"
 
-# Native builds are not effected by TCLIBC. Without this, rust-native
-# thinks it's "target" (i.e. x86_64-linux) is a musl target.
-RUST_LIBC = "${TCLIBC}"
-RUST_LIBC:class-crosssdk = "glibc"
-RUST_LIBC:class-native = "glibc"
-
-def determine_libc(d, thing):
-    '''Determine which libc something should target'''
-
-    # BUILD is never musl, TARGET may be musl or glibc,
-    # HOST could be musl, but only if a compiler is built to be run on
-    # target in which case HOST_SYS != BUILD_SYS.
-    if thing == 'TARGET':
-        libc = d.getVar('RUST_LIBC')
-    elif thing == 'BUILD' and (d.getVar('HOST_SYS') != d.getVar('BUILD_SYS')):
-        libc = d.getVar('RUST_LIBC')
-    else:
-        libc = d.getVar('RUST_LIBC:class-native')
-
-    return libc
-
 def target_is_armv7(d):
     '''Determine if target is armv7'''
     # TUNE_FEATURES may include arm* even if the target is not arm
@@ -63,31 +42,28 @@ def rust_base_triple(d, thing):
     '''
 
     # The llvm-target for armv7 is armv7-unknown-linux-gnueabihf
-    if thing == "TARGET" and target_is_armv7(d):
+    if d.getVar('{}_ARCH'.format(thing)) == d.getVar('TARGET_ARCH') and target_is_armv7(d):
         arch = "armv7"
     else:
         arch = oe.rust.arch_to_rust_arch(d.getVar('{}_ARCH'.format(thing)))
 
-    # All the Yocto targets are Linux and are 'unknown'
-    vendor = "-unknown"
-    os = d.getVar('{}_OS'.format(thing))
-    libc = determine_libc(d, thing)
+    # When bootstrapping rust-native, BUILD must be the same as upstream snapshot tarballs
+    pn = d.getVar('PN')
+    if thing == "BUILD" and pn in ["rust-native", "nativesdk-rust", "nativesdk-rust-tools", "rust", "rust-tools"]:
+        return arch + "-unknown-linux-gnu"
 
-    # Prefix with a dash and convert glibc -> gnu
-    if libc == "glibc":
-        libc = "-gnu"
-    elif libc == "musl":
-        libc = "-musl"
-
-    # Don't double up musl (only appears to be the case on aarch64)
-    if os == "linux-musl":
-        if libc != "-musl":
-            bb.fatal("{}_OS was '{}' but TCLIBC was not 'musl'".format(thing, os))
-        os = "linux"
+    vendor = d.getVar('{}_VENDOR'.format(thing))
 
+    # Default to glibc
+    libc = "-gnu"
+    os = d.getVar('{}_OS'.format(thing))
     # This catches ARM targets and appends the necessary hard float bits
     if os == "linux-gnueabi" or os == "linux-musleabi":
         libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf', '', d)
+    elif "musl" in os:
+        libc = "-musl"
+        os = "linux"
+
     return arch + vendor + '-' + os + libc
 
 
diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-target-config.bbclass
index 87b7dee3edc..5450813bf38 100644
--- a/meta/classes/rust-target-config.bbclass
+++ b/meta/classes/rust-target-config.bbclass
@@ -283,14 +283,21 @@ llvm_cpu[vardepvalue] = "${@llvm_cpu(d)}"
 
 def rust_gen_target(d, thing, wd, arch):
     import json
+
+    build_sys = d.getVar('BUILD_SYS')
+    target_sys = d.getVar('TARGET_SYS')
+
     sys = d.getVar('{}_SYS'.format(thing))
     prefix = d.getVar('{}_PREFIX'.format(thing))
+    rustsys = d.getVar('RUST_{}_SYS'.format(thing))
 
     abi = None
     cpu = "generic"
     features = ""
 
-    if thing == "TARGET":
+    # Need to apply the target tuning conssitently, only if the triplet applies to the target
+    # and not in the native case
+    if sys == target_sys and sys != build_sys:
         abi = d.getVar('ABIEXTENSION')
         cpu = llvm_cpu(d)
         if bb.data.inherits_class('native', d):
@@ -311,14 +318,12 @@ def rust_gen_target(d, thing, wd, arch):
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
+    if tspec['data-layout'] is None:
+        bb.fatal("No rust target defined for %s" % arch_abi)
     tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
     tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
@@ -349,18 +354,21 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['panic-strategy'] = d.getVar("RUST_PANIC_STRATEGY")
 
     # write out the target spec json file
-    with open(wd + sys + '.json', 'w') as f:
+    with open(wd + rustsys + '.json', 'w') as f:
         json.dump(tspec, f, indent=4)
 
 # These are accounted for in tmpdir path names so don't need to be in the task sig
-rust_gen_target[vardepsexclude] += "RUST_HOST_SYS RUST_TARGET_SYS ABIEXTENSION llvm_cpu"
+rust_gen_target[vardepsexclude] += "ABIEXTENSION llvm_cpu"
 
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
@@ -370,5 +378,5 @@ python do_rust_gen_targets () {
 }
 
 addtask rust_gen_targets after do_patch before do_compile
-do_rust_gen_targets[dirs] += "${WORKDIR}/targets"
+do_rust_gen_targets[dirs] += "${RUST_TARGETS_DIR}"
 
diff --git a/meta/classes/rust.bbclass b/meta/classes/rust.bbclass
index 5c8938d09fe..2639cecfd43 100644
--- a/meta/classes/rust.bbclass
+++ b/meta/classes/rust.bbclass
@@ -2,7 +2,7 @@ inherit rust-common
 
 RUSTC = "rustc"
 
-RUSTC_ARCHFLAGS += "--target=${HOST_SYS} ${RUSTFLAGS}"
+RUSTC_ARCHFLAGS += "--target=${RUST_HOST_SYS} ${RUSTFLAGS}"
 
 def rust_base_dep(d):
     # Taken from meta/classes/base.bbclass `base_dep_prepend` and modified to
@@ -10,7 +10,7 @@ def rust_base_dep(d):
     deps = ""
     if not d.getVar('INHIBIT_DEFAULT_RUST_DEPS'):
         if (d.getVar('HOST_SYS') != d.getVar('BUILD_SYS')):
-            deps += " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
+            deps += " rust-native ${RUSTLIB_DEP}"
         else:
             deps += " rust-native"
     return deps
@@ -37,7 +37,7 @@ HOST_CFLAGS   ?= "${CFLAGS}"
 HOST_CXXFLAGS ?= "${CXXFLAGS}"
 HOST_CPPFLAGS ?= "${CPPFLAGS}"
 
-rustlib_suffix="${TUNE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/rustlib/${HOST_SYS}/lib"
+rustlib_suffix="${TUNE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/rustlib/${RUST_HOST_SYS}/lib"
 # Native sysroot standard library path
 rustlib_src="${prefix}/lib/${rustlib_suffix}"
 # Host sysroot standard library path
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1d36aae8b35..bdfb6784371 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -943,7 +943,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
     OMP_NUM_THREADS BB_CURRENTTASK"
 BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \
-    SSTATE_DIR SOURCE_DATE_EPOCH"
+    SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGET_SYS"
 BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUGH_ADDITIONS DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e20275c6746..c0c38dfc165 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -90,7 +90,6 @@ RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-cairo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-cargo = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-cargo-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
@@ -718,12 +717,9 @@ RECIPE_MAINTAINER:pn-rt-tests = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-cross-${TUNE_PKGARCH}-${TCLIBC} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-crosssdk-${SDK_ARCH}-glibc = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-llvm = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-tools-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-sato-icon-theme = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
index 0d4f5ec9ef2..42f85f0eb38 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
@@ -6,13 +6,12 @@ inherit cross-canadian packagegroup
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 RUST="rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-CARGO="cargo-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-RUST_TOOLS="rust-tools-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 RDEPENDS:${PN} = " \
     ${@all_multilib_tune_values(d, 'RUST')} \
-    ${@all_multilib_tune_values(d, 'CARGO')} \
-    rust-cross-canadian-src \
-    ${@all_multilib_tune_values(d, 'RUST_TOOLS')} \
+    nativesdk-rust \
+    nativesdk-cargo \
+    nativesdk-rust-tools-clippy \
+    nativesdk-rust-tools-rustfmt \
 "
 
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
deleted file mode 100644
index a2fac929d45..00000000000
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
+++ /dev/null
@@ -1,85 +0,0 @@
-SUMMARY = "Cargo, a package manager for Rust cross canadian flavor."
-
-RUST_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
-
-HOST_SYS = "${HOST_ARCH}-unknown-linux-gnu"
-CARGO_RUST_TARGET_CCLD = "${RUST_BUILD_CCLD}"
-
-inherit rust-target-config
-require cargo.inc
-
-CARGO = "${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo"
-BASEDEPENDS:remove = "cargo-native"
-
-export RUST_TARGET_PATH="${WORKDIR}/targets/"
-
-RUSTLIB = " \
-	-L ${STAGING_DIR_NATIVE}/${SDKPATHNATIVE}/usr/lib/${TARGET_SYS}/rustlib/${HOST_SYS}/lib \
-"
-
-DEPENDS += "rust-native \
-            rust-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-            virtual/nativesdk-${HOST_PREFIX}compilerlibs \
-            nativesdk-openssl nativesdk-zlib \
-            virtual/nativesdk-libc \
-"
-
-inherit cross-canadian
-
-PN = "cargo-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-RUST_TARGETGENS = "BUILD HOST"
-
-do_compile:prepend () {
-	PKG_CONFIG_PATH="${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
-}
-
-create_sdk_wrapper () {
-        file="$1"
-        shift
-
-        cat <<- EOF > "${file}"
-		#!/bin/sh
-		\$$1 \$@
-		EOF
-
-        chmod +x "$file"
-}
-
-do_install () {
-    SYS_BINDIR=$(dirname ${D}${bindir})
-    install -d "${SYS_BINDIR}"
-    install -m 755 "${B}/target/${CARGO_TARGET_SUBDIR}/cargo" "${SYS_BINDIR}"
-    for i in ${SYS_BINDIR}/*; do
-	chrpath -r "\$ORIGIN/../lib" ${i}
-    done
-
-    # Uses SDK's CC as linker so linked binaries works out of box.
-    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld" "CC"
-
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
-    mkdir "${ENV_SETUP_DIR}"
-    ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
-    cat <<- EOF > "${ENV_SETUP_SH}"
-	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
-	mkdir -p "\$CARGO_HOME"
-        # Init the default target once, it might be otherwise user modified.
-	if [ ! -f "\$CARGO_HOME/config" ]; then
-		touch "\$CARGO_HOME/config"
-		echo "[build]" >> "\$CARGO_HOME/config"
-		echo 'target = "'${TARGET_SYS}'"' >> "\$CARGO_HOME/config"
-		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
-		echo '[target.'${TARGET_SYS}']' >> "\$CARGO_HOME/config"
-		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
-    fi
-
-	# Keep the below off as long as HTTP/2 is disabled.
-	export CARGO_HTTP_MULTIPLEXING=false
-
-	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
-	EOF
-}
-
-PKG_SYS_BINDIR = "${SDKPATHNATIVE}/usr/bin"
-FILES:${PN} += "${base_prefix}/environment-setup.d ${PKG_SYS_BINDIR}"
-
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb b/meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb
deleted file mode 100644
index 63fd69107be..00000000000
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require recipes-devtools/rust/rust-source.inc
-require recipes-devtools/rust/rust-snapshot.inc
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/cargo-${PV}:"
-
-require cargo-cross-canadian.inc
diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
index 607c51fc3d1..e34554a9d78 100644
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -18,6 +18,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit cargo pkgconfig
 
+RUST_TARGETGENS = "BUILD HOST TARGET"
+
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
 	# Need to use uninative's loader if enabled/present since the library paths
@@ -54,3 +56,8 @@ export LIBSSH2_SYS_USE_PKG_CONFIG = "1"
 # so we must use the locally set up snapshot to bootstrap the build.
 BASEDEPENDS:remove:class-native = "cargo-native"
 CARGO:class-native = "${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo"
+
+DEPENDS:append:class-nativesdk = " nativesdk-rust"
+RUSTLIB:append:class-nativesdk = " -L ${STAGING_DIR_HOST}/${SDKPATHNATIVE}/usr/lib/rustlib/${RUST_HOST_SYS}/lib"
+
+
diff --git a/meta/recipes-devtools/cargo/cargo_1.62.0.bb b/meta/recipes-devtools/cargo/cargo_1.62.0.bb
index eee58fc2452..5c8527708cb 100644
--- a/meta/recipes-devtools/cargo/cargo_1.62.0.bb
+++ b/meta/recipes-devtools/cargo/cargo_1.62.0.bb
@@ -2,3 +2,4 @@ require recipes-devtools/rust/rust-source.inc
 require recipes-devtools/rust/rust-snapshot.inc
 require cargo.inc
 BBCLASSEXTEND = "native nativesdk"
+RUSTLIB_DEP:class-nativesdk = ""
\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/libstd-rs.inc b/meta/recipes-devtools/rust/libstd-rs.inc
index 987956344a2..60af77db76b 100644
--- a/meta/recipes-devtools/rust/libstd-rs.inc
+++ b/meta/recipes-devtools/rust/libstd-rs.inc
@@ -7,11 +7,16 @@ LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
 RUSTLIB_DEP = ""
 inherit cargo
 
+DEPENDS += "rust-native"
+
 DEPENDS:append:libc-musl = " libunwind"
 # rv32 does not have libunwind ported yet
 DEPENDS:remove:riscv32 = "libunwind"
 DEPENDS:remove:riscv64 = "libunwind"
 
+
+RUST_TARGETGENS = "BUILD HOST TARGET"
+
 # Embed bitcode in order to allow compiling both with and without LTO
 RUSTFLAGS += "-Cembed-bitcode=yes"
 # Needed so cargo can find libbacktrace
@@ -35,6 +40,6 @@ do_install () {
     # With the incremental build support added in 1.24, the libstd deps directory also includes dependency
     # files that get installed. Those are really only needed to incrementally rebuild the libstd library
     # itself and don't need to be installed.
-    rm -f ${B}/${TARGET_SYS}/${BUILD_DIR}/deps/*.d
-    cp ${B}/${TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
+    rm -f ${B}/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/*.d
+    cp ${B}/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
 }
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
deleted file mode 100644
index 34020ff6ff4..00000000000
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ /dev/null
@@ -1,49 +0,0 @@
-
-RUST_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
-
-require rust.inc
-
-DEPENDS += "rust-llvm (=${PV})"
-
-inherit cross-canadian
-
-DEPENDS += "  \
-            virtual/${HOST_PREFIX}gcc-crosssdk \
-            virtual/nativesdk-libc rust-llvm-native \
-            virtual/${TARGET_PREFIX}compilerlibs \
-            virtual/nativesdk-${HOST_PREFIX}compilerlibs \
-            gcc-cross-${TARGET_ARCH} \
-           "
-
-# The host tools are likely not to be able to do the necessary operation on
-# the target architecturea. Alternatively one could check compatibility
-# between host/target.
-EXCLUDE_FROM_SHLIBS_${RUSTLIB_TARGET_PN} = "1"
-
-DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-                    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
-                    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
-                    "
-
-RUST_TARGETGENS = "BUILD HOST TARGET"
-
-INHIBIT_DEFAULT_RUST_DEPS = "1"
-
-export WRAPPER_TARGET_CC = "${CCACHE}${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TARGET_CC_ARCH} ${SECURITY_NOPIE_CFLAGS}"
-export WRAPPER_TARGET_CXX = "${CCACHE}${TARGET_PREFIX}g++ --sysroot=${STAGING_DIR_TARGET} ${TARGET_CC_ARCH} ${SECURITY_NOPIE_CFLAGS}"
-export WRAPPER_TARGET_CCLD = "${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TARGET_CC_ARCH} ${SECURITY_NOPIE_CFLAGS}"
-export WRAPPER_TARGET_LDFLAGS = "${TARGET_LDFLAGS}"
-export WRAPPER_TARGET_AR = "${TARGET_PREFIX}ar"
-
-python do_configure:prepend() {
-    targets = [d.getVar("TARGET_SYS", True), "{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
-    hosts = ["{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
-}
-
-INSANE_SKIP:${RUSTLIB_TARGET_PN} = "file-rdeps arch ldflags"
-SKIP_FILEDEPS:${RUSTLIB_TARGET_PN} = "1"
-
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 8bbbd61bdc3..2b09661542d 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -1,78 +1,70 @@
+PN = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-require rust-cross-canadian-common.inc
+inherit rust-target-config
+inherit rust-common
 
-RUSTLIB_TARGET_PN = "rust-cross-canadian-rustlib-target-${TRANSLATED_TARGET_ARCH}"
-RUSTLIB_HOST_PN = "rust-cross-canadian-rustlib-host-${TRANSLATED_TARGET_ARCH}"
-RUSTLIB_SRC_PN = "rust-cross-canadian-src"
-RUSTLIB_PKGS = "${RUSTLIB_SRC_PN} ${RUSTLIB_TARGET_PN} ${RUSTLIB_HOST_PN}"
-PN = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+LICENSE = "MIT"
+
+MODIFYTOS = "0"
+
+create_sdk_wrapper () {
+        file="$1"
+        shift
 
-PACKAGES = "${RUSTLIB_PKGS} ${PN}"
-RDEPENDS:${PN} += "${RUSTLIB_PKGS}"
+        cat <<- EOF > "${file}"
+		#!/bin/sh
+		\$$1 \$@
+		EOF
 
-# The default behaviour of x.py changed in 1.47+ so now we need to
-# explicitly ask for the stage 2 compiler to be assembled.
-do_compile () {
-    rust_runx build --stage 2
+        chmod +x "$file"
 }
 
 do_install () {
     # Rust requires /usr/lib to contain the libs.
-    # Similar story is with /usr/bin ruquiring  `lib` to be at the same level.
     # The required structure is retained for simplicity.
     SYS_LIBDIR=$(dirname ${D}${libdir})
     SYS_BINDIR=$(dirname ${D}${bindir})
     RUSTLIB_DIR=${SYS_LIBDIR}/${TARGET_SYS}/rustlib
 
-    install -d "${SYS_BINDIR}"
-    cp build/${SNAPSHOT_BUILD_SYS}/stage2/bin/* ${SYS_BINDIR}
-    for i in ${SYS_BINDIR}/*; do
-	chrpath -r "\$ORIGIN/../lib" ${i}
-    done
-
-    install -d "${D}${libdir}"
-    cp -pRd build/${SNAPSHOT_BUILD_SYS}/stage2/lib/${TARGET_SYS}/*.so ${SYS_LIBDIR}
-    cp -pRd build/${SNAPSHOT_BUILD_SYS}/stage2/lib/${TARGET_SYS}/rustlib ${RUSTLIB_DIR}
-
-    for i in ${SYS_LIBDIR}/*.so; do
-	chrpath -r "\$ORIGIN/../lib" ${i}
-    done
-    for i in ${RUSTLIB_DIR}/*/lib/*.so; do
-	chrpath -d ${i}
-    done
-
-    install -m 0644 "${WORKDIR}/targets/${TARGET_SYS}.json" "${RUSTLIB_DIR}"
-
-    SRC_DIR=${RUSTLIB_DIR}/src/rust
-    install -d ${SRC_DIR}/src/llvm-project
-    cp -R --no-dereference build/${SNAPSHOT_BUILD_SYS}/stage2/lib/rustlib/src/rust/src/llvm-project/libunwind ${SRC_DIR}/src/llvm-project
-    cp -R --no-dereference build/${SNAPSHOT_BUILD_SYS}/stage2/lib/rustlib/src/rust/library ${SRC_DIR}
-    cp --no-dereference build/${SNAPSHOT_BUILD_SYS}/stage2/lib/rustlib/src/rust/Cargo.lock ${SRC_DIR}
-    # Remove executable bit from any files so then SDK doesn't try to relocate.
-    chmod -R -x+X ${SRC_DIR}
+    install -d ${RUSTLIB_DIR}
+    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_HOST_SYS}.json" "${RUSTLIB_DIR}"
+    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_TARGET_SYS}.json" "${RUSTLIB_DIR}"
+
+    # Uses SDK's CC as linker so linked binaries works out of box.
+    install -d ${SYS_BINDIR}
+    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld" "CC"
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
     ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
     cat <<- EOF > "${ENV_SETUP_SH}"
-	export RUSTFLAGS="--sysroot=\$OECORE_NATIVE_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib/${TARGET_SYS}/lib"
+	export RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
     chown -R root.root ${D}
+
+    ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    cat <<- EOF > "${ENV_SETUP_SH}"
+	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
+	mkdir -p "\$CARGO_HOME"
+        # Init the default target once, it might be otherwise user modified.
+	if [ ! -f "\$CARGO_HOME/config" ]; then
+		touch "\$CARGO_HOME/config"
+		echo "[build]" >> "\$CARGO_HOME/config"
+		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
+		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
+		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
+		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
+    fi
+
+	# Keep the below off as long as HTTP/2 is disabled.
+	export CARGO_HTTP_MULTIPLEXING=false
+
+	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
+	EOF
 }
 
-PKG_SYS_LIBDIR = "${SDKPATHNATIVE}/usr/lib"
-PKG_SYS_BINDIR = "${SDKPATHNATIVE}/usr/bin"
-PKG_RUSTLIB_DIR = "${PKG_SYS_LIBDIR}/${TARGET_SYS}/rustlib"
-FILES:${PN} = "${PKG_SYS_LIBDIR}/*.so ${PKG_SYS_BINDIR} ${base_prefix}/environment-setup.d"
-FILES:${RUSTLIB_TARGET_PN} = "${PKG_RUSTLIB_DIR}/${TARGET_SYS} ${PKG_RUSTLIB_DIR}/${TARGET_SYS}.json"
-FILES:${RUSTLIB_HOST_PN} = "${PKG_RUSTLIB_DIR}/${BUILD_ARCH}-unknown-linux-gnu"
-FILES:${RUSTLIB_SRC_PN} = "${PKG_RUSTLIB_DIR}/src"
-
-SUMMARY:${RUSTLIB_TARGET_PN} = "Rust cross canadian libaries for ${TARGET_SYS}"
-SUMMARY:${RUSTLIB_HOST_PN} = "Rust cross canadian libaries for ${HOST_SYS}"
-SUMMARY:${RUSTLIB_SRC_PN} = "Rust standard library sources for cross canadian toolchain"
-SUMMARY:${PN} = "Rust crost canadian compiler"
+FILES:${PN} += "${base_prefix}/environment-setup.d"
 
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb
index 766912c019b..55865238ab4 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb
+++ b/meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb
@@ -1,6 +1,2 @@
-require rust-cross-canadian.inc
-require rust-source.inc
-require rust-snapshot.inc
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/rust:"
-
+inherit cross-canadian
+require rust-cross-canadian.inc
\ No newline at end of file
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
diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtools/rust/rust-llvm.inc
index 9baad12dc8e..625eb570416 100644
--- a/meta/recipes-devtools/rust/rust-llvm.inc
+++ b/meta/recipes-devtools/rust/rust-llvm.inc
@@ -47,6 +47,13 @@ EXTRA_OECMAKE:append:class-target = "\
     -DLLVM_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config \
 "
 
+EXTRA_OECMAKE:append:class-nativesdk = "\
+    -DCMAKE_CROSSCOMPILING:BOOL=ON \
+    -DLLVM_BUILD_TOOLS=OFF \
+    -DLLVM_TABLEGEN=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen \
+    -DLLVM_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config \
+"
+
 # The debug symbols are huge here (>2GB) so suppress them since they
 # provide almost no value. If you really need them then override this
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
@@ -68,4 +75,4 @@ FILES:${PN}-staticdev =+ "${libdir}/llvm-rust/*/*.a"
 FILES:${PN} += "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.* ${libdir}/llvm-rust/bin"
 FILES:${PN}-dev += "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${libdir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cmake"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
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
index ecb057ad3b5..5addaa2df34 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -9,17 +9,16 @@ inherit cargo_common
 
 DEPENDS += "file-native python3-native"
 DEPENDS:append:class-native = " rust-llvm-native"
+DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"
 
 S = "${RUSTSRC}"
 
-# We generate local targets, and need to be able to locate them
-export RUST_TARGET_PATH="${WORKDIR}/targets/"
-
 export FORCE_CRATE_HASH="${BB_TASKHASH}"
 
 RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
-export YOCTO_ALTERNATE_EXE_PATH = "${RUST_ALTERNATE_EXE_PATH}"
-export YOCTO_ALTERNATE_MULTILIB_NAME = "/${BASELIB}"
+RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
+
+RUST_HOST_ARCH = "${@oe.rust.arch_to_rust_arch(d.getVar('HOST_ARCH'))}"
 
 # We don't want to use bitbakes vendoring because the rust sources do their
 # own vendoring.
@@ -27,20 +26,18 @@ CARGO_DISABLE_BITBAKE_VENDORING = "1"
 
 # We can't use RUST_BUILD_SYS here because that may be "musl" if
 # TCLIBC="musl". Snapshots are always -unknown-linux-gnu
-SNAPSHOT_BUILD_SYS = "${RUST_BUILD_ARCH}-unknown-linux-gnu"
 setup_cargo_environment () {
     # The first step is to build bootstrap and some early stage tools,
     # these are build for the same target as the snapshot, e.g.
     # x86_64-unknown-linux-gnu.
     # Later stages are build for the native target (i.e. target.x86_64-linux)
     cargo_common_do_configure
-
-    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
-    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
 }
 
 inherit rust-target-config
 
+RUST_TARGETGENS = "BUILD HOST TARGET"
+
 do_rust_setup_snapshot () {
     for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
         "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
@@ -79,24 +76,35 @@ python do_configure() {
     config = configparser.RawConfigParser()
 
     # [target.ARCH-poky-linux]
-    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
-    config.add_section(target_section)
+    host_section = "target.{}".format(d.getVar('RUST_HOST_SYS', True))
+    config.add_section(host_section)
 
-    llvm_config = d.expand("${YOCTO_ALTERNATE_EXE_PATH}")
-    config.set(target_section, "llvm-config", e(llvm_config))
+    llvm_config_target = d.expand("${RUST_ALTERNATE_EXE_PATH}")
+    llvm_config_build = d.expand("${RUST_ALTERNATE_EXE_PATH_NATIVE}")
+    config.set(host_section, "llvm-config", e(llvm_config_target))
 
-    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
-    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+    config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+    config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
 
     # If we don't do this rust-native will compile it's own llvm for BUILD.
     # [target.${BUILD_ARCH}-unknown-linux-gnu]
-    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
-    config.add_section(target_section)
+    build_section = "target.{}".format(d.getVar('RUST_BUILD_SYS', True))
+    if build_section != host_section:
+        config.add_section(build_section)
+
+        config.set(build_section, "llvm-config", e(llvm_config_build))
+
+        config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
+        config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+
+    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
+    if target_section != host_section and target_section != build_section:
+        config.add_section(target_section)
 
-    config.set(target_section, "llvm-config", e(llvm_config))
+        config.set(target_section, "llvm-config", e(llvm_config_target))
 
-    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
-    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+        config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+        config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
 
     # [llvm]
     config.add_section("llvm")
@@ -128,16 +136,16 @@ python do_configure() {
     config.set("build", "vendor", e(True))
 
     if not "targets" in locals():
-        targets = [d.getVar("TARGET_SYS", True)]
+        targets = [d.getVar("RUST_TARGET_SYS", True)]
     config.set("build", "target", e(targets))
 
     if not "hosts" in locals():
-        hosts = [d.getVar("HOST_SYS", True)]
+        hosts = [d.getVar("RUST_HOST_SYS", True)]
     config.set("build", "host", e(hosts))
 
     # We can't use BUILD_SYS since that is something the rust snapshot knows
     # nothing about when trying to build some stage0 tools (like fabricate)
-    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
+    config.set("build", "build", e(d.getVar("RUST_BUILD_SYS", True)))
 
     # [install]
     config.add_section("install")
@@ -169,6 +177,13 @@ rust_runx () {
     unset CXXFLAGS
     unset CPPFLAGS
 
+    # Copy the natively built llvm-config into the target so we can run it. Horrible,
+    # but works!
+    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
+        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
+        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
+    fi
+
     oe_cargo_fix_env
 
     python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
@@ -189,18 +204,6 @@ rust_do_install () {
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
index b505ad46caf..e2d04165035 100644
--- a/meta/recipes-devtools/rust/rust_1.62.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.62.0.bb
@@ -3,19 +3,63 @@ require rust-source.inc
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
+    (PSEUDO_UNLOAD=1 rust_runx install)
+
+    install -d ${D}${bindir}
+    for i in cargo-clippy clippy-driver rustfmt; do
+        cp build/${RUST_BUILD_SYS}/stage2-tools-bin/$i ${D}${bindir}
+        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+    done
+
+    chown root:root ${D}/ -R
+    rm ${D}${libdir}/rustlib/uninstall.sh
+}
+
+rust_do_install:class-target() {
+    (PSEUDO_UNLOAD=1 rust_runx install)
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
 }
 
+RUSTLIB_DEP:class-nativesdk = ""
\ No newline at end of file
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
index cc7fb9bbdfe..82b1bf9bcef 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
@@ -14,7 +14,7 @@ SECTION = "x11/utils"
 DEPENDS = "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-native"
 BBCLASSEXTEND = "native nativesdk"
 
-inherit gnomebase pixbufcache upstream-version-is-even gobject-introspection rust vala gi-docgen
+inherit cargo_common gnomebase pixbufcache upstream-version-is-even gobject-introspection rust vala gi-docgen
 
 SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch \
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
@@ -29,25 +29,25 @@ BASEDEPENDS:append = " cargo-native"
 
 export RUST_BACKTRACE = "full"
 export RUSTFLAGS
-export RUST_TARGET_PATH
 
-export RUST_TARGET = "${HOST_SYS}"
+export RUST_TARGET = "${RUST_HOST_SYS}"
 
 RUSTFLAGS:append:mips = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
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
-    sed -ie 's,"linker": ".*","linker": "${RUST_TARGET_CC}",g' ${WORKDIR}/${HOST_SYS}.json
-    RUST_TARGET_PATH="${WORKDIR}"
-    export RUST_TARGET_PATH
+    sed -ie 's,"linker": ".*","linker": "${RUST_TARGET_CC}",g' ${RUST_TARGETS_DIR}/${RUST_HOST_SYS}.json
 }
 
 # Issue only on windows
-- 
2.34.1



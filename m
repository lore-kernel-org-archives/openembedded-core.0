Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.2103.1614135755958051484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 19:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 11O32Okh009274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 19:02:30 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Feb 2021 19:02:12 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Tue, 23 Feb 2021 19:02:12 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 6/8] meta-rust: merge commits
Date: Tue, 23 Feb 2021 22:01:59 -0500
Message-ID: <20210224030201.349588-7-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
References: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Merge most of:
  git log --oneline --no-merges 5cda04c..029f1ea
with two layer.conf exceptions explained below.

920328c rust-native shouldn't depend on TARGET variables
4e96013 Factor in `CARGO_SRC_DIR` when setting `MANIFEST_PATH`.
87e8d50 Keep only the most recent two Rust versions.
53c9aab rust: Drop v8.1a tune for aarch64
7feed5d recipes-example/rust-hello-world: move to new url in meta-rust org
1b94401 readme: fix url and link issue number
26609f4 rust.inc: use 'v8.1a' feature when building for aarch64 instead of 'v8'
71538c8 rust_versions.inc: switch the default version to 1.49.0
c976184 {cargo,rust}-1.49.0: simplify as in https://github.com/meta-rust/meta-rust/pull/299
0025ceb Fix *-native cargo builds
3ab7542 rust-source, rust-snaphost: drop md5sums
b163a89 rust-source, rust-snapshot: simplify as well
0ee328a add rust 1.49.0
3e73030 rust-target.inc: add new include file to simplify all rust_*.bb
9c0a105 rust_versions.inc: add include for easy switching between versions
a31a407 cargo: move LIC_FILES_CHKSUM from cargo_*.bb to cargo.inc where LICENSE is set
1d64f90 rust: move LIC_FILES_CHKSUM from rust-source-*.inc to rust.inc where LICENSE is set
80c30c3 rust-llvm-ncsa.inc: reorder to actually set LICENSE and LIC_FILES_CHKSUM
1cb40bd Revert "rust-llvm: Use early variable assignment for the license checksum in rust-llvm.inc"
d5ab20d rust-hello-world: enable LTO in the build
b7eacc0 libstd-rs: embed bitcode for LTO
1936904 cargo: Mark the cargo-native dependency specific to target
5dda6c4 rust-llvm: Use early variable assignment for the license checksum in rust-llvm.inc
47de35e libstd-rs: Remove libunwind on riscv
e297948 rust: Add riscv32/riscv64 support
a679b6f rust: Build rust backend
a59ddd9 rust: Correct the data layout for riscv32
e5ee880 cargo_common: Make output more readable
a673320 cargo: Enable build separation
cb4f829 Use proper llvm-target for armv7
4b151fa add rust 1.47.0
8cfc3c9 clean up some common definitions across rust versions
aec6519 cargo: add missing version 1.46.0
7afffa0 rust-bin.bbclass: Do not use append and += together
2822b50 layer.conf: Add gatesgarth to LAYERSERIES_COMPAT
    skip the layer compat change but keep
    rust-llvm.inc: export YOCTO_ALTERNATE_EXE_PATH
8a44bae Disable LIBGIT2_SYS_USE_PKG_CONFIG due to incompatibility with 0.28.x
b7f9c1d Add rust 1.46.0
647b976 rust: use PARALLEL_MAKE instead of BB_NUMBER_THREADS
8d3f79f rust.inc: whitelist BB_NUMBER_THREADS in do_compile
2c7321d Bump to Rust version 1.43
b84c61e Revert "cargo: fix progress output"
dd0fc89 cargo: fix progress output
afcb58e rust.inc: cut build time in half
40a6bd8 rust.inc: run bootstrap.py in parallel
c023edd rust.inc: make max-atomic-width an integer
3b78365 rust-native shouldn't depend on TARGET variables
8ef8b39 rustfmt: Upgrade to 1.4.2
e4d25b9 layer.conf: Mark it 3.1 release compatible
    skip the layer compat change so this commit was omitted
ea97549 Avoid extra sh process from shell wrapper
4a763a2 Update 0001-Disable-http2.patch for cargo 1.41.0
5c7f51b Update to Rust 1.41.0
837b635 cargo: Refresh http2 disable patch
2668f6a Update 0001-Disable-http2.patch for Cargo shipped with Rust 1.40.0
e5c2a40 Update to Rust and Cargo 1.40.0.
72aa4ef rust: Use Python3 native for build
186ec59 rust: Improve TUNE_FEATURE parsing
71895ec Update to Rust and Cargo 1.39.0

Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
---
 meta/classes/cargo.bbclass                    |  13 +-
 meta/classes/cargo_common.bbclass             |  63 +++++--
 meta/classes/rust-bin.bbclass                 |   2 +-
 meta/classes/rust-common.bbclass              |  27 ++-
 meta/conf/distro/include/rust_versions.inc    |  13 ++
 .../cargo-1.37.0/0001-Disable-http2.patch     |  29 ---
 .../0001-Disable-http2.patch                  |  22 +--
 .../0001-Disable-http2.patch                  |  24 +--
 meta/recipes-devtools/cargo/cargo.inc         |  18 +-
 meta/recipes-devtools/cargo/cargo_1.34.2.bb   |   8 -
 meta/recipes-devtools/cargo/cargo_1.36.0.bb   |   8 -
 meta/recipes-devtools/cargo/cargo_1.37.0.bb   |   8 -
 meta/recipes-devtools/cargo/cargo_1.47.0.bb   |   3 +
 meta/recipes-devtools/cargo/cargo_1.49.0.bb   |   3 +
 meta/recipes-devtools/rust/README-rust.md     |   6 +-
 meta/recipes-devtools/rust/libstd-rs.inc      |   9 +
 .../recipes-devtools/rust/libstd-rs_1.34.2.bb |   8 -
 .../recipes-devtools/rust/libstd-rs_1.36.0.bb |   8 -
 .../recipes-devtools/rust/libstd-rs_1.37.0.bb |   8 -
 .../recipes-devtools/rust/libstd-rs_1.47.0.bb |   5 +
 .../recipes-devtools/rust/libstd-rs_1.49.0.bb |   5 +
 meta/recipes-devtools/rust/rust-cross.inc     |  19 ++
 ...t-cross_1.34.2.bb => rust-cross_1.47.0.bb} |   1 -
 ...t-cross_1.36.0.bb => rust-cross_1.49.0.bb} |   1 -
 meta/recipes-devtools/rust/rust-llvm.inc      |  16 +-
 .../recipes-devtools/rust/rust-llvm_1.34.2.bb |  16 --
 .../recipes-devtools/rust/rust-llvm_1.36.0.bb |  16 --
 .../recipes-devtools/rust/rust-llvm_1.37.0.bb |  16 --
 ...st-cross_1.37.0.bb => rust-llvm_1.47.0.bb} |   3 +-
 .../recipes-devtools/rust/rust-llvm_1.49.0.bb |   2 +
 .../rust/rust-snapshot-1.34.2.inc             |  24 ---
 .../rust/rust-snapshot-1.36.0.inc             |  24 ---
 .../rust/rust-snapshot-1.37.0.inc             |  24 ---
 .../rust/rust-snapshot-1.47.0.inc             |  13 ++
 .../rust/rust-snapshot-1.49.0.inc             |  13 ++
 meta/recipes-devtools/rust/rust-snapshot.inc  |   9 +
 .../rust/rust-source-1.34.2.inc               |  11 --
 .../rust/rust-source-1.36.0.inc               |  11 --
 .../rust/rust-source-1.37.0.inc               |  11 --
 .../rust/rust-source-1.47.0.inc               |   3 +
 .../rust/rust-source-1.49.0.inc               |   3 +
 meta/recipes-devtools/rust/rust-source.inc    |   3 +
 .../rust/{rust_1.36.0.bb => rust-target.inc}  |   2 -
 meta/recipes-devtools/rust/rust.inc           | 105 ++++++-----
 ...-dash-vs-underscore-mismatches-in-op.patch |  75 ++++++++
 meta/recipes-devtools/rust/rust_1.34.2.bb     |  12 --
 meta/recipes-devtools/rust/rust_1.37.0.bb     |  12 --
 meta/recipes-devtools/rust/rust_1.47.0.bb     |   9 +
 meta/recipes-devtools/rust/rust_1.49.0.bb     |  15 ++
 .../rust-hello-world/0001-enable-LTO.patch    |  23 +++
 .../rust-hello-world/rust-hello-world_git.bb  |   8 +-
 meta/recipes-example/rustfmt/rustfmt_0.8.0.bb |  67 -------
 meta/recipes-example/rustfmt/rustfmt_1.4.2.bb | 171 ++++++++++++++++++
 53 files changed, 591 insertions(+), 437 deletions(-)
 create mode 100644 meta/conf/distro/include/rust_versions.inc
 delete mode 100644 meta/recipes-devtools/cargo/cargo-1.37.0/0001-Disable-http2.patch
 rename meta/recipes-devtools/cargo/{cargo-1.36.0 => cargo-1.47.0}/0001-Disable-http2.patch (53%)
 rename meta/recipes-devtools/cargo/{cargo-1.34.2 => cargo-1.49.0}/0001-Disable-http2.patch (53%)
 delete mode 100644 meta/recipes-devtools/cargo/cargo_1.34.2.bb
 delete mode 100644 meta/recipes-devtools/cargo/cargo_1.36.0.bb
 delete mode 100644 meta/recipes-devtools/cargo/cargo_1.37.0.bb
 create mode 100644 meta/recipes-devtools/cargo/cargo_1.47.0.bb
 create mode 100644 meta/recipes-devtools/cargo/cargo_1.49.0.bb
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs_1.34.2.bb
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs_1.36.0.bb
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs_1.37.0.bb
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.47.0.bb
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.49.0.bb
 rename meta/recipes-devtools/rust/{rust-cross_1.34.2.bb => rust-cross_1.47.0.bb} (98%)
 rename meta/recipes-devtools/rust/{rust-cross_1.36.0.bb => rust-cross_1.49.0.bb} (98%)
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm_1.34.2.bb
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm_1.36.0.bb
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm_1.37.0.bb
 rename meta/recipes-devtools/rust/{rust-cross_1.37.0.bb => rust-llvm_1.47.0.bb} (55%)
 create mode 100644 meta/recipes-devtools/rust/rust-llvm_1.49.0.bb
 delete mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.34.2.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.36.0.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.37.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.47.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.49.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-snapshot.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-source-1.34.2.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-source-1.36.0.inc
 delete mode 100644 meta/recipes-devtools/rust/rust-source-1.37.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-source-1.47.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-source-1.49.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-source.inc
 rename meta/recipes-devtools/rust/{rust_1.36.0.bb => rust-target.inc} (82%)
 create mode 100644 meta/recipes-devtools/rust/rust/0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch
 delete mode 100644 meta/recipes-devtools/rust/rust_1.34.2.bb
 delete mode 100644 meta/recipes-devtools/rust/rust_1.37.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust_1.47.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust_1.49.0.bb
 create mode 100644 meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch
 delete mode 100644 meta/recipes-example/rustfmt/rustfmt_0.8.0.bb
 create mode 100644 meta/recipes-example/rustfmt/rustfmt_1.4.2.bb

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
index c321e6bf70..c2eee101bd 100644
--- a/meta/classes/cargo.bbclass
+++ b/meta/classes/cargo.bbclass
@@ -15,16 +15,23 @@ BASEDEPENDS_append = " cargo-native"
 DEPENDS_append_class-target = " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
 DEPENDS_append_class-native = " rust-native"
 
-# Cargo only supports in-tree builds at the moment
-B = "${S}"
+# Enable build separation
+B = "${WORKDIR}/build"
 
 # In case something fails in the build process, give a bit more feedback on
 # where the issue occured
 export RUST_BACKTRACE = "1"
 
+# The directory of the Cargo.toml relative to the root directory, per default
+# assume there's a Cargo.toml directly in the root directory
+CARGO_SRC_DIR ??= ""
+
+# The actual path to the Cargo.toml
+MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
+
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_BUILD_FLAGS = "-v --target ${HOST_SYS} ${BUILD_MODE}"
+CARGO_BUILD_FLAGS = "-v --target ${HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
index e5f908033d..5ed99b881b 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -30,48 +30,71 @@ CARGO_VENDORING_DIRECTORY ?= "${CARGO_HOME}/bitbake"
 
 cargo_common_do_configure () {
 	mkdir -p ${CARGO_HOME}/bitbake
-	echo "paths = [" > ${CARGO_HOME}/config
 
-	for p in ${EXTRA_OECARGO_PATHS}; do
-		printf "\"%s\"\n" "$p"
-	done | sed -e 's/$/,/' >> ${CARGO_HOME}/config
-	echo "]" >> ${CARGO_HOME}/config
+	cat <<- EOF > ${CARGO_HOME}/config
+	# EXTRA_OECARGO_PATHS
+	paths = [
+	$(for p in ${EXTRA_OECARGO_PATHS}; do echo \"$p\",; done)
+	]
+	EOF
 
-	# Point cargo at our local mirror of the registry
 	cat <<- EOF >> ${CARGO_HOME}/config
+
+	# Local mirror vendored by bitbake
 	[source.bitbake]
 	directory = "${CARGO_VENDORING_DIRECTORY}"
 	EOF
 
 	if [ -z "${EXTERNALSRC}" ] && [ ${CARGO_DISABLE_BITBAKE_VENDORING} = "0" ]; then
 		cat <<- EOF >> ${CARGO_HOME}/config
+
 		[source.crates-io]
 		replace-with = "bitbake"
 		local-registry = "/nonexistant"
 		EOF
 	fi
 
-        # Disable multiplexing in order to keep cargo from using http2, which we
-        # can't currently enable because of dependency loops
-        cat <<- EOF >> ${CARGO_HOME}/config
-		[http]
-		multiplexing = false
-	EOF
+	cat <<- EOF >> ${CARGO_HOME}/config
 
-	# When a sstate-cache is used sometimes the certificates are not available
-	# at the compile time path anymore. Set it explicitly instead.
-	echo "cainfo = \"${STAGING_ETCDIR_NATIVE}/ssl/certs/ca-certificates.crt\"" \
-		>> ${CARGO_HOME}/config
+	[http]
+	# Multiplexing can't be enabled because http2 can't be enabled
+	# in curl-native without dependency loops
+	multiplexing = false
+
+	# Ignore the hard coded and incorrect path to certificates
+	cainfo = "${STAGING_ETCDIR_NATIVE}/ssl/certs/ca-certificates.crt"
+
+	EOF
 
 	if [ -n "${http_proxy}" ]; then
 		echo "proxy = \"${http_proxy}\"" >> ${CARGO_HOME}/config
 	fi
 
-	echo "[target.${HOST_SYS}]" >> ${CARGO_HOME}/config
-	echo "linker = '${RUST_TARGET_CCLD}'" >> ${CARGO_HOME}/config
+	cat <<- EOF >> ${CARGO_HOME}/config
+
+	# HOST_SYS
+	[target.${HOST_SYS}]
+	linker = "${RUST_TARGET_CCLD}"
+	EOF
+
 	if [ "${HOST_SYS}" != "${BUILD_SYS}" ]; then
-		echo "[target.${BUILD_SYS}]" >> ${CARGO_HOME}/config
-		echo "linker = '${RUST_BUILD_CCLD}'" >> ${CARGO_HOME}/config
+		cat <<- EOF >> ${CARGO_HOME}/config
+
+		# BUILD_SYS
+		[target.${BUILD_SYS}]
+		linker = "${RUST_BUILD_CCLD}"
+		EOF
+	fi
+
+	# Put build output in build directory preferred by bitbake instead of
+	# inside source directory unless they are the same
+	if [ "${B}" != "${S}" ]; then
+		cat <<- EOF >> ${CARGO_HOME}/config
+
+		[build]
+		# Use out of tree build destination to avoid poluting the source tree
+		target-dir = "${B}/target"
+		EOF
 	fi
 }
 
diff --git a/meta/classes/rust-bin.bbclass b/meta/classes/rust-bin.bbclass
index a13fbafb56..6819c9e061 100644
--- a/meta/classes/rust-bin.bbclass
+++ b/meta/classes/rust-bin.bbclass
@@ -1,6 +1,6 @@
 inherit rust
 
-RDEPENDS_${PN}_append_class-target += "${RUSTLIB_DEP}"
+RDEPENDS_${PN}_append_class-target = " ${RUSTLIB_DEP}"
 
 RUSTC_ARCHFLAGS += "-C opt-level=3 -g -L ${STAGING_DIR_HOST}/${rustlibdir} -C linker=${RUST_TARGET_CCLD}"
 EXTRA_OEMAKE += 'RUSTC_ARCHFLAGS="${RUSTC_ARCHFLAGS}"'
diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index cbc7d3cfe6..ff7b9da8f3 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -31,6 +31,24 @@ def determine_libc(d, thing):
 
     return libc
 
+def target_is_armv7(d):
+    '''Determine if target is armv7'''
+    # TUNE_FEATURES may include arm* even if the target is not arm
+    # in the case of *-native packages
+    if d.getVar('TARGET_ARCH') != 'arm':
+        return False
+
+    feat = d.getVar('TUNE_FEATURES')
+    feat = frozenset(feat.split())
+    mach_overrides = d.getVar('MACHINEOVERRIDES')
+    mach_overrides = frozenset(mach_overrides.split(':'))
+
+    v7=frozenset(['armv7a', 'armv7r', 'armv7m', 'armv7ve'])
+    if mach_overrides.isdisjoint(v7) and feat.isdisjoint(v7):
+        return False
+    else:
+        return True
+
 # Responsible for taking Yocto triples and converting it to Rust triples
 def rust_base_triple(d, thing):
     '''
@@ -40,7 +58,12 @@ def rust_base_triple(d, thing):
     Note that os is assumed to be some linux form
     '''
 
-    arch = d.getVar('{}_ARCH'.format(thing))
+    # The llvm-target for armv7 is armv7-unknown-linux-gnueabihf
+    if thing == "TARGET" and target_is_armv7(d):
+        arch = "armv7"
+    else:
+        arch = d.getVar('{}_ARCH'.format(thing))
+
     # All the Yocto targets are Linux and are 'unknown'
     vendor = "-unknown"
     os = d.getVar('{}_OS'.format(thing))
@@ -110,7 +133,7 @@ create_wrapper () {
 
 	cat <<- EOF > "${file}"
 	#!/bin/sh
-	$@ "\$@"
+	exec $@ "\$@"
 	EOF
 	chmod +x "${file}"
 }
diff --git a/meta/conf/distro/include/rust_versions.inc b/meta/conf/distro/include/rust_versions.inc
new file mode 100644
index 0000000000..8e328a720f
--- /dev/null
+++ b/meta/conf/distro/include/rust_versions.inc
@@ -0,0 +1,13 @@
+# include this in your distribution to easily switch between versions
+# just by changing RUST_VERSION variable
+
+RUST_VERSION ?= "1.49.0"
+
+PREFERRED_VERSION_cargo ?= "${RUST_VERSION}"
+PREFERRED_VERSION_cargo-native ?= "${RUST_VERSION}"
+PREFERRED_VERSION_libstd-rs ?= "${RUST_VERSION}"
+PREFERRED_VERSION_rust ?= "${RUST_VERSION}"
+PREFERRED_VERSION_rust-cross-${TARGET_ARCH} ?= "${RUST_VERSION}"
+PREFERRED_VERSION_rust-llvm ?= "${RUST_VERSION}"
+PREFERRED_VERSION_rust-llvm-native ?= "${RUST_VERSION}"
+PREFERRED_VERSION_rust-native ?= "${RUST_VERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo-1.37.0/0001-Disable-http2.patch b/meta/recipes-devtools/cargo/cargo-1.37.0/0001-Disable-http2.patch
deleted file mode 100644
index c804297d48..0000000000
--- a/meta/recipes-devtools/cargo/cargo-1.37.0/0001-Disable-http2.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0e2384133664ebeb548b782ad763c3a627c1bc66 Mon Sep 17 00:00:00 2001
-From: Johan Anderholm <johan.anderholm@gmail.com>
-Date: Sun, 27 Jan 2019 10:19:00 +0100
-Subject: [PATCH] Disable http2
-
-http2 requires that curl is build with nghttp2 which in turn depends on
-many dependencies and ultimately a dependency loop in the case of
-curl-native. As long as multiplexing is disabled in cargo this should
-be fine.
-
-Upstream-Status: Inappropriate
-
----
- src/tools/cargo/Cargo.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Cargo.toml b/Cargo.toml
-index d15aa2513..ba9c77d25 100644
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -24,7 +24,7 @@ bytesize = "1.0"
- crates-io = { path = "crates/crates-io", version = "0.26" }
- crossbeam-utils = "0.6"
- crypto-hash = "0.3.1"
--curl = { version = "0.4.21", features = ['http2'] }
-+curl = { version = "0.4.21" }
- curl-sys = "0.4.18"
- env_logger = "0.6.0"
- pretty_env_logger = { version = "0.3", optional = true }
diff --git a/meta/recipes-devtools/cargo/cargo-1.36.0/0001-Disable-http2.patch b/meta/recipes-devtools/cargo/cargo-1.47.0/0001-Disable-http2.patch
similarity index 53%
rename from meta/recipes-devtools/cargo/cargo-1.36.0/0001-Disable-http2.patch
rename to meta/recipes-devtools/cargo/cargo-1.47.0/0001-Disable-http2.patch
index 9794ec05f9..b08f7ac133 100644
--- a/meta/recipes-devtools/cargo/cargo-1.36.0/0001-Disable-http2.patch
+++ b/meta/recipes-devtools/cargo/cargo-1.47.0/0001-Disable-http2.patch
@@ -1,4 +1,4 @@
-From 42e65192b6f7520b7a05924856e00600961f6758 Mon Sep 17 00:00:00 2001
+From 40802c3a42fab9cfcd27fda8d00e98f8cc30016a Mon Sep 17 00:00:00 2001
 From: Johan Anderholm <johan.anderholm@gmail.com>
 Date: Sun, 27 Jan 2019 10:19:00 +0100
 Subject: [PATCH] Disable http2
@@ -14,18 +14,18 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Cargo.toml b/Cargo.toml
-index c3fcacf5..bd6ec50b 100644
+index 95cea90c4..56211532f 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
-@@ -24,7 +24,7 @@ bytesize = "1.0"
- crates-io = { path = "src/crates-io", version = "0.25" }
- crossbeam-utils = "0.6"
+@@ -25,7 +25,7 @@ cargo-platform = { path = "crates/cargo-platform", version = "0.1.1" }
+ crates-io = { path = "crates/crates-io", version = "0.31.1" }
+ crossbeam-utils = "0.7"
  crypto-hash = "0.3.1"
--curl = { version = "0.4.21", features = ['http2'] }
-+curl = { version = "0.4.21" }
- curl-sys = "0.4.18"
- env_logger = "0.6.0"
- pretty_env_logger = { version = "0.3", optional = true }
+-curl = { version = "0.4.23", features = ["http2"] }
++curl = { version = "0.4.23" }
+ curl-sys = "0.4.22"
+ env_logger = "0.7.0"
+ pretty_env_logger = { version = "0.4", optional = true }
 -- 
-2.11.0
+2.28.0
 
diff --git a/meta/recipes-devtools/cargo/cargo-1.34.2/0001-Disable-http2.patch b/meta/recipes-devtools/cargo/cargo-1.49.0/0001-Disable-http2.patch
similarity index 53%
rename from meta/recipes-devtools/cargo/cargo-1.34.2/0001-Disable-http2.patch
rename to meta/recipes-devtools/cargo/cargo-1.49.0/0001-Disable-http2.patch
index a44482a112..51f37d3b51 100644
--- a/meta/recipes-devtools/cargo/cargo-1.34.2/0001-Disable-http2.patch
+++ b/meta/recipes-devtools/cargo/cargo-1.49.0/0001-Disable-http2.patch
@@ -1,4 +1,4 @@
-From 44cf21036646e4849e9f8566db7decb7da917394 Mon Sep 17 00:00:00 2001
+From 7f8a197af9c33d0575187663f796f882064136dc Mon Sep 17 00:00:00 2001
 From: Johan Anderholm <johan.anderholm@gmail.com>
 Date: Sun, 27 Jan 2019 10:19:00 +0100
 Subject: [PATCH] Disable http2
@@ -9,21 +9,23 @@ curl-native. As long as multiplexing is disabled in cargo this should
 be fine.
 
 Upstream-Status: Inappropriate
-
 ---
  Cargo.toml | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Cargo.toml b/Cargo.toml
-index 8238380861d9..ced1defea459 100644
+index fde0a3188..a4a51939a 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
-@@ -24,7 +24,7 @@ bytesize = "1.0"
- crates-io = { path = "src/crates-io", version = "0.23" }
- crossbeam-utils = "0.6"
+@@ -25,7 +25,7 @@ cargo-platform = { path = "crates/cargo-platform", version = "0.1.1" }
+ crates-io = { path = "crates/crates-io", version = "0.31.1" }
+ crossbeam-utils = "0.8"
  crypto-hash = "0.3.1"
--curl = { version = "0.4.19", features = ['http2'] }
-+curl = { version = "0.4.19" }
- curl-sys = "0.4.15"
- env_logger = "0.6.0"
- pretty_env_logger = { version = "0.3", optional = true }
+-curl = { version = "0.4.23", features = ["http2"] }
++curl = { version = "0.4.23" }
+ curl-sys = "0.4.22"
+ env_logger = "0.8.1"
+ pretty_env_logger = { version = "0.4", optional = true }
+-- 
+2.28.0
+
diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
index 48012520d9..9645b90df6 100644
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -3,10 +3,12 @@ HOMEPAGE = "https://crates.io"
 LICENSE = "MIT | Apache-2.0"
 SECTION = "devel"
 
-DEPENDS = "openssl zlib libgit2 curl ca-certificates libssh2"
+DEPENDS = "openssl zlib curl ca-certificates libssh2"
 
 LIC_FILES_CHKSUM = " \
     file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d \
+    file://LICENSE-APACHE;md5=71b224ca933f0676e26d5c2e2271331c \
+    file://LICENSE-THIRD-PARTY;md5=f257ad009884cb88a3a87d6920e7180a \
 "
 
 SRC_URI += "file://0001-Disable-http2.patch"
@@ -29,15 +31,21 @@ do_compile_prepend () {
 
 do_install () {
 	install -d "${D}${bindir}"
-	install -m 755 "${RUSTSRC}/target/${CARGO_TARGET_SUBDIR}/cargo" "${D}${bindir}"
+	install -m 755 "${B}/target/${CARGO_TARGET_SUBDIR}/cargo" "${D}${bindir}"
 }
 
+# Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
+# as shipped by Yocto Dunfell.
+# According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
+# libgit2-sys and arbitrary system libgit2 versions, so better keep this turned off.
+#export LIBGIT2_SYS_USE_PKG_CONFIG = "1"
+
 # Needed for pkg-config to be used
-export LIBGIT2_SYS_USE_PKG_CONFIG = "1"
 export LIBSSH2_SYS_USE_PKG_CONFIG = "1"
 
 BBCLASSEXTEND = "native"
 
-# When building cargo-native we don't have a built cargo to use so we must use
-# the snapshot to bootstrap the build of cargo
+# When building cargo-native we don't have cargo-native to use and depend on,
+# so we must use the locally set up snapshot to bootstrap the build.
+BASEDEPENDS_remove_class-native = "cargo-native"
 CARGO_class-native = "${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo"
diff --git a/meta/recipes-devtools/cargo/cargo_1.34.2.bb b/meta/recipes-devtools/cargo/cargo_1.34.2.bb
deleted file mode 100644
index d79f958c6e..0000000000
--- a/meta/recipes-devtools/cargo/cargo_1.34.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require recipes-devtools/rust/rust-source-${PV}.inc
-require recipes-devtools/rust/rust-snapshot-${PV}.inc
-require cargo.inc
-
-LIC_FILES_CHKSUM += " \
-    file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
-    file://LICENSE-THIRD-PARTY;md5=892ea68b169e69cfe75097fc38a15b56 \
-"
diff --git a/meta/recipes-devtools/cargo/cargo_1.36.0.bb b/meta/recipes-devtools/cargo/cargo_1.36.0.bb
deleted file mode 100644
index f048779aae..0000000000
--- a/meta/recipes-devtools/cargo/cargo_1.36.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require recipes-devtools/rust/rust-source-${PV}.inc
-require recipes-devtools/rust/rust-snapshot-${PV}.inc
-require cargo.inc
-
-LIC_FILES_CHKSUM += " \
-    file://LICENSE-APACHE;md5=71b224ca933f0676e26d5c2e2271331c \
-    file://LICENSE-THIRD-PARTY;md5=f257ad009884cb88a3a87d6920e7180a \
-"
diff --git a/meta/recipes-devtools/cargo/cargo_1.37.0.bb b/meta/recipes-devtools/cargo/cargo_1.37.0.bb
deleted file mode 100644
index f048779aae..0000000000
--- a/meta/recipes-devtools/cargo/cargo_1.37.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require recipes-devtools/rust/rust-source-${PV}.inc
-require recipes-devtools/rust/rust-snapshot-${PV}.inc
-require cargo.inc
-
-LIC_FILES_CHKSUM += " \
-    file://LICENSE-APACHE;md5=71b224ca933f0676e26d5c2e2271331c \
-    file://LICENSE-THIRD-PARTY;md5=f257ad009884cb88a3a87d6920e7180a \
-"
diff --git a/meta/recipes-devtools/cargo/cargo_1.47.0.bb b/meta/recipes-devtools/cargo/cargo_1.47.0.bb
new file mode 100644
index 0000000000..dd050a82a0
--- /dev/null
+++ b/meta/recipes-devtools/cargo/cargo_1.47.0.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/rust/rust-source-${PV}.inc
+require recipes-devtools/rust/rust-snapshot-${PV}.inc
+require cargo.inc
diff --git a/meta/recipes-devtools/cargo/cargo_1.49.0.bb b/meta/recipes-devtools/cargo/cargo_1.49.0.bb
new file mode 100644
index 0000000000..dd050a82a0
--- /dev/null
+++ b/meta/recipes-devtools/cargo/cargo_1.49.0.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/rust/rust-source-${PV}.inc
+require recipes-devtools/rust/rust-snapshot-${PV}.inc
+require cargo.inc
diff --git a/meta/recipes-devtools/rust/README-rust.md b/meta/recipes-devtools/rust/README-rust.md
index 329d59ab7b..400baf700d 100644
--- a/meta/recipes-devtools/rust/README-rust.md
+++ b/meta/recipes-devtools/rust/README-rust.md
@@ -13,7 +13,7 @@ This OpenEmbedded layer provides the rust compiler, tools for building packages
 ## What doesn't:
 
  - Using anything but x86_64 as the build environment
- - rust (built for target) issue #81
+ - rust (built for target) [issue #81](https://github.com/meta-rust/meta-rust/issues/81)
 
 ## What's untested:
 
@@ -27,7 +27,7 @@ rust packages do), then it's especially easy.  Otherwise you should probably
 get the code building in cargo first.
 
 Once your package builds in cargo, you can use
-[cargo-bitbake](https://github.com/cardoe/cargo-bitbake) to generate a bitbake
+[cargo-bitbake](https://github.com/meta-rust/cargo-bitbake) to generate a bitbake
 recipe for it.  This allows bitbake to fetch all the necessary dependent
 crates, as well as a pegged version of the crates.io index, to ensure maximum
 reproducibility.
@@ -39,7 +39,7 @@ contained within it
 
 ## Pitfalls
 
- - TARGET_SYS _must_ be different from BUILD_SYS. This is due to the way Rust configuration options are tracked for different targets. This is the reason we use the Yocto triples instead of the native Rust triples. See rust-lang/cargo#3349.
+ - TARGET_SYS _must_ be different from BUILD_SYS. This is due to the way Rust configuration options are tracked for different targets. This is the reason we use the Yocto triples instead of the native Rust triples. See [rust-lang/cargo#3349](https://github.com/rust-lang/cargo/issues/3349).
 
 ## Dependencies
 
diff --git a/meta/recipes-devtools/rust/libstd-rs.inc b/meta/recipes-devtools/rust/libstd-rs.inc
index 5298c00706..1bf2dab0a5 100644
--- a/meta/recipes-devtools/rust/libstd-rs.inc
+++ b/meta/recipes-devtools/rust/libstd-rs.inc
@@ -2,17 +2,26 @@ SUMMARY = "Rust standard libaries"
 HOMEPAGE = "http://www.rust-lang.org"
 SECTION = "devel"
 LICENSE = "MIT | Apache-2.0"
+LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
 
 RUSTLIB_DEP = ""
 inherit cargo
 
 DEPENDS_append_libc-musl = " libunwind"
+# rv32 does not have libunwind ported yet
+DEPENDS_remove_riscv32 = "libunwind"
+DEPENDS_remove_riscv64 = "libunwind"
+
+# Embed bitcode in order to allow compiling both with and without LTO
+RUSTFLAGS += "-Cembed-bitcode=yes"
 # Needed so cargo can find libbacktrace
 RUSTFLAGS += "-L ${STAGING_LIBDIR} -C link-arg=-Wl,-soname,libstd.so"
 
 S = "${RUSTSRC}/src/libstd"
 
+CARGO_FEATURES ?= "panic-unwind backtrace"
 CARGO_BUILD_FLAGS += "--features '${CARGO_FEATURES}'"
+CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
 do_compile_prepend () {
     export CARGO_TARGET_DIR="${B}"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.34.2.bb b/meta/recipes-devtools/rust/libstd-rs_1.34.2.bb
deleted file mode 100644
index 69cb48ad07..0000000000
--- a/meta/recipes-devtools/rust/libstd-rs_1.34.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require rust-source-${PV}.inc
-require libstd-rs.inc
-
-LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
-
-CARGO_FEATURES ?= "panic-unwind backtrace"
-
-CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.36.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.36.0.bb
deleted file mode 100644
index 69cb48ad07..0000000000
--- a/meta/recipes-devtools/rust/libstd-rs_1.36.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require rust-source-${PV}.inc
-require libstd-rs.inc
-
-LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
-
-CARGO_FEATURES ?= "panic-unwind backtrace"
-
-CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.37.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.37.0.bb
deleted file mode 100644
index 69cb48ad07..0000000000
--- a/meta/recipes-devtools/rust/libstd-rs_1.37.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require rust-source-${PV}.inc
-require libstd-rs.inc
-
-LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
-
-CARGO_FEATURES ?= "panic-unwind backtrace"
-
-CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.47.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.47.0.bb
new file mode 100644
index 0000000000..4398a22986
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs_1.47.0.bb
@@ -0,0 +1,5 @@
+require rust-source-${PV}.inc
+require libstd-rs.inc
+
+# libstd moved from src/libstd to library/std in 1.47+
+S = "${RUSTSRC}/library/std"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.49.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.49.0.bb
new file mode 100644
index 0000000000..4398a22986
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs_1.49.0.bb
@@ -0,0 +1,5 @@
+require rust-source-${PV}.inc
+require libstd-rs.inc
+
+# libstd moved from src/libstd to library/std in 1.47+
+S = "${RUSTSRC}/library/std"
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index 4869b85c03..b3698cdb20 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -1,6 +1,25 @@
 require rust.inc
 inherit cross
 
+python do_rust_gen_targets () {
+    wd = d.getVar('WORKDIR') + '/targets/'
+    # It is important 'TARGET' is last here so that it overrides our less
+    # informed choices for BUILD & HOST if TARGET happens to be the same as
+    # either of them.
+    for thing in ['BUILD', 'HOST', 'TARGET']:
+        bb.debug(1, "rust_gen_target for " + thing)
+        features = ""
+        cpu = "generic"
+        arch = d.getVar('{}_ARCH'.format(thing))
+        if thing is "TARGET":
+            # arm and armv7 have different targets in llvm
+            if arch == "arm" and target_is_armv7(d):
+                arch = 'armv7'
+            features = d.getVar('TARGET_LLVM_FEATURES') or ""
+            cpu = d.getVar('TARGET_LLVM_CPU')
+        rust_gen_target(d, thing, wd, features, cpu, arch)
+}
+
 # Otherwise we'll depend on what we provide
 INHIBIT_DEFAULT_RUST_DEPS = "1"
 
diff --git a/meta/recipes-devtools/rust/rust-cross_1.34.2.bb b/meta/recipes-devtools/rust/rust-cross_1.47.0.bb
similarity index 98%
rename from meta/recipes-devtools/rust/rust-cross_1.34.2.bb
rename to meta/recipes-devtools/rust/rust-cross_1.47.0.bb
index bb92b99ccc..ddc25d36b5 100644
--- a/meta/recipes-devtools/rust/rust-cross_1.34.2.bb
+++ b/meta/recipes-devtools/rust/rust-cross_1.47.0.bb
@@ -1,3 +1,2 @@
 require rust-cross.inc
 require rust-source-${PV}.inc
-
diff --git a/meta/recipes-devtools/rust/rust-cross_1.36.0.bb b/meta/recipes-devtools/rust/rust-cross_1.49.0.bb
similarity index 98%
rename from meta/recipes-devtools/rust/rust-cross_1.36.0.bb
rename to meta/recipes-devtools/rust/rust-cross_1.49.0.bb
index bb92b99ccc..ddc25d36b5 100644
--- a/meta/recipes-devtools/rust/rust-cross_1.36.0.bb
+++ b/meta/recipes-devtools/rust/rust-cross_1.49.0.bb
@@ -1,3 +1,2 @@
 require rust-cross.inc
 require rust-source-${PV}.inc
-
diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtools/rust/rust-llvm.inc
index b4bef3875c..53ae87ed0f 100644
--- a/meta/recipes-devtools/rust/rust-llvm.inc
+++ b/meta/recipes-devtools/rust/rust-llvm.inc
@@ -1,13 +1,13 @@
 SUMMARY = "LLVM compiler framework (packaged with rust)"
-LICENSE = "NCSA"
+LICENSE ?= "Apache-2.0-with-LLVM-exception"
 
 SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch"
 
 S = "${RUSTSRC}/src/llvm-project/llvm"
 
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=4c0bc17c954e99fd547528d938832bfa"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
 
-inherit cmake pythonnative
+inherit cmake python3native
 
 DEPENDS += "ninja-native rust-llvm-native"
 
@@ -19,7 +19,7 @@ LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=Release \
-    -DLLVM_TARGETS_TO_BUILD='X86;ARM;AArch64;PowerPC;Mips' \
+    -DLLVM_TARGETS_TO_BUILD='ARM;AArch64;Mips;PowerPC;RISCV;X86' \
     -DLLVM_BUILD_DOCS=OFF \
     -DLLVM_ENABLE_TERMINFO=OFF \
     -DLLVM_ENABLE_ZLIB=OFF \
@@ -44,9 +44,11 @@ EXTRA_OECMAKE_append_class-target = "\
 # provide almost no value. If you really need them then override this
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-do_install_append_class-target() {
-    # Disable checks on the native tools, since these should came from the native recipe
-    sed -i -e 's/\(.*APPEND.*_IMPORT_CHECK_FILES_FOR_.*{_IMPORT_PREFIX}\/bin\/.*\)/#\1/' ${D}/usr/share/llvm/cmake/LLVMExports-noconfig.cmake
+export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
+
+do_install_append () {
+    # we don't need any of this stuff to build Rust
+    rm -rf "${D}/usr/lib/cmake"
 }
 
 PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.34.2.bb b/meta/recipes-devtools/rust/rust-llvm_1.34.2.bb
deleted file mode 100644
index d41fa28477..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm_1.34.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require rust-source-${PV}.inc
-require rust-llvm.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
-
-do_install_prepend () {
-	# the install does a sed on this without installing the file
-	# we don't need it for anything
-	mkdir -p "${D}/usr/share/llvm/cmake"
-	touch "${D}/usr/share/llvm/cmake/LLVMExports-noconfig.cmake"
-}
-
-do_install_append () {
-	# we don't need any of this stuff to build Rust
-	rm -rf "${D}/usr/lib/cmake"
-}
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.36.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.36.0.bb
deleted file mode 100644
index d41fa28477..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm_1.36.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require rust-source-${PV}.inc
-require rust-llvm.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
-
-do_install_prepend () {
-	# the install does a sed on this without installing the file
-	# we don't need it for anything
-	mkdir -p "${D}/usr/share/llvm/cmake"
-	touch "${D}/usr/share/llvm/cmake/LLVMExports-noconfig.cmake"
-}
-
-do_install_append () {
-	# we don't need any of this stuff to build Rust
-	rm -rf "${D}/usr/lib/cmake"
-}
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.37.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.37.0.bb
deleted file mode 100644
index d41fa28477..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm_1.37.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require rust-source-${PV}.inc
-require rust-llvm.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
-
-do_install_prepend () {
-	# the install does a sed on this without installing the file
-	# we don't need it for anything
-	mkdir -p "${D}/usr/share/llvm/cmake"
-	touch "${D}/usr/share/llvm/cmake/LLVMExports-noconfig.cmake"
-}
-
-do_install_append () {
-	# we don't need any of this stuff to build Rust
-	rm -rf "${D}/usr/lib/cmake"
-}
diff --git a/meta/recipes-devtools/rust/rust-cross_1.37.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.47.0.bb
similarity index 55%
rename from meta/recipes-devtools/rust/rust-cross_1.37.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.47.0.bb
index bb92b99ccc..1dca22bd60 100644
--- a/meta/recipes-devtools/rust/rust-cross_1.37.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.47.0.bb
@@ -1,3 +1,2 @@
-require rust-cross.inc
 require rust-source-${PV}.inc
-
+require rust-llvm.inc
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.49.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.49.0.bb
new file mode 100644
index 0000000000..1dca22bd60
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm_1.49.0.bb
@@ -0,0 +1,2 @@
+require rust-source-${PV}.inc
+require rust-llvm.inc
diff --git a/meta/recipes-devtools/rust/rust-snapshot-1.34.2.inc b/meta/recipes-devtools/rust/rust-snapshot-1.34.2.inc
deleted file mode 100644
index d0209bb864..0000000000
--- a/meta/recipes-devtools/rust/rust-snapshot-1.34.2.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-## This is information on the rust-snapshot (binary) used to build our current release.
-## snapshot info is taken from rust/src/stage0.txt
-## TODO: find a way to add additional SRC_URIs based on the contents of an
-##       earlier SRC_URI.
-RS_VERSION = "1.33.0"
-
-RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-CARGO_VERSION = "0.34.0"
-CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-
-SRC_URI += " \
-	https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.gz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-	https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.gz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-	https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.gz;name=cargo-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-	"
-
-# TODO: Add hashes for other architecture toolchains as well. Make a script?
-SRC_URI[rustc-snapshot-x86_64.md5sum] = "c1ec989c1965dce754dda1e54274a68c"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "54a342f718b712d8a17fd7878ebd37d22a82ebc70b59c421168cd4153fd04c2b"
-SRC_URI[rust-std-snapshot-x86_64.md5sum] = "d573c5bd3a965c973734c1606968a91e"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "661c2ba717ae1502f002b4c6e7aeb8941685c7ea8fe7ac26ed9ede26f615b7af"
-SRC_URI[cargo-snapshot-x86_64.md5sum] = "de0e635afa9bf495cefecea476bfce36"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "4795ae5ca3bb8c7c83ca338676bb02b670efa1eb474e346284b629dc872bcce8"
diff --git a/meta/recipes-devtools/rust/rust-snapshot-1.36.0.inc b/meta/recipes-devtools/rust/rust-snapshot-1.36.0.inc
deleted file mode 100644
index e4b6813e84..0000000000
--- a/meta/recipes-devtools/rust/rust-snapshot-1.36.0.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-## This is information on the rust-snapshot (binary) used to build our current release.
-## snapshot info is taken from rust/src/stage0.txt
-## TODO: find a way to add additional SRC_URIs based on the contents of an
-##       earlier SRC_URI.
-RS_VERSION = "1.35.0"
-
-RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-CARGO_VERSION = "0.36.0"
-CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-
-SRC_URI += " \
-	https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-	https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-	https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-	"
-
-# TODO: Add hashes for other architecture toolchains as well. Make a script?
-SRC_URI[rustc-snapshot-x86_64.md5sum] = "47ea78f6b3f68e30f24b9c94e465d6bd"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "5d6dc216ba429ddf3a1657e70f3e5e380549b546fe56de897677a11d72aa4e07"
-SRC_URI[rust-std-snapshot-x86_64.md5sum] = "348ec23ca8e47fc65079bc80e63cca5f"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "ccff05d0e2d88499505b10f8e33e8b1645df057f918edc81f8acb0fcee9f90b2"
-SRC_URI[cargo-snapshot-x86_64.md5sum] = "93a375e771f3d9b3a139e612dd4730ee"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "ab5a6ff1947463dbd2477ca5dac2012494dae821112098ae0c54add652adfdc3"
diff --git a/meta/recipes-devtools/rust/rust-snapshot-1.37.0.inc b/meta/recipes-devtools/rust/rust-snapshot-1.37.0.inc
deleted file mode 100644
index 8d4c1801ed..0000000000
--- a/meta/recipes-devtools/rust/rust-snapshot-1.37.0.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-## This is information on the rust-snapshot (binary) used to build our current release.
-## snapshot info is taken from rust/src/stage0.txt
-## TODO: find a way to add additional SRC_URIs based on the contents of an
-##       earlier SRC_URI.
-RS_VERSION = "1.36.0"
-
-RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-CARGO_VERSION = "0.37.0"
-CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-
-SRC_URI += " \
-	https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-	https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-	https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-	"
-
-# TODO: Add hashes for other architecture toolchains as well. Make a script?
-SRC_URI[rustc-snapshot-x86_64.md5sum] = "ec27794c94cc1df1a0a69f7244a09176"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "fff0158da6f5af2a89936dc3e0c361077c06c2983eb310615e02f81ebbde1416"
-SRC_URI[rust-std-snapshot-x86_64.md5sum] = "b71a6fd6f44527c3bf09584e89ad8958"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "ce8e12684b568a8a4f7d346a743383429849cf3f028f5712ad3d3e31590c8db3"
-SRC_URI[cargo-snapshot-x86_64.md5sum] = "8c661276a0da7a1aa48affbe33b347e6"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "d20fa121951339d5492cf8862f8a7af59efc99d18f3c27b95ab6d4658b6a7d67"
diff --git a/meta/recipes-devtools/rust/rust-snapshot-1.47.0.inc b/meta/recipes-devtools/rust/rust-snapshot-1.47.0.inc
new file mode 100644
index 0000000000..cdd52f6d3a
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-snapshot-1.47.0.inc
@@ -0,0 +1,13 @@
+require rust-snapshot.inc
+
+## This is information on the rust-snapshot (binary) used to build our current release.
+## snapshot info is taken from rust/src/stage0.txt
+## TODO: find a way to add additional SRC_URIs based on the contents of an
+##       earlier SRC_URI.
+RS_VERSION = "1.46.0"
+CARGO_VERSION = "0.47.0"
+
+# TODO: Add hashes for other architecture toolchains as well. Make a script?
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "e631d80cb03539769c041ee4566e94e36a271d4b3cdd149e1447d1f77fda979c"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "6edcec5367f9fcaee78cbcabfb1f6757fa95d7fd2c0853913223fe20ad534f12"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "9da5c4888c6025fa174eaef330337e49666ca9562f876a34d40c03a80d432b8d"
diff --git a/meta/recipes-devtools/rust/rust-snapshot-1.49.0.inc b/meta/recipes-devtools/rust/rust-snapshot-1.49.0.inc
new file mode 100644
index 0000000000..18f2b7c25e
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-snapshot-1.49.0.inc
@@ -0,0 +1,13 @@
+require rust-snapshot.inc
+
+## This is information on the rust-snapshot (binary) used to build our current release.
+## snapshot info is taken from rust/src/stage0.txt
+## TODO: find a way to add additional SRC_URIs based on the contents of an
+##       earlier SRC_URI.
+RS_VERSION = "1.48.0"
+CARGO_VERSION = "1.48.0"
+
+# TODO: Add hashes for other architecture toolchains as well. Make a script?
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "1c00a6a0dabbf6290728b09f9307d9fa6cc985487f727075c68acd4a600ef3f8"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "fc4d292a52cbb6b84fb9f065d0d7596064a9b957381d639d5a750d6e2bf02483"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "b11d595581e2580c069b5039214e1031a0e4f87ff6490ac39f92f77857e37055"
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
new file mode 100644
index 0000000000..79d03afd1b
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -0,0 +1,9 @@
+SRC_URI += " \
+    https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+    https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+    https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+"
+
+RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
diff --git a/meta/recipes-devtools/rust/rust-source-1.34.2.inc b/meta/recipes-devtools/rust/rust-source-1.34.2.inc
deleted file mode 100644
index 5c83f6f000..0000000000
--- a/meta/recipes-devtools/rust/rust-source-1.34.2.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.gz;name=rust"
-
-SRC_URI[rust.md5sum] = "7c85e6a60dda740295f7e004a1fb15e1"
-SRC_URI[rust.sha256sum] = "c69a4a85a1c464368597df8878cb9e1121aae93e215616d45ad7d23af3052f56"
-
-# later versions of rust change the directory that they unextract to
-RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
-# set this as our default
-S = "${RUSTSRC}"
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
diff --git a/meta/recipes-devtools/rust/rust-source-1.36.0.inc b/meta/recipes-devtools/rust/rust-source-1.36.0.inc
deleted file mode 100644
index 1a1d07c72f..0000000000
--- a/meta/recipes-devtools/rust/rust-source-1.36.0.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
-
-SRC_URI[rust.md5sum] = "78ffc0b029aaed216b45c3fe24747d46"
-SRC_URI[rust.sha256sum] = "f51645b9f787af4a5d94db17f6af39db0c55980ed24fe366cad55b57900f8f2d"
-
-# later versions of rust change the directory that they unextract to
-RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
-# set this as our default
-S = "${RUSTSRC}"
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
diff --git a/meta/recipes-devtools/rust/rust-source-1.37.0.inc b/meta/recipes-devtools/rust/rust-source-1.37.0.inc
deleted file mode 100644
index 0169cd3fbd..0000000000
--- a/meta/recipes-devtools/rust/rust-source-1.37.0.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
-
-SRC_URI[rust.md5sum] = "ee6300b1d7e5767115492915c4c0d8ef"
-SRC_URI[rust.sha256sum] = "10abffac50a729cf74cef6dd03193a2f4647541bd19ee9281be9e5b12ca8cdfd"
-
-# later versions of rust change the directory that they unextract to
-RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
-# set this as our default
-S = "${RUSTSRC}"
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
diff --git a/meta/recipes-devtools/rust/rust-source-1.47.0.inc b/meta/recipes-devtools/rust/rust-source-1.47.0.inc
new file mode 100644
index 0000000000..6bf6e726b1
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-source-1.47.0.inc
@@ -0,0 +1,3 @@
+require rust-source.inc
+
+SRC_URI[rust.sha256sum] = "ec2c81d2d34890486094a6407589be96161e4e301c238332d32c6dbae4f38ea2"
diff --git a/meta/recipes-devtools/rust/rust-source-1.49.0.inc b/meta/recipes-devtools/rust/rust-source-1.49.0.inc
new file mode 100644
index 0000000000..645fa2819b
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-source-1.49.0.inc
@@ -0,0 +1,3 @@
+require rust-source.inc
+
+SRC_URI[rust.sha256sum] = "ebe910edc824a0a037a10be443446a0511923ba8342fa3c331ec8a22481d5d15"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
new file mode 100644
index 0000000000..52502fb49f
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -0,0 +1,3 @@
+SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
+
+RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
diff --git a/meta/recipes-devtools/rust/rust_1.36.0.bb b/meta/recipes-devtools/rust/rust-target.inc
similarity index 82%
rename from meta/recipes-devtools/rust/rust_1.36.0.bb
rename to meta/recipes-devtools/rust/rust-target.inc
index c7f9f4fd87..0a5b127f3c 100644
--- a/meta/recipes-devtools/rust/rust_1.36.0.bb
+++ b/meta/recipes-devtools/rust/rust-target.inc
@@ -1,6 +1,4 @@
 require rust.inc
-require rust-source-${PV}.inc
-require rust-snapshot-${PV}.inc
 
 DEPENDS += "rust-llvm (=${PV})"
 
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index abd4e0e4bc..aeb5432a16 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -2,12 +2,15 @@ SUMMARY = "Rust compiler and runtime libaries"
 HOMEPAGE = "http://www.rust-lang.org"
 SECTION = "devel"
 LICENSE = "MIT | Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
 
 inherit rust
 inherit cargo_common
 
-DEPENDS += "file-native python-native"
+DEPENDS += "file-native python3-native"
 DEPENDS_append_class-native = " rust-llvm-native"
+EXCLUDE_FROM_WORLD = "1"
+S = "${RUSTSRC}"
 
 # We generate local targets, and need to be able to locate them
 export RUST_TARGET_PATH="${WORKDIR}/targets/"
@@ -47,6 +50,9 @@ def llvm_features_from_tune(d):
         return []
     feat = frozenset(feat.split())
 
+    mach_overrides = d.getVar('MACHINEOVERRIDES')
+    mach_overrides = frozenset(mach_overrides.split(':'))
+
     if 'vfpv4' in feat:
         f.append("+vfp4")
     if 'vfpv3' in feat:
@@ -60,19 +66,16 @@ def llvm_features_from_tune(d):
     if 'neon' in feat:
         f.append("+neon")
 
-    if 'aarch64' in feat:
-        f.append("+v8")
-
     if 'mips32' in feat:
         f.append("+mips32")
 
     if 'mips32r2' in feat:
         f.append("+mips32r2")
 
-    v7=frozenset(['armv7a', 'armv7r', 'armv7m', 'armv7ve'])
-    if not feat.isdisjoint(v7):
-        f.append("+v7")
-    if 'armv6' in feat:
+    if target_is_armv7(d):
+        f.append('+v7')
+
+    if ('armv6' in mach_overrides) or ('armv6' in feat):
         f.append("+v6")
 
     if 'dsp' in feat:
@@ -80,8 +83,8 @@ def llvm_features_from_tune(d):
 
     if 'thumb' in feat:
         if d.getVar('ARM_THUMB_OPT') is "thumb":
-            if not feat.isdisjoint(v7):
-                f.append("+thumb2")
+            if target_is_armv7(d):
+                f.append('+thumb2')
             f.append("+thumb-mode")
 
     if 'cortexa5' in feat:
@@ -94,7 +97,8 @@ def llvm_features_from_tune(d):
         f.append("+a15")
     if 'cortexa17' in feat:
         f.append("+a17")
-
+    if ('riscv64' in feat) or ('riscv32' in feat):
+        f.append("+a,+c,+d,+f,+m")
     return f
 
 # TARGET_CC_ARCH changes from build/cross/target so it'll do the right thing
@@ -151,6 +155,15 @@ TARGET_C_INT_WIDTH[arm] = "32"
 MAX_ATOMIC_WIDTH[arm] = "64"
 FEATURES[arm] = "+v6,+vfp2"
 
+## armv7-unknown-linux-gnueabihf
+DATA_LAYOUT[armv7] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+LLVM_TARGET[armv7] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[armv7] = "little"
+TARGET_POINTER_WIDTH[armv7] = "32"
+TARGET_C_INT_WIDTH[armv7] = "32"
+MAX_ATOMIC_WIDTH[armv7] = "64"
+FEATURES[armv7] = "+v7,+vfp2,+thumb2"
+
 ## aarch64-unknown-linux-{gnu, musl}
 DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
 LLVM_TARGET[aarch64] = "${RUST_TARGET_SYS}"
@@ -224,7 +237,7 @@ TARGET_C_INT_WIDTH[powerpc] = "32"
 MAX_ATOMIC_WIDTH[powerpc] = "32"
 
 ## riscv32-unknown-linux-{gnu, musl}
-DATA_LAYOUT[riscv32] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
+DATA_LAYOUT[riscv32] = "e-m:e-p:32:32-i64:64-n32-S128"
 LLVM_TARGET[riscv32] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[riscv32] = "little"
 TARGET_POINTER_WIDTH[riscv32] = "32"
@@ -239,9 +252,6 @@ TARGET_POINTER_WIDTH[riscv64] = "64"
 TARGET_C_INT_WIDTH[riscv64] = "64"
 MAX_ATOMIC_WIDTH[riscv64] = "64"
 
-def arch_for(d, thing):
-    return d.getVar('{}_ARCH'.format(thing))
-
 def sys_for(d, thing):
     return d.getVar('{}_SYS'.format(thing))
 
@@ -257,6 +267,8 @@ def arch_to_rust_target_arch(arch):
         return "mips"
     elif arch == "mip64sel":
         return "mips64"
+    elif arch == "armv7":
+        return "arm"
     else:
         return arch
 
@@ -274,6 +286,8 @@ def llvm_cpu(d):
     trans['powerpc'] = "powerpc"
     trans['mips64'] = "mips64"
     trans['mips64el'] = "mips64"
+    trans['riscv64'] = "generic-rv64"
+    trans['riscv32'] = "generic-rv32"
 
     if target in ["mips", "mipsel"]:
         feat = frozenset(d.getVar('TUNE_FEATURES').split())
@@ -296,18 +310,12 @@ TARGET_LLVM_FEATURES = "${@llvm_features(d)}"
 # (original) target.
 TARGET_LLVM_FEATURES_class-native = "${@','.join(llvm_features_from_cc_arch(d))}"
 
-def rust_gen_target(d, thing, wd):
+def rust_gen_target(d, thing, wd, features, cpu, arch):
     import json
     from distutils.version import LooseVersion
-    arch = arch_for(d, thing)
     sys = sys_for(d, thing)
     prefix = prefix_for(d, thing)
 
-    features = ""
-    cpu = "generic"
-    if thing is "TARGET":
-        features = d.getVar('TARGET_LLVM_FEATURES') or ""
-        cpu = d.getVar('TARGET_LLVM_CPU')
     features = features or d.getVarFlag('FEATURES', arch) or ""
     features = features.strip()
 
@@ -315,7 +323,7 @@ def rust_gen_target(d, thing, wd):
     tspec = {}
     tspec['llvm-target'] = d.getVarFlag('LLVM_TARGET', arch)
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch)
-    tspec['max-atomic-width'] = d.getVarFlag('MAX_ATOMIC_WIDTH', arch)
+    tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch))
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch)
     tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch)
     tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch)
@@ -325,6 +333,10 @@ def rust_gen_target(d, thing, wd):
         tspec['env'] = "musl"
     else:
         tspec['env'] = "gnu"
+    if "riscv64" in tspec['llvm-target']:
+        tspec['llvm-abiname'] = "lp64d"
+    if "riscv32" in tspec['llvm-target']:
+        tspec['llvm-abiname'] = "ilp32d"
     tspec['vendor'] = "unknown"
     tspec['target-family'] = "unix"
     tspec['linker'] = "{}{}gcc".format(d.getVar('CCACHE'), prefix)
@@ -352,20 +364,15 @@ def rust_gen_target(d, thing, wd):
     with open(wd + sys + '.json', 'w') as f:
         json.dump(tspec, f, indent=4)
 
-
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
-    # It is important 'TARGET' is last here so that it overrides our less
-    # informed choices for BUILD & HOST if TARGET happens to be the same as
-    # either of them.
-    for thing in ['BUILD', 'HOST', 'TARGET']:
-        bb.debug(1, "rust_gen_target for " + thing)
-        rust_gen_target(d, thing, wd)
+    build_arch = d.getVar('BUILD_ARCH')
+    rust_gen_target(d, 'BUILD', wd, "", "generic", build_arch)
 }
+
 addtask rust_gen_targets after do_patch before do_compile
 do_rust_gen_targets[dirs] += "${WORKDIR}/targets"
 
-
 do_rust_setup_snapshot () {
     for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
         "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
@@ -450,7 +457,18 @@ python do_configure() {
     # nothing about when trying to build some stage0 tools (like fabricate)
     config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
 
+    # [install]
+    config.add_section("install")
+    # ./x.py install doesn't have any notion of "destdir"
+    # but we can prepend ${D} to all the directories instead
+    config.set("install", "prefix",  e(d.getVar("D", True) + d.getVar("prefix", True)))
+    config.set("install", "bindir",  e(d.getVar("D", True) + d.getVar("bindir", True)))
+    config.set("install", "libdir",  e(d.getVar("D", True) + d.getVar("libdir", True)))
+    config.set("install", "datadir", e(d.getVar("D", True) + d.getVar("datadir", True)))
+    config.set("install", "mandir",  e(d.getVar("D", True) + d.getVar("mandir", True)))
+
     with open("config.toml", "w") as f:
+        f.write('changelog-seen = 2\n\n')
         config.write(f)
 
     # set up ${WORKDIR}/cargo_home
@@ -471,39 +489,36 @@ rust_runx () {
 
     oe_cargo_fix_env
 
-    python src/bootstrap/bootstrap.py "$@" --verbose
+    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
 }
+rust_runx[vardepsexclude] += "PARALLEL_MAKE"
 
 do_compile () {
     rust_runx build
-    rust_runx dist
 }
 
 rust_do_install () {
-    # Only install compiler generated for the HOST_SYS. There will be
-    # one for SNAPSHOT_BUILD_SYS as well.
-    local installer=build/tmp/dist/rustc-${PV}-${HOST_SYS}/install.sh
-    ${installer} --destdir="${D}" --prefix="${prefix}" --disable-ldconfig
+    mkdir -p ${D}${bindir}
+    cp build/${HOST_SYS}/stage2/bin/* ${D}${bindir}
 
-    installer=build/tmp/dist/rust-std-${PV}-${HOST_SYS}/install.sh
-    ${installer} --destdir="${D}" --prefix="${prefix}" --disable-ldconfig
+    mkdir -p ${D}${libdir}/rustlib
+    cp -pRd build/${HOST_SYS}/stage2/lib/* ${D}${libdir}
+    # Remove absolute symlink so bitbake doesn't complain
+    rm -f ${D}${libdir}/rustlib/src/rust
+}
 
+rust_install_targets() {
     # Install our custom target.json files
     local td="${D}${libdir}/rustlib/"
     install -d "$td"
     for tgt in "${WORKDIR}/targets/"* ; do
         install -m 0644 "$tgt" "$td"
     done
-
-    # cleanup after rust-installer since we don't need these bits
-    rm ${D}/${libdir}/rustlib/install.log
-    rm ${D}/${libdir}/rustlib/rust-installer-version
-    rm ${D}/${libdir}/rustlib/uninstall.sh
-    rm ${D}/${libdir}/rustlib/components
 }
 
 
 do_install () {
     rust_do_install
+    rust_install_targets
 }
 # ex: sts=4 et sw=4 ts=8
diff --git a/meta/recipes-devtools/rust/rust/0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch b/meta/recipes-devtools/rust/rust/0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch
new file mode 100644
index 0000000000..13d81eaa37
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust/0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch
@@ -0,0 +1,75 @@
+From dd682cb48c8b667859dded98a4bbfbd891a1eca4 Mon Sep 17 00:00:00 2001
+From: Vadim Petrochenkov <vadim.petrochenkov@gmail.com>
+Date: Thu, 12 Nov 2020 19:16:59 +0300
+Subject: [PATCH] rustc_target: Fix dash vs underscore mismatches in option
+ names
+
+---
+ compiler/rustc_target/src/spec/mod.rs | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/compiler/rustc_target/src/spec/mod.rs b/compiler/rustc_target/src/spec/mod.rs
+index f949bf95a50..f837114ee74 100644
+--- a/compiler/rustc_target/src/spec/mod.rs
++++ b/compiler/rustc_target/src/spec/mod.rs
+@@ -1428,8 +1428,8 @@ pub fn from_json(obj: Json) -> Result<Target, String> {
+         }
+ 
+         key!(is_builtin, bool);
+-        key!(endian = "target_endian");
+-        key!(c_int_width = "target_c_int_width");
++        key!(endian = "target-endian");
++        key!(c_int_width = "target-c-int-width");
+         key!(os);
+         key!(env);
+         key!(vendor);
+@@ -1466,7 +1466,7 @@ pub fn from_json(obj: Json) -> Result<Target, String> {
+         key!(exe_suffix);
+         key!(staticlib_prefix);
+         key!(staticlib_suffix);
+-        key!(os_family = "target_family", optional);
++        key!(os_family = "target-family", optional);
+         key!(abi_return_struct_as_int, bool);
+         key!(is_like_osx, bool);
+         key!(is_like_solaris, bool);
+@@ -1511,7 +1511,7 @@ pub fn from_json(obj: Json) -> Result<Target, String> {
+         key!(limit_rdylib_exports, bool);
+         key!(override_export_symbols, opt_list);
+         key!(merge_functions, MergeFunctions)?;
+-        key!(mcount = "target_mcount");
++        key!(mcount = "target-mcount");
+         key!(llvm_abiname);
+         key!(relax_elf_relocations, bool);
+         key!(llvm_args, list);
+@@ -1663,8 +1663,8 @@ fn to_json(&self) -> Json {
+         target_val!(data_layout);
+ 
+         target_option_val!(is_builtin);
+-        target_option_val!(endian, "target_endian");
+-        target_option_val!(c_int_width, "target_c_int_width");
++        target_option_val!(endian, "target-endian");
++        target_option_val!(c_int_width, "target-c-int-width");
+         target_option_val!(os);
+         target_option_val!(env);
+         target_option_val!(vendor);
+@@ -1701,7 +1701,7 @@ fn to_json(&self) -> Json {
+         target_option_val!(exe_suffix);
+         target_option_val!(staticlib_prefix);
+         target_option_val!(staticlib_suffix);
+-        target_option_val!(os_family, "target_family");
++        target_option_val!(os_family, "target-family");
+         target_option_val!(abi_return_struct_as_int);
+         target_option_val!(is_like_osx);
+         target_option_val!(is_like_solaris);
+@@ -1746,7 +1746,7 @@ fn to_json(&self) -> Json {
+         target_option_val!(limit_rdylib_exports);
+         target_option_val!(override_export_symbols);
+         target_option_val!(merge_functions);
+-        target_option_val!(mcount, "target_mcount");
++        target_option_val!(mcount, "target-mcount");
+         target_option_val!(llvm_abiname);
+         target_option_val!(relax_elf_relocations);
+         target_option_val!(llvm_args);
+-- 
+2.28.0
+
diff --git a/meta/recipes-devtools/rust/rust_1.34.2.bb b/meta/recipes-devtools/rust/rust_1.34.2.bb
deleted file mode 100644
index c7f9f4fd87..0000000000
--- a/meta/recipes-devtools/rust/rust_1.34.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require rust.inc
-require rust-source-${PV}.inc
-require rust-snapshot-${PV}.inc
-
-DEPENDS += "rust-llvm (=${PV})"
-
-# Otherwise we'll depend on what we provide
-INHIBIT_DEFAULT_RUST_DEPS_class-native = "1"
-# We don't need to depend on gcc-native because yocto assumes it exists
-PROVIDES_class-native = "virtual/${TARGET_PREFIX}rust"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/rust/rust_1.37.0.bb b/meta/recipes-devtools/rust/rust_1.37.0.bb
deleted file mode 100644
index c7f9f4fd87..0000000000
--- a/meta/recipes-devtools/rust/rust_1.37.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require rust.inc
-require rust-source-${PV}.inc
-require rust-snapshot-${PV}.inc
-
-DEPENDS += "rust-llvm (=${PV})"
-
-# Otherwise we'll depend on what we provide
-INHIBIT_DEFAULT_RUST_DEPS_class-native = "1"
-# We don't need to depend on gcc-native because yocto assumes it exists
-PROVIDES_class-native = "virtual/${TARGET_PREFIX}rust"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/rust/rust_1.47.0.bb b/meta/recipes-devtools/rust/rust_1.47.0.bb
new file mode 100644
index 0000000000..894f715e16
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust_1.47.0.bb
@@ -0,0 +1,9 @@
+require rust-target.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
+
+# The default behaviour of x.py changed in 1.47+ so now we need to
+# explicitly ask for the stage 2 compiler to be assembled.
+do_compile () {
+    rust_runx build --stage 2 src/rustc
+}
diff --git a/meta/recipes-devtools/rust/rust_1.49.0.bb b/meta/recipes-devtools/rust/rust_1.49.0.bb
new file mode 100644
index 0000000000..96d625f6c3
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust_1.49.0.bb
@@ -0,0 +1,15 @@
+require rust-target.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
+
+SRC_URI += "\
+    file://0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch \
+    "
+
+do_compile () {
+    rust_runx build --stage 2
+}
+
+rust_do_install() {
+    rust_runx install
+}
diff --git a/meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch b/meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch
new file mode 100644
index 0000000000..56ef9e73e6
--- /dev/null
+++ b/meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch
@@ -0,0 +1,23 @@
+From fa40b874f6470ec11a8fd7b0c9909d0cdd2d6feb Mon Sep 17 00:00:00 2001
+From: Dan Callaghan <dan.callaghan@opengear.com>
+Date: Fri, 5 Feb 2021 08:56:34 +1000
+Subject: [PATCH] enable LTO
+
+---
+ Cargo.toml | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index 7a2f6c8..cdb6b5d 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -3,3 +3,6 @@
+ name = "rust-hello-world"
+ version = "0.0.1"
+ authors = ["Cody P Schafer <dev@codyps.com>"]
++
++[profile.release]
++lto = true
+-- 
+2.28.0
+
diff --git a/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb b/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
index ba8854849d..c29eac34e5 100644
--- a/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
+++ b/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
@@ -1,11 +1,15 @@
 inherit cargo
 
-SRC_URI = "git://github.com/jmesmon/rust-hello-world.git;protocol=https"
+SRC_URI = "git://github.com/meta-rust/rust-hello-world.git;protocol=https"
 SRCREV="e0fa23f1a3cb1eb1407165bd2fc36d2f6e6ad728"
 LIC_FILES_CHKSUM="file://COPYRIGHT;md5=e6b2207ac3740d2d01141c49208c2147"
 
+SRC_URI += "\
+    file://0001-enable-LTO.patch \
+    "
+
 SUMMARY = "Hello World by Cargo for Rust"
-HOMEPAGE = "https://github.com/jmesmon/rust-hello-world"
+HOMEPAGE = "https://github.com/meta-rust/rust-hello-world"
 LICENSE = "MIT | Apache-2.0"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-example/rustfmt/rustfmt_0.8.0.bb b/meta/recipes-example/rustfmt/rustfmt_0.8.0.bb
deleted file mode 100644
index 0c94e38e66..0000000000
--- a/meta/recipes-example/rustfmt/rustfmt_0.8.0.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-# Auto-Generated by cargo-bitbake 0.3.6
-#
-inherit cargo
-
-# If this is git based prefer versioned ones if they exist
-# DEFAULT_PREFERENCE = "-1"
-
-# how to get rustfmt could be as easy as but default to a git checkout:
-# SRC_URI += "crate://crates.io/rustfmt/0.8.0"
-SRC_URI += "git://github.com/rust-lang-nursery/rustfmt.git;protocol=https;branch=syntex"
-SRCREV = "4ed5a3bac71ed104e27797ee63729b0333e39d39"
-S = "${WORKDIR}/git"
-CARGO_SRC_DIR=""
-
-
-# please note if you have entries that do not begin with crate://
-# you must change them to how that package can be fetched
-SRC_URI += " \
-crate://crates.io/aho-corasick/0.6.2 \
-crate://crates.io/bitflags/0.8.0 \
-crate://crates.io/diff/0.1.10 \
-crate://crates.io/either/1.0.3 \
-crate://crates.io/env_logger/0.4.1 \
-crate://crates.io/getopts/0.2.14 \
-crate://crates.io/itertools/0.5.9 \
-crate://crates.io/kernel32-sys/0.2.2 \
-crate://crates.io/libc/0.2.21 \
-crate://crates.io/log/0.3.6 \
-crate://crates.io/memchr/1.0.1 \
-crate://crates.io/multimap/0.3.0 \
-crate://crates.io/regex-syntax/0.4.0 \
-crate://crates.io/regex/0.2.1 \
-crate://crates.io/rustc-serialize/0.3.22 \
-crate://crates.io/same-file/0.1.3 \
-crate://crates.io/strings/0.0.1 \
-crate://crates.io/syntex_errors/0.58.1 \
-crate://crates.io/syntex_pos/0.58.1 \
-crate://crates.io/syntex_syntax/0.58.1 \
-crate://crates.io/term/0.4.5 \
-crate://crates.io/thread-id/3.0.0 \
-crate://crates.io/thread_local/0.3.3 \
-crate://crates.io/toml/0.2.1 \
-crate://crates.io/unicode-segmentation/1.1.0 \
-crate://crates.io/unicode-xid/0.0.4 \
-crate://crates.io/unreachable/0.1.1 \
-crate://crates.io/utf8-ranges/1.0.0 \
-crate://crates.io/void/1.0.2 \
-crate://crates.io/walkdir/1.0.7 \
-crate://crates.io/winapi-build/0.1.1 \
-crate://crates.io/winapi/0.2.8 \
-"
-
-
-
-LIC_FILES_CHKSUM=" \
-file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
-file://LICENSE-MIT;md5=0b29d505d9225d1f0815cbdcf602b901 \
-"
-
-SUMMARY = "Tool to find and fix Rust formatting issues"
-HOMEPAGE = "https://github.com/rust-lang-nursery/rustfmt"
-LICENSE = "Apache-2.0 | MIT"
-
-# includes this file if it exists but does not fail
-# this is useful for anything you may want to override from
-# what cargo-bitbake generates.
-include rustfmt.inc
diff --git a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb b/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
new file mode 100644
index 0000000000..ecced49049
--- /dev/null
+++ b/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
@@ -0,0 +1,171 @@
+# Auto-Generated by cargo-bitbake 0.3.13
+#
+inherit cargo
+
+# If this is git based prefer versioned ones if they exist
+# DEFAULT_PREFERENCE = "-1"
+
+# how to get rustfmt-nightly could be as easy as but default to a git checkout:
+# SRC_URI += "crate://crates.io/rustfmt-nightly/1.4.2"
+SRC_URI += "git://github.com/rust-lang/rustfmt/;protocol=https;nobranch=1"
+SRCREV = "aeb3496f31a0dfa90fc511520d2023634e885260"
+S = "${WORKDIR}/git"
+CARGO_SRC_DIR = ""
+
+
+# please note if you have entries that do not begin with crate://
+# you must change them to how that package can be fetched
+SRC_URI += " \
+    crate://crates.io/aho-corasick/0.7.4 \
+    crate://crates.io/annotate-snippets/0.6.1 \
+    crate://crates.io/ansi_term/0.11.0 \
+    crate://crates.io/argon2rs/0.2.5 \
+    crate://crates.io/arrayvec/0.4.11 \
+    crate://crates.io/atty/0.2.13 \
+    crate://crates.io/autocfg/0.1.5 \
+    crate://crates.io/backtrace-sys/0.1.31 \
+    crate://crates.io/backtrace/0.3.33 \
+    crate://crates.io/bitflags/1.1.0 \
+    crate://crates.io/blake2-rfc/0.2.18 \
+    crate://crates.io/bstr/0.2.6 \
+    crate://crates.io/bytecount/0.5.1 \
+    crate://crates.io/byteorder/1.3.2 \
+    crate://crates.io/c2-chacha/0.2.2 \
+    crate://crates.io/cargo_metadata/0.8.1 \
+    crate://crates.io/cc/1.0.38 \
+    crate://crates.io/cfg-if/0.1.9 \
+    crate://crates.io/clap/2.33.0 \
+    crate://crates.io/cloudabi/0.0.3 \
+    crate://crates.io/constant_time_eq/0.1.3 \
+    crate://crates.io/crossbeam-channel/0.3.9 \
+    crate://crates.io/crossbeam-deque/0.2.0 \
+    crate://crates.io/crossbeam-epoch/0.3.1 \
+    crate://crates.io/crossbeam-utils/0.2.2 \
+    crate://crates.io/crossbeam-utils/0.6.6 \
+    crate://crates.io/derive-new/0.5.7 \
+    crate://crates.io/diff/0.1.11 \
+    crate://crates.io/dirs-sys/0.3.3 \
+    crate://crates.io/dirs/2.0.1 \
+    crate://crates.io/either/1.5.2 \
+    crate://crates.io/ena/0.13.0 \
+    crate://crates.io/env_logger/0.6.2 \
+    crate://crates.io/failure/0.1.5 \
+    crate://crates.io/failure_derive/0.1.5 \
+    crate://crates.io/fnv/1.0.6 \
+    crate://crates.io/fuchsia-cprng/0.1.1 \
+    crate://crates.io/getopts/0.2.19 \
+    crate://crates.io/getrandom/0.1.6 \
+    crate://crates.io/globset/0.4.4 \
+    crate://crates.io/heck/0.3.1 \
+    crate://crates.io/humantime/1.2.0 \
+    crate://crates.io/ignore/0.4.8 \
+    crate://crates.io/indexmap/1.0.2 \
+    crate://crates.io/itertools/0.8.0 \
+    crate://crates.io/itoa/0.4.4 \
+    crate://crates.io/jobserver/0.1.16 \
+    crate://crates.io/lazy_static/1.3.0 \
+    crate://crates.io/libc/0.2.60 \
+    crate://crates.io/lock_api/0.1.5 \
+    crate://crates.io/log/0.4.7 \
+    crate://crates.io/memchr/2.2.1 \
+    crate://crates.io/memoffset/0.2.1 \
+    crate://crates.io/nodrop/0.1.13 \
+    crate://crates.io/num_cpus/1.10.1 \
+    crate://crates.io/owning_ref/0.4.0 \
+    crate://crates.io/packed_simd/0.3.3 \
+    crate://crates.io/parking_lot/0.7.1 \
+    crate://crates.io/parking_lot_core/0.4.0 \
+    crate://crates.io/ppv-lite86/0.2.5 \
+    crate://crates.io/proc-macro2/0.4.30 \
+    crate://crates.io/quick-error/1.2.2 \
+    crate://crates.io/quote/0.6.13 \
+    crate://crates.io/rand/0.6.5 \
+    crate://crates.io/rand/0.7.0 \
+    crate://crates.io/rand_chacha/0.1.1 \
+    crate://crates.io/rand_chacha/0.2.1 \
+    crate://crates.io/rand_core/0.3.1 \
+    crate://crates.io/rand_core/0.4.0 \
+    crate://crates.io/rand_core/0.5.0 \
+    crate://crates.io/rand_hc/0.1.0 \
+    crate://crates.io/rand_hc/0.2.0 \
+    crate://crates.io/rand_isaac/0.1.1 \
+    crate://crates.io/rand_jitter/0.1.4 \
+    crate://crates.io/rand_os/0.1.3 \
+    crate://crates.io/rand_pcg/0.1.2 \
+    crate://crates.io/rand_xorshift/0.1.1 \
+    crate://crates.io/rdrand/0.4.0 \
+    crate://crates.io/redox_syscall/0.1.56 \
+    crate://crates.io/redox_users/0.3.0 \
+    crate://crates.io/regex-syntax/0.6.10 \
+    crate://crates.io/regex/1.2.0 \
+    crate://crates.io/rustc-ap-arena/542.0.0 \
+    crate://crates.io/rustc-ap-graphviz/542.0.0 \
+    crate://crates.io/rustc-ap-rustc_data_structures/542.0.0 \
+    crate://crates.io/rustc-ap-rustc_errors/542.0.0 \
+    crate://crates.io/rustc-ap-rustc_lexer/542.0.0 \
+    crate://crates.io/rustc-ap-rustc_macros/542.0.0 \
+    crate://crates.io/rustc-ap-rustc_target/542.0.0 \
+    crate://crates.io/rustc-ap-serialize/542.0.0 \
+    crate://crates.io/rustc-ap-syntax/542.0.0 \
+    crate://crates.io/rustc-ap-syntax_pos/542.0.0 \
+    crate://crates.io/rustc-demangle/0.1.15 \
+    crate://crates.io/rustc-hash/1.0.1 \
+    crate://crates.io/rustc-rayon-core/0.2.0 \
+    crate://crates.io/rustc-rayon/0.2.0 \
+    crate://crates.io/rustc-workspace-hack/1.0.0 \
+    crate://crates.io/rustc_version/0.2.3 \
+    crate://crates.io/ryu/1.0.0 \
+    crate://crates.io/same-file/1.0.5 \
+    crate://crates.io/scoped-tls/1.0.0 \
+    crate://crates.io/scoped_threadpool/0.1.9 \
+    crate://crates.io/scopeguard/0.3.3 \
+    crate://crates.io/semver-parser/0.7.0 \
+    crate://crates.io/semver/0.9.0 \
+    crate://crates.io/serde/1.0.97 \
+    crate://crates.io/serde_derive/1.0.97 \
+    crate://crates.io/serde_json/1.0.40 \
+    crate://crates.io/smallvec/0.6.10 \
+    crate://crates.io/spin/0.5.0 \
+    crate://crates.io/stable_deref_trait/1.1.1 \
+    crate://crates.io/strsim/0.8.0 \
+    crate://crates.io/structopt-derive/0.2.18 \
+    crate://crates.io/structopt/0.2.18 \
+    crate://crates.io/syn/0.15.42 \
+    crate://crates.io/synstructure/0.10.2 \
+    crate://crates.io/term/0.6.0 \
+    crate://crates.io/termcolor/1.0.5 \
+    crate://crates.io/textwrap/0.11.0 \
+    crate://crates.io/thread_local/0.3.6 \
+    crate://crates.io/toml/0.5.1 \
+    crate://crates.io/ucd-util/0.1.5 \
+    crate://crates.io/unicode-segmentation/1.3.0 \
+    crate://crates.io/unicode-width/0.1.5 \
+    crate://crates.io/unicode-xid/0.1.0 \
+    crate://crates.io/unicode_categories/0.1.1 \
+    crate://crates.io/utf8-ranges/1.0.3 \
+    crate://crates.io/vec_map/0.8.1 \
+    crate://crates.io/walkdir/2.2.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.2 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi/0.3.7 \
+    crate://crates.io/wincolor/1.0.1 \
+"
+
+
+
+# FIXME: update generateme with the real MD5 of the license file
+LIC_FILES_CHKSUM = " \
+    file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
+    file://LICENSE-MIT;md5=0b29d505d9225d1f0815cbdcf602b901 \
+"
+
+SUMMARY = "Tool to find and fix Rust formatting issues"
+HOMEPAGE = "https://github.com/rust-lang/rustfmt"
+LICENSE = "Apache-2.0 | MIT"
+
+# includes this file if it exists but does not fail
+# this is useful for anything you may want to override from
+# what cargo-bitbake generates.
+include rustfmt-nightly-${PV}.inc
+include rustfmt-nightly.inc
-- 
2.27.0


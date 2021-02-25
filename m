Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.5827.1614217729022232456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 17:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 11P1mbCK006948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 17:48:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 17:48:28 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Wed, 24 Feb 2021 17:48:28 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/7] meta-rust: move code to oe-core from meta-rust layer
Date: Wed, 24 Feb 2021 20:48:17 -0500
Message-ID: <20210225014823.397741-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225014823.397741-1-Randy.MacLeod@windriver.com>
References: <16668FEB024AAA5B.31532@lists.openembedded.org>
 <20210225014823.397741-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rust is becoming more widely used so move the
meta-rust layer. Taken from meta-rust at commit:
   11aed43 cargo-1.37.0: fix patch fuzz

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/classes/cargo.bbclass                    |  70 +++
 meta/classes/cargo_common.bbclass             |  98 ++++
 meta/classes/crate-fetch.bbclass              |  13 +
 meta/classes/rust-bin.bbclass                 | 149 +++++
 meta/classes/rust-common.bbclass              | 144 +++++
 meta/classes/rust.bbclass                     |  45 ++
 .../distro/include/rust_security_flags.inc    |   7 +
 meta/conf/layer.conf                          |   2 +
 meta/lib/crate.py                             | 149 +++++
 .../cargo-1.34.2/0001-Disable-http2.patch     |  29 +
 .../cargo-1.36.0/0001-Disable-http2.patch     |  31 ++
 .../cargo-1.37.0/0001-Disable-http2.patch     |  29 +
 meta/recipes-devtools/cargo/cargo.inc         |  43 ++
 meta/recipes-devtools/cargo/cargo_1.34.2.bb   |   8 +
 meta/recipes-devtools/cargo/cargo_1.36.0.bb   |   8 +
 meta/recipes-devtools/cargo/cargo_1.37.0.bb   |   8 +
 meta/recipes-devtools/rust/libstd-rs.inc      |  31 ++
 .../recipes-devtools/rust/libstd-rs_1.34.2.bb |   8 +
 .../recipes-devtools/rust/libstd-rs_1.36.0.bb |   8 +
 .../recipes-devtools/rust/libstd-rs_1.37.0.bb |   8 +
 meta/recipes-devtools/rust/rust-cross.inc     |  52 ++
 .../rust/rust-cross_1.34.2.bb                 |   3 +
 .../rust/rust-cross_1.36.0.bb                 |   3 +
 .../rust/rust-cross_1.37.0.bb                 |   3 +
 meta/recipes-devtools/rust/rust-llvm.inc      |  62 +++
 ...-llvm-allow-env-override-of-exe-path.patch |  32 ++
 .../recipes-devtools/rust/rust-llvm_1.34.2.bb |  16 +
 .../recipes-devtools/rust/rust-llvm_1.36.0.bb |  16 +
 .../recipes-devtools/rust/rust-llvm_1.37.0.bb |  16 +
 .../rust/rust-snapshot-1.34.2.inc             |  24 +
 .../rust/rust-snapshot-1.36.0.inc             |  24 +
 .../rust/rust-snapshot-1.37.0.inc             |  24 +
 .../rust/rust-source-1.34.2.inc               |  11 +
 .../rust/rust-source-1.36.0.inc               |  11 +
 .../rust/rust-source-1.37.0.inc               |  11 +
 meta/recipes-devtools/rust/rust.inc           | 509 ++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.34.2.bb     |  12 +
 meta/recipes-devtools/rust/rust_1.36.0.bb     |  12 +
 meta/recipes-devtools/rust/rust_1.37.0.bb     |  12 +
 .../rust-hello-world/rust-hello-world_git.bb  |  13 +
 meta/recipes-example/rustfmt/rustfmt_0.8.0.bb |  67 +++
 scripts/build.sh                              |  19 +
 scripts/cleanup-env.sh                        |  14 +
 scripts/containerize.sh                       |  54 ++
 scripts/fetch.sh                              | 103 ++++
 scripts/publish-build-cache.sh                |  13 +
 scripts/setup-env.sh                          |  12 +
 47 files changed, 2036 insertions(+)
 create mode 100644 meta/classes/cargo.bbclass
 create mode 100644 meta/classes/cargo_common.bbclass
 create mode 100644 meta/classes/crate-fetch.bbclass
 create mode 100644 meta/classes/rust-bin.bbclass
 create mode 100644 meta/classes/rust-common.bbclass
 create mode 100644 meta/classes/rust.bbclass
 create mode 100644 meta/conf/distro/include/rust_security_flags.inc
 create mode 100644 meta/lib/crate.py
 create mode 100644 meta/recipes-devtools/cargo/cargo-1.34.2/0001-Disable-http2.patch
 create mode 100644 meta/recipes-devtools/cargo/cargo-1.36.0/0001-Disable-http2.patch
 create mode 100644 meta/recipes-devtools/cargo/cargo-1.37.0/0001-Disable-http2.patch
 create mode 100644 meta/recipes-devtools/cargo/cargo.inc
 create mode 100644 meta/recipes-devtools/cargo/cargo_1.34.2.bb
 create mode 100644 meta/recipes-devtools/cargo/cargo_1.36.0.bb
 create mode 100644 meta/recipes-devtools/cargo/cargo_1.37.0.bb
 create mode 100644 meta/recipes-devtools/rust/libstd-rs.inc
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.34.2.bb
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.36.0.bb
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.37.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust-cross.inc
 create mode 100644 meta/recipes-devtools/rust/rust-cross_1.34.2.bb
 create mode 100644 meta/recipes-devtools/rust/rust-cross_1.36.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust-cross_1.37.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust-llvm.inc
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-of-exe-path.patch
 create mode 100644 meta/recipes-devtools/rust/rust-llvm_1.34.2.bb
 create mode 100644 meta/recipes-devtools/rust/rust-llvm_1.36.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust-llvm_1.37.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.34.2.inc
 create mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.36.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.37.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-source-1.34.2.inc
 create mode 100644 meta/recipes-devtools/rust/rust-source-1.36.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-source-1.37.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust.inc
 create mode 100644 meta/recipes-devtools/rust/rust_1.34.2.bb
 create mode 100644 meta/recipes-devtools/rust/rust_1.36.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust_1.37.0.bb
 create mode 100644 meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
 create mode 100644 meta/recipes-example/rustfmt/rustfmt_0.8.0.bb
 create mode 100755 scripts/build.sh
 create mode 100755 scripts/cleanup-env.sh
 create mode 100755 scripts/containerize.sh
 create mode 100755 scripts/fetch.sh
 create mode 100755 scripts/publish-build-cache.sh
 create mode 100755 scripts/setup-env.sh

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
new file mode 100644
index 0000000000..c321e6bf70
--- /dev/null
+++ b/meta/classes/cargo.bbclass
@@ -0,0 +1,70 @@
+##
+## Purpose:
+## This class is used by any recipes that are built using
+## Cargo.
+
+inherit cargo_common
+
+# the binary we will use
+CARGO = "cargo"
+
+# We need cargo to compile for the target
+BASEDEPENDS_append = " cargo-native"
+
+# Ensure we get the right rust variant
+DEPENDS_append_class-target = " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
+DEPENDS_append_class-native = " rust-native"
+
+# Cargo only supports in-tree builds at the moment
+B = "${S}"
+
+# In case something fails in the build process, give a bit more feedback on
+# where the issue occured
+export RUST_BACKTRACE = "1"
+
+RUSTFLAGS ??= ""
+BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
+CARGO_BUILD_FLAGS = "-v --target ${HOST_SYS} ${BUILD_MODE}"
+
+# This is based on the content of CARGO_BUILD_FLAGS and generally will need to
+# change if CARGO_BUILD_FLAGS changes.
+BUILD_DIR = "${@['release', 'debug'][d.getVar('DEBUG_BUILD') == '1']}"
+CARGO_TARGET_SUBDIR="${HOST_SYS}/${BUILD_DIR}"
+oe_cargo_build () {
+	export RUSTFLAGS="${RUSTFLAGS}"
+	export RUST_TARGET_PATH="${RUST_TARGET_PATH}"
+	bbnote "cargo = $(which ${CARGO})"
+	bbnote "rustc = $(which ${RUSTC})"
+	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
+	"${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
+}
+
+cargo_do_compile () {
+	oe_cargo_fix_env
+	oe_cargo_build
+}
+
+cargo_do_install () {
+	local have_installed=false
+	for tgt in "${B}/target/${CARGO_TARGET_SUBDIR}/"*; do
+		case $tgt in
+		*.so|*.rlib)
+			install -d "${D}${rustlibdir}"
+			install -m755 "$tgt" "${D}${rustlibdir}"
+			have_installed=true
+			;;
+		*)
+			if [ -f "$tgt" ] && [ -x "$tgt" ]; then
+				install -d "${D}${bindir}"
+				install -m755 "$tgt" "${D}${bindir}"
+				have_installed=true
+			fi
+			;;
+		esac
+	done
+	if ! $have_installed; then
+		die "Did not find anything to install"
+	fi
+}
+
+EXPORT_FUNCTIONS do_compile do_install
diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
new file mode 100644
index 0000000000..e5f908033d
--- /dev/null
+++ b/meta/classes/cargo_common.bbclass
@@ -0,0 +1,98 @@
+##
+## Purpose:
+## This class is to support building with cargo. It
+## must be different than cargo.bbclass because Rust
+## now builds with Cargo but cannot use cargo.bbclass
+## due to dependencies and assumptions in cargo.bbclass
+## that Rust & Cargo are already installed. So this
+## is used by cargo.bbclass and Rust
+##
+
+# add crate fetch support
+inherit crate-fetch
+inherit rust-common
+
+# Where we download our registry and dependencies to
+export CARGO_HOME = "${WORKDIR}/cargo_home"
+
+# The pkg-config-rs library used by cargo build scripts disables itself when
+# cross compiling unless this is defined. We set up pkg-config appropriately
+# for cross compilation, so tell it we know better than it.
+export PKG_CONFIG_ALLOW_CROSS = "1"
+
+# Don't instruct cargo to use crates downloaded by bitbake. Some rust packages,
+# for example the rust compiler itself, come with their own vendored sources.
+# Specifying two [source.crates-io] will not work.
+CARGO_DISABLE_BITBAKE_VENDORING ?= "0"
+
+# Used by libstd-rs to point to the vendor dir included in rustc src
+CARGO_VENDORING_DIRECTORY ?= "${CARGO_HOME}/bitbake"
+
+cargo_common_do_configure () {
+	mkdir -p ${CARGO_HOME}/bitbake
+	echo "paths = [" > ${CARGO_HOME}/config
+
+	for p in ${EXTRA_OECARGO_PATHS}; do
+		printf "\"%s\"\n" "$p"
+	done | sed -e 's/$/,/' >> ${CARGO_HOME}/config
+	echo "]" >> ${CARGO_HOME}/config
+
+	# Point cargo at our local mirror of the registry
+	cat <<- EOF >> ${CARGO_HOME}/config
+	[source.bitbake]
+	directory = "${CARGO_VENDORING_DIRECTORY}"
+	EOF
+
+	if [ -z "${EXTERNALSRC}" ] && [ ${CARGO_DISABLE_BITBAKE_VENDORING} = "0" ]; then
+		cat <<- EOF >> ${CARGO_HOME}/config
+		[source.crates-io]
+		replace-with = "bitbake"
+		local-registry = "/nonexistant"
+		EOF
+	fi
+
+        # Disable multiplexing in order to keep cargo from using http2, which we
+        # can't currently enable because of dependency loops
+        cat <<- EOF >> ${CARGO_HOME}/config
+		[http]
+		multiplexing = false
+	EOF
+
+	# When a sstate-cache is used sometimes the certificates are not available
+	# at the compile time path anymore. Set it explicitly instead.
+	echo "cainfo = \"${STAGING_ETCDIR_NATIVE}/ssl/certs/ca-certificates.crt\"" \
+		>> ${CARGO_HOME}/config
+
+	if [ -n "${http_proxy}" ]; then
+		echo "proxy = \"${http_proxy}\"" >> ${CARGO_HOME}/config
+	fi
+
+	echo "[target.${HOST_SYS}]" >> ${CARGO_HOME}/config
+	echo "linker = '${RUST_TARGET_CCLD}'" >> ${CARGO_HOME}/config
+	if [ "${HOST_SYS}" != "${BUILD_SYS}" ]; then
+		echo "[target.${BUILD_SYS}]" >> ${CARGO_HOME}/config
+		echo "linker = '${RUST_BUILD_CCLD}'" >> ${CARGO_HOME}/config
+	fi
+}
+
+oe_cargo_fix_env () {
+	export CC="${RUST_TARGET_CC}"
+	export CXX="${RUST_TARGET_CXX}"
+	export CFLAGS="${CFLAGS}"
+	export CXXFLAGS="${CXXFLAGS}"
+	export AR="${AR}"
+	export TARGET_CC="${RUST_TARGET_CC}"
+	export TARGET_CXX="${RUST_TARGET_CXX}"
+	export TARGET_CFLAGS="${CFLAGS}"
+	export TARGET_CXXFLAGS="${CXXFLAGS}"
+	export TARGET_AR="${AR}"
+	export HOST_CC="${RUST_BUILD_CC}"
+	export HOST_CXX="${RUST_BUILD_CXX}"
+	export HOST_CFLAGS="${BUILD_CFLAGS}"
+	export HOST_CXXFLAGS="${BUILD_CXXFLAGS}"
+	export HOST_AR="${BUILD_AR}"
+}
+
+EXTRA_OECARGO_PATHS ??= ""
+
+EXPORT_FUNCTIONS do_configure
diff --git a/meta/classes/crate-fetch.bbclass b/meta/classes/crate-fetch.bbclass
new file mode 100644
index 0000000000..c0ed434a96
--- /dev/null
+++ b/meta/classes/crate-fetch.bbclass
@@ -0,0 +1,13 @@
+#
+# crate-fetch class
+#
+# Registers 'crate' method for Bitbake fetch2.
+#
+# Adds support for following format in recipe SRC_URI:
+# crate://<packagename>/<version>
+#
+
+python () {
+        import crate
+        bb.fetch2.methods.append( crate.Crate() )
+}
diff --git a/meta/classes/rust-bin.bbclass b/meta/classes/rust-bin.bbclass
new file mode 100644
index 0000000000..a13fbafb56
--- /dev/null
+++ b/meta/classes/rust-bin.bbclass
@@ -0,0 +1,149 @@
+inherit rust
+
+RDEPENDS_${PN}_append_class-target += "${RUSTLIB_DEP}"
+
+RUSTC_ARCHFLAGS += "-C opt-level=3 -g -L ${STAGING_DIR_HOST}/${rustlibdir} -C linker=${RUST_TARGET_CCLD}"
+EXTRA_OEMAKE += 'RUSTC_ARCHFLAGS="${RUSTC_ARCHFLAGS}"'
+
+# Some libraries alias with the standard library but libstd is configured to
+# make it difficult or imposisble to use its version. Unfortunately libstd
+# must be explicitly overridden using extern.
+OVERLAP_LIBS = "\
+    libc \
+    log \
+    getopts \
+    rand \
+"
+def get_overlap_deps(d):
+    deps = d.getVar("DEPENDS").split()
+    overlap_deps = []
+    for o in d.getVar("OVERLAP_LIBS").split():
+        l = len([o for dep in deps if (o + '-rs' in dep)])
+        if l > 0:
+            overlap_deps.append(o)
+    return " ".join(overlap_deps)
+OVERLAP_DEPS = "${@get_overlap_deps(d)}"
+
+# Prevents multiple static copies of standard library modules
+# See https://github.com/rust-lang/rust/issues/19680
+RUSTC_PREFER_DYNAMIC = "-C prefer-dynamic"
+RUSTC_FLAGS += "${RUSTC_PREFER_DYNAMIC}"
+
+CRATE_NAME ?= "${@d.getVar('BPN').replace('-rs', '').replace('-', '_')}"
+BINNAME ?= "${BPN}"
+LIBNAME ?= "lib${CRATE_NAME}-rs"
+CRATE_TYPE ?= "dylib"
+BIN_SRC ?= "${S}/src/main.rs"
+LIB_SRC ?= "${S}/src/lib.rs"
+
+rustbindest ?= "${bindir}"
+rustlibdest ?= "${rustlibdir}"
+RUST_RPATH_ABS ?= "${rustlibdir}:${rustlib}"
+
+def relative_rpaths(paths, base):
+    relpaths = set()
+    for p in paths.split(':'):
+        if p == base:
+            relpaths.add('$ORIGIN')
+            continue
+        relpaths.add(os.path.join('$ORIGIN', os.path.relpath(p, base)))
+    return '-rpath=' + ':'.join(relpaths) if len(relpaths) else ''
+
+RUST_LIB_RPATH_FLAGS ?= "${@relative_rpaths(d.getVar('RUST_RPATH_ABS', True), d.getVar('rustlibdest', True))}"
+RUST_BIN_RPATH_FLAGS ?= "${@relative_rpaths(d.getVar('RUST_RPATH_ABS', True), d.getVar('rustbindest', True))}"
+
+def libfilename(d):
+    if d.getVar('CRATE_TYPE', True) == 'dylib':
+        return d.getVar('LIBNAME', True) + '.so'
+    else:
+        return d.getVar('LIBNAME', True) + '.rlib'
+
+def link_args(d, bin):
+    linkargs = []
+    if bin:
+        rpaths = d.getVar('RUST_BIN_RPATH_FLAGS', False)
+    else:
+        rpaths = d.getVar('RUST_LIB_RPATH_FLAGS', False)
+        if d.getVar('CRATE_TYPE', True) == 'dylib':
+            linkargs.append('-soname')
+            linkargs.append(libfilename(d))
+    if len(rpaths):
+        linkargs.append(rpaths)
+    if len(linkargs):
+        return ' '.join(['-Wl,' + arg for arg in linkargs])
+    else:
+        return ''
+
+get_overlap_externs () {
+    externs=
+    for dep in ${OVERLAP_DEPS}; do
+        extern=$(ls ${STAGING_DIR_HOST}/${rustlibdir}/lib$dep-rs.{so,rlib} 2>/dev/null \
+                    | awk '{print $1}');
+        if [ -n "$extern" ]; then
+            externs="$externs --extern $dep=$extern"
+        else
+            echo "$dep in depends but no such library found in ${rustlibdir}!" >&2
+            exit 1
+        fi
+    done
+    echo "$externs"
+}
+
+do_configure () {
+}
+
+oe_runrustc () {
+	export RUST_TARGET_PATH="${RUST_TARGET_PATH}"
+	bbnote ${RUSTC} ${RUSTC_ARCHFLAGS} ${RUSTC_FLAGS} "$@"
+	"${RUSTC}" ${RUSTC_ARCHFLAGS} ${RUSTC_FLAGS} "$@"
+}
+
+oe_compile_rust_lib () {
+    rm -rf ${LIBNAME}.{rlib,so}
+    local -a link_args
+    if [ -n '${@link_args(d, False)}' ]; then
+        link_args[0]='-C'
+        link_args[1]='link-args=${@link_args(d, False)}'
+    fi
+    oe_runrustc $(get_overlap_externs) \
+        "${link_args[@]}" \
+        ${LIB_SRC} \
+        -o ${@libfilename(d)} \
+        --crate-name=${CRATE_NAME} --crate-type=${CRATE_TYPE} \
+        "$@"
+}
+oe_compile_rust_lib[vardeps] += "get_overlap_externs"
+
+oe_compile_rust_bin () {
+    rm -rf ${BINNAME}
+    local -a link_args
+    if [ -n '${@link_args(d, True)}' ]; then
+        link_args[0]='-C'
+        link_args[1]='link-args=${@link_args(d, True)}'
+    fi
+    oe_runrustc $(get_overlap_externs) \
+        "${link_args[@]}" \
+        ${BIN_SRC} -o ${BINNAME} "$@"
+}
+oe_compile_rust_bin[vardeps] += "get_overlap_externs"
+
+oe_install_rust_lib () {
+    for lib in $(ls ${LIBNAME}.{so,rlib} 2>/dev/null); do
+        echo Installing $lib
+        install -D -m 755 $lib ${D}/${rustlibdest}/$lib
+    done
+}
+
+oe_install_rust_bin () {
+    echo Installing ${BINNAME}
+    install -D -m 755 ${BINNAME} ${D}/${rustbindest}/${BINNAME}
+}
+
+do_rust_bin_fixups() {
+    for f in `find ${PKGD} -name '*.so*'`; do
+        echo "Strip rust note: $f"
+        ${OBJCOPY} -R .note.rustc $f $f
+    done
+}
+PACKAGE_PREPROCESS_FUNCS += "do_rust_bin_fixups"
+
diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
new file mode 100644
index 0000000000..cbc7d3cfe6
--- /dev/null
+++ b/meta/classes/rust-common.bbclass
@@ -0,0 +1,144 @@
+# Common variables used by all Rust builds
+export rustlibdir = "${libdir}/rust"
+FILES_${PN} += "${rustlibdir}/*.so"
+FILES_${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
+FILES_${PN}-dbg += "${rustlibdir}/.debug"
+
+RUSTLIB = "-L ${STAGING_LIBDIR}/rust"
+RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
+RUSTLIB_DEP ?= "libstd-rs"
+RUST_TARGET_PATH = "${STAGING_LIBDIR_NATIVE}/rustlib"
+RUST_PANIC_STRATEGY ?= "unwind"
+
+# Native builds are not effected by TCLIBC. Without this, rust-native
+# thinks it's "target" (i.e. x86_64-linux) is a musl target.
+RUST_LIBC = "${TCLIBC}"
+RUST_LIBC_class-native = "glibc"
+
+def determine_libc(d, thing):
+    '''Determine which libc something should target'''
+
+    # BUILD is never musl, TARGET may be musl or glibc,
+    # HOST could be musl, but only if a compiler is built to be run on
+    # target in which case HOST_SYS != BUILD_SYS.
+    if thing == 'TARGET':
+        libc = d.getVar('RUST_LIBC')
+    elif thing == 'BUILD' and (d.getVar('HOST_SYS') != d.getVar('BUILD_SYS')):
+        libc = d.getVar('RUST_LIBC')
+    else:
+        libc = d.getVar('RUST_LIBC_class-native')
+
+    return libc
+
+# Responsible for taking Yocto triples and converting it to Rust triples
+def rust_base_triple(d, thing):
+    '''
+    Mangle bitbake's *_SYS into something that rust might support (see
+    rust/mk/cfg/* for a list)
+
+    Note that os is assumed to be some linux form
+    '''
+
+    arch = d.getVar('{}_ARCH'.format(thing))
+    # All the Yocto targets are Linux and are 'unknown'
+    vendor = "-unknown"
+    os = d.getVar('{}_OS'.format(thing))
+    libc = determine_libc(d, thing)
+
+    # Prefix with a dash and convert glibc -> gnu
+    if libc == "glibc":
+        libc = "-gnu"
+    elif libc == "musl":
+        libc = "-musl"
+
+    # Don't double up musl (only appears to be the case on aarch64)
+    if os == "linux-musl":
+        if libc != "-musl":
+            bb.fatal("{}_OS was '{}' but TCLIBC was not 'musl'".format(thing, os))
+        os = "linux"
+
+    # This catches ARM targets and appends the necessary hard float bits
+    if os == "linux-gnueabi" or os == "linux-musleabi":
+        libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf', '', d)
+    return arch + vendor + '-' + os + libc
+
+# Naming explanation
+# Yocto
+# - BUILD_SYS - Yocto triple of the build environment
+# - HOST_SYS - What we're building for in Yocto
+# - TARGET_SYS - What we're building for in Yocto
+#
+# So when building '-native' packages BUILD_SYS == HOST_SYS == TARGET_SYS
+# When building packages for the image HOST_SYS == TARGET_SYS
+# This is a gross over simplification as there are other modes but
+# currently this is all that's supported.
+#
+# Rust
+# - TARGET - the system where the binary will run
+# - HOST - the system where the binary is being built
+#
+# Rust additionally will use two additional cases:
+# - undecorated (e.g. CC) - equivalent to TARGET
+# - triple suffix (e.g. CC_x86_64_unknown_linux_gnu) - both
+#   see: https://github.com/alexcrichton/gcc-rs
+# The way that Rust's internal triples and Yocto triples are mapped together
+# its likely best to not use the triple suffix due to potential confusion.
+
+RUST_BUILD_SYS = "${@rust_base_triple(d, 'BUILD')}"
+RUST_HOST_SYS = "${@rust_base_triple(d, 'HOST')}"
+RUST_TARGET_SYS = "${@rust_base_triple(d, 'TARGET')}"
+
+# wrappers to get around the fact that Rust needs a single
+# binary but Yocto's compiler and linker commands have
+# arguments. Technically the archiver is always one command but
+# this is necessary for builds that determine the prefix and then
+# use those commands based on the prefix.
+WRAPPER_DIR = "${WORKDIR}/wrapper"
+RUST_BUILD_CC = "${WRAPPER_DIR}/build-rust-cc"
+RUST_BUILD_CXX = "${WRAPPER_DIR}/build-rust-cxx"
+RUST_BUILD_CCLD = "${WRAPPER_DIR}/build-rust-ccld"
+RUST_BUILD_AR = "${WRAPPER_DIR}/build-rust-ar"
+RUST_TARGET_CC = "${WRAPPER_DIR}/target-rust-cc"
+RUST_TARGET_CXX = "${WRAPPER_DIR}/target-rust-cxx"
+RUST_TARGET_CCLD = "${WRAPPER_DIR}/target-rust-ccld"
+RUST_TARGET_AR = "${WRAPPER_DIR}/target-rust-ar"
+
+create_wrapper () {
+	file="$1"
+	shift
+
+	cat <<- EOF > "${file}"
+	#!/bin/sh
+	$@ "\$@"
+	EOF
+	chmod +x "${file}"
+}
+
+# compiler is used by gcc-rs
+# linker is used by rustc/cargo
+# archiver is used by the build of libstd-rs
+do_rust_create_wrappers () {
+	mkdir -p "${WRAPPER_DIR}"
+
+	# Yocto Build / Rust Host C compiler
+	create_wrapper "${RUST_BUILD_CC}" "${BUILD_CC}"
+	# Yocto Build / Rust Host C++ compiler
+	create_wrapper "${RUST_BUILD_CXX}" "${BUILD_CXX}"
+	# Yocto Build / Rust Host linker
+	create_wrapper "${RUST_BUILD_CCLD}" "${BUILD_CCLD}" "${BUILD_LDFLAGS}"
+	# Yocto Build / Rust Host archiver
+	create_wrapper "${RUST_BUILD_AR}" "${BUILD_AR}"
+
+	# Yocto Target / Rust Target C compiler
+	create_wrapper "${RUST_TARGET_CC}" "${CC}"
+	# Yocto Target / Rust Target C++ compiler
+	create_wrapper "${RUST_TARGET_CXX}" "${CXX}"
+	# Yocto Target / Rust Target linker
+	create_wrapper "${RUST_TARGET_CCLD}" "${CCLD}" "${LDFLAGS}"
+	# Yocto Target / Rust Target archiver
+	create_wrapper "${RUST_TARGET_AR}" "${AR}"
+}
+
+addtask rust_create_wrappers before do_configure after do_patch
+do_rust_create_wrappers[dirs] += "${WRAPPER_DIR}"
diff --git a/meta/classes/rust.bbclass b/meta/classes/rust.bbclass
new file mode 100644
index 0000000000..ec9ad54bc6
--- /dev/null
+++ b/meta/classes/rust.bbclass
@@ -0,0 +1,45 @@
+inherit rust-common
+
+RUSTC = "rustc"
+
+RUSTC_ARCHFLAGS += "--target=${HOST_SYS} ${RUSTFLAGS}"
+
+def rust_base_dep(d):
+    # Taken from meta/classes/base.bbclass `base_dep_prepend` and modified to
+    # use rust instead of gcc
+    deps = ""
+    if not d.getVar('INHIBIT_DEFAULT_RUST_DEPS'):
+        if (d.getVar('HOST_SYS') != d.getVar('BUILD_SYS')):
+            deps += " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
+        else:
+            deps += " rust-native"
+    return deps
+
+DEPENDS_append = " ${@rust_base_dep(d)}"
+
+# BUILD_LDFLAGS
+# 	${STAGING_LIBDIR_NATIVE}
+# 	${STAGING_BASE_LIBDIR_NATIVE}
+# BUILDSDK_LDFLAGS
+# 	${STAGING_LIBDIR}
+# 	#{STAGING_DIR_HOST}
+# TARGET_LDFLAGS ?????
+#RUSTC_BUILD_LDFLAGS = "\
+#	--sysroot ${STAGING_DIR_NATIVE} \
+#	-L${STAGING_LIBDIR_NATIVE}	\
+#	-L${STAGING_BASE_LIBDIR_NATIVE}	\
+#"
+
+# XXX: for some reason bitbake sets BUILD_* & TARGET_* but uses the bare
+# variables for HOST. Alias things to make it easier for us.
+HOST_LDFLAGS  ?= "${LDFLAGS}"
+HOST_CFLAGS   ?= "${CFLAGS}"
+HOST_CXXFLAGS ?= "${CXXFLAGS}"
+HOST_CPPFLAGS ?= "${CPPFLAGS}"
+
+rustlib_suffix="${TUNE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/rustlib/${HOST_SYS}/lib"
+# Native sysroot standard library path
+rustlib_src="${prefix}/lib/${rustlib_suffix}"
+# Host sysroot standard library path
+rustlib="${libdir}/${rustlib_suffix}"
+rustlib_class-native="${libdir}/rustlib/${BUILD_SYS}/lib"
diff --git a/meta/conf/distro/include/rust_security_flags.inc b/meta/conf/distro/include/rust_security_flags.inc
new file mode 100644
index 0000000000..7e6377e8c7
--- /dev/null
+++ b/meta/conf/distro/include/rust_security_flags.inc
@@ -0,0 +1,7 @@
+# Build errors with PIE options enabled
+SECURITY_CFLAGS_pn-rust-native = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-rust-cross-${TARGET_ARCH} = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-rust = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-rust-llvm = "${SECURITY_NO_PIE_CFLAGS}"
+
+SECURITY_LDFLAGS_pn-rust-cross-arm = " -lssp_nonshared -lssp"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index cda37c33b4..d834be1d02 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -105,3 +105,5 @@ SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 # Avoid empty path entries
 BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
 PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' != '' else ''}${HOSTTOOLS_DIR}"
+
+require conf/distro/include/rust_security_flags.inc
diff --git a/meta/lib/crate.py b/meta/lib/crate.py
new file mode 100644
index 0000000000..d10f441875
--- /dev/null
+++ b/meta/lib/crate.py
@@ -0,0 +1,149 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+"""
+BitBake 'Fetch' implementation for crates.io
+"""
+
+# Copyright (C) 2016 Doug Goldstein
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Based on functions from the base bb module, Copyright 2003 Holger Schurig
+
+import hashlib
+import json
+import os
+import shutil
+import subprocess
+import bb
+from   bb.fetch2 import logger, subprocess_setup, UnpackError
+from   bb.fetch2.wget import Wget
+
+
+class Crate(Wget):
+
+    """Class to fetch crates via wget"""
+
+    def _cargo_bitbake_path(self, rootdir):
+        return os.path.join(rootdir, "cargo_home", "bitbake")
+
+    def supports(self, ud, d):
+        """
+        Check to see if a given url is for this fetcher
+        """
+        return ud.type in ['crate']
+
+    def recommends_checksum(self, urldata):
+        return False
+
+    def urldata_init(self, ud, d):
+        """
+        Sets up to download the respective crate from crates.io
+        """
+
+        if ud.type == 'crate':
+            self._crate_urldata_init(ud, d)
+
+        super(Crate, self).urldata_init(ud, d)
+
+    def _crate_urldata_init(self, ud, d):
+        """
+        Sets up the download for a crate
+        """
+
+        # URL syntax is: crate://NAME/VERSION
+        # break the URL apart by /
+        parts = ud.url.split('/')
+        if len(parts) < 5:
+            raise bb.fetch2.ParameterError("Invalid URL: Must be crate://HOST/NAME/VERSION", ud.url)
+
+        # last field is version
+        version = parts[len(parts) - 1]
+        # second to last field is name
+        name = parts[len(parts) - 2]
+        # host (this is to allow custom crate registries to be specified
+        host = '/'.join(parts[2:len(parts) - 2])
+
+        # if using upstream just fix it up nicely
+        if host == 'crates.io':
+            host = 'crates.io/api/v1/crates'
+
+        ud.url = "https://%s/%s/%s/download" % (host, name, version)
+        ud.parm['downloadfilename'] = "%s-%s.crate" % (name, version)
+        ud.parm['name'] = name
+
+        logger.debug(2, "Fetching %s to %s" % (ud.url, ud.parm['downloadfilename']))
+
+    def unpack(self, ud, rootdir, d):
+        """
+        Uses the crate to build the necessary paths for cargo to utilize it
+        """
+        if ud.type == 'crate':
+            return self._crate_unpack(ud, rootdir, d)
+        else:
+            super(Crate, self).unpack(ud, rootdir, d)
+
+    def _crate_unpack(self, ud, rootdir, d):
+        """
+        Unpacks a crate
+        """
+        thefile = ud.localpath
+
+        # possible metadata we need to write out
+        metadata = {}
+
+        # change to the rootdir to unpack but save the old working dir
+        save_cwd = os.getcwd()
+        os.chdir(rootdir)
+
+        pn = d.getVar('BPN')
+        if pn == ud.parm.get('name'):
+            cmd = "tar -xz --no-same-owner -f %s" % thefile
+        else:
+            cargo_bitbake = self._cargo_bitbake_path(rootdir)
+
+            cmd = "tar -xz --no-same-owner -f %s -C %s" % (thefile, cargo_bitbake)
+
+            # ensure we've got these paths made
+            bb.utils.mkdirhier(cargo_bitbake)
+
+            # generate metadata necessary
+            with open(thefile, 'rb') as f:
+                # get the SHA256 of the original tarball
+                tarhash = hashlib.sha256(f.read()).hexdigest()
+
+            metadata['files'] = {}
+            metadata['package'] = tarhash
+
+        # path it
+        path = d.getVar('PATH')
+        if path:
+            cmd = "PATH=\"%s\" %s" % (path, cmd)
+        bb.note("Unpacking %s to %s/" % (thefile, os.getcwd()))
+
+        ret = subprocess.call(cmd, preexec_fn=subprocess_setup, shell=True)
+
+        os.chdir(save_cwd)
+
+        if ret != 0:
+            raise UnpackError("Unpack command %s failed with return value %s" % (cmd, ret), ud.url)
+
+        # if we have metadata to write out..
+        if len(metadata) > 0:
+            cratepath = os.path.splitext(os.path.basename(thefile))[0]
+            bbpath = self._cargo_bitbake_path(rootdir)
+            mdfile = '.cargo-checksum.json'
+            mdpath = os.path.join(bbpath, cratepath, mdfile)
+            with open(mdpath, "w") as f:
+                json.dump(metadata, f)
diff --git a/meta/recipes-devtools/cargo/cargo-1.34.2/0001-Disable-http2.patch b/meta/recipes-devtools/cargo/cargo-1.34.2/0001-Disable-http2.patch
new file mode 100644
index 0000000000..a44482a112
--- /dev/null
+++ b/meta/recipes-devtools/cargo/cargo-1.34.2/0001-Disable-http2.patch
@@ -0,0 +1,29 @@
+From 44cf21036646e4849e9f8566db7decb7da917394 Mon Sep 17 00:00:00 2001
+From: Johan Anderholm <johan.anderholm@gmail.com>
+Date: Sun, 27 Jan 2019 10:19:00 +0100
+Subject: [PATCH] Disable http2
+
+http2 requires that curl is build with nghttp2 which in turn depends on
+many dependencies and ultimately a dependency loop in the case of
+curl-native. As long as multiplexing is disabled in cargo this should
+be fine.
+
+Upstream-Status: Inappropriate
+
+---
+ Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index 8238380861d9..ced1defea459 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -24,7 +24,7 @@ bytesize = "1.0"
+ crates-io = { path = "src/crates-io", version = "0.23" }
+ crossbeam-utils = "0.6"
+ crypto-hash = "0.3.1"
+-curl = { version = "0.4.19", features = ['http2'] }
++curl = { version = "0.4.19" }
+ curl-sys = "0.4.15"
+ env_logger = "0.6.0"
+ pretty_env_logger = { version = "0.3", optional = true }
diff --git a/meta/recipes-devtools/cargo/cargo-1.36.0/0001-Disable-http2.patch b/meta/recipes-devtools/cargo/cargo-1.36.0/0001-Disable-http2.patch
new file mode 100644
index 0000000000..9794ec05f9
--- /dev/null
+++ b/meta/recipes-devtools/cargo/cargo-1.36.0/0001-Disable-http2.patch
@@ -0,0 +1,31 @@
+From 42e65192b6f7520b7a05924856e00600961f6758 Mon Sep 17 00:00:00 2001
+From: Johan Anderholm <johan.anderholm@gmail.com>
+Date: Sun, 27 Jan 2019 10:19:00 +0100
+Subject: [PATCH] Disable http2
+
+http2 requires that curl is build with nghttp2 which in turn depends on
+many dependencies and ultimately a dependency loop in the case of
+curl-native. As long as multiplexing is disabled in cargo this should
+be fine.
+
+Upstream-Status: Inappropriate
+---
+ Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index c3fcacf5..bd6ec50b 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -24,7 +24,7 @@ bytesize = "1.0"
+ crates-io = { path = "src/crates-io", version = "0.25" }
+ crossbeam-utils = "0.6"
+ crypto-hash = "0.3.1"
+-curl = { version = "0.4.21", features = ['http2'] }
++curl = { version = "0.4.21" }
+ curl-sys = "0.4.18"
+ env_logger = "0.6.0"
+ pretty_env_logger = { version = "0.3", optional = true }
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/cargo/cargo-1.37.0/0001-Disable-http2.patch b/meta/recipes-devtools/cargo/cargo-1.37.0/0001-Disable-http2.patch
new file mode 100644
index 0000000000..c804297d48
--- /dev/null
+++ b/meta/recipes-devtools/cargo/cargo-1.37.0/0001-Disable-http2.patch
@@ -0,0 +1,29 @@
+From 0e2384133664ebeb548b782ad763c3a627c1bc66 Mon Sep 17 00:00:00 2001
+From: Johan Anderholm <johan.anderholm@gmail.com>
+Date: Sun, 27 Jan 2019 10:19:00 +0100
+Subject: [PATCH] Disable http2
+
+http2 requires that curl is build with nghttp2 which in turn depends on
+many dependencies and ultimately a dependency loop in the case of
+curl-native. As long as multiplexing is disabled in cargo this should
+be fine.
+
+Upstream-Status: Inappropriate
+
+---
+ src/tools/cargo/Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index d15aa2513..ba9c77d25 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -24,7 +24,7 @@ bytesize = "1.0"
+ crates-io = { path = "crates/crates-io", version = "0.26" }
+ crossbeam-utils = "0.6"
+ crypto-hash = "0.3.1"
+-curl = { version = "0.4.21", features = ['http2'] }
++curl = { version = "0.4.21" }
+ curl-sys = "0.4.18"
+ env_logger = "0.6.0"
+ pretty_env_logger = { version = "0.3", optional = true }
diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
new file mode 100644
index 0000000000..48012520d9
--- /dev/null
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -0,0 +1,43 @@
+SUMMARY = "Cargo, a package manager for Rust."
+HOMEPAGE = "https://crates.io"
+LICENSE = "MIT | Apache-2.0"
+SECTION = "devel"
+
+DEPENDS = "openssl zlib libgit2 curl ca-certificates libssh2"
+
+LIC_FILES_CHKSUM = " \
+    file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d \
+"
+
+SRC_URI += "file://0001-Disable-http2.patch"
+
+S = "${RUSTSRC}/src/tools/cargo"
+CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
+
+inherit cargo
+
+do_cargo_setup_snapshot () {
+	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
+}
+
+addtask cargo_setup_snapshot after do_unpack before do_configure
+do_cargo_setup_snapshot[dirs] += "${WORKDIR}/${CARGO_SNAPSHOT}"
+
+do_compile_prepend () {
+	export RUSTC_BOOTSTRAP="1"
+}
+
+do_install () {
+	install -d "${D}${bindir}"
+	install -m 755 "${RUSTSRC}/target/${CARGO_TARGET_SUBDIR}/cargo" "${D}${bindir}"
+}
+
+# Needed for pkg-config to be used
+export LIBGIT2_SYS_USE_PKG_CONFIG = "1"
+export LIBSSH2_SYS_USE_PKG_CONFIG = "1"
+
+BBCLASSEXTEND = "native"
+
+# When building cargo-native we don't have a built cargo to use so we must use
+# the snapshot to bootstrap the build of cargo
+CARGO_class-native = "${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo"
diff --git a/meta/recipes-devtools/cargo/cargo_1.34.2.bb b/meta/recipes-devtools/cargo/cargo_1.34.2.bb
new file mode 100644
index 0000000000..d79f958c6e
--- /dev/null
+++ b/meta/recipes-devtools/cargo/cargo_1.34.2.bb
@@ -0,0 +1,8 @@
+require recipes-devtools/rust/rust-source-${PV}.inc
+require recipes-devtools/rust/rust-snapshot-${PV}.inc
+require cargo.inc
+
+LIC_FILES_CHKSUM += " \
+    file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
+    file://LICENSE-THIRD-PARTY;md5=892ea68b169e69cfe75097fc38a15b56 \
+"
diff --git a/meta/recipes-devtools/cargo/cargo_1.36.0.bb b/meta/recipes-devtools/cargo/cargo_1.36.0.bb
new file mode 100644
index 0000000000..f048779aae
--- /dev/null
+++ b/meta/recipes-devtools/cargo/cargo_1.36.0.bb
@@ -0,0 +1,8 @@
+require recipes-devtools/rust/rust-source-${PV}.inc
+require recipes-devtools/rust/rust-snapshot-${PV}.inc
+require cargo.inc
+
+LIC_FILES_CHKSUM += " \
+    file://LICENSE-APACHE;md5=71b224ca933f0676e26d5c2e2271331c \
+    file://LICENSE-THIRD-PARTY;md5=f257ad009884cb88a3a87d6920e7180a \
+"
diff --git a/meta/recipes-devtools/cargo/cargo_1.37.0.bb b/meta/recipes-devtools/cargo/cargo_1.37.0.bb
new file mode 100644
index 0000000000..f048779aae
--- /dev/null
+++ b/meta/recipes-devtools/cargo/cargo_1.37.0.bb
@@ -0,0 +1,8 @@
+require recipes-devtools/rust/rust-source-${PV}.inc
+require recipes-devtools/rust/rust-snapshot-${PV}.inc
+require cargo.inc
+
+LIC_FILES_CHKSUM += " \
+    file://LICENSE-APACHE;md5=71b224ca933f0676e26d5c2e2271331c \
+    file://LICENSE-THIRD-PARTY;md5=f257ad009884cb88a3a87d6920e7180a \
+"
diff --git a/meta/recipes-devtools/rust/libstd-rs.inc b/meta/recipes-devtools/rust/libstd-rs.inc
new file mode 100644
index 0000000000..5298c00706
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs.inc
@@ -0,0 +1,31 @@
+SUMMARY = "Rust standard libaries"
+HOMEPAGE = "http://www.rust-lang.org"
+SECTION = "devel"
+LICENSE = "MIT | Apache-2.0"
+
+RUSTLIB_DEP = ""
+inherit cargo
+
+DEPENDS_append_libc-musl = " libunwind"
+# Needed so cargo can find libbacktrace
+RUSTFLAGS += "-L ${STAGING_LIBDIR} -C link-arg=-Wl,-soname,libstd.so"
+
+S = "${RUSTSRC}/src/libstd"
+
+CARGO_BUILD_FLAGS += "--features '${CARGO_FEATURES}'"
+
+do_compile_prepend () {
+    export CARGO_TARGET_DIR="${B}"
+    # For Rust 1.13.0 and newer
+    export RUSTC_BOOTSTRAP="1"
+}
+
+do_install () {
+    mkdir -p ${D}${rustlibdir}
+
+    # With the incremental build support added in 1.24, the libstd deps directory also includes dependency
+    # files that get installed. Those are really only needed to incrementally rebuild the libstd library
+    # itself and don't need to be installed.
+    rm -f ${B}/${TARGET_SYS}/${BUILD_DIR}/deps/*.d
+    cp ${B}/${TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
+}
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.34.2.bb b/meta/recipes-devtools/rust/libstd-rs_1.34.2.bb
new file mode 100644
index 0000000000..69cb48ad07
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs_1.34.2.bb
@@ -0,0 +1,8 @@
+require rust-source-${PV}.inc
+require libstd-rs.inc
+
+LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
+
+CARGO_FEATURES ?= "panic-unwind backtrace"
+
+CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.36.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.36.0.bb
new file mode 100644
index 0000000000..69cb48ad07
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs_1.36.0.bb
@@ -0,0 +1,8 @@
+require rust-source-${PV}.inc
+require libstd-rs.inc
+
+LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
+
+CARGO_FEATURES ?= "panic-unwind backtrace"
+
+CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.37.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.37.0.bb
new file mode 100644
index 0000000000..69cb48ad07
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs_1.37.0.bb
@@ -0,0 +1,8 @@
+require rust-source-${PV}.inc
+require libstd-rs.inc
+
+LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
+
+CARGO_FEATURES ?= "panic-unwind backtrace"
+
+CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
new file mode 100644
index 0000000000..4869b85c03
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -0,0 +1,52 @@
+require rust.inc
+inherit cross
+
+# Otherwise we'll depend on what we provide
+INHIBIT_DEFAULT_RUST_DEPS = "1"
+
+# Unlike native (which nicely maps it's DEPENDS) cross wipes them out completely.
+# Generally, we (and cross in general) need the same things that native needs,
+# so it might make sense to take it's mapping. For now, though, we just mention
+# the bits we need explicitly.
+DEPENDS += "rust-llvm-native"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
+DEPENDS += "rust-native"
+
+PROVIDES = "virtual/${TARGET_PREFIX}rust"
+PN = "rust-cross-${TARGET_ARCH}"
+
+# In the cross compilation case, rustc doesn't seem to get the rpath quite
+# right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
+# include the '../../lib' (ie: relative path from cross_bindir to normal
+# libdir. As a result, we end up not being able to properly reference files in normal ${libdir}.
+# Most of the time this happens to work fine as the systems libraries are
+# subsituted, but sometimes a host system will lack a library, or the right
+# version of a library (libtinfo was how I noticed this).
+#
+# FIXME: this should really be fixed in rust itself.
+# FIXME: using hard-coded relative paths is wrong, we should ask bitbake for
+#        the relative path between 2 of it's vars.
+HOST_POST_LINK_ARGS_append = " -Wl,-rpath=../../lib"
+BUILD_POST_LINK_ARGS_append = " -Wl,-rpath=../../lib"
+
+# We need the same thing for the calls to the compiler when building the runtime crap
+TARGET_CC_ARCH_append = " --sysroot=${STAGING_DIR_TARGET}"
+
+do_rust_setup_snapshot () {
+}
+
+do_configure () {
+}
+
+do_compile () {
+}
+
+do_install () {
+	mkdir -p ${D}${prefix}/${base_libdir_native}/rustlib
+	cp ${WORKDIR}/targets/${TARGET_SYS}.json ${D}${prefix}/${base_libdir_native}/rustlib
+}
+
+rust_cross_sysroot_preprocess() {
+    sysroot_stage_dir ${D}${prefix}/${base_libdir_native}/rustlib ${SYSROOT_DESTDIR}${prefix}/${base_libdir_native}/rustlib
+}
+SYSROOT_PREPROCESS_FUNCS += "rust_cross_sysroot_preprocess"
diff --git a/meta/recipes-devtools/rust/rust-cross_1.34.2.bb b/meta/recipes-devtools/rust/rust-cross_1.34.2.bb
new file mode 100644
index 0000000000..bb92b99ccc
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-cross_1.34.2.bb
@@ -0,0 +1,3 @@
+require rust-cross.inc
+require rust-source-${PV}.inc
+
diff --git a/meta/recipes-devtools/rust/rust-cross_1.36.0.bb b/meta/recipes-devtools/rust/rust-cross_1.36.0.bb
new file mode 100644
index 0000000000..bb92b99ccc
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-cross_1.36.0.bb
@@ -0,0 +1,3 @@
+require rust-cross.inc
+require rust-source-${PV}.inc
+
diff --git a/meta/recipes-devtools/rust/rust-cross_1.37.0.bb b/meta/recipes-devtools/rust/rust-cross_1.37.0.bb
new file mode 100644
index 0000000000..bb92b99ccc
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-cross_1.37.0.bb
@@ -0,0 +1,3 @@
+require rust-cross.inc
+require rust-source-${PV}.inc
+
diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtools/rust/rust-llvm.inc
new file mode 100644
index 0000000000..b4bef3875c
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm.inc
@@ -0,0 +1,62 @@
+SUMMARY = "LLVM compiler framework (packaged with rust)"
+LICENSE = "NCSA"
+
+SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch"
+
+S = "${RUSTSRC}/src/llvm-project/llvm"
+
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=4c0bc17c954e99fd547528d938832bfa"
+
+inherit cmake pythonnative
+
+DEPENDS += "ninja-native rust-llvm-native"
+
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv4t = "arm"
+
+LLVM_RELEASE = "6.0"
+LLVM_DIR = "llvm${LLVM_RELEASE}"
+
+EXTRA_OECMAKE = " \
+    -DCMAKE_BUILD_TYPE=Release \
+    -DLLVM_TARGETS_TO_BUILD='X86;ARM;AArch64;PowerPC;Mips' \
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
+EXTRA_OECMAKE_append_class-target = "\
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
+do_install_append_class-target() {
+    # Disable checks on the native tools, since these should came from the native recipe
+    sed -i -e 's/\(.*APPEND.*_IMPORT_CHECK_FILES_FOR_.*{_IMPORT_PREFIX}\/bin\/.*\)/#\1/' ${D}/usr/share/llvm/cmake/LLVMExports-noconfig.cmake
+}
+
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
+
+# Add the extra locations to avoid the complaints about unpackaged files
+FILES_${PN}-bugpointpasses = "${libdir}/llvm-rust/lib/BugpointPasses.so"
+FILES_${PN}-llvmhello = "${libdir}/llvm-rust/lib/LLVMHello.so"
+FILES_${PN}-liblto = "${libdir}/llvm-rust/lib/libLTO.so.*"
+FILES_${PN}-staticdev =+ "${libdir}/llvm-rust/*/*.a"
+FILES_${PN} += "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.* ${libdir}/llvm-rust/bin"
+FILES_${PN}-dev += "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${libdir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cmake"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-of-exe-path.patch
new file mode 100644
index 0000000000..65dbd6ffd6
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-of-exe-path.patch
@@ -0,0 +1,32 @@
+From 7111770e8290082530d920e120995bf81431b0aa Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Fri, 19 May 2017 00:22:57 -0700
+Subject: [PATCH 12/18] llvm: allow env override of exe path
+
+When using a native llvm-config from inside a sysroot, we need llvm-config to
+return the libraries, include directories, etc. from inside the sysroot rather
+than from the native sysroot. Thus provide an env override for calling
+llvm-config from a target sysroot.
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/llvm-config/llvm-config.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+--- a/tools/llvm-config/llvm-config.cpp
++++ b/tools/llvm-config/llvm-config.cpp
+@@ -226,6 +226,13 @@ Typical components:\n\
+ 
+ /// Compute the path to the main executable.
+ std::string GetExecutablePath(const char *Argv0) {
++  // Hack for Yocto: we need to override the root path when we are using
++  // llvm-config from within a target sysroot.
++  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
++  if (Sysroot != nullptr) {
++    return Sysroot;
++  }
++
+   // This just needs to be some symbol in the binary; C++ doesn't
+   // allow taking the address of ::main however.
+   void *P = (void *)(intptr_t)GetExecutablePath;
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.34.2.bb b/meta/recipes-devtools/rust/rust-llvm_1.34.2.bb
new file mode 100644
index 0000000000..d41fa28477
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm_1.34.2.bb
@@ -0,0 +1,16 @@
+require rust-source-${PV}.inc
+require rust-llvm.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
+
+do_install_prepend () {
+	# the install does a sed on this without installing the file
+	# we don't need it for anything
+	mkdir -p "${D}/usr/share/llvm/cmake"
+	touch "${D}/usr/share/llvm/cmake/LLVMExports-noconfig.cmake"
+}
+
+do_install_append () {
+	# we don't need any of this stuff to build Rust
+	rm -rf "${D}/usr/lib/cmake"
+}
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.36.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.36.0.bb
new file mode 100644
index 0000000000..d41fa28477
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm_1.36.0.bb
@@ -0,0 +1,16 @@
+require rust-source-${PV}.inc
+require rust-llvm.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
+
+do_install_prepend () {
+	# the install does a sed on this without installing the file
+	# we don't need it for anything
+	mkdir -p "${D}/usr/share/llvm/cmake"
+	touch "${D}/usr/share/llvm/cmake/LLVMExports-noconfig.cmake"
+}
+
+do_install_append () {
+	# we don't need any of this stuff to build Rust
+	rm -rf "${D}/usr/lib/cmake"
+}
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.37.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.37.0.bb
new file mode 100644
index 0000000000..d41fa28477
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm_1.37.0.bb
@@ -0,0 +1,16 @@
+require rust-source-${PV}.inc
+require rust-llvm.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
+
+do_install_prepend () {
+	# the install does a sed on this without installing the file
+	# we don't need it for anything
+	mkdir -p "${D}/usr/share/llvm/cmake"
+	touch "${D}/usr/share/llvm/cmake/LLVMExports-noconfig.cmake"
+}
+
+do_install_append () {
+	# we don't need any of this stuff to build Rust
+	rm -rf "${D}/usr/lib/cmake"
+}
diff --git a/meta/recipes-devtools/rust/rust-snapshot-1.34.2.inc b/meta/recipes-devtools/rust/rust-snapshot-1.34.2.inc
new file mode 100644
index 0000000000..d0209bb864
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-snapshot-1.34.2.inc
@@ -0,0 +1,24 @@
+## This is information on the rust-snapshot (binary) used to build our current release.
+## snapshot info is taken from rust/src/stage0.txt
+## TODO: find a way to add additional SRC_URIs based on the contents of an
+##       earlier SRC_URI.
+RS_VERSION = "1.33.0"
+
+RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+CARGO_VERSION = "0.34.0"
+CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+
+SRC_URI += " \
+	https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.gz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+	https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.gz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+	https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.gz;name=cargo-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+	"
+
+# TODO: Add hashes for other architecture toolchains as well. Make a script?
+SRC_URI[rustc-snapshot-x86_64.md5sum] = "c1ec989c1965dce754dda1e54274a68c"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "54a342f718b712d8a17fd7878ebd37d22a82ebc70b59c421168cd4153fd04c2b"
+SRC_URI[rust-std-snapshot-x86_64.md5sum] = "d573c5bd3a965c973734c1606968a91e"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "661c2ba717ae1502f002b4c6e7aeb8941685c7ea8fe7ac26ed9ede26f615b7af"
+SRC_URI[cargo-snapshot-x86_64.md5sum] = "de0e635afa9bf495cefecea476bfce36"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "4795ae5ca3bb8c7c83ca338676bb02b670efa1eb474e346284b629dc872bcce8"
diff --git a/meta/recipes-devtools/rust/rust-snapshot-1.36.0.inc b/meta/recipes-devtools/rust/rust-snapshot-1.36.0.inc
new file mode 100644
index 0000000000..e4b6813e84
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-snapshot-1.36.0.inc
@@ -0,0 +1,24 @@
+## This is information on the rust-snapshot (binary) used to build our current release.
+## snapshot info is taken from rust/src/stage0.txt
+## TODO: find a way to add additional SRC_URIs based on the contents of an
+##       earlier SRC_URI.
+RS_VERSION = "1.35.0"
+
+RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+CARGO_VERSION = "0.36.0"
+CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+
+SRC_URI += " \
+	https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+	https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+	https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+	"
+
+# TODO: Add hashes for other architecture toolchains as well. Make a script?
+SRC_URI[rustc-snapshot-x86_64.md5sum] = "47ea78f6b3f68e30f24b9c94e465d6bd"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "5d6dc216ba429ddf3a1657e70f3e5e380549b546fe56de897677a11d72aa4e07"
+SRC_URI[rust-std-snapshot-x86_64.md5sum] = "348ec23ca8e47fc65079bc80e63cca5f"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "ccff05d0e2d88499505b10f8e33e8b1645df057f918edc81f8acb0fcee9f90b2"
+SRC_URI[cargo-snapshot-x86_64.md5sum] = "93a375e771f3d9b3a139e612dd4730ee"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "ab5a6ff1947463dbd2477ca5dac2012494dae821112098ae0c54add652adfdc3"
diff --git a/meta/recipes-devtools/rust/rust-snapshot-1.37.0.inc b/meta/recipes-devtools/rust/rust-snapshot-1.37.0.inc
new file mode 100644
index 0000000000..8d4c1801ed
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-snapshot-1.37.0.inc
@@ -0,0 +1,24 @@
+## This is information on the rust-snapshot (binary) used to build our current release.
+## snapshot info is taken from rust/src/stage0.txt
+## TODO: find a way to add additional SRC_URIs based on the contents of an
+##       earlier SRC_URI.
+RS_VERSION = "1.36.0"
+
+RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+CARGO_VERSION = "0.37.0"
+CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+
+SRC_URI += " \
+	https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+	https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+	https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+	"
+
+# TODO: Add hashes for other architecture toolchains as well. Make a script?
+SRC_URI[rustc-snapshot-x86_64.md5sum] = "ec27794c94cc1df1a0a69f7244a09176"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "fff0158da6f5af2a89936dc3e0c361077c06c2983eb310615e02f81ebbde1416"
+SRC_URI[rust-std-snapshot-x86_64.md5sum] = "b71a6fd6f44527c3bf09584e89ad8958"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "ce8e12684b568a8a4f7d346a743383429849cf3f028f5712ad3d3e31590c8db3"
+SRC_URI[cargo-snapshot-x86_64.md5sum] = "8c661276a0da7a1aa48affbe33b347e6"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "d20fa121951339d5492cf8862f8a7af59efc99d18f3c27b95ab6d4658b6a7d67"
diff --git a/meta/recipes-devtools/rust/rust-source-1.34.2.inc b/meta/recipes-devtools/rust/rust-source-1.34.2.inc
new file mode 100644
index 0000000000..5c83f6f000
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-source-1.34.2.inc
@@ -0,0 +1,11 @@
+SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.gz;name=rust"
+
+SRC_URI[rust.md5sum] = "7c85e6a60dda740295f7e004a1fb15e1"
+SRC_URI[rust.sha256sum] = "c69a4a85a1c464368597df8878cb9e1121aae93e215616d45ad7d23af3052f56"
+
+# later versions of rust change the directory that they unextract to
+RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
+# set this as our default
+S = "${RUSTSRC}"
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
diff --git a/meta/recipes-devtools/rust/rust-source-1.36.0.inc b/meta/recipes-devtools/rust/rust-source-1.36.0.inc
new file mode 100644
index 0000000000..1a1d07c72f
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-source-1.36.0.inc
@@ -0,0 +1,11 @@
+SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
+
+SRC_URI[rust.md5sum] = "78ffc0b029aaed216b45c3fe24747d46"
+SRC_URI[rust.sha256sum] = "f51645b9f787af4a5d94db17f6af39db0c55980ed24fe366cad55b57900f8f2d"
+
+# later versions of rust change the directory that they unextract to
+RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
+# set this as our default
+S = "${RUSTSRC}"
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
diff --git a/meta/recipes-devtools/rust/rust-source-1.37.0.inc b/meta/recipes-devtools/rust/rust-source-1.37.0.inc
new file mode 100644
index 0000000000..0169cd3fbd
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-source-1.37.0.inc
@@ -0,0 +1,11 @@
+SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
+
+SRC_URI[rust.md5sum] = "ee6300b1d7e5767115492915c4c0d8ef"
+SRC_URI[rust.sha256sum] = "10abffac50a729cf74cef6dd03193a2f4647541bd19ee9281be9e5b12ca8cdfd"
+
+# later versions of rust change the directory that they unextract to
+RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
+# set this as our default
+S = "${RUSTSRC}"
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=93a95682d51b4cb0a633a97046940ef0"
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
new file mode 100644
index 0000000000..abd4e0e4bc
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -0,0 +1,509 @@
+SUMMARY = "Rust compiler and runtime libaries"
+HOMEPAGE = "http://www.rust-lang.org"
+SECTION = "devel"
+LICENSE = "MIT | Apache-2.0"
+
+inherit rust
+inherit cargo_common
+
+DEPENDS += "file-native python-native"
+DEPENDS_append_class-native = " rust-llvm-native"
+
+# We generate local targets, and need to be able to locate them
+export RUST_TARGET_PATH="${WORKDIR}/targets/"
+
+export FORCE_CRATE_HASH="${BB_TASKHASH}"
+
+export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
+export YOCTO_ALTERNATE_MULTILIB_NAME = "/${BASELIB}"
+
+# We don't want to use bitbakes vendoring because the rust sources do their
+# own vendoring.
+CARGO_DISABLE_BITBAKE_VENDORING = "1"
+
+# We can't use RUST_BUILD_SYS here because that may be "musl" if
+# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
+SNAPSHOT_BUILD_SYS = "${BUILD_ARCH}-unknown-linux-gnu"
+setup_cargo_environment () {
+    # The first step is to build bootstrap and some early stage tools,
+    # these are build for the same target as the snapshot, e.g.
+    # x86_64-unknown-linux-gnu.
+    # Later stages are build for the native target (i.e. target.x86_64-linux)
+    cargo_common_do_configure
+
+    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
+    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
+}
+
+# Right now this is focused on arm-specific tune features.
+# We get away with this for now as one can only use x86-64 as the build host
+# (not arm).
+# Note that TUNE_FEATURES is _always_ refering to the target, so we really
+# don't want to use this for the host/build.
+def llvm_features_from_tune(d):
+    f = []
+    feat = d.getVar('TUNE_FEATURES')
+    if not feat:
+        return []
+    feat = frozenset(feat.split())
+
+    if 'vfpv4' in feat:
+        f.append("+vfp4")
+    if 'vfpv3' in feat:
+        f.append("+vfp3")
+    if 'vfpv3d16' in feat:
+        f.append("+d16")
+
+    if 'vfpv2' in feat or 'vfp' in feat:
+        f.append("+vfp2")
+
+    if 'neon' in feat:
+        f.append("+neon")
+
+    if 'aarch64' in feat:
+        f.append("+v8")
+
+    if 'mips32' in feat:
+        f.append("+mips32")
+
+    if 'mips32r2' in feat:
+        f.append("+mips32r2")
+
+    v7=frozenset(['armv7a', 'armv7r', 'armv7m', 'armv7ve'])
+    if not feat.isdisjoint(v7):
+        f.append("+v7")
+    if 'armv6' in feat:
+        f.append("+v6")
+
+    if 'dsp' in feat:
+        f.append("+dsp")
+
+    if 'thumb' in feat:
+        if d.getVar('ARM_THUMB_OPT') is "thumb":
+            if not feat.isdisjoint(v7):
+                f.append("+thumb2")
+            f.append("+thumb-mode")
+
+    if 'cortexa5' in feat:
+        f.append("+a5")
+    if 'cortexa7' in feat:
+        f.append("+a7")
+    if 'cortexa9' in feat:
+        f.append("+a9")
+    if 'cortexa15' in feat:
+        f.append("+a15")
+    if 'cortexa17' in feat:
+        f.append("+a17")
+
+    return f
+
+# TARGET_CC_ARCH changes from build/cross/target so it'll do the right thing
+# this should go away when https://github.com/rust-lang/rust/pull/31709 is
+# stable (1.9.0?)
+def llvm_features_from_cc_arch(d):
+    f = []
+    feat = d.getVar('TARGET_CC_ARCH')
+    if not feat:
+        return []
+    feat = frozenset(feat.split())
+
+    if '-mmmx' in feat:
+        f.append("+mmx")
+    if '-msse' in feat:
+        f.append("+sse")
+    if '-msse2' in feat:
+        f.append("+sse2")
+    if '-msse3' in feat:
+        f.append("+sse3")
+    if '-mssse3' in feat:
+        f.append("+ssse3")
+    if '-msse4.1' in feat:
+        f.append("+sse4.1")
+    if '-msse4.2' in feat:
+        f.append("+sse4.2")
+    if '-msse4a' in feat:
+        f.append("+sse4a")
+    if '-mavx' in feat:
+        f.append("+avx")
+    if '-mavx2' in feat:
+        f.append("+avx2")
+
+    return f
+
+def llvm_features_from_target_fpu(d):
+    # TARGET_FPU can be hard or soft. +soft-float tell llvm to use soft float
+    # ABI. There is no option for hard.
+
+    fpu = d.getVar('TARGET_FPU', True)
+    return ["+soft-float"] if fpu == "soft" else []
+
+def llvm_features(d):
+    return ','.join(llvm_features_from_tune(d) +
+                    llvm_features_from_cc_arch(d) +
+                    llvm_features_from_target_fpu(d))
+
+## arm-unknown-linux-gnueabihf
+DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+LLVM_TARGET[arm] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[arm] = "little"
+TARGET_POINTER_WIDTH[arm] = "32"
+TARGET_C_INT_WIDTH[arm] = "32"
+MAX_ATOMIC_WIDTH[arm] = "64"
+FEATURES[arm] = "+v6,+vfp2"
+
+## aarch64-unknown-linux-{gnu, musl}
+DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
+LLVM_TARGET[aarch64] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[aarch64] = "little"
+TARGET_POINTER_WIDTH[aarch64] = "64"
+TARGET_C_INT_WIDTH[aarch64] = "32"
+MAX_ATOMIC_WIDTH[aarch64] = "128"
+
+## x86_64-unknown-linux-{gnu, musl}
+DATA_LAYOUT[x86_64] = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
+LLVM_TARGET[x86_64] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[x86_64] = "little"
+TARGET_POINTER_WIDTH[x86_64] = "64"
+TARGET_C_INT_WIDTH[x86_64] = "32"
+MAX_ATOMIC_WIDTH[x86_64] = "64"
+
+## i686-unknown-linux-{gnu, musl}
+DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
+LLVM_TARGET[i686] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[i686] = "little"
+TARGET_POINTER_WIDTH[i686] = "32"
+TARGET_C_INT_WIDTH[i686] = "32"
+MAX_ATOMIC_WIDTH[i686] = "64"
+
+## XXX: a bit of a hack so qemux86 builds, clone of i686-unknown-linux-{gnu, musl} above
+DATA_LAYOUT[i586] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
+LLVM_TARGET[i586] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[i586] = "little"
+TARGET_POINTER_WIDTH[i586] = "32"
+TARGET_C_INT_WIDTH[i586] = "32"
+MAX_ATOMIC_WIDTH[i586] = "64"
+
+## mips-unknown-linux-{gnu, musl}
+DATA_LAYOUT[mips] = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
+LLVM_TARGET[mips] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[mips] = "big"
+TARGET_POINTER_WIDTH[mips] = "32"
+TARGET_C_INT_WIDTH[mips] = "32"
+MAX_ATOMIC_WIDTH[mips] = "32"
+
+## mipsel-unknown-linux-{gnu, musl}
+DATA_LAYOUT[mipsel] = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
+LLVM_TARGET[mipsel] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[mipsel] = "little"
+TARGET_POINTER_WIDTH[mipsel] = "32"
+TARGET_C_INT_WIDTH[mipsel] = "32"
+MAX_ATOMIC_WIDTH[mipsel] = "32"
+
+## mips64-unknown-linux-{gnu, musl}
+DATA_LAYOUT[mips64] = "E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
+LLVM_TARGET[mips64] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[mips64] = "big"
+TARGET_POINTER_WIDTH[mips64] = "64"
+TARGET_C_INT_WIDTH[mips64] = "64"
+MAX_ATOMIC_WIDTH[mips64] = "64"
+
+## mips64el-unknown-linux-{gnu, musl}
+DATA_LAYOUT[mips64el] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
+LLVM_TARGET[mips64el] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[mips64el] = "little"
+TARGET_POINTER_WIDTH[mips64el] = "64"
+TARGET_C_INT_WIDTH[mips64el] = "64"
+MAX_ATOMIC_WIDTH[mips64el] = "64"
+
+## powerpc-unknown-linux-{gnu, musl}
+DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-i64:64-n32"
+LLVM_TARGET[powerpc] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[powerpc] = "big"
+TARGET_POINTER_WIDTH[powerpc] = "32"
+TARGET_C_INT_WIDTH[powerpc] = "32"
+MAX_ATOMIC_WIDTH[powerpc] = "32"
+
+## riscv32-unknown-linux-{gnu, musl}
+DATA_LAYOUT[riscv32] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
+LLVM_TARGET[riscv32] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[riscv32] = "little"
+TARGET_POINTER_WIDTH[riscv32] = "32"
+TARGET_C_INT_WIDTH[riscv32] = "32"
+MAX_ATOMIC_WIDTH[riscv32] = "32"
+
+## riscv64-unknown-linux-{gnu, musl}
+DATA_LAYOUT[riscv64] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
+LLVM_TARGET[riscv64] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[riscv64] = "little"
+TARGET_POINTER_WIDTH[riscv64] = "64"
+TARGET_C_INT_WIDTH[riscv64] = "64"
+MAX_ATOMIC_WIDTH[riscv64] = "64"
+
+def arch_for(d, thing):
+    return d.getVar('{}_ARCH'.format(thing))
+
+def sys_for(d, thing):
+    return d.getVar('{}_SYS'.format(thing))
+
+def prefix_for(d, thing):
+    return d.getVar('{}_PREFIX'.format(thing))
+
+# Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to something
+# rust's internals won't choke on.
+def arch_to_rust_target_arch(arch):
+    if arch == "i586" or arch == "i686":
+        return "x86"
+    elif arch == "mipsel":
+        return "mips"
+    elif arch == "mip64sel":
+        return "mips64"
+    else:
+        return arch
+
+# generates our target CPU value
+def llvm_cpu(d):
+    cpu = d.getVar('PACKAGE_ARCH')
+    target = d.getVar('TRANSLATED_TARGET_ARCH')
+
+    trans = {}
+    trans['corei7-64'] = "corei7"
+    trans['core2-32'] = "core2"
+    trans['x86-64'] = "x86-64"
+    trans['i686'] = "i686"
+    trans['i586'] = "i586"
+    trans['powerpc'] = "powerpc"
+    trans['mips64'] = "mips64"
+    trans['mips64el'] = "mips64"
+
+    if target in ["mips", "mipsel"]:
+        feat = frozenset(d.getVar('TUNE_FEATURES').split())
+        if "mips32r2" in feat:
+            trans['mipsel'] = "mips32r2"
+            trans['mips'] = "mips32r2"
+        elif "mips32" in feat:
+            trans['mipsel'] = "mips32"
+            trans['mips'] = "mips32"
+
+    try:
+        return trans[cpu]
+    except:
+        return trans.get(target, "generic")
+
+TARGET_LLVM_CPU="${@llvm_cpu(d)}"
+TARGET_LLVM_FEATURES = "${@llvm_features(d)}"
+
+# class-native implies TARGET=HOST, and TUNE_FEATURES only describes the real
+# (original) target.
+TARGET_LLVM_FEATURES_class-native = "${@','.join(llvm_features_from_cc_arch(d))}"
+
+def rust_gen_target(d, thing, wd):
+    import json
+    from distutils.version import LooseVersion
+    arch = arch_for(d, thing)
+    sys = sys_for(d, thing)
+    prefix = prefix_for(d, thing)
+
+    features = ""
+    cpu = "generic"
+    if thing is "TARGET":
+        features = d.getVar('TARGET_LLVM_FEATURES') or ""
+        cpu = d.getVar('TARGET_LLVM_CPU')
+    features = features or d.getVarFlag('FEATURES', arch) or ""
+    features = features.strip()
+
+    # build tspec
+    tspec = {}
+    tspec['llvm-target'] = d.getVarFlag('LLVM_TARGET', arch)
+    tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch)
+    tspec['max-atomic-width'] = d.getVarFlag('MAX_ATOMIC_WIDTH', arch)
+    tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch)
+    tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch)
+    tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch)
+    tspec['arch'] = arch_to_rust_target_arch(arch)
+    tspec['os'] = "linux"
+    if "musl" in tspec['llvm-target']:
+        tspec['env'] = "musl"
+    else:
+        tspec['env'] = "gnu"
+    tspec['vendor'] = "unknown"
+    tspec['target-family'] = "unix"
+    tspec['linker'] = "{}{}gcc".format(d.getVar('CCACHE'), prefix)
+    tspec['ar'] = "{}ar".format(prefix)
+    tspec['cpu'] = cpu
+    if features is not "":
+        tspec['features'] = features
+    tspec['dynamic-linking'] = True
+    tspec['executables'] = True
+    tspec['linker-is-gnu'] = True
+    tspec['linker-flavor'] = "gcc"
+    tspec['has-rpath'] = True
+    tspec['has-elf-tls'] = True
+    tspec['position-independent-executables'] = True
+    tspec['panic-strategy'] = d.getVar("RUST_PANIC_STRATEGY")
+
+    # Don't use jemalloc as it doesn't work for many targets.
+    # https://github.com/rust-lang/rust/pull/37392
+    # From 1.20.0 and forward, system allocator is the default.
+    if LooseVersion(d.getVar("PV")) < LooseVersion("1.20.0"):
+        tspec['exe-allocation-crate'] = "alloc_system"
+        tspec['lib-allocation-crate'] = "alloc_system"
+
+    # write out the target spec json file
+    with open(wd + sys + '.json', 'w') as f:
+        json.dump(tspec, f, indent=4)
+
+
+python do_rust_gen_targets () {
+    wd = d.getVar('WORKDIR') + '/targets/'
+    # It is important 'TARGET' is last here so that it overrides our less
+    # informed choices for BUILD & HOST if TARGET happens to be the same as
+    # either of them.
+    for thing in ['BUILD', 'HOST', 'TARGET']:
+        bb.debug(1, "rust_gen_target for " + thing)
+        rust_gen_target(d, thing, wd)
+}
+addtask rust_gen_targets after do_patch before do_compile
+do_rust_gen_targets[dirs] += "${WORKDIR}/targets"
+
+
+do_rust_setup_snapshot () {
+    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
+        "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
+    done
+
+    # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
+    # and fail without it there.
+    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
+    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
+}
+addtask rust_setup_snapshot after do_unpack before do_configure
+do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
+
+
+python do_configure() {
+    import json
+    from distutils.version import LooseVersion
+    try:
+        import configparser
+    except ImportError:
+        import ConfigParser as configparser
+
+    # toml is rather similar to standard ini like format except it likes values
+    # that look more JSON like. So for our purposes simply escaping all values
+    # as JSON seem to work fine.
+
+    e = lambda s: json.dumps(s)
+
+    config = configparser.RawConfigParser()
+
+    # [target.ARCH-poky-linux]
+    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
+    config.add_section(target_section)
+
+    llvm_config = d.expand("${YOCTO_ALTERNATE_EXE_PATH}")
+    config.set(target_section, "llvm-config", e(llvm_config))
+
+    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+
+    # If we don't do this rust-native will compile it's own llvm for BUILD.
+    # [target.${BUILD_ARCH}-unknown-linux-gnu]
+    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
+    config.add_section(target_section)
+
+    config.set(target_section, "llvm-config", e(llvm_config))
+
+    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
+    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+
+    # [rust]
+    config.add_section("rust")
+    config.set("rust", "rpath", e(True))
+    config.set("rust", "channel", e("stable"))
+
+    if LooseVersion(d.getVar("PV")) < LooseVersion("1.32.0"):
+        config.set("rust", "use-jemalloc", e(False))
+
+    # Whether or not to optimize the compiler and standard library
+    config.set("rust", "optimize", e(True))
+
+    # [build]
+    config.add_section("build")
+    config.set("build", "submodules", e(False))
+    config.set("build", "docs", e(False))
+
+    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
+    config.set("build", "rustc", e(rustc))
+
+    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
+    config.set("build", "cargo", e(cargo))
+
+    config.set("build", "vendor", e(True))
+
+    targets = [d.getVar("TARGET_SYS", True)]
+    config.set("build", "target", e(targets))
+
+    hosts = [d.getVar("HOST_SYS", True)]
+    config.set("build", "host", e(targets))
+
+    # We can't use BUILD_SYS since that is something the rust snapshot knows
+    # nothing about when trying to build some stage0 tools (like fabricate)
+    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
+
+    with open("config.toml", "w") as f:
+        config.write(f)
+
+    # set up ${WORKDIR}/cargo_home
+    bb.build.exec_func("setup_cargo_environment", d)
+}
+
+
+rust_runx () {
+    echo "COMPILE ${PN}" "$@"
+
+    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for a
+    # wide range of targets (not just TARGET). Yocto's settings for them will
+    # be inappropriate, avoid using.
+    unset CFLAGS
+    unset LDFLAGS
+    unset CXXFLAGS
+    unset CPPFLAGS
+
+    oe_cargo_fix_env
+
+    python src/bootstrap/bootstrap.py "$@" --verbose
+}
+
+do_compile () {
+    rust_runx build
+    rust_runx dist
+}
+
+rust_do_install () {
+    # Only install compiler generated for the HOST_SYS. There will be
+    # one for SNAPSHOT_BUILD_SYS as well.
+    local installer=build/tmp/dist/rustc-${PV}-${HOST_SYS}/install.sh
+    ${installer} --destdir="${D}" --prefix="${prefix}" --disable-ldconfig
+
+    installer=build/tmp/dist/rust-std-${PV}-${HOST_SYS}/install.sh
+    ${installer} --destdir="${D}" --prefix="${prefix}" --disable-ldconfig
+
+    # Install our custom target.json files
+    local td="${D}${libdir}/rustlib/"
+    install -d "$td"
+    for tgt in "${WORKDIR}/targets/"* ; do
+        install -m 0644 "$tgt" "$td"
+    done
+
+    # cleanup after rust-installer since we don't need these bits
+    rm ${D}/${libdir}/rustlib/install.log
+    rm ${D}/${libdir}/rustlib/rust-installer-version
+    rm ${D}/${libdir}/rustlib/uninstall.sh
+    rm ${D}/${libdir}/rustlib/components
+}
+
+
+do_install () {
+    rust_do_install
+}
+# ex: sts=4 et sw=4 ts=8
diff --git a/meta/recipes-devtools/rust/rust_1.34.2.bb b/meta/recipes-devtools/rust/rust_1.34.2.bb
new file mode 100644
index 0000000000..c7f9f4fd87
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust_1.34.2.bb
@@ -0,0 +1,12 @@
+require rust.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
+
+DEPENDS += "rust-llvm (=${PV})"
+
+# Otherwise we'll depend on what we provide
+INHIBIT_DEFAULT_RUST_DEPS_class-native = "1"
+# We don't need to depend on gcc-native because yocto assumes it exists
+PROVIDES_class-native = "virtual/${TARGET_PREFIX}rust"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/rust/rust_1.36.0.bb b/meta/recipes-devtools/rust/rust_1.36.0.bb
new file mode 100644
index 0000000000..c7f9f4fd87
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust_1.36.0.bb
@@ -0,0 +1,12 @@
+require rust.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
+
+DEPENDS += "rust-llvm (=${PV})"
+
+# Otherwise we'll depend on what we provide
+INHIBIT_DEFAULT_RUST_DEPS_class-native = "1"
+# We don't need to depend on gcc-native because yocto assumes it exists
+PROVIDES_class-native = "virtual/${TARGET_PREFIX}rust"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/rust/rust_1.37.0.bb b/meta/recipes-devtools/rust/rust_1.37.0.bb
new file mode 100644
index 0000000000..c7f9f4fd87
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust_1.37.0.bb
@@ -0,0 +1,12 @@
+require rust.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
+
+DEPENDS += "rust-llvm (=${PV})"
+
+# Otherwise we'll depend on what we provide
+INHIBIT_DEFAULT_RUST_DEPS_class-native = "1"
+# We don't need to depend on gcc-native because yocto assumes it exists
+PROVIDES_class-native = "virtual/${TARGET_PREFIX}rust"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb b/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
new file mode 100644
index 0000000000..ba8854849d
--- /dev/null
+++ b/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
@@ -0,0 +1,13 @@
+inherit cargo
+
+SRC_URI = "git://github.com/jmesmon/rust-hello-world.git;protocol=https"
+SRCREV="e0fa23f1a3cb1eb1407165bd2fc36d2f6e6ad728"
+LIC_FILES_CHKSUM="file://COPYRIGHT;md5=e6b2207ac3740d2d01141c49208c2147"
+
+SUMMARY = "Hello World by Cargo for Rust"
+HOMEPAGE = "https://github.com/jmesmon/rust-hello-world"
+LICENSE = "MIT | Apache-2.0"
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-example/rustfmt/rustfmt_0.8.0.bb b/meta/recipes-example/rustfmt/rustfmt_0.8.0.bb
new file mode 100644
index 0000000000..0c94e38e66
--- /dev/null
+++ b/meta/recipes-example/rustfmt/rustfmt_0.8.0.bb
@@ -0,0 +1,67 @@
+# Auto-Generated by cargo-bitbake 0.3.6
+#
+inherit cargo
+
+# If this is git based prefer versioned ones if they exist
+# DEFAULT_PREFERENCE = "-1"
+
+# how to get rustfmt could be as easy as but default to a git checkout:
+# SRC_URI += "crate://crates.io/rustfmt/0.8.0"
+SRC_URI += "git://github.com/rust-lang-nursery/rustfmt.git;protocol=https;branch=syntex"
+SRCREV = "4ed5a3bac71ed104e27797ee63729b0333e39d39"
+S = "${WORKDIR}/git"
+CARGO_SRC_DIR=""
+
+
+# please note if you have entries that do not begin with crate://
+# you must change them to how that package can be fetched
+SRC_URI += " \
+crate://crates.io/aho-corasick/0.6.2 \
+crate://crates.io/bitflags/0.8.0 \
+crate://crates.io/diff/0.1.10 \
+crate://crates.io/either/1.0.3 \
+crate://crates.io/env_logger/0.4.1 \
+crate://crates.io/getopts/0.2.14 \
+crate://crates.io/itertools/0.5.9 \
+crate://crates.io/kernel32-sys/0.2.2 \
+crate://crates.io/libc/0.2.21 \
+crate://crates.io/log/0.3.6 \
+crate://crates.io/memchr/1.0.1 \
+crate://crates.io/multimap/0.3.0 \
+crate://crates.io/regex-syntax/0.4.0 \
+crate://crates.io/regex/0.2.1 \
+crate://crates.io/rustc-serialize/0.3.22 \
+crate://crates.io/same-file/0.1.3 \
+crate://crates.io/strings/0.0.1 \
+crate://crates.io/syntex_errors/0.58.1 \
+crate://crates.io/syntex_pos/0.58.1 \
+crate://crates.io/syntex_syntax/0.58.1 \
+crate://crates.io/term/0.4.5 \
+crate://crates.io/thread-id/3.0.0 \
+crate://crates.io/thread_local/0.3.3 \
+crate://crates.io/toml/0.2.1 \
+crate://crates.io/unicode-segmentation/1.1.0 \
+crate://crates.io/unicode-xid/0.0.4 \
+crate://crates.io/unreachable/0.1.1 \
+crate://crates.io/utf8-ranges/1.0.0 \
+crate://crates.io/void/1.0.2 \
+crate://crates.io/walkdir/1.0.7 \
+crate://crates.io/winapi-build/0.1.1 \
+crate://crates.io/winapi/0.2.8 \
+"
+
+
+
+LIC_FILES_CHKSUM=" \
+file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
+file://LICENSE-MIT;md5=0b29d505d9225d1f0815cbdcf602b901 \
+"
+
+SUMMARY = "Tool to find and fix Rust formatting issues"
+HOMEPAGE = "https://github.com/rust-lang-nursery/rustfmt"
+LICENSE = "Apache-2.0 | MIT"
+
+# includes this file if it exists but does not fail
+# this is useful for anything you may want to override from
+# what cargo-bitbake generates.
+include rustfmt.inc
diff --git a/scripts/build.sh b/scripts/build.sh
new file mode 100755
index 0000000000..cfff7c1ba8
--- /dev/null
+++ b/scripts/build.sh
@@ -0,0 +1,19 @@
+#!/bin/bash
+
+# Grab the MACHINE from the environment; otherwise, set it to a sane default
+export MACHINE="${MACHINE-qemux86-64}"
+
+# What to build
+BUILD_TARGETS="\
+    rustfmt \
+    "
+
+die() {
+    echo "$*" >&2
+    exit 1
+}
+
+rm -f build/conf/bblayers.conf || die "failed to nuke bblayers.conf"
+rm -f build/conf/local.conf || die "failed to nuke local.conf"
+
+./scripts/containerize.sh bitbake ${BUILD_TARGETS} || die "failed to build"
diff --git a/scripts/cleanup-env.sh b/scripts/cleanup-env.sh
new file mode 100755
index 0000000000..d2d57295b2
--- /dev/null
+++ b/scripts/cleanup-env.sh
@@ -0,0 +1,14 @@
+#!/bin/bash -x
+
+sudo fuser -m `pwd`/build
+
+# Only attempt to unmount if the directory is already mounted
+if mountpoint -q `pwd`/build; then
+    sudo umount `pwd`/build
+fi
+
+sudo fuser -m `pwd`/build
+
+ps -ef
+
+exit 0
diff --git a/scripts/containerize.sh b/scripts/containerize.sh
new file mode 100755
index 0000000000..9e28453a0a
--- /dev/null
+++ b/scripts/containerize.sh
@@ -0,0 +1,54 @@
+#!/bin/bash
+
+# what container are we using to build this
+CONTAINER="cardoe/yocto:pyro"
+
+einfo() {
+	echo "$*" >&2
+}
+
+die() {
+    echo "$*" >&2
+    exit 1
+}
+
+# Save the commands for future use
+cmd=$@
+
+# If no command was specified, just drop us into a shell if we're interactive
+[ $# -eq 0 ] && tty -s && cmd="/bin/bash"
+
+# user and group we are running as to ensure files created inside
+# the container retain the same permissions
+my_uid=$(id -u)
+my_gid=$(id -g)
+
+# Are we in an interactive terminal?
+tty -s && termint=t
+
+# Fetch the latest version of the container
+einfo "*** Ensuring local container is up to date"
+docker pull ${CONTAINER} > /dev/null || die "Failed to update docker container"
+
+# Ensure we've got what we need for SSH_AUTH_SOCK
+if [[ -n ${SSH_AUTH_SOCK} ]]; then
+	SSH_AUTH_DIR=$(dirname $(readlink -f ${SSH_AUTH_SOCK}))
+	SSH_AUTH_NAME=$(basename ${SSH_AUTH_SOCK})
+fi
+
+# Kick off Docker
+einfo "*** Launching container ..."
+exec docker run \
+    --privileged \
+    -e BUILD_UID=${my_uid} \
+    -e BUILD_GID=${my_gid} \
+    -e TEMPLATECONF=meta-rust/conf \
+    -e MACHINE=${MACHINE:-qemux86-64} \
+    ${SSH_AUTH_SOCK:+-e SSH_AUTH_SOCK="/tmp/ssh-agent/${SSH_AUTH_NAME}"} \
+    -v ${HOME}/.ssh:/var/build/.ssh \
+    -v "${PWD}":/var/build:rw \
+    ${SSH_AUTH_SOCK:+-v "${SSH_AUTH_DIR}":/tmp/ssh-agent} \
+    ${EXTRA_CONTAINER_ARGS} \
+    -${termint}i --rm -- \
+    ${CONTAINER} \
+    ${cmd}
diff --git a/scripts/fetch.sh b/scripts/fetch.sh
new file mode 100755
index 0000000000..f8639a94af
--- /dev/null
+++ b/scripts/fetch.sh
@@ -0,0 +1,103 @@
+#!/bin/bash -x
+
+# default repo
+if [[ $# -lt 1 ]]; then
+    echo "No Yocto branch specified, defaulting to master"
+    echo "To change this pass a Yocto branch name as an argument to this script"
+fi
+branch=${1-master}
+
+# the repos we want to check out, must setup variables below
+# NOTE: poky must remain first
+REPOS="poky metaoe"
+
+POKY_URI="git://git.yoctoproject.org/poky.git"
+POKY_PATH="poky"
+POKY_REV="${POKY_REV-refs/remotes/origin/${branch}}"
+
+METAOE_URI="git://git.openembedded.org/meta-openembedded.git"
+METAOE_PATH="poky/meta-openembedded"
+METAOE_REV="${METAOE_REV-refs/remotes/origin/${branch}}"
+
+METARUST_URI="."
+METARUST_PATH="poky/meta-rust"
+
+die() {
+	echo "$*" >&2
+	exit 1
+}
+
+update_repo() {
+	uri=$1
+	path=$2
+	rev=$3
+
+	# check if we already have it checked out, if so we just want to update
+	if [[ -d ${path} ]]; then
+		pushd ${path} > /dev/null
+		echo "Updating '${path}'"
+		git remote set-url origin "${uri}"
+		git fetch origin || die "unable to fetch ${uri}"
+	else
+		echo "Cloning '${path}'"
+		if [ -d "${GIT_LOCAL_REF_DIR}" ]; then
+			git clone --reference ${GIT_LOCAL_REF_DIR}/`basename ${path}` \
+				${uri} ${path} || die "unable to clone ${uri}"
+		else
+			git clone ${uri} ${path} || die "unable to clone ${uri}"
+		fi
+		pushd ${path} > /dev/null
+	fi
+
+	# The reset steps are taken from Jenkins
+
+	# Reset
+	# * drop -d from clean to not nuke build/tmp
+	# * add -e to not clear out bitbake bits
+	git reset --hard || die "failed reset"
+	git clean -fx -e bitbake -e meta/lib/oe || die "failed clean"
+
+	# Call the branch what we're basing it on, otherwise use default
+	# if the revision was not a branch.
+	branch=$(basename ${rev})
+	[[ "${branch}" == "${rev}" ]] && branch="default"
+
+	# Create 'default' branch
+	git update-ref refs/heads/${branch} ${rev} || \
+		die "unable to get ${rev} of ${uri}"
+	git config branch.${branch}.remote origin || die "failed config remote"
+	git config branch.${branch}.merge ${rev} || die "failed config merge"
+	git symbolic-ref HEAD refs/heads/${branch} || die "failed symbolic-ref"
+	git reset --hard || die "failed reset"
+	popd > /dev/null
+	echo "Updated '${path}' to '${rev}'"
+}
+
+# For each repo, do the work
+for repo in ${REPOS}; do
+	# upper case the name
+	repo=$(echo ${repo} | tr '[:lower:]' '[:upper:]')
+
+	# expand variables
+	expand_uri="${repo}_URI"
+	expand_path="${repo}_PATH"
+	expand_rev="${repo}_REV"
+	repo_uri=${!expand_uri}
+	repo_path=${!expand_path}
+	repo_rev=${!expand_rev}
+
+	# check that we've got data
+	[[ -z ${repo_uri} ]] && die "No revision defined in ${expand_uri}"
+	[[ -z ${repo_path} ]] && die "No revision defined in ${expand_path}"
+	[[ -z ${repo_rev} ]] && die "No revision defined in ${expand_rev}"
+
+	# now fetch/clone/update repo
+	update_repo "${repo_uri}" "${repo_path}" "${repo_rev}"
+
+done
+
+rm -rf "${METARUST_PATH}" || die "unable to clear old ${METARUST_PATH}"
+ln -sf "../${METARUST_URI}" "${METARUST_PATH}" || \
+	die "unable to symlink ${METARUST_PATH}"
+
+exit 0
diff --git a/scripts/publish-build-cache.sh b/scripts/publish-build-cache.sh
new file mode 100755
index 0000000000..e3a0a1829a
--- /dev/null
+++ b/scripts/publish-build-cache.sh
@@ -0,0 +1,13 @@
+#!/bin/bash -x
+
+if [[ $# -lt 1 ]]; then
+    echo "No Yocto branch specified, defaulting to master"
+    echo "To change this pass a Yocto branch name as an argument to this script"
+fi
+branch=${1-master}
+
+rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress build/downloads yocto-cache@build-cache.asterius.io:/srv/yocto-cache/
+
+rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress build/sstate-cache yocto-cache@build-cache.asterius.io:/srv/yocto-cache/${branch}/
+
+exit 0
diff --git a/scripts/setup-env.sh b/scripts/setup-env.sh
new file mode 100755
index 0000000000..dbed06111b
--- /dev/null
+++ b/scripts/setup-env.sh
@@ -0,0 +1,12 @@
+#!/bin/bash -e
+
+mkdir -p build
+
+total_mem=`grep MemTotal /proc/meminfo | awk '{print $2}'`
+
+# Only have the slaves with large amounts of RAM mount the tmpfs
+if [ "$total_mem" -ge "67108864" ]; then
+    sudo mount -t tmpfs -o size=64G,mode=755,uid=${UID} tmpfs build
+fi
+
+exit 0
-- 
2.27.0


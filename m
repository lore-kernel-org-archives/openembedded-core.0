Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68DBC5479D
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:45 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.126060.1672005578985679525
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a9BB7Egf;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id vm8so16242811ejc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jicuNX8MyR2qm/bAJiW5ZbV2IE5vfTz2MWnU1FkKpc4=;
        b=a9BB7Egf6NBmMoYcihheq+Ns4HuitREXUFVTZwxve1y+tVejst7jp+kxyo3GB+zm5f
         CG7RKkU5RSVu2PiePgeDX+Xk2h+Fs6HmpXpPZTpy+uhRqnvLDYc8sy3b6oFUySNTBEED
         rseUj54jNimKcCiYgDRsfVP3tV1kXIQszPdFqOFXw7tI9MshGuszoi0cYTYVHepZ17mR
         PDcdMbjA2FWvLVV/WKEQMU+J3p85FbcGXPLTS/66mxlM6DEMaZjIAYsTef9iD70K1gnk
         kZn+9WfDTfVrdVROw8P20o11+lo7BornRwQcZaumiFF1h6YGOcXPbkkMSVQ6w+fu/qUy
         0J1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jicuNX8MyR2qm/bAJiW5ZbV2IE5vfTz2MWnU1FkKpc4=;
        b=cDhsqJa/3WQmkJiCXUdj8m2gyOBu2J4+qJwhskl+FuTJjd2MkbZEFPhpvpwsBMwJoa
         QQvzVXJj6sy1xi7YLuXFXP+9nH+K/r8xrSZ/xq7L8pTDjhxMNMUQKRtJE5UtRtS1jPbY
         JBDenG4duOrU7DkzcpIc791+NcsrUUSOP1twWZp5QgAC5knJR2n6FXDt9IMZzj2Rafqe
         3gMi9IxUNMu/HlhIwqaF9XlaCkvpaYKH6J1Fw0HYSSV0BRR8cTdxrCq1VaOVeIAZReGU
         9TrDk85PLRTkHgNyOU5R5HDJrjI+o6cejN3oX2VdzNPr3Nx7tAXX2AtLUNQWHsutTXz/
         iVmg==
X-Gm-Message-State: AFqh2kpKTWcjm2settRMWH/hE+ipNplHIH/XinpcM1E0wc12idJp0ZvZ
	twCoV7jcBcA9RYsTUNOLks2Lx6tlIZ4=
X-Google-Smtp-Source: AMrXdXujOEYyKd9M8BtyJ1RWfqz5O9G1MOwnRASUrYcmoXo6u7cAwEaNtwGCxwg/pQvIiy0XURBGxQ==
X-Received: by 2002:a17:906:910:b0:7c0:f71b:8b3 with SMTP id i16-20020a170906091000b007c0f71b08b3mr13491532ejd.57.1672005576926;
        Sun, 25 Dec 2022 13:59:36 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:36 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 07/11] rust: Merge .inc into .bb
Date: Sun, 25 Dec 2022 21:59:17 +0000
Message-Id: <20221225215921.12868-8-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175002

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/rust/rust-target.inc |  10 -
 meta/recipes-devtools/rust/rust.inc        | 223 ---------------------
 meta/recipes-devtools/rust/rust_1.66.0.bb  | 218 +++++++++++++++++++-
 3 files changed, 217 insertions(+), 234 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-target.inc
 delete mode 100644 meta/recipes-devtools/rust/rust.inc

diff --git a/meta/recipes-devtools/rust/rust-target.inc b/meta/recipes-devtools/rust/rust-target.inc
deleted file mode 100644
index dce2b47517b5..000000000000
--- a/meta/recipes-devtools/rust/rust-target.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-require rust.inc
-
-DEPENDS += "rust-llvm (=${PV})"
-
-# Otherwise we'll depend on what we provide
-INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
-# We don't need to depend on gcc-native because yocto assumes it exists
-PROVIDES:class-native = "virtual/${TARGET_PREFIX}rust"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
deleted file mode 100644
index f58aa4644446..000000000000
--- a/meta/recipes-devtools/rust/rust.inc
+++ /dev/null
@@ -1,223 +0,0 @@
-SUMMARY = "Rust compiler and runtime libaries"
-HOMEPAGE = "http://www.rust-lang.org"
-SECTION = "devel"
-LICENSE = "(MIT | Apache-2.0) & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=92289ed52a60b63ab715612ad2915603"
-
-inherit rust
-inherit cargo_common
-
-DEPENDS += "file-native python3-native"
-DEPENDS:append:class-native = " rust-llvm-native"
-DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"
-
-S = "${RUSTSRC}"
-
-# Use at your own risk, accepted values are stable, beta and nightly
-RUST_CHANNEL ?= "stable"
-PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)}"
-
-export FORCE_CRATE_HASH="${BB_TASKHASH}"
-
-RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
-RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
-
-# We don't want to use bitbakes vendoring because the rust sources do their
-# own vendoring.
-CARGO_DISABLE_BITBAKE_VENDORING = "1"
-
-# We can't use RUST_BUILD_SYS here because that may be "musl" if
-# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
-setup_cargo_environment () {
-    # The first step is to build bootstrap and some early stage tools,
-    # these are build for the same target as the snapshot, e.g.
-    # x86_64-unknown-linux-gnu.
-    # Later stages are build for the native target (i.e. target.x86_64-linux)
-    cargo_common_do_configure
-}
-
-inherit rust-target-config
-
-do_rust_setup_snapshot () {
-    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
-        "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
-    done
-
-    # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
-    # and fail without it there.
-    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
-    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
-
-    # Need to use uninative's loader if enabled/present since the library paths
-    # are used internally by rust and result in symbol mismatches if we don't
-    if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
-        for bin in cargo rustc rustdoc; do
-            patchelf-uninative ${WORKDIR}/rust-snapshot/bin/$bin --set-interpreter ${UNINATIVE_LOADER}
-        done
-    fi
-}
-addtask rust_setup_snapshot after do_unpack before do_configure
-do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
-do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
-
-python do_configure() {
-    import json
-    try:
-        import configparser
-    except ImportError:
-        import ConfigParser as configparser
-
-    # toml is rather similar to standard ini like format except it likes values
-    # that look more JSON like. So for our purposes simply escaping all values
-    # as JSON seem to work fine.
-
-    e = lambda s: json.dumps(s)
-
-    config = configparser.RawConfigParser()
-
-    # [target.ARCH-poky-linux]
-    host_section = "target.{}".format(d.getVar('RUST_HOST_SYS', True))
-    config.add_section(host_section)
-
-    llvm_config_target = d.expand("${RUST_ALTERNATE_EXE_PATH}")
-    llvm_config_build = d.expand("${RUST_ALTERNATE_EXE_PATH_NATIVE}")
-    config.set(host_section, "llvm-config", e(llvm_config_target))
-
-    config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
-    config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
-    config.set(host_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
-    if "musl" in host_section:
-        config.set(host_section, "musl-root", e(d.expand("${STAGING_DIR_HOST}${exec_prefix}")))
-
-    # If we don't do this rust-native will compile it's own llvm for BUILD.
-    # [target.${BUILD_ARCH}-unknown-linux-gnu]
-    build_section = "target.{}".format(d.getVar('RUST_BUILD_SYS', True))
-    if build_section != host_section:
-        config.add_section(build_section)
-
-        config.set(build_section, "llvm-config", e(llvm_config_build))
-
-        config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
-        config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
-        config.set(build_section, "linker", e(d.expand("${RUST_BUILD_CCLD}")))
-
-    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
-    if target_section != host_section and target_section != build_section:
-        config.add_section(target_section)
-
-        config.set(target_section, "llvm-config", e(llvm_config_target))
-
-        config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
-        config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
-        config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
-
-    # [llvm]
-    config.add_section("llvm")
-    config.set("llvm", "static-libstdcpp", e(False))
-    if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
-        config.set("llvm", "use-libcxx", e(True))
-
-    # [rust]
-    config.add_section("rust")
-    config.set("rust", "rpath", e(True))
-    config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
-
-    # Whether or not to optimize the compiler and standard library
-    config.set("rust", "optimize", e(True))
-
-    # Emits extraneous output from tests to ensure that failures of the test
-    # harness are debuggable just from logfiles
-    config.set("rust", "verbose-tests", e(True))
-
-    # [build]
-    config.add_section("build")
-    config.set("build", "submodules", e(False))
-    config.set("build", "docs", e(False))
-
-    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
-    config.set("build", "rustc", e(rustc))
-
-    # Support for the profiler runtime to generate e.g. coverage report,
-    # PGO etc.
-    config.set("build", "profiler", e(True))
-
-    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
-    config.set("build", "cargo", e(cargo))
-
-    config.set("build", "vendor", e(True))
-
-    if not "targets" in locals():
-        targets = [d.getVar("RUST_TARGET_SYS", True)]
-    config.set("build", "target", e(targets))
-
-    if not "hosts" in locals():
-        hosts = [d.getVar("RUST_HOST_SYS", True)]
-    config.set("build", "host", e(hosts))
-
-    # We can't use BUILD_SYS since that is something the rust snapshot knows
-    # nothing about when trying to build some stage0 tools (like fabricate)
-    config.set("build", "build", e(d.getVar("RUST_BUILD_SYS", True)))
-
-    # [install]
-    config.add_section("install")
-    # ./x.py install doesn't have any notion of "destdir"
-    # but we can prepend ${D} to all the directories instead
-    config.set("install", "prefix",  e(d.getVar("D", True) + d.getVar("prefix", True)))
-    config.set("install", "bindir",  e(d.getVar("D", True) + d.getVar("bindir", True)))
-    config.set("install", "libdir",  e(d.getVar("D", True) + d.getVar("libdir", True)))
-    config.set("install", "datadir", e(d.getVar("D", True) + d.getVar("datadir", True)))
-    config.set("install", "mandir",  e(d.getVar("D", True) + d.getVar("mandir", True)))
-
-    with open("config.toml", "w") as f:
-        f.write('changelog-seen = 2\n\n')
-        config.write(f)
-
-    # set up ${WORKDIR}/cargo_home
-    bb.build.exec_func("setup_cargo_environment", d)
-}
-
-
-rust_runx () {
-    echo "COMPILE ${PN}" "$@"
-
-    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for a
-    # wide range of targets (not just TARGET). Yocto's settings for them will
-    # be inappropriate, avoid using.
-    unset CFLAGS
-    unset LDFLAGS
-    unset CXXFLAGS
-    unset CPPFLAGS
-
-    export RUSTFLAGS="${RUST_DEBUG_REMAP}"
-
-    # Copy the natively built llvm-config into the target so we can run it. Horrible,
-    # but works!
-    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
-        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
-        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
-        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
-    fi
-
-    oe_cargo_fix_env
-
-    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
-}
-rust_runx[vardepsexclude] += "PARALLEL_MAKE"
-
-do_compile () {
-    rust_runx build
-}
-
-rust_do_install () {
-    mkdir -p ${D}${bindir}
-    cp build/${RUST_HOST_SYS}/stage2/bin/* ${D}${bindir}
-
-    mkdir -p ${D}${libdir}/rustlib
-    cp -pRd build/${RUST_HOST_SYS}/stage2/lib/* ${D}${libdir}
-    # Remove absolute symlink so bitbake doesn't complain
-    rm -f ${D}${libdir}/rustlib/src/rust
-}
-
-do_install () {
-    rust_do_install
-}
diff --git a/meta/recipes-devtools/rust/rust_1.66.0.bb b/meta/recipes-devtools/rust/rust_1.66.0.bb
index b39f772c5fe1..5192ec2ee11a 100644
--- a/meta/recipes-devtools/rust/rust_1.66.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.66.0.bb
@@ -1,4 +1,215 @@
-require rust-target.inc
+SUMMARY = "Rust compiler and runtime libaries"
+HOMEPAGE = "http://www.rust-lang.org"
+SECTION = "devel"
+LICENSE = "(MIT | Apache-2.0) & Unicode-TOU"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=92289ed52a60b63ab715612ad2915603"
+
+inherit rust
+inherit cargo_common
+
+DEPENDS += "file-native python3-native"
+DEPENDS:append:class-native = " rust-llvm-native"
+DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"
+
+DEPENDS += "rust-llvm (=${PV})"
+
+# Otherwise we'll depend on what we provide
+INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
+# We don't need to depend on gcc-native because yocto assumes it exists
+PROVIDES:class-native = "virtual/${TARGET_PREFIX}rust"
+
+S = "${RUSTSRC}"
+
+# Use at your own risk, accepted values are stable, beta and nightly
+RUST_CHANNEL ?= "stable"
+PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)}"
+
+export FORCE_CRATE_HASH="${BB_TASKHASH}"
+
+RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
+RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
+
+# We don't want to use bitbakes vendoring because the rust sources do their
+# own vendoring.
+CARGO_DISABLE_BITBAKE_VENDORING = "1"
+
+# We can't use RUST_BUILD_SYS here because that may be "musl" if
+# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
+setup_cargo_environment () {
+    # The first step is to build bootstrap and some early stage tools,
+    # these are build for the same target as the snapshot, e.g.
+    # x86_64-unknown-linux-gnu.
+    # Later stages are build for the native target (i.e. target.x86_64-linux)
+    cargo_common_do_configure
+}
+
+inherit rust-target-config
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
+
+    # Need to use uninative's loader if enabled/present since the library paths
+    # are used internally by rust and result in symbol mismatches if we don't
+    if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
+        for bin in cargo rustc rustdoc; do
+            patchelf-uninative ${WORKDIR}/rust-snapshot/bin/$bin --set-interpreter ${UNINATIVE_LOADER}
+        done
+    fi
+}
+addtask rust_setup_snapshot after do_unpack before do_configure
+do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
+do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
+
+python do_configure() {
+    import json
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
+    host_section = "target.{}".format(d.getVar('RUST_HOST_SYS', True))
+    config.add_section(host_section)
+
+    llvm_config_target = d.expand("${RUST_ALTERNATE_EXE_PATH}")
+    llvm_config_build = d.expand("${RUST_ALTERNATE_EXE_PATH_NATIVE}")
+    config.set(host_section, "llvm-config", e(llvm_config_target))
+
+    config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+    config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+    config.set(host_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
+    if "musl" in host_section:
+        config.set(host_section, "musl-root", e(d.expand("${STAGING_DIR_HOST}${exec_prefix}")))
+
+    # If we don't do this rust-native will compile it's own llvm for BUILD.
+    # [target.${BUILD_ARCH}-unknown-linux-gnu]
+    build_section = "target.{}".format(d.getVar('RUST_BUILD_SYS', True))
+    if build_section != host_section:
+        config.add_section(build_section)
+
+        config.set(build_section, "llvm-config", e(llvm_config_build))
+
+        config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
+        config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+        config.set(build_section, "linker", e(d.expand("${RUST_BUILD_CCLD}")))
+
+    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
+    if target_section != host_section and target_section != build_section:
+        config.add_section(target_section)
+
+        config.set(target_section, "llvm-config", e(llvm_config_target))
+
+        config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+        config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+        config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
+
+    # [llvm]
+    config.add_section("llvm")
+    config.set("llvm", "static-libstdcpp", e(False))
+    if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
+        config.set("llvm", "use-libcxx", e(True))
+
+    # [rust]
+    config.add_section("rust")
+    config.set("rust", "rpath", e(True))
+    config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
+
+    # Whether or not to optimize the compiler and standard library
+    config.set("rust", "optimize", e(True))
+
+    # Emits extraneous output from tests to ensure that failures of the test
+    # harness are debuggable just from logfiles
+    config.set("rust", "verbose-tests", e(True))
+
+    # [build]
+    config.add_section("build")
+    config.set("build", "submodules", e(False))
+    config.set("build", "docs", e(False))
+
+    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
+    config.set("build", "rustc", e(rustc))
+
+    # Support for the profiler runtime to generate e.g. coverage report,
+    # PGO etc.
+    config.set("build", "profiler", e(True))
+
+    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
+    config.set("build", "cargo", e(cargo))
+
+    config.set("build", "vendor", e(True))
+
+    if not "targets" in locals():
+        targets = [d.getVar("RUST_TARGET_SYS", True)]
+    config.set("build", "target", e(targets))
+
+    if not "hosts" in locals():
+        hosts = [d.getVar("RUST_HOST_SYS", True)]
+    config.set("build", "host", e(hosts))
+
+    # We can't use BUILD_SYS since that is something the rust snapshot knows
+    # nothing about when trying to build some stage0 tools (like fabricate)
+    config.set("build", "build", e(d.getVar("RUST_BUILD_SYS", True)))
+
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
+    with open("config.toml", "w") as f:
+        f.write('changelog-seen = 2\n\n')
+        config.write(f)
+
+    # set up ${WORKDIR}/cargo_home
+    bb.build.exec_func("setup_cargo_environment", d)
+}
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
+    export RUSTFLAGS="${RUST_DEBUG_REMAP}"
+
+    # Copy the natively built llvm-config into the target so we can run it. Horrible,
+    # but works!
+    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
+        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
+        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
+        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
+    fi
+
+    oe_cargo_fix_env
+
+    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
+}
+rust_runx[vardepsexclude] += "PARALLEL_MAKE"
+
 require rust-source.inc
 require rust-snapshot.inc
 
@@ -35,6 +246,10 @@ RDEPENDS:${PN}-tools-rustfmt = "${PN}"
 SUMMARY:${PN}-tools-clippy = "A collection of lints to catch common mistakes and improve your Rust code"
 SUMMARY:${PN}-tools-rustfmt = "A tool for formatting Rust code according to style guidelines"
 
+do_install () {
+    rust_do_install
+}
+
 rust_do_install() {
     rust_runx install
 }
@@ -87,3 +302,4 @@ RUSTLIB_DEP:class-nativesdk = ""
 # musl builds include libunwind.a
 INSANE_SKIP:${PN} = "staticdev"
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.0



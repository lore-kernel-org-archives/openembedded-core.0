Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.17071.1621247750364417769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kI5Kw0bg;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id m190so4359756pga.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xstCUN+lggfkMkukSM2uz/otHtqN7Av9hb3GyKyBC6U=;
        b=kI5Kw0bgHu1j1qNMUndEzQqgkL/TWF+mDmVD9uO155lM19c5Pb3iP2201Xgnk80Wjr
         j/Z3EPiWUGw8dJFl12LluUxD58yl4d2flJIG7/GwoymOW5L2DGmXrfYndSNq0J9NKnmD
         CA1+DezD+dK8ORH8ny3FpXWWLjskivuSbru2O6Ym21ad7jP0omtwNY7ispZEeFQDwqbx
         kew43SLLMITqxzWXKRywggb4s5Fd+iqBo/RhDf2o5+1tF3JLTXL0ZZjqlA62tx5oPZ67
         vXvuQhOefbE6d4j9Jdh0G0pm8OEHNdYRzWw7PbZKk+53gUT5VFt2P1uyiLTo8x4BDJXC
         ba8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xstCUN+lggfkMkukSM2uz/otHtqN7Av9hb3GyKyBC6U=;
        b=udUQJBtQHFGLLOamEiIgZ+rs644G942wI9vDPa45Cqkth4irCy5fl+NLnlzDKc2HTA
         r108tjFIkbWJzLYZjDQ58elVt/aItHwMYvDwK/CPjzCaWIL4rJxqtKpJWieY0RMOhkzN
         ctaHiwSzpju1ciz3HxWWjRlOcLbw2IzLn5yx85kg2g87Cin2osH0D3NgpfdhZ4q/66IC
         tSevR3/Qa5o0WI7xmnKsMqiW/yV3KCIgwR5ACtpNHzmbxFchXIXhsNWQP9U9wLISrNQ1
         7NWI/YO7KMnd4KyTm1zYz3Dc7bmsZarqb+qGKhOo40gRT6C6yh2CKWUVs5vk7pZhAlZz
         XsAg==
X-Gm-Message-State: AOAM532JTcBU1vcOykHi0cAA7HcZETh6e+fM4eybU1toqDT+315PIBiX
	8XHBWjgZl4Y+sbQpZrcTFd2Ons/o4jrzuskp
X-Google-Smtp-Source: ABdhPJznqS6ztAZWP/Fs2qrUlRJxXMHvjjjvvtIL3AkmvRQo73Kh0+L2IQBd5A1DgWzx2kGIyDyQGQ==
X-Received: by 2002:a63:4d52:: with SMTP id n18mr23688495pgl.147.1621247749276;
        Mon, 17 May 2021 03:35:49 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id m20sm14903365pjq.40.2021.05.17.03.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:35:48 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Cc: kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	alex.kanavin@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v2 1/7] rust-testsuite.inc : Rust cross testing.
Date: Mon, 17 May 2021 03:35:22 -0700
Message-Id: <20210517103528.24434-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>

Below list of functions are part of rust-testsuite.inc
setup_cargo_environment(): Build bootstrap and some early stage tools.
do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
do_configure(): To generate config.toml
do_compile(): To build "remote-test-server" for qemutarget image.
do_check(): To execute testing by copying remote-test-server to qmutarget image.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust-testsuite.inc | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc

diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
new file mode 100644
index 0000000000..d1c5496da4
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite.inc
@@ -0,0 +1,166 @@
+SUMMARY = "Rust testing"
+HOMEPAGE = "https://rustc-dev-guide.rust-lang.org/tests/intro.html"
+SECTION = "test"
+LICENSE = "MIT | Apache-2.0"
+
+inherit rust
+inherit cargo_common
+
+DEPENDS += "file-native python3-native"
+EXCLUDE_FROM_WORLD = "1"
+
+# Path of target specification file "target-poky-linux.json"
+export RUST_TARGET_PATH="${STAGING_LIBDIR_NATIVE}/rustlib"
+
+export FORCE_CRATE_HASH="${BB_TASKHASH}"
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
+    # [target.ARCH-unknown-linux-gnu] in case of x86_64 [target.ARCH-poky-linux] 
+    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
+    config.add_section(target_section)
+
+    # Points to wrapper files which contain target specific compiler and linker commands. 
+    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
+
+    # If we don't do this rust-native will compile it's own llvm for BUILD.
+    # [target.${BUILD_ARCH}-unknown-linux-gnu]
+    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
+    config.add_section(target_section)
+
+    # Wrapper scripts of build system.
+    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
+    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+
+    # [llvm]
+    config.add_section("llvm")
+    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X86"))
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
+    # Emits extraneous output from tests to ensure that failures of the test
+    # harness are debuggable just from logfiles
+    config.set("rust", "verbose-tests", e(True))    
+
+    # Override default linker cc.
+    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}")))
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
+    hosts = [d.getVar("SNAPSHOT_BUILD_SYS", True)]
+    config.set("build", "host", e(hosts))
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
+    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
+}
+rust_runx[vardepsexclude] += "PARALLEL_MAKE"
+
+do_compile () {
+
+    rust_runx build src/tools/remote-test-server --target "${TARGET_SYS}"
+}
+
+do_check[dirs] += "${B}"
+do_check[nostamp] = "1"
+do_check () {
+    scp -P 2222 -o StrictHostKeyChecking=no build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/
+    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1 "~/remote-test-server -v remote"
+
+    export TEST_DEVICE_ADDR="127.0.0.1:12345"
+    rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" > summary.txt 2> /dev/null
+}
+addtask do_check after do_compile
-- 
2.17.1


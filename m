Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.180.1631554520271030007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 10:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OR/qlsij;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id 5so6315864plo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O6f/6LyVUQsxTDFeDoAOt4YxsHOoqTQ7LzxpqBLxN28=;
        b=OR/qlsij8eDgpqBic5riwwHqhevHnJryI649AAwteHlVylmnUY7YTgQLO0RyziQrpy
         Doc7o3Dr+g1m3I6GvF0lBwnNBw+Z9tc8r9eg0i8EScRHAKTwEoHpRRJn6CwJqVmq7rBZ
         T97flArzmt1NoY88pkW9L7YpkHAp9+ItWqi9idH99IReORIMM20MIqoa1geLAyNlkp6H
         t/yITEVDE6/7QV4qrDrLaIAHDqEh0bzkNZHz559FVTIZ+yRpQabK7J2QliATLBZPdFnR
         gDuJay+hDrSEcAGWuZ8vBjE/IaQtz4vRTmwcMAurVwguM0/IRg0fjIEP1rN0YHl8Yakg
         DTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O6f/6LyVUQsxTDFeDoAOt4YxsHOoqTQ7LzxpqBLxN28=;
        b=lasBWkb5XD2+et8Mjzls3Fz8Q518o8C/804HBaNsP3pPc6+/XY6DQwTRhbXXK9r5Pf
         hYuqq53ZfEA1ojWPsrcW5IuPzurW8oNylB/+C81PGGSkRohr8tXbi4Z898SL/CTR5TnW
         8hwzDJouNKo9s0jfjPACsItRxcZ7eogZeoBeZOaq+gvDPniIHBSp/MA/JACsT3JSk7qE
         4sUsP+/ObbB8iCJkIL2PcjcZpn0ZNZLSNrM4/DOIuJzooJdxDP+Nj6QYNyvKhtAUCaRU
         zAsZn4ozzx6UdQTrPJgGeKILLEz5tqWV1dCGG4wBsL4Sk6z0seVHnjFyvEo/8R+kWZMD
         /dCg==
X-Gm-Message-State: AOAM531oHravzS0xfzoc6Q4p5/HWdARaXx4rsqIQvQhjYbtr0AttWI5N
	LTdqfPH1y8sZjkyyX944dXL29AFDVwE6SQ==
X-Google-Smtp-Source: ABdhPJx0R+gpPtVY9ZdZFhu2TFMBcPoC2T5eZfAzGCv6NZhEIb4Q5Y1NDart66CK+kuy1x8I5Xyd3A==
X-Received: by 2002:a17:90a:b785:: with SMTP id m5mr722142pjr.213.1631554519515;
        Mon, 13 Sep 2021 10:35:19 -0700 (PDT)
Return-Path: <pgowda.cve@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id t68sm8988337pgc.59.2021.09.13.10.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 10:35:19 -0700 (PDT)
From: "Pgowda" <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	alex.kanavin@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH 2/4] Rust cross testing file
Date: Mon, 13 Sep 2021 10:35:11 -0700
Message-Id: <20210913173513.176653-2-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913173513.176653-1-pgowda.cve@gmail.com>
References: <20210913173513.176653-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file is main entry point for rust oe-selftest.
It configures, compiles and runs the test suite framework.

It implements the above using the following functions:
setup_cargo_environment(): Build bootstrap and some early stage tools.
do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
do_configure(): To generate config.toml
do_compile(): To build "remote-test-server" for qemutarget image.

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust-testsuite.inc | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc

diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
new file mode 100644
index 0000000000..0a8abbef21
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite.inc
@@ -0,0 +1,157 @@
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
+S = "${RUSTSRC}"
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
+include rust-common.inc
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
-- 
2.31.1


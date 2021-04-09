Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web09.7957.1617969579474582486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 04:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bHZXX+Tb;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so5414389otb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=C04HKr3XOsHYbWq5I+WcBcHbG8baWWsuhVchaPPphgU=;
        b=bHZXX+TbhUPviU//v0X9Y/HZT9qyBuUPvpMNRcsLsic4f8NUoMZJ+5VRMkp9TZpmuT
         ynTfBIdG9Bpbhj++iToe1UDiZoetVhlHgrZzPj2bbDhnwreE2jUm17HGoQyRZ8yvcjLr
         BLO65Y3hRmAQ8ikHgwPh8djf+s5a90TAUKjV65SRDUuSZ+6NpDL7o4sR1Cn8D2SUEexT
         H3IDcX8Xryaz9TM5oIjBpkfCyiz0QqF+4XRUF7/rjgDXj8giEwE0W+TI7VZhpWVaD39f
         7xUu6hVildOnyeP2o7kz47ks4aG1zazqFy/3OyDOiE7i6emwppJ0v3K3B5Ehm++s8k02
         L72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=C04HKr3XOsHYbWq5I+WcBcHbG8baWWsuhVchaPPphgU=;
        b=Cz9qRlZ6NBSICE+xKMEPHKrasDhxDNOGwh8LPFk21fGfybO1fAo/RpIRAMEfLTGFL2
         1+xIwLmwnD9fUCARgPbAOv8KirPKNNNFj+06JI/Vgbq10M4TnTQa/RoS3cdViwIdDDHO
         wPq72yvO64po2oYJlG9FuVRFupB9EXoyR8oEVbatCkx2JmYPmSpGIOKxnoIeOxl2ZETy
         /AI+kk7JnSk4CApbmtv/szPcLUbsYmCRcRMxn2+pPF96nf9VAK4v1nkH4d9UED9CETeL
         ECmLlxlCXMiPsZ7Q71EZZZwiKh+BIJw8sCjJhq1ESO7gnQShjzvzojUfT2405a2tEQFz
         dVug==
X-Gm-Message-State: AOAM5327qvnbpvqP06JZWg1zxEZOCvEuZ6SmSBfC+mEhSS/vAFX2aFw2
	Fs168hXNZWzjmZmDNeq5ySeVewSsSblGovWd3VU=
X-Google-Smtp-Source: ABdhPJyj4MmJSxWw7PeMrKzeIpSJ0TPwH5UaqIbSf4TzdhpET474mgiBLdAz0eQnwzRkP72zU5hy8g==
X-Received: by 2002:a9d:6d08:: with SMTP id o8mr11674491otp.214.1617969578112;
        Fri, 09 Apr 2021 04:59:38 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id w23sm493680oow.25.2021.04.09.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 04:59:37 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH] Rust cross testing integration with oe-selftest.
Date: Fri,  9 Apr 2021 04:59:32 -0700
Message-Id: <20210409115932.72453-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/classes/rust-common.bbclass              |   5 +-
 meta/conf/bitbake.conf                        |   2 +-
 meta/lib/oeqa/selftest/cases/rust.py          |  41 ++
 meta/lib/oeqa/utils/qemurunner.py             |   8 +-
 meta/recipes-devtools/rust/rust-test.inc      | 504 ++++++++++++++++++
 .../recipes-devtools/rust/rust-test_1.46.0.bb |  12 +
 scripts/runqemu                               |  15 +-
 7 files changed, 583 insertions(+), 4 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
 create mode 100644 meta/recipes-devtools/rust/rust-test.inc
 create mode 100644 meta/recipes-devtools/rust/rust-test_1.46.0.bb

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index ff7b9da8f3..fb75b07ba3 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -84,7 +84,10 @@ def rust_base_triple(d, thing):
     # This catches ARM targets and appends the necessary hard float bits
     if os == "linux-gnueabi" or os == "linux-musleabi":
         libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf', '', d)
-    return arch + vendor + '-' + os + libc
+    if d.getVar('TARGET_ARCH') == 'mips64':
+       return arch + vendor + '-' + os + libc + 'abi64'
+    else:
+       return arch + vendor + '-' + os + libc
 
 # Naming explanation
 # Yocto
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3438be92b7..83e1b68071 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -483,7 +483,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 HOSTTOOLS += " \
     [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
-    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
+    fgrep file find flock g++ gawk gcc cc getconf getopt git grep gunzip gzip \
     head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..69a1a285a9
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: MIT
+import os
+from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
+
+class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
+
+	def run_check(self, *suites, ssh = None):
+		# configure ssh target
+		features = []
+		if ssh is not None:
+			features.append('TOOLCHAIN_TEST_TARGET = "ssh"')
+			features.append('TOOLCHAIN_TEST_HOST = "{0}"'.format(ssh))
+			features.append('TOOLCHAIN_TEST_HOST_USER = "root"')
+			features.append('TOOLCHAIN_TEST_HOST_PORT = "22"')
+		self.write_config("\n".join(features))
+
+		recipe = "rust-test"
+		bitbake("{} -c check".format(recipe))
+
+	def run_check_emulated(self, *args, **kwargs):
+		# build remote-test-server before image build
+		recipe = "rust-test"	
+		bitbake("{} -c compile".format(recipe))
+		# build core-image-minimal with required packages
+		default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+		features = []
+		features.append('IMAGE_FEATURES += "ssh-server-openssh"')
+		features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
+		self.write_config("\n".join(features))
+		bitbake("core-image-minimal")
+		# wrap the execution with a qemu instance
+		with runqemu("core-image-minimal", runqemuparams = "nographic slirp") as qemu:
+			return self.run_check(*args, ssh=qemu.ip, **kwargs)
+
+@OETestTag("toolchain-system")
+class RustSelfTestSystemEmulated(RustSelfTestBase):
+	def test_rust(self):
+		self.run_check_emulated("rust")
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 77ec939ad7..aea7c624ec 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -184,7 +184,13 @@ class QemuRunner:
         # and analyze descendents in order to determine it.
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
-        self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
+
+        if "slirp" in launch_cmd:
+            self.use_slirp = True
+            self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1} -monitor telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null"'.format(bootparams, self.qemu_pidfile)
+        else:
+            self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
+
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
diff --git a/meta/recipes-devtools/rust/rust-test.inc b/meta/recipes-devtools/rust/rust-test.inc
new file mode 100644
index 0000000000..0a13b3e0d8
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-test.inc
@@ -0,0 +1,504 @@
+HOMEPAGE = "http://www.rust-lang.org"
+SECTION = "devel"
+LICENSE = "MIT | Apache-2.0"
+
+inherit rust
+inherit cargo_common
+
+DEPENDS += "file-native python3-native"
+DEPENDS_append_class-native = " rust-llvm-native"
+
+# In case of x86_64 target we setting this path to location of "x86_64-poky-linux.json". 
+# This is to differentiate cross target and build in config.toml file.
+export RUST_TARGET_PATH = "${STAGING_LIBDIR_NATIVE}/rustlib"
+
+export FORCE_CRATE_HASH="${BB_TASKHASH}"
+
+#export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
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
+    mach_overrides = d.getVar('MACHINEOVERRIDES')
+    mach_overrides = frozenset(mach_overrides.split(':'))
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
+    if (not mach_overrides.isdisjoint(v7)) or (not feat.isdisjoint(v7)):
+        f.append("+v7")
+    if ('armv6' in mach_overrides) or ('armv6' in feat):
+        f.append("+v6")
+
+    if 'dsp' in feat:
+        f.append("+dsp")
+
+    if 'thumb' in feat:
+        if d.getVar('ARM_THUMB_OPT') is "thumb":
+            if (not mach_overrides.isdisjoint(v7)) or (not feat.isdisjoint(v7)):
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
+def rust_gen_target(d, thing, wd, features, cpu):
+    import json
+    from distutils.version import LooseVersion
+    arch = arch_for(d, thing)
+    sys = sys_for(d, thing)
+    prefix = prefix_for(d, thing)
+
+    features = features or d.getVarFlag('FEATURES', arch) or ""
+    features = features.strip()
+
+    # build tspec
+    tspec = {}
+    tspec['llvm-target'] = d.getVarFlag('LLVM_TARGET', arch)
+    tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch)
+    tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch))
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
+python do_rust_gen_targets () {
+    wd = d.getVar('WORKDIR') + '/targets/'
+    rust_gen_target(d, 'BUILD', wd, "", "generic")
+}
+
+addtask rust_gen_targets after do_patch before do_compile
+do_rust_gen_targets[dirs] += "${WORKDIR}/targets"
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
+    # [target.ARCH-unknown-linux-gnu]
+    if( d.getVar('RUST_TARGET_SYS', True) != d.getVar('SNAPSHOT_BUILD_SYS', True)):
+       target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
+    else :
+       target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
+
+    config.add_section(target_section)
+
+    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
+
+    # If we don't do this rust-native will compile it's own llvm for BUILD.
+    # [target.${BUILD_ARCH}-unknown-linux-gnu]
+    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
+    config.add_section(target_section)
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
+    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
+    config.set("build", "cargo", e(cargo))
+
+    config.set("build", "vendor", e(True))
+
+    if( d.getVar('RUST_TARGET_SYS', True) != d.getVar('SNAPSHOT_BUILD_SYS', True)):
+        targets = [d.getVar("RUST_TARGET_SYS", True)]
+    else:
+        targets = [d.getVar("TARGET_SYS", True)]
+
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
+    nativepython3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" 
+}
+rust_runx[vardepsexclude] += "PARALLEL_MAKE"
+
+do_compile () {	
+    if [  "${SNAPSHOT_BUILD_SYS}" = "${RUST_TARGET_SYS}" ]
+    then
+       rust_runx build src/tools/remote-test-server --target "${TARGET_SYS}"
+    else
+       rust_runx build src/tools/remote-test-server --target "${RUST_TARGET_SYS}"
+    fi
+}
+
+do_check[dirs] += "${B}"
+do_check[nostamp] = "1"
+do_check () {
+    scp -P 2222 -o StrictHostKeyChecking=no build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/
+    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1 "~/remote-test-server -v remote"
+
+
+    export TEST_DEVICE_ADDR="127.0.0.1:12345"
+    if [  "${SNAPSHOT_BUILD_SYS}" = "${RUST_TARGET_SYS}" ]
+    then
+       rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" > summary.txt 2> /dev/null
+    else
+       rust_runx test --no-fail-fast --target "${RUST_TARGET_SYS}" > summary.txt 2> /dev/null
+    fi
+
+}
+addtask do_check after do_compile
+
diff --git a/meta/recipes-devtools/rust/rust-test_1.46.0.bb b/meta/recipes-devtools/rust/rust-test_1.46.0.bb
new file mode 100644
index 0000000000..b724ea5eb0
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-test_1.46.0.bb
@@ -0,0 +1,12 @@
+require rust-test.inc
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
diff --git a/scripts/runqemu b/scripts/runqemu
index dd92a64553..1a21a90add 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1055,7 +1055,7 @@ class BaseConfig(object):
         logger.info("Network configuration:%s", netconf)
         self.kernel_cmdline_script += netconf
         # Port mapping
-        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
+        hostfwd = ",hostfwd=tcp::12345-:12345,hostfwd=tcp::2323-:23,hostfwd=tcp::2222-:22"
         qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
         qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
         # Figure out the port
@@ -1084,6 +1084,19 @@ class BaseConfig(object):
                         mac += 1
             if p != p_new:
                 ports.append(p_new)
+                temp=__file__.split(os.path.basename(__file__))[0]
+                with open(temp+"../meta/recipes-devtools/rust/rust-test.inc", 'r+') as f:
+                    text = f.readlines()
+                    temp1=[]
+                    for i in text:
+                        temp = re.sub(r'(\S+\s)(-.)(\s\d+)( -o StrictHostKeyChecking=no .*)', r'\1\2 '+str(p_new)+'\\4', i)
+                        temp1.append(temp)
+                    temp2=''
+                    for i in temp1:
+                        temp2=temp2+i
+                    f.seek(0)
+                    f.write(temp2)
+                    f.truncate()
                 qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new, qb_slirp_opt)
                 logger.info("Port forward changed: %s -> %s" % (p, p_new))
         mac = "%s%02x" % (self.mac_slirp, mac)
-- 
2.17.1


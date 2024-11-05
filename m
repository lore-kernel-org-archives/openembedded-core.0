Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CEAD33A24
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:45 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.27948.1730832344731378300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xl9xcvnj;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2e88cb0bbso4463402a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832344; x=1731437144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zfm8wq4m3z8TgkExhOrCZGbBrqKeiRKIB0szk8r0+Wc=;
        b=Xl9xcvnji105nj+xo1nzppG2KIIENH47tMSqEsEpeb7VA5KahZwtT8Wtt6hfZbHnl4
         beRFt5toYyA63+G2n2TkxnHbApz5ISOSfOa1PntLBPedkA5yPB+v0Dn7p0/f+zLHi/B5
         P8v93PD7M8bmLOXtWfnyROQ0724P4M571fO/UKiA7PWpK7bvfwjgE7Zr1iben4MhZwth
         E/Uh+yUnAum4kuGdPxkxZhmAOpBBOuI2YHjp1bMX464Pr1uYXJBapt1GONfN5wMApypQ
         XMQWWq6KN2HANtag/ysY9c1nCC43LZdzS7+egDNNg3DFanqS5feOYc2Ff+hRcI34JWjS
         UsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832344; x=1731437144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfm8wq4m3z8TgkExhOrCZGbBrqKeiRKIB0szk8r0+Wc=;
        b=bUifXRzDJM5fEsKTSqGlhSXR9ZJclPZPyEcNYK5oo9bFH4P5//W1VRFFbmgrlHW9w/
         6xfyfkjEAMVTfhuAgJ3X8oF8ZfE8D8nI2DewVRq/6MvNQ3yHwlspGQeSKQWLP3f5NFyQ
         jRB0UJvSDrwOu2CwJfdRYdXhhhw/LUKpWObnsc1auoo8MpX7W/FuN9aqkEP6YMQnMUT/
         qmvweuwMQol005QbMy87ih/hq5P8Zesxk+9lLa6Up6bciOrs29Tb0SVUDfB8BOV4+/8K
         UNK7izlX74WqxO+z0O4Sjn3qohYwtF7HNVMsI5RakVMQQaW1SoF5XvoFUxBig0hsbzT9
         i+mA==
X-Gm-Message-State: AOJu0YyKoXR1tqhf/1D77MKoTPrU6vOi4+33ZJjYfjFDw/YEWUsoy/ZE
	hqGphvnqkpdTHZ7g6blCKVDlmKpc66Zm/bUDFR4XoSjU73skNxugXS5gCg==
X-Google-Smtp-Source: AGHT+IHd0aA6ieHEzMtpB/kR9pI9fO9Ivlu+wuiYI/X+OZPMjRWUtuB80Czir0ggjURKkUE/qQt8Kw==
X-Received: by 2002:a17:90a:7c03:b0:2e2:e6fa:cfef with SMTP id 98e67ed59e1d1-2e8f11bad3emr37681569a91.25.1730832343869;
        Tue, 05 Nov 2024 10:45:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 01/19] clang.inc: Global settings for clang toolchain
Date: Tue,  5 Nov 2024 10:45:20 -0800
Message-ID: <20241105184540.3450302-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206729

It is added to default distro include file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/clang.inc | 147 +++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 meta/conf/distro/include/clang.inc

diff --git a/meta/conf/distro/include/clang.inc b/meta/conf/distro/include/clang.inc
new file mode 100644
index 00000000000..ce49bbc0ed1
--- /dev/null
+++ b/meta/conf/distro/include/clang.inc
@@ -0,0 +1,147 @@
+# Add the necessary override
+CCACHE_COMPILERCHECK:toolchain-clang ?= "%compiler% -v"
+HOST_CC_ARCH:prepend:toolchain-clang = "-target ${HOST_SYS} "
+CC:toolchain-clang  = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CXX:toolchain-clang = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CPP:toolchain-clang = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} -E"
+CCLD:toolchain-clang = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+RANLIB:toolchain-clang = "${HOST_PREFIX}llvm-ranlib"
+AR:toolchain-clang = "${HOST_PREFIX}llvm-ar"
+NM:toolchain-clang = "${HOST_PREFIX}llvm-nm"
+OBJDUMP:toolchain-clang = "${HOST_PREFIX}llvm-objdump"
+OBJCOPY:toolchain-clang = "${HOST_PREFIX}llvm-objcopy"
+STRIP:toolchain-clang = "${HOST_PREFIX}llvm-strip"
+STRINGS:toolchain-clang = "${HOST_PREFIX}llvm-strings"
+READELF:toolchain-clang = "${HOST_PREFIX}llvm-readelf"
+LD:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '${HOST_PREFIX}ld.lld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', d)}"
+
+LTO:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'thin-lto', '-flto=thin', '-flto -fuse-ld=lld', d)}"
+
+COMPILER_RT ??= ""
+COMPILER_RT:toolchain-clang:class-native = "-rtlib=libgcc ${UNWINDLIB}"
+COMPILER_RT:armeb = "-rtlib=libgcc ${UNWINDLIB}"
+COMPILER_RT:libc-klibc = "-rtlib=libgcc ${UNWINDLIB}"
+
+UNWINDLIB ??= ""
+UNWINDLIB:toolchain-clang:class-native = "--unwindlib=libgcc"
+UNWINDLIB:armeb = "--unwindlib=libgcc"
+UNWINDLIB_libc-klibc = "--unwindlib=libgcc"
+
+LIBCPLUSPLUS ??= ""
+LIBCPLUSPLUS:armv5 = "-stdlib=libstdc++"
+
+CXXFLAGS:append:toolchain-clang = " ${LIBCPLUSPLUS}"
+LDFLAGS:append:toolchain-clang = " ${COMPILER_RT} ${LIBCPLUSPLUS}"
+
+TUNE_CCARGS:remove:toolchain-clang = "-meb"
+TUNE_CCARGS:remove:toolchain-clang = "-mel"
+TUNE_CCARGS:append:toolchain-clang = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", " -mbig-endian", " -mlittle-endian", d)}"
+
+# Clang does not yet support big.LITTLE performance tunes, so use the LITTLE for tunes
+TUNE_CCARGS:remove:toolchain-clang = "\
+    -mcpu=cortex-a57.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a72.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a15.cortex-a7${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a17.cortex-a7${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a72.cortex-a35${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a73.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a75.cortex-a55${TUNE_CCARGS_MARCH_OPTS} \
+    -mcpu=cortex-a76.cortex-a55${TUNE_CCARGS_MARCH_OPTS}"
+TUNE_CCARGS:append:toolchain-clang = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa72-cortexa53 cortexa57-cortexa53 cortexa73-cortexa53", " -mcpu=cortex-a53${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
+TUNE_CCARGS:append:toolchain-clang = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa15-cortexa7 cortexa17-cortexa7", " -mcpu=cortex-a7${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
+TUNE_CCARGS:append:toolchain-clang = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa72-cortexa35", " -mcpu=cortex-a35${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
+TUNE_CCARGS:append:toolchain-clang = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa75-cortexa55 cortexa76-cortexa55", " -mcpu=cortex-a55${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
+
+# Workaround for https://github.com/llvm/llvm-project/issues/85699
+# needed for 64bit rpi3/rpi4 machines
+TUNE_CCARGS_MARCH_OPTS:append:toolchain-clang = "${@bb.utils.contains_any("DEFAULTTUNE", "cortexa72 cortexa53", "+nocrypto", "", d)}"
+
+# Clang does not support octeontx2 processor
+TUNE_CCARGS:remove:toolchain-clang = "-mcpu=octeontx2${TUNE_CCARGS_MARCH_OPTS}"
+
+# Reconcile some ppc anamolies
+TUNE_CCARGS:remove:toolchain-clang:powerpc = "-mhard-float -mno-spe"
+TUNE_CCARGS:append:toolchain-clang:libc-musl:powerpc64 = " -mlong-double-64"
+TUNE_CCARGS:append:toolchain-clang:libc-musl:powerpc64le = " -mlong-double-64"
+TUNE_CCARGS:append:toolchain-clang:libc-musl:powerpc = " -mlong-double-64"
+# usrmerge workaround
+TUNE_CCARGS:append:toolchain-clang = "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)}"
+
+TUNE_CCARGS:append:toolchain-clang = " -Qunused-arguments"
+
+LDFLAGS:append:toolchain-clang:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
+LDFLAGS:append:toolchain-clang:class-nativesdk:x86 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux.so.2"
+LDFLAGS:append:toolchain-clang:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
+
+LDFLAGS:toolchain-clang:class-nativesdk = "${BUILDSDK_LDFLAGS} \
+                                           -Wl,-rpath-link,${STAGING_LIBDIR}/.. \
+                                           -Wl,-rpath,${libdir}/.. "
+
+# Enable lld globally"
+LDFLAGS:append:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-ld=lld', '', d)}"
+
+# Remove gcc specific -fcanon-prefix-map option, added in gcc-13+
+# clang does not support it yet
+DEBUG_PREFIX_MAP:remove:toolchain-clang = "-fcanon-prefix-map"
+
+# choose between 'gcc' 'clang' an empty '' can be used as well
+TOOLCHAIN ??= "gcc"
+# choose between 'gnu' 'llvm'
+TC_CXX_RUNTIME ??= "gnu"
+# Using gcc or llvm runtime is only available when using clang for compiler
+#TC_CXX_RUNTIME:toolchain-gcc = "gnu"
+TC_CXX_RUNTIME:armeb = "gnu"
+TC_CXX_RUNTIME:armv5 = "gnu"
+
+TOOLCHAIN:class-native = "gcc"
+TOOLCHAIN:class-nativesdk = "gcc"
+TOOLCHAIN:class-cross-canadian = "gcc"
+TOOLCHAIN:class-crosssdk = "gcc"
+TOOLCHAIN:class-cross = "gcc"
+
+OVERRIDES =. "${@['', 'toolchain-${TOOLCHAIN}:']['${TOOLCHAIN}' != '']}"
+OVERRIDES =. "${@['', 'runtime-${TC_CXX_RUNTIME}:']['${TC_CXX_RUNTIME}' != '']}"
+OVERRIDES[vardepsexclude] += "TOOLCHAIN TC_CXX_RUNTIME"
+
+YOCTO_ALTERNATE_EXE_PATH:toolchain-clang:class-target = "${STAGING_BINDIR}/llvm-config"
+YOCTO_ALTERNATE_LIBDIR:toolchain-clang:class-target = "/${BASELIB}"
+
+#YOCTO_ALTERNATE_EXE_PATH:toolchain-clang:class-target[export] = "1"
+#YOCTO_ALTERNATE_LIBDIR:toolchain-clang:class-target[export] = "1"
+
+#DEPENDS:append:toolchain-clang:class-target = " clang-cross-${TARGET_ARCH} "
+#DEPENDS:remove:toolchain-clang:allarch = "clang-cross-${TARGET_ARCH}"
+
+def clang_base_deps(d):
+    ret = ""
+    if not d.getVar('INHIBIT_DEFAULT_DEPS', False):
+        if not oe.utils.inherits(d, 'allarch') :
+            ret += " ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/libc"
+            if (d.getVar('TC_CXX_RUNTIME').find('android') != -1):
+                ret += " ${MLPREFIX}libcxx"
+            else:
+                ret += " virtual/${TARGET_PREFIX}compilerlibs ${MLPREFIX}compiler-rt ${MLPREFIX}libcxx"
+    return ret
+
+BASE_DEFAULT_DEPS:append:class-target:toolchain-clang:class-target = " ${@clang_base_deps(d)}"
+BASE_DEFAULT_DEPS:append:class-native:toolchain-clang:runtime-llvm = " libcxx-native compiler-rt-native"
+BASE_DEFAULT_DEPS:append:class-nativesdk:toolchain-clang:runtime-llvm = " clang-native nativesdk-libcxx nativesdk-compiler-rt"
+
+# do_populate_sysroot needs STRIP
+POPULATESYSROOTDEPS:toolchain-clang:class-target = "${MLPREFIX}clang-cross-${TARGET_ARCH}:do_populate_sysroot"
+
+cmake_do_generate_toolchain_file:append:toolchain-clang () {
+    cat >> ${WORKDIR}/toolchain.cmake <<EOF
+set( CMAKE_CLANG_TIDY ${HOST_PREFIX}clang-tidy )
+EOF
+    sed -i 's/ -mmusl / /g' ${WORKDIR}/toolchain.cmake
+}
+
+# dump recipes which still use gcc
+#python __anonymous() {
+#    toolchain = d.getVar("TOOLCHAIN")
+#    if not toolchain or toolchain == "clang" or 'class-target' not in d.getVar('OVERRIDES').split(':'):
+#        return
+#    pkgn = d.getVar("PN")
+#    bb.warn("%s - %s" % (pkgn, toolchain))
+#}


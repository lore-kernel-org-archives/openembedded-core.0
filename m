Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6D7CCFA1A
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 23:06:34 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1148.1762556787148468834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 15:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iH5LBYgd;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-33067909400so1050589a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762556786; x=1763161586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57n/OdFtQ8dCk74viqM3qM/bv8XaLlDj7O3/h+oIJkU=;
        b=iH5LBYgdCxM32EVluakHLzqHZVCSctGIAv4Oos3lppU3vyI9UYY+lg0Z6xCb7tYlSh
         9AUwqv+F/1nDWUma26thGrUlPep/PvSWq5343scATiT6kM6JvqI5VQRmQ3AfTizazTce
         kjfbYrmX5TaqI72g8M+h827KliGzQedZcIl6I/dG2oUZe6Ls5PfkRNV5TP0jHwVUIfIE
         cQbaZlJcFdJFBPiuu1TOvLGB7DE1BtZ9hb8YXGVZqcSXHwzyeNVwYnzckTti+xWgG9Cj
         gRZgGawmpD12klPEQ/a9SMkvdgm6mk5wAB3DwfKluDOQ6E867jIC7O8/waAwM2ApNAgX
         ynhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762556786; x=1763161586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=57n/OdFtQ8dCk74viqM3qM/bv8XaLlDj7O3/h+oIJkU=;
        b=cOY4I4lOufob/+ERXU8w5F3pw89QWGCawKc/7Y5NmQ1ym9uORpAh3YwS+35zmayNT/
         MtTv4y/zcQUj6zLMl0zPXB8Emf4YAyF++Ots0JdwpCHyDjd0HdcKkVN1RO1lx4FBQOxI
         x7aUorVMC9Nbh5vUwyiLDyTsfrlk4vlnrqHpZXTlHh+4+obaWT1HzR3pLHstOt3gDHpx
         I4xc9upqTXu3GCmiZb1OXa5CPCfHptxpEHmyITNFb3Ha2nCCJQq2qoj5oLEUoFVAKzOu
         4aaXcCZsIxCcbFOf4jFSuqe1FMkf1Nr9dDD99xC9+hvigbUFh2hMuOzbly3KMQoYcUMU
         ZNBA==
X-Gm-Message-State: AOJu0YyFxVOajqf8HYct6LOAggTxAJRc7NfKEJRmbqpCPD7fIpBCpN+H
	CcO0xM2r7515e2X4ydNDYAN+CRw80Usqy0u5MnSQ4hhftMew7Z37daBfLCsrs2WfsUc=
X-Gm-Gg: ASbGncsdp+LszRSdv3QIaG5YwVMy0yNmBt+NETN//K+I1zbgSiJzyXQxNhQwJ3hHOVL
	Z4Wyz2O09iWvaQ+zV3UVmPVl3iDU1mPpYom71OvTn3Hf7HJbdDAHyfrBzuGel60zZPlhCPKpQ4h
	+AsuegOx23n5ymbUP3l0QicsZblNYlHvx/0IzEYhszrjk7ep9C7pwbJo6LyiCwBBPTsoeB93QPY
	2nV/6afIhEKHJ1rBHOgrwd1CxFzudEdnS/wyUtRRee1CY/Obdq85UfXi5ToVJTPMJZLqmxKqUOB
	swPcI8/ZqKW6gdyqQShdPEmA88ZNYfjiZ/UUAfgtQq1kt6FDnNjoSGMnKmN0p1CGG9m2bxwWneo
	LRwnEecKvDZqB7xwbLqRSZfLSZYn/ZFvC9tjyLEZkCAlXC3fxspm4IcVI+fzTufN1PlqtOo/vf7
	+dftYYH/akgZxrLyWVa8+LJQRgOY+rfqvRH1LYe46Qpgn6CF+Guub+8cb3nS8cbw==
X-Google-Smtp-Source: AGHT+IEXk+KEYnuKLy/aJCJZucO/KIntsChwcsl7Uuz5xKzL1O63zk/Vk/T+L05uOWxgXlQZsiOOcA==
X-Received: by 2002:a17:90b:5403:b0:341:ad7a:8f83 with SMTP id 98e67ed59e1d1-3436cb26367mr1073939a91.9.1762556786005;
        Fri, 07 Nov 2025 15:06:26 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a69b626csm10526282a91.19.2025.11.07.15.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 15:06:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/6] libcxx/compiler-rt: Add support for llvm-libgcc
Date: Fri,  7 Nov 2025 15:06:17 -0800
Message-ID: <20251107230617.364804-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107230617.364804-1-raj.khem@gmail.com>
References: <20251107230617.364804-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 23:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226073

llvm-libgcc is a drop-in replacement for libgcc and crt* files
and its API compatible as well, built out of compiler-rt
and libunwind projects.

Its only enabled when TC_CXX_RUNTIME is set to 'llvm'
since user intends to use LLVM provided runtime packages
as default platform/system runtime.

Move libunwind out of libcxx recipe into compiler-rt
recipe, to facilicate building llvm-libgcc

Package and build crt* files, creating symlinks for
names as they are expected by gcc, to help build packages
with gcc when and where needed.

Always use LLD linker to build compiler-rt since the
versioning script to generate libgcc compatibility
expects it to be LLD and not BFD linker doing the link

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/clang/compiler-rt_git.bb | 84 +++++++++----------
 meta/recipes-devtools/clang/libcxx_git.bb     | 57 +++----------
 2 files changed, 50 insertions(+), 91 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index b849b64515a..a265c2aa938 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -16,32 +16,25 @@ BPN = "compiler-rt"
 
 inherit cmake pkgconfig
 
-LIC_FILES_CHKSUM = "file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a"
-
-LIBCPLUSPLUS = ""
-COMPILER_RT = ""
-
-TUNE_CCARGS:remove = "-no-integrated-as"
+LIC_FILES_CHKSUM = "\
+    file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a \
+    file://libunwind/LICENSE.TXT;md5=f66970035d12f196030658b11725e1a1 \
+"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
 DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc libcxx-native compiler-rt-native"
 DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS}"
 DEPENDS:append:class-native = " clang-native"
+DEPENDS:append:class-native = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", " lld-native", "", d)}"
 DEPENDS:remove:class-native = "libcxx-native compiler-rt-native"
 
-# Trick clang.bbclass into not creating circular dependencies
-UNWINDLIB:class-nativesdk = "--unwindlib=libgcc"
-COMPILER_RT:class-nativesdk = "-rtlib=libgcc"
-LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
-UNWINDLIB:class-native = "--unwindlib=libgcc"
-COMPILER_RT:class-native = "-rtlib=libgcc"
-LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
-UNWINDLIB:class-target = "--unwindlib=libgcc"
-COMPILER_RT:class-target = "-rtlib=libgcc"
-LIBCPLUSPLUS:class-target = "-stdlib=libstdc++"
-
-PACKAGECONFIG ??= "crt"
+PROVIDES += "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libgcc", "", d)}"
+RPROVIDES:${PN} += "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libgcc", "", d)}"
+RPROVIDES:${PN}-dev += "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libgcc-dev", "", d)}"
+RPROVIDES:${PN}-dbg += "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libgcc-dbg", "", d)}"
+
+PACKAGECONFIG ??= "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "crt", "", d)}"
 PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
 PACKAGECONFIG[profile] = "-DCOMPILER_RT_BUILD_PROFILE=ON,-DCOMPILER_RT_BUILD_PROFILE=OFF"
 # Context Profiling, might need to enable 'profile' too
@@ -50,10 +43,7 @@ PACKAGECONFIG[ctx-profile] = "-DCOMPILER_RT_BUILD_CTX_PROFILE=ON,-DCOMPILER_RT_B
 HF = ""
 HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
 
-CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
-CXXFLAGS += "${LIBCPLUSPLUS}"
+LDFLAGS += "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", " -fuse-ld=lld -unwindlib=none -nostdlib -lpthread -lc", "", d)}"
 
 TOOLCHAIN = "clang"
 TOOLCHAIN_NATIVE = "clang"
@@ -67,41 +57,43 @@ def get_compiler_rt_arch(bb, d):
         return 'armhf'
     return d.getVar('HOST_ARCH')
 
-OECMAKE_TARGET_COMPILE = "compiler-rt"
-OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
-OECMAKE_SOURCEPATH = "${S}/llvm"
-
 INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
 INSTALL_VER:class-native = "${@oe.utils.trim_version("${PV}", 1)}"
 
+OECMAKE_SOURCEPATH = "${S}/runtimes"
+
+RUNTIMES ?= "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "llvm-libgcc", "compiler-rt", d)}"
+
+LLVMLIBGCCOPTS = "-DLLVM_LIBGCC_EXPLICIT_OPT_IN=Yes"
+
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
                   -DCMAKE_C_COMPILER_WORKS=ON \
                   -DCMAKE_CXX_COMPILER_WORKS=ON \
+                  -DCXX_SUPPORTS_FNO_EXCEPTIONS_FLAG=ON \
+                  -DCXX_SUPPORTS_FUNWIND_TABLES_FLAG=ON \
                   -DCOMPILER_RT_STANDALONE_BUILD=ON \
+                  -DLLVM_LIBGCC_STANDALONE_BUILD=ON \
                   -DCOMPILER_RT_INCLUDE_TESTS=OFF \
                   -DCOMPILER_RT_BUILD_XRAY=OFF \
                   -DCOMPILER_RT_BUILD_SANITIZERS=OFF \
                   -DCOMPILER_RT_BUILD_MEMPROF=OFF \
                   -DCOMPILER_RT_BUILD_LIBFUZZER=OFF \
                   -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${@get_compiler_rt_arch(bb, d)} \
-                  -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
+                  -DLLVM_ENABLE_RUNTIMES=${RUNTIMES} \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=OFF \
+                  -DCOMPILER_RT_BUILD_ORC=OFF \
+                  -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
+                  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+                  -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                   -DCOMPILER_RT_INSTALL_PATH=${nonarch_libdir}/clang/${INSTALL_VER} \
-                  -S ${S}/runtimes \
-"
-EXTRA_OECMAKE:append:class-native = "\
-               -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=ON \
+                  ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "${LLVMLIBGCCOPTS}", "", d)} \
 "
 EXTRA_OECMAKE:append:class-target = "\
                -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
                -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
                -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
-               -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
-               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
-               -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
-               -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
-               -DCOMPILER_RT_BUILD_ORC=OFF \
 "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -110,28 +102,30 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
                -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
-               -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
-               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
-               -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
-               -DCOMPILER_RT_BUILD_ORC=OFF \
 "
 
 do_install:append () {
     if [ "${HF}" = "hf" ]; then
-        mv -f ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.builtins-arm.a \
+        install -Dm 0644 ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.builtins-arm.a \
               ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.builtins-armhf.a
     fi
+    if ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'true', 'false', d)}; then
+        ln -sf clang/${INSTALL_VER}/lib/linux/clang_rt.crtbegin-${@get_compiler_rt_arch(bb, d)}.o ${D}${nonarch_libdir}/crtbegin.o
+        ln -sf clang/${INSTALL_VER}/lib/linux/clang_rt.crtbegin-${@get_compiler_rt_arch(bb, d)}.o ${D}${nonarch_libdir}/crtbeginS.o
+        ln -sf clang/${INSTALL_VER}/lib/linux/clang_rt.crtend-${@get_compiler_rt_arch(bb, d)}.o ${D}${nonarch_libdir}/crtend.o
+        ln -sf clang/${INSTALL_VER}/lib/linux/clang_rt.crtend-${@get_compiler_rt_arch(bb, d)}.o ${D}${nonarch_libdir}/crtendS.o
+    fi
 }
 
-FILES_SOLIBSDEV = ""
-
 FILES:${PN} += "${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/lib*${SOLIBSDEV} \
                 ${nonarch_libdir}/clang/${INSTALL_VER}/*.txt \
-                ${nonarch_libdir}/clang/${INSTALL_VER}/share/*.txt"
+                ${nonarch_libdir}/clang/${INSTALL_VER}/share/*.txt \
+                ${nonarch_libdir}/*.so"
 FILES:${PN}-staticdev += "${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/*.a"
 FILES:${PN}-dev += "${datadir} ${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/*.syms \
                     ${nonarch_libdir}/clang/${INSTALL_VER}/include \
                     ${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/clang_rt.crt*.o \
+                    ${nonarch_libdir}/crt*.o \
                     ${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.asan-preinit*.a"
 
 INSANE_SKIP:${PN} = "dev-so libdir"
@@ -141,6 +135,4 @@ RDEPENDS:${PN}-dev += "${PN}-staticdev"
 
 BBCLASSEXTEND = "native nativesdk"
 
-ALLOW_EMPTY:${PN} = "1"
-
 SYSROOT_DIRS:append:class-target = " ${nonarch_libdir}"
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index 1cea430e6ba..fee7cfc9ea1 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -12,60 +12,46 @@ inherit cmake
 
 BPN = "libcxx"
 
-PACKAGECONFIG ??= "compiler-rt exceptions unwind ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "unwind unwind-shared", "", d)}"
+PACKAGECONFIG ??= "exceptions ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "llvm-unwind", "", d)}"
 PACKAGECONFIG:append:armv5 = " no-atomics"
-PACKAGECONFIG:remove:class-native = "compiler-rt"
-PACKAGECONFIG[unwind] = "-DLIBCXXABI_USE_LLVM_UNWINDER=ON -DLIBCXXABI_ENABLE_STATIC_UNWINDER=ON,-DLIBCXXABI_USE_LLVM_UNWINDER=OFF,,"
+
 PACKAGECONFIG[exceptions] = "-DLIBCXXABI_ENABLE_EXCEPTIONS=ON -DLIBCXX_ENABLE_EXCEPTIONS=ON,-DLIBCXXABI_ENABLE_EXCEPTIONS=OFF -DLIBCXX_ENABLE_EXCEPTIONS=OFF -DCMAKE_REQUIRED_FLAGS='-fno-exceptions',"
 PACKAGECONFIG[no-atomics] = "-D_LIBCXXABI_HAS_ATOMIC_BUILTINS=OFF -DCMAKE_SHARED_LINKER_FLAGS='-latomic',,"
-PACKAGECONFIG[compiler-rt] = "-DLIBCXX_USE_COMPILER_RT=ON -DLIBCXXABI_USE_COMPILER_RT=ON -DLIBUNWIND_USE_COMPILER_RT=ON,,compiler-rt"
-PACKAGECONFIG[unwind-shared] = "-DLIBUNWIND_ENABLE_SHARED=ON,-DLIBUNWIND_ENABLE_SHARED=OFF,,"
-PACKAGECONFIG[unwind-cross] = "-DLIBUNWIND_ENABLE_CROSS_UNWINDING=ON,-DLIBUNWIND_ENABLE_CROSS_UNWINDING=OFF,,"
+PACKAGECONFIG[llvm-unwind] = "-DLIBCXXABI_USE_LLVM_UNWINDER=ON,-DLIBCXXABI_USE_LLVM_UNWINDER=OFF"
 
-DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc"
-DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-crosssdk-${SDK_SYS} nativesdk-compiler-rt virtual/nativesdk-libc"
+DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc compiler-rt libgcc"
+DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-crosssdk-${SDK_SYS} nativesdk-compiler-rt virtual/nativesdk-libc nativesdk-compiler-rt nativesdk-libgcc"
 DEPENDS:append:class-native = " clang-native compiler-rt-native"
 DEPENDS:remove:class-native = "libcxx-native"
 
-COMPILER_RT ?= "${@bb.utils.contains("PACKAGECONFIG", "compiler-rt", "-rtlib=compiler-rt", "-rtlib=libgcc", d)}"
-UNWINDLIB ?= "${@bb.utils.contains("PACKAGECONFIG", "unwind", "-unwindlib=none", "-unwindlib=libgcc", d)}"
-LIBCPLUSPLUS ?= ""
-#LIBCPLUSPLUS ?= "-stdlib=libstdc++"
-# Trick clang.bbclass into not creating circular dependencies
-#UNWINDLIB:class-nativesdk = "-unwindlib=libgcc"
-#LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
-UNWINDLIB:class-native = "-unwindlib=libgcc"
-#LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
-
-LDFLAGS:append = " ${UNWINDLIB}"
-
 INHIBIT_DEFAULT_DEPS = "1"
 
 LIC_FILES_CHKSUM = "file://libcxx/LICENSE.TXT;md5=55d89dd7eec8d3b4204b680e27da3953 \
                     file://libcxxabi/LICENSE.TXT;md5=7b9334635b542c56868400a46b272b1e \
-                    file://libunwind/LICENSE.TXT;md5=f66970035d12f196030658b11725e1a1 \
 "
 
-OECMAKE_TARGET_COMPILE = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "unwind", "", d)} cxxabi cxx"
-OECMAKE_TARGET_INSTALL = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "install-unwind", "", d)} install-cxxabi install-cxx"
+OECMAKE_TARGET_COMPILE = "cxxabi cxx"
+OECMAKE_TARGET_INSTALL = "install-cxxabi install-cxx"
 
 CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 BUILD_CC = "${CCACHE}clang ${BUILD_CC_ARCH}"
 BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
-LDFLAGS += "${COMPILER_RT} ${UNWINDLIB} ${LIBCPLUSPLUS}"
-CXXFLAGS += "${LIBCPLUSPLUS}"
 
 TOOLCHAIN = "clang"
 TOOLCHAIN_NATIVE = "clang"
 
-OECMAKE_SOURCEPATH = "${S}/llvm"
+LDFLAGS:append:class-target = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", " -fuse-ld=lld -lpthread -lc", "", d)}"
+LDFLAGS:append:class-nativesdk = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", " -fuse-ld=lld -lpthread -lc", "", d)}"
+
+OECMAKE_SOURCEPATH = "${S}/runtimes"
 EXTRA_OECMAKE += "\
                   -DCMAKE_BUILD_TYPE=RelWithDebInfo \
                   -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
                   -DCMAKE_CROSSCOMPILING=ON \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DLLVM_ENABLE_RTTI=ON \
+                  -DCOMPILER_RT_USE_BUILTINS_LIBRARY=ON \
                   -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=OFF \
                   -DLIBCXXABI_INCLUDE_TESTS=OFF \
                   -DLIBCXXABI_ENABLE_SHARED=ON \
@@ -73,7 +59,6 @@ EXTRA_OECMAKE += "\
                   -DLIBCXX_CXX_ABI=libcxxabi \
                   -DLIBCXX_CXX_ABI_INCLUDE_PATHS=${S}/libcxxabi/include \
                   -DLIBCXX_CXX_ABI_LIBRARY_PATH=${B}/lib${LLVM_LIBDIR_SUFFIX} \
-                  -S ${S}/runtimes \
                   -DLLVM_ENABLE_RUNTIMES='libcxx;libcxxabi;libunwind' \
                   -DLLVM_RUNTIME_TARGETS=${HOST_ARCH} \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
@@ -84,7 +69,6 @@ EXTRA_OECMAKE:append:class-target = " \
                   -DCMAKE_C_COMPILER_WORKS=ON \
                   -DCMAKE_CXX_COMPILER_WORKS=ON \
                   -DCXX_SUPPORTS_FNO_EXCEPTIONS_FLAG=ON \
-                  -DCOMPILER_RT_USE_BUILTINS_LIBRARY=ON \
                   -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
                   -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${NM} \
                   -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
@@ -96,7 +80,6 @@ EXTRA_OECMAKE:append:class-nativesdk = " \
                   -DCMAKE_C_COMPILER_WORKS=ON \
                   -DCMAKE_CXX_COMPILER_WORKS=ON \
                   -DCXX_SUPPORTS_FNO_EXCEPTIONS_FLAG=ON \
-                  -DCOMPILER_RT_USE_BUILTINS_LIBRARY=ON \
                   -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
                   -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${NM} \
                   -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
@@ -109,22 +92,6 @@ CXXFLAGS:append:armv5 = " -mfpu=vfp2"
 
 ALLOW_EMPTY:${PN} = "1"
 
-PROVIDES:append = " ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libunwind", "false", d)}"
-
-do_install:append() {
-    if ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "true", "false", d)}
-    then
-        for f in libunwind.h __libunwind_config.h unwind.h unwind_itanium.h unwind_arm_ehabi.h
-        do
-            install -Dm 0644 ${S}/libunwind/include/$f ${D}${includedir}/$f
-        done
-        install -d ${D}${libdir}/pkgconfig
-        sed -e 's,@LIBDIR@,${libdir},g;s,@VERSION@,${PV},g' ${S}/libunwind/libunwind.pc.in > ${D}${libdir}/pkgconfig/libunwind.pc
-    fi
-}
-
-PACKAGES:append = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", " libunwind", "", d)}"
-FILES:libunwind = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", " ${libdir}/libunwind.so.*", "", d)}"
 # Package library module manifest path
 FILES:${PN}-dev += "${datadir}/libc++/v1/ ${libdir}/libc++.modules.json"
 


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B81C54E90
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:30:58 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.37975.1747603851916042508
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hdcq9cJS;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30ecc762cb7so650984a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603851; x=1748208651; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jpqHEdt+tXqdtzwQq0ncbkdO83ThXwcm7Cg78lxqHQ=;
        b=hdcq9cJSWHz+V0vdU4D0xEIGrMZz61RGDdU8Qu+XO16/35AnsAdKL/1xxzMh+2BCsL
         tvlWSn09ZiGMOW5OK4Qg55sN6QNfVijxL/7idiIhnn+JQlEDEQCizON0BJEI9MSpx56+
         22COHM+4Vs3+0T7UEhBHXMJJt+NiKvr78WWV0Rnv70IeRkdevGjfqECJ4iQ+lHzkucFW
         qMGPinDvoFK1xkhwGTZTyXvF8NqT127AiEecLVBZnh/3pBta+mTnmomT4k0hKlbODbQw
         5G/JN5MrVxyh0qzq4H6Ajo1JMqJ2iI8olSzOAR/wCC3Cco0DV8b+zhiw25QdB2ytBhLB
         bLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603851; x=1748208651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jpqHEdt+tXqdtzwQq0ncbkdO83ThXwcm7Cg78lxqHQ=;
        b=bFYbMkwClknYBM33pv/Om841AIzAUuZcnGBqpKgXHc3lCIE4GoKl72s/uT/fXX12N4
         IeRa/5rckdaK3opwWTne7hju8GLUkNHlgqlJ5C0d9rL/9/0YcAdmUhVRQDsfZm2S3DWo
         2pQFTk3Yv5YM/2SU14ZGG0UQ9hhEFH/u83MNKKYCIwIxA1la5epBlWKkZzfDw9vb6TXA
         1Z8NrofgoidCn1CszlC5rNE/QX17gzURq5l0h4m6jqQCnzDGOa6dH6Dee8vzGtnqa5xG
         8i+cJBBPjXifc4ivTd10Wpo7i4i/OtB8t0ViSZfnHa3k/QjMqXfqX/kaOjksk2hJ9wCt
         rjVg==
X-Gm-Message-State: AOJu0YylZNYLEw8OoGkWw2q8FNWZ7PEH+sX0F2PPs1UfDvBr0ZbMNcEd
	516PrehHj88dTTgJI8M2wEv4g11EcUDVVTlMtpiBDSkWtReAUNP6gdw6WJBDZNou
X-Gm-Gg: ASbGncvxhO7D++7R4w/+cjTPcDYe38fKaoNy43ktz0P9db4VR5MhQMnNUBVhPMvvCY9
	6sivKKZf1eQ78gNz8BgV6YHTbK72LypxSWiu6VhKV/VuUReKnh0VsXkdl/VpYsWh3fZJ8oFZuzM
	HbxLvJROVQnr8p/jiqjk20RfRsZH71QaVMqQRODap4TeNdr9WCioPPQMsiH8HWEQZuoGK2tD5a/
	pCu6/g9JZvJvc2j/PQdGBGYrvVuDwt0Lv11w8G6GjBqN3Nqam4/HDfCgX89T1kDHQE0Kgm0PvpQ
	M4FsJJMWCm/ZJvHbbdrscZzukMLukW03GDlrFe5yLycONv30jE/D0w==
X-Google-Smtp-Source: AGHT+IFGddY9DK8KOcl89crxKtNmfWaBW7XnkZsHtjPS8K13gpM2SBaUv7H/prtwqIh8w5HGeti3PA==
X-Received: by 2002:a17:90b:5487:b0:2fa:3b6b:3370 with SMTP id 98e67ed59e1d1-30e4dccbaffmr20440800a91.16.1747603850609;
        Sun, 18 May 2025 14:30:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:36 -0700
Subject: [PATCH 01/21] toolchain: Provide abstraction for choosing
 per-recipe toolchain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-1-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216785

This implements a toolchain selection mechanism with existing defaults
unchanged.

It introduces a variable called TOOLCHAIN, which denotes the familiar
name for toolchain e.g. "gcc" which selects GNU compiler + binutils
as default C/C++ toolchain or "clang" which will use LLVM/Clang Compiler

Additionally build-gcc is used for selecting native compiler

TOOLCHAIN variable has a global fallback to "gcc" in configuration
metadata. A distro can switch to using say "clang" as default system
compiler by defining

TOOLCHAIN ?= "clang"

In local.conf or other distro specific global configuration metadata

It is also selectable at recipe scope, since not all packages are
buildable with either clang or gcc, a recipe can explicitly demand
a given toolchain e.g. glibc can not be built with clang therefore
glibc recipe sets.

TOOLCHAIN = "gcc"

TCOVERRIDE is defined to toolchain-TOOLCHAIN and its added to OVERRIDES
that a recipe can see and it can use "toolchain-gcc" or "toolchain-clang"
to set specific metadata based upon global toolchain policy in distro.

toolchain: Use TOOLCHAIN_NATIVE for defining native compiler

This helps in selecting gcc or clang for native compiler irrespective
of cross-compiler selection via TOOLCHAIN variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/base.bbclass                   |  5 ++++
 meta/classes-recipe/cross-canadian.bbclass         |  2 ++
 meta/classes-recipe/cross.bbclass                  |  2 ++
 meta/classes-recipe/crosssdk.bbclass               |  2 ++
 meta/classes-recipe/native.bbclass                 |  2 ++
 meta/classes-recipe/nativesdk.bbclass              |  2 ++
 meta/classes/clang-native.bbclass                  | 28 ++++++++++++++++++++++
 .../toolchain/clang.inc => classes/clang.bbclass}  | 10 ++++----
 .../build-gcc.inc => classes/gcc-native.bbclass}   |  1 -
 .../toolchain/gcc.inc => classes/gcc.bbclass}      |  1 +
 meta/conf/bitbake.conf                             |  7 +++---
 meta/conf/distro/defaultsetup.conf                 |  1 +
 12 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 8215969c7bb37c1a1b91e260cd31714fee2db87c..ab2f0686b7b09e004ba8d5bb609e81b19da67e38 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -6,6 +6,7 @@
 
 BB_DEFAULT_TASK ?= "build"
 CLASSOVERRIDE ?= "class-target"
+TCOVERRIDE ?= "toolchain-gcc"
 
 inherit patch
 inherit staging
@@ -19,6 +20,10 @@ PACKAGECONFIG_CONFARGS ??= ""
 
 inherit metadata_scm
 
+inherit gcc-native
+inherit gcc
+inherit_defer ${@oe.utils.ifelse(d.getVar('TOOLCHAIN') == 'clang', 'clang', '')}
+
 def lsb_distro_identifier(d):
     adjust = d.getVar('LSB_DISTRO_ADJUST')
     adjust_func = None
diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-recipe/cross-canadian.bbclass
index 059d9aa95f57dd77a0ab5172c4c15c13ed3bc43e..a9dc6aa9bac7d5cc27331a505ed213aa9d402d4d 100644
--- a/meta/classes-recipe/cross-canadian.bbclass
+++ b/meta/classes-recipe/cross-canadian.bbclass
@@ -14,6 +14,8 @@
 EXCLUDE_FROM_WORLD = "1"
 NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
+TCOVERRIDE = ""
+TOOLCHAIN = ""
 CLASSOVERRIDE = "class-cross-canadian"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 93de9a527446554b93c1e323c7458cc7aacef799..7ebf37760ca1fcad8cd1a2ee41ef32a29cca9b92 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -10,6 +10,8 @@ inherit relocatable
 # no need for them to be a direct target of 'world'
 EXCLUDE_FROM_WORLD = "1"
 
+TCOVERRIDE = ""
+TOOLCHAIN = ""
 CLASSOVERRIDE = "class-cross"
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
index 824b1bcff47bcd36a70aa1d7b8724b6cf07131ff..0c0144b26829d3b76d034a89133ee94cf760b86d 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -7,6 +7,8 @@
 inherit cross
 
 CLASSOVERRIDE = "class-crosssdk"
+TCOVERRIDE = ""
+TOOLCHAIN = ""
 NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
 MACHINEOVERRIDES = ""
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 625975a69429389a5b231a19b17e8ed7a12d80ad..cbdace9b7021e90a4df2684d9eacda36112b46c6 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -108,6 +108,8 @@ PKG_CONFIG_SYSTEM_INCLUDE_PATH[unexport] = "1"
 
 # we dont want libc-*libc to kick in for native recipes
 LIBCOVERRIDE = ""
+TCOVERRIDE = ""
+TOOLCHAIN = ""
 CLASSOVERRIDE = "class-native"
 MACHINEOVERRIDES = ""
 MACHINE_FEATURES = ""
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 7ecb4c12c1f0f2b9cc48da215006a153679facf8..440bc3a5c5434152dfe5c9c19db1c2be857cd794 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -13,6 +13,8 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 # libc for the SDK can be different to that of the target
 NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
+TCOVERRIDE = ""
+TOOLCHAIN = ""
 CLASSOVERRIDE = "class-nativesdk"
 MACHINEOVERRIDES = ""
 
diff --git a/meta/classes/clang-native.bbclass b/meta/classes/clang-native.bbclass
new file mode 100644
index 0000000000000000000000000000000000000000..bf395eade73eaad18bf15f35d03bc0aec2223090
--- /dev/null
+++ b/meta/classes/clang-native.bbclass
@@ -0,0 +1,28 @@
+# inherit this class if you would like to use clang to compile the native
+# version of your recipes instead of system compiler ( which is normally gcc )
+# on build machines
+# to use it add
+#
+# inherit clang-native
+#
+# to the concerned recipe via a bbappend or directly to recipe file
+#
+BUILD_CC = "${CCACHE}${BUILD_PREFIX}clang ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE}"
+BUILD_CXX = "${CCACHE}${BUILD_PREFIX}clang++ ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE}"
+BUILD_FC = "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE}"
+BUILD_CPP = "${BUILD_PREFIX}clang ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE} -E"
+BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
+BUILD_CCLD = "${BUILD_PREFIX}clang ${BUILD_CC_ARCH}"
+BUILD_AR = "${BUILD_PREFIX}llvm-ar"
+BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
+BUILD_RANLIB = "${BUILD_PREFIX}llvm-ranlib -D"
+BUILD_STRIP = "${BUILD_PREFIX}llvm-strip"
+BUILD_OBJCOPY = "${BUILD_PREFIX}llvm-objcopy"
+BUILD_OBJDUMP = "${BUILD_PREFIX}llvm-objdump"
+BUILD_NM = "${BUILD_PREFIX}llvn-nm"
+BUILD_READELF = "${BUILD_PREFIX}readelf"
+DEPENDS:append = " clang-native compiler-rt-native libcxx-native"
+# Use libcxx headers for native parts
+CXXFLAGS:append = " -stdlib=libc++"
+LDFLAGS:append = " -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc"
+BUILD_LDFLAGS:append = " -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc"
diff --git a/meta/conf/toolchain/clang.inc b/meta/classes/clang.bbclass
similarity index 76%
rename from meta/conf/toolchain/clang.inc
rename to meta/classes/clang.bbclass
index 0e5f0769f85a8373c58d4b54dbe2bb1cf7dbd50b..be8b888918d1b4b4ae1d245df2c9da013cdc826e 100644
--- a/meta/conf/toolchain/clang.inc
+++ b/meta/classes/clang.bbclass
@@ -17,9 +17,11 @@ READELF = "${HOST_PREFIX}llvm-readelf"
 PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
-PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
 
-PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "clang-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
+
+TCOVERRIDE = "toolchain-clang"
diff --git a/meta/conf/toolchain/build-gcc.inc b/meta/classes/gcc-native.bbclass
similarity index 99%
rename from meta/conf/toolchain/build-gcc.inc
rename to meta/classes/gcc-native.bbclass
index a708bd0389a123504301fd151fb9ebdb677926be..1e1d68b027806b94e8229d4efef025cc1c038ad3 100644
--- a/meta/conf/toolchain/build-gcc.inc
+++ b/meta/classes/gcc-native.bbclass
@@ -12,4 +12,3 @@ BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
 BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
 BUILD_NM = "${BUILD_PREFIX}nm"
 BUILD_READELF = "${BUILD_PREFIX}readelf"
-
diff --git a/meta/conf/toolchain/gcc.inc b/meta/classes/gcc.bbclass
similarity index 97%
rename from meta/conf/toolchain/gcc.inc
rename to meta/classes/gcc.bbclass
index 36d33f5d6d0bfbf0f36158f389c4112ce20d806b..75f9abe999a297c7b17e64e693ffd8f441bb16b1 100644
--- a/meta/conf/toolchain/gcc.inc
+++ b/meta/classes/gcc.bbclass
@@ -24,3 +24,4 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
 
+TCOVERRIDE = "toolchain-gcc"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e5037c6277841908df333b16adbe4e6cce55f814..cfd70498b246fa1bf03e4730ecd5bf5be759ed44 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -13,6 +13,8 @@ BASELIB = "lib"
 BASELIB:libc-glibc:powerpc64 = "lib64"
 BASELIB:libc-glibc:powerpc64le = "lib64"
 
+TOOLCHAIN ??= "gcc"
+
 # Path prefixes
 export base_prefix = ""
 export prefix = "/usr"
@@ -801,7 +803,7 @@ DISTRO_NAME ??= "OpenEmbedded"
 # And finally '<foo>:forcevariable' overrides any standard variable, with the highest priority.
 # This works for functions as well, they are really just variables.
 #
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:${TCOVERRIDE}${LIBCOVERRIDE}:forcevariable"
 FILE_LAYERNAME ??= "config"
 LIBCOVERRIDE ?= ""
 CLASSOVERRIDE ?= "class-target"
@@ -834,9 +836,6 @@ include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
 
-require toolchain/gcc.inc
-require toolchain/build-gcc.inc
-
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
 ##################################################################
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 80de23f517ab139be262bcd35311134bb04db49d..4d0ea6e39714de3f57b3e6dcfeff8836dc47e9f8 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -1,6 +1,7 @@
 include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
+include_all conf/distro/include/default-toolchains.inc
 include_all conf/distro/include/maintainers.inc
 include conf/distro/include/time64.inc
 require conf/distro/include/tcmode-${TCMODE}.inc

-- 
2.49.0



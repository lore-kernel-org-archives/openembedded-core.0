Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E56AC021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 15:23:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.24235.1741101779382288853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 07:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g4LVk0WC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso5888005e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 07:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741101777; x=1741706577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t5cvty2GnWaP2CzwXNz3uwvSXzpMuAvfIrR/xu18qUQ=;
        b=g4LVk0WCKEmAKR1Z31wvbAjBbvk/VhfYNDWkUWj9ViZSo5xoo4EekxkVb/k2laLDRB
         1FksR9UDKPhu5Fyd1Skne+9n3UWNTqyZcUPc4a0wlyQJnXIQfRB9AoN2Ueup9oVFUkzn
         p0O1uR7YRLbJbOHwlKbsQzSXs/62OC30jaxAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741101777; x=1741706577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5cvty2GnWaP2CzwXNz3uwvSXzpMuAvfIrR/xu18qUQ=;
        b=baIaJEZgwErRaGVb4M6FYHs1QZsAbCxHRFrHHx6+TbQ7Bd/V1sUVR0TMS3j6nnGE0J
         o76qYMV1Wu18a70USNSlVDD4UOAyKpXiFf31QUPt+scmYilKkvc22MwxcszdWb1c8TFy
         PLTWvWTOgd8+IXXPwXtGnhbkYgJ5gJQlPLFCv8GodhrrV2WCThyp70y/Vek+bKkZUSQh
         2UuTQJdoERoPqyAkZOAsHpCrEKENyJXkIhgwWsSkRxQvGN5JGObx8FKkpDXaLXPtgSvj
         CEGUev1Hgw0c0+RFzs4rrUhIfcJ0yv2jkgP9awBqjhQua6cd1YEuI9bUx2pBi6AiAUTd
         lHVg==
X-Gm-Message-State: AOJu0YyCovMTb9gGKZm1qg5l2827Ky4LjniuzwYoSHotnMPBX79aREHL
	1d1dcmSrunkaEtsf47anTJoM69fO1TxmKcHqpPdU2YxloChRmy187hXLQVK1VKs8ln3/6dMOLdP
	f
X-Gm-Gg: ASbGncvk3mxK/BDzfOhXfD3JXMwkCcGXJUPoeI0yLkYmKn/8xKhAlw328cWSQL48zIu
	JIKKHn+3bBuFlwQ1xWxo6xMtTxTkv+x7Cpd6rlluSU/ttqFM3hUE3g8eVxzy9Hptpj7JQBjDLdI
	eTO+z+CvFJX0/gHngW/S6drCCNvQ5xQ32A09J8337MFMFGf28d9QzW361T1CZxVGK3OiS8Dkjaz
	UIreeFNyMRixDeE2OR6PrtcEru1L1w0u0QSMD8XA/gplspvZoy37iFCVIOVw3moSPnQbwzS51RJ
	0yBYjpBsboFfjL25odCw+gtQTt05PF0nJ8fWdF1g72gSxZTtoy1W8SRVCI67qcQwjNEkff3R0A=
	=
X-Google-Smtp-Source: AGHT+IH+CWEfHd1h4u2jhb8A8F+Gu5ScJn0S/c5Lrd+Kx44oMQWDfl7GbJm+KWpdtGXz7y791wFJPA==
X-Received: by 2002:a05:600c:5112:b0:43b:c9a8:8fab with SMTP id 5b1f17b1804b1-43bc9a89170mr38718875e9.19.1741101777109;
        Tue, 04 Mar 2025 07:22:57 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bea3:48e1:f1c0:6abe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc7eb779csm53839625e9.34.2025.03.04.07.22.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:22:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Start to separate out gcc related variable definitions
Date: Tue,  4 Mar 2025 15:22:55 +0000
Message-ID: <20250304152255.1932472-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 15:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212287

To be able to switch toolchains, we need to separate out the gcc definitions
into seperate include files. This patch starts that process. Whilst the
include is still hardcoded for now, it allows developers to start experimenting
with this locally more easily and stops people reinventing this patch. A
sample clang configuruation is also included which I was using for experimentation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                      | 61 +++++++++++----------
 meta/conf/distro/include/tcmode-default.inc | 13 +----
 meta/conf/toolchain/build-gcc.inc           | 15 +++++
 meta/conf/toolchain/clang.inc               | 26 +++++++++
 meta/conf/toolchain/gcc.inc                 | 26 +++++++++
 5 files changed, 100 insertions(+), 41 deletions(-)
 create mode 100644 meta/conf/toolchain/build-gcc.inc
 create mode 100644 meta/conf/toolchain/clang.inc
 create mode 100644 meta/conf/toolchain/gcc.inc

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 38ddf18d37a..501808204e5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -555,40 +555,38 @@ HOSTTOOLS_NONFATAL += "git-lfs"
 
 CCACHE ??= ""
 
+export CC
+export CXX
+export FC
+export CPP
+export LD
+export CCLD
+export AR
+export AS
+export RANLIB
+export STRIP
+export OBJCOPY
+export OBJDUMP
+export STRINGS
+export NM
+export READELF
+
+export BUILD_CC
+export BUILD_CXX
+export BUILD_FC
+export BUILD_CPP
+export BUILD_LD
+export BUILD_CCLD
+export BUILD_AR
+export BUILD_AS
+export BUILD_RANLIB
+export BUILD_STRIP
+export BUILD_NM
+
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
-export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export FC = "${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
-export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
-export CCLD = "${CC}"
-export AR = "${HOST_PREFIX}gcc-ar"
-export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
-export RANLIB = "${HOST_PREFIX}gcc-ranlib"
-export STRIP = "${HOST_PREFIX}strip"
-export OBJCOPY = "${HOST_PREFIX}objcopy"
-export OBJDUMP = "${HOST_PREFIX}objdump"
-export STRINGS = "${HOST_PREFIX}strings"
-export NM = "${HOST_PREFIX}gcc-nm"
-export READELF = "${HOST_PREFIX}readelf"
 PYTHON = "${@sys.executable}"
 
-export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
-export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
-export BUILD_FC = "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
-export BUILD_CPP = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E"
-export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
-export BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
-export BUILD_AR = "${BUILD_PREFIX}ar"
-export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
-export BUILD_RANLIB = "${BUILD_PREFIX}ranlib -D"
-export BUILD_STRIP = "${BUILD_PREFIX}strip"
-BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
-BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
-export BUILD_NM = "${BUILD_PREFIX}nm"
-BUILD_READELF = "${BUILD_PREFIX}readelf"
-
 export MAKE = "make"
 EXTRA_OEMAKE = ""
 EXTRA_OECONF = ""
@@ -843,6 +841,9 @@ include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
 
+require toolchain/gcc.inc
+require toolchain/build-gcc.inc
+
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
 ##################################################################
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index acc4ab3fa0f..079a7ca3eac 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -3,19 +3,10 @@
 #
 
 PREFERRED_PROVIDER_virtual/cross-binutils = "${MLPREFIX}binutils-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
-PREFERRED_PROVIDER_gdb = "gdb"
-
 PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?= "binutils-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
-
 PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?= "binutils-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
+
+PREFERRED_PROVIDER_gdb = "gdb"
 
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
diff --git a/meta/conf/toolchain/build-gcc.inc b/meta/conf/toolchain/build-gcc.inc
new file mode 100644
index 00000000000..a708bd0389a
--- /dev/null
+++ b/meta/conf/toolchain/build-gcc.inc
@@ -0,0 +1,15 @@
+BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
+BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
+BUILD_FC = "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
+BUILD_CPP = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E"
+BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
+BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
+BUILD_AR = "${BUILD_PREFIX}ar"
+BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
+BUILD_RANLIB = "${BUILD_PREFIX}ranlib -D"
+BUILD_STRIP = "${BUILD_PREFIX}strip"
+BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
+BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
+BUILD_NM = "${BUILD_PREFIX}nm"
+BUILD_READELF = "${BUILD_PREFIX}readelf"
+
diff --git a/meta/conf/toolchain/clang.inc b/meta/conf/toolchain/clang.inc
new file mode 100644
index 00000000000..40bfba2fd4f
--- /dev/null
+++ b/meta/conf/toolchain/clang.inc
@@ -0,0 +1,26 @@
+CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+FC = "${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CPP = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} -E"
+LD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '${HOST_PREFIX}ld.lld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', d)}"
+CCLD = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+RANLIB = "${HOST_PREFIX}llvm-ranlib"
+AR = "${HOST_PREFIX}llvm-ar"
+AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
+RANLIB = "${HOST_PREFIX}gcc-ranlib"
+STRIP = "${HOST_PREFIX}llvm-strip"
+OBJCOPY = "${HOST_PREFIX}llvm-objcopy"
+OBJDUMP = "${HOST_PREFIX}llvm-objdump"
+STRINGS = "${HOST_PREFIX}llvm-strings"
+NM = "${HOST_PREFIX}llvm-nm"
+READELF = "${HOST_PREFIX}llvm-readelf"
+
+PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
+PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
diff --git a/meta/conf/toolchain/gcc.inc b/meta/conf/toolchain/gcc.inc
new file mode 100644
index 00000000000..36d33f5d6d0
--- /dev/null
+++ b/meta/conf/toolchain/gcc.inc
@@ -0,0 +1,26 @@
+CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+FC = "${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
+LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
+CCLD = "${CC}"
+AR = "${HOST_PREFIX}gcc-ar"
+AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
+RANLIB = "${HOST_PREFIX}gcc-ranlib"
+STRIP = "${HOST_PREFIX}strip"
+OBJCOPY = "${HOST_PREFIX}objcopy"
+OBJDUMP = "${HOST_PREFIX}objdump"
+STRINGS = "${HOST_PREFIX}strings"
+NM = "${HOST_PREFIX}gcc-nm"
+READELF = "${HOST_PREFIX}readelf"
+
+PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
+PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
+


Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.5919.1626265575750899316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=geIyx/BW;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id l7so2978833wrv.7
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OqahJL8Q+YClcrA0vUAexoHmoWQ66Q1/MGp6B+3B28Y=;
        b=geIyx/BWyXavSPpBN4Ed86HnxkHuq7rbNi6O2rI6VHFgq4cMqogZX+ojF2aLE6I2eh
         aJOZiU5PDTFPh6WwDtCS4u9OnX74PiGq26mruX2iH2j15O3dA+l2J4RXsapvm26xXZ18
         /eAeJZ+xfEANv43uhtvxQq0DIkl54aycKxx7rmJbcJXFoX7YEWIF3mCXtsbQSQULpWfu
         xjfl5wIMpbT8sH7kudXkIL3TqvkUS8ABo/lRtB9UrqhVBQKbSWoSxggr8ktZpWzS1k3g
         JCBdax1j6Vy7z1i5DPabGIZ9FjViJH1h9UVcZL80fwbAqG+ppfsMsn4QzJ50vG/0SJoS
         GOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OqahJL8Q+YClcrA0vUAexoHmoWQ66Q1/MGp6B+3B28Y=;
        b=B8tuPTPGrBIDuaYIjzjB72U9cbHiuvUIJ5TsNTiokj2f3Z0rce9uRp+7EVhBnvGypG
         0ElcjBOm+J1DYwjFJm111YGC8UI//rlOWLF0bjskLKjccSXBiv9n1cljOpAxAQGp7fPd
         io17et/eePSlucDZgZ2fzElD/iDX1XkOWX91i5DMa8ilGWdMnuuSEpL39v8vOBlHK/+B
         ntCyw5bCjyMc5PYaaoP1URKUFuBvOyuyE5Dsi4Ah5Hp/KahiRnl0embyshQbbZ0E5Wz1
         XProyDLbla2dPwzW6hiVuR2+VGcZE8GqTkUCtik4pxXAG+bUDt+zT3bJcojORPAwHIEk
         hSIg==
X-Gm-Message-State: AOAM533T3svtDYKB0MEtqdAejRz+7r0l/SVP9ymqsDbp11+iQT8aqw48
	g8Uc+YBpYwWE432TOvBVycRQbAdZt18=
X-Google-Smtp-Source: ABdhPJyI2/2dQ9jdpPTYfdKvimFtUaOwuH4MQDTfPCpx06qdcBuOK5EmIwgjfPp0kwss423fwMAK8g==
X-Received: by 2002:adf:9cc7:: with SMTP id h7mr12479328wre.186.1626265574408;
        Wed, 14 Jul 2021 05:26:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/21] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
Date: Wed, 14 Jul 2021 14:25:47 +0200
Message-Id: <20210714122606.605142-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

oe-core has not been providing multiple versions for any of these items
for a long time, it's not likely to change anytime soon, and it makes
automated (or semi-automated) versions updates with devtool impossible,
as PREFERRED_VERSION masks the updated recipe in devtool workspace.

Specifically, this was prompted by investigating why automated llvm update
doesn't work; it does now.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 57 ---------------------
 1 file changed, 57 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 68e5d848ba..0571304fdc 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -16,68 +16,11 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "11.%"
-SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.36%"
-GDBVERSION ?= "10.%"
-GLIBCVERSION ?= "2.33"
-LINUXLIBCVERSION ?= "5.13%"
-QEMUVERSION ?= "6.0%"
-GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "12.0.0"
 
-PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-sanitizers ?= "${GCCVERSION}"
-PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-gcc-sanitizers ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_libgcc-initial ?= "${GCCVERSION}"
-PREFERRED_VERSION_libgfortran ?= "${GCCVERSION}"
-PREFERRED_VERSION_nativesdk-gcc ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
-PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
-PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?= "${GDBVERSION}"
-PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GDBVERSION}"
-
-PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
-PREFERRED_VERSION_glibc                    ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-locale             ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-mtrace             ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-scripts            ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc          ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
-
-PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
-PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
-PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
-
 # Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
 # from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
 # go-native.
 PREFERRED_PROVIDER_go-native ?= "go-binary-native"
-PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
-PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
-PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
-PREFERRED_VERSION_go-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GOVERSION}"
-PREFERRED_VERSION_go ?= "${GOVERSION}"
-PREFERRED_VERSION_go-native ?= "${GOVERSION}"
-PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
-PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
-PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
-
-PREFERRED_VERSION_llvm = "${LLVMVERSION}"
-PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
-PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
-- 
2.31.1


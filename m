Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.7169.1626271366414498449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 07:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bRfZE2BV;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id n4so1669596wms.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 07:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wpE8oUo/njdeKoCgvoFgGYPSixMHd4d5X5iTjvZLL2Y=;
        b=bRfZE2BVIxLhjfR8CTcNkhKtVLCx6xly7HfcpHFWaF+I3lVrUAkkRcPXSKj0RNJLnM
         0vBF7SQEbRc9579uUawipU/tKI6rwW/HIbmway/GwR45ENx/pGRWrPQL+Btm/2b+xDW+
         WqEtV8y+0oSuVLWqfYlS90eK/zgmiYxYgeDh5U9QAK3WuFTCyGslyuNiAXkWnB39JmQs
         2iErjyxhvUM6zOKDmqbVMiAKQnj1ePDaaK6k/lr2ulL+Xw+GPaIxfXYXct2cRNv4LWCs
         xm/8WogPVRtC4bs9FCWxIQOWNYA3C5T/EDuJGEWIryv44BdCxkJhvKXBk3uQ7y7OZAv5
         Qaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wpE8oUo/njdeKoCgvoFgGYPSixMHd4d5X5iTjvZLL2Y=;
        b=rRk0JXrxkYcM/tfywYN88nxXg5iDC101lizOGUeV2DV7LvlctwqQfveZSxp4HAmFyL
         UdjLBroKAG+hZShSq/lojmSKwTthMZejepUVz9Uhm5GUDhoCiXwQXwjzwT5S2XNzT7LD
         pwD/aEN0OPr/bDyj2++U2XrM+9/vq91eiJ7cRjSQDxw9Qg1hl//zrjd9b6li10yqSHY4
         xohNKFN0H8S8gL51UKOBMC8ylECZU1lcTpBCMm7MxUc+3pNO/gWMhqUXVQVbamaQOrnT
         lzQC30VcoTCxBpFild6ez9vUWI2KSzhA6te+dtUU/lcqXR0aTSyO5JMya/YYyjs0KDLx
         8o1w==
X-Gm-Message-State: AOAM53363/USkBNgarWsivTqXJ4AqE1pwglmbANYOusXvwacZ/9DW/So
	EEEcAC5+SNJ76lPLRVHZVWDWZlvUw28=
X-Google-Smtp-Source: ABdhPJzSFz1/URPPIIa9Oz9/Vr7VZhmyv1lW3EKXTYLqvZQ76j2Mgw0Wr9hHnzn09rsgl/E2JtHqaA==
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr11513623wmb.162.1626271364893;
        Wed, 14 Jul 2021 07:02:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n18sm2735639wrt.89.2021.07.14.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 07:02:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
Date: Wed, 14 Jul 2021 16:02:39 +0200
Message-Id: <20210714140239.609611-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

oe-core has not been providing multiple versions for any of these items
for a long time, it's not likely to change anytime soon, and it makes
automated (or semi-automated) versions updates with devtool impossible,
as PREFERRED_VERSION masks the updated recipe in devtool workspace.

Specifically, this was prompted by investigating why automated llvm update
doesn't work; it does now.

v2: GCC is excluded as overriding the version through GCCVERSION is used
across several layers, and the list of things to override is large.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 40 ---------------------
 1 file changed, 40 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1d4aa1e11f..3489b01812 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,12 +18,6 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "11.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.36%"
-GDBVERSION ?= "10.%"
-GLIBCVERSION ?= "2.33"
-LINUXLIBCVERSION ?= "5.13%"
-QEMUVERSION ?= "6.0%"
-GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "12.0.1"
@@ -42,42 +36,8 @@ PREFERRED_VERSION_libgfortran ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
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


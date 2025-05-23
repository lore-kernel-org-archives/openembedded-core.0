Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4F0C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:53:07 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.40738.1747972377753973028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kiegt9LA;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2322bace4ceso50102285ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972377; x=1748577177; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cifmhcZW0/wNpVdes7nHc1sRCygUdorRFExew15sX/U=;
        b=kiegt9LAFZhR/W8Fij+pDKPe8BL1X67b39oH403gU++iziIqK9G+Kiw4lDxNbssDiQ
         aViy0yIwH3cPUTelWJ8jtcvLRJqRETVnfvKUbwoLmyXNKTx5n3yzpnIxDS/mLQI6d4E/
         lg11Y/HXEXbikwyCQRaS3BFlAr9gN37ANHfbBcB4bUUtZZZk3aiWuZXDg1T2uNMD86c/
         yqd1QkBX/Zsm+5JqIehhoFZ0oKbx2KS/SIixTUeLpU37jnmeU7T/bIrN85YS2HQsGrLl
         G8NEvSeAURek8l85iDZw7BSiyyU7qmkGBA+nS5HvYyVb5IScht/EOj6MIkRoGkOY/wJJ
         1d+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972377; x=1748577177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cifmhcZW0/wNpVdes7nHc1sRCygUdorRFExew15sX/U=;
        b=o6FOESpRQbU+ap6WhcF9bQCGP+C/qU9BI7+E5XJeHlbNJcAZXTy1i6gOC6O7P69Y9l
         YZJ/RYw3PBwiCKADK5x1esmxWNbOBLAWnZa2AlzqRTHBhjevikqPXcuAXOJkd3jv1QYB
         3kMVKg9pYNWZR+Egz2drzJq9xolb4Iimj1TSL0ltDlr13PdLDfGIsvfI7N04zN8G9I5T
         8OB/g7oOLBHUfqQas5+oYyLbApub6CyMfVTODwM6NuaYlTODzkmZPj8VYx3jubunXGCt
         uqcc6a46Wg8UB5T83TjakPHJx0+GfW/RNVLNRrtZxX4eZoTe1nfrNpYIKHdvIFTTxpLT
         IB2A==
X-Gm-Message-State: AOJu0YzIaUz6ntjV452PnJZwjZ8P0bk/iUUDA1yQcy8dk91AuDWX+XtI
	f2Al0uAX2faH/SB2iRWytdDAjQ4uhFf3y0SFap08cT91f/HaOrR7oHt7g47GDMBN
X-Gm-Gg: ASbGncv9pRt8n/F0xJXZIrir2GLQHXYytgtKq/I/smmFkY5P8XBbXZ7Bu+C0dorIWKC
	8Ppd4QzSXjA/Z54t+gUToiHsWEKTMv/br9j7/w3V83ZTyrPLmgSqmA/hhf8sTJM86DNynwNuEyP
	Hid2r2r0o5vQac6AM7tCMUd5xXlyZZbrNPVyy0vJYZeMAfIWFxZzrPuDMCTQ7HQoqzT4QfGogYV
	NRjuAryMbP+5bObzls/OE1LtZhEre7ihiA98ai5U5kxLnTe6tev9kGTWFQERGPt+LRQQHTxVIPE
	SYBj9pdoHx4uiMWoOt0liFdebGVwRPMs0ijPyLevIWM=
X-Google-Smtp-Source: AGHT+IF1yxBsvPfU2TA2/9SSj0Tdjn1PRHYDwNd57M9QmEEG342+iGmGagA0zvGE2z+iFGEv30KkjA==
X-Received: by 2002:a17:903:1ca:b0:221:78a1:27fb with SMTP id d9443c01a7336-231d438a223mr397737955ad.11.1747972377129;
        Thu, 22 May 2025 20:52:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:47 -0700
Subject: [PATCH v3 13/13] meta: Add TCOVERRIDE for toolchain selection at
 recipe scope
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-13-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217173

TCOVERRIDE is defined to toolchain-<TOOLCHAIN> and its added to OVERRIDES
that a recipe can see and it can use "toolchain-gcc" or "toolchain-clang"
to set specific metadata based upon global distro toolchain policy.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/base.bbclass           | 1 +
 meta/classes-recipe/cross-canadian.bbclass | 1 +
 meta/classes-recipe/cross.bbclass          | 1 +
 meta/classes-recipe/crosssdk.bbclass       | 1 +
 meta/classes-recipe/native.bbclass         | 1 +
 meta/classes-recipe/nativesdk.bbclass      | 1 +
 meta/classes/toolchain/clang.bbclass       | 2 ++
 meta/classes/toolchain/gcc.bbclass         | 2 ++
 meta/conf/bitbake.conf                     | 2 +-
 9 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 1e7d6fe9b6ac34c17820d9f6378a5aa50f00dff4..684dfee92040b28bfcc1bce7087faec791443b1b 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -6,6 +6,7 @@
 
 BB_DEFAULT_TASK ?= "build"
 CLASSOVERRIDE ?= "class-target"
+TCOVERRIDE ?= "toolchain-gcc"
 
 inherit patch
 inherit staging
diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-recipe/cross-canadian.bbclass
index de002ede9d3f5d53a4837334bd5474bcfb208499..dda00f9a5cf2edf1cb76ab38879e611363ee4c8c 100644
--- a/meta/classes-recipe/cross-canadian.bbclass
+++ b/meta/classes-recipe/cross-canadian.bbclass
@@ -15,6 +15,7 @@ EXCLUDE_FROM_WORLD = "1"
 NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
 TOOLCHAIN = ""
+TCOVERRIDE = ""
 CLASSOVERRIDE = "class-cross-canadian"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 5c36222d7aba04448b1ab70d61dd7c6d011b6a17..d1a57cbcfef49d90de23691984141abb8651d089 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -11,6 +11,7 @@ inherit relocatable
 EXCLUDE_FROM_WORLD = "1"
 
 TOOLCHAIN = ""
+TCOVERRIDE = ""
 CLASSOVERRIDE = "class-cross"
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
index 0117afc404c2df77a1f7cb28831fe4098dbb4524..0c0144b26829d3b76d034a89133ee94cf760b86d 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -7,6 +7,7 @@
 inherit cross
 
 CLASSOVERRIDE = "class-crosssdk"
+TCOVERRIDE = ""
 TOOLCHAIN = ""
 NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 12630079cd19d6df29f2da94853f6cf2c5895772..cbdace9b7021e90a4df2684d9eacda36112b46c6 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -108,6 +108,7 @@ PKG_CONFIG_SYSTEM_INCLUDE_PATH[unexport] = "1"
 
 # we dont want libc-*libc to kick in for native recipes
 LIBCOVERRIDE = ""
+TCOVERRIDE = ""
 TOOLCHAIN = ""
 CLASSOVERRIDE = "class-native"
 MACHINEOVERRIDES = ""
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index f41e5b9642d26cbafeab47ec469441ddd3ff1c09..440bc3a5c5434152dfe5c9c19db1c2be857cd794 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -13,6 +13,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 # libc for the SDK can be different to that of the target
 NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
+TCOVERRIDE = ""
 TOOLCHAIN = ""
 CLASSOVERRIDE = "class-nativesdk"
 MACHINEOVERRIDES = ""
diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index cc4cdc0356b397e07ea2d6fb5840e3fc9f9955b7..8a0a2c315a2d4cddf795d185891a6ca1661f65fa 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -30,3 +30,5 @@ TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-pre
 
 LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
 LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
+
+TCOVERRIDE = "toolchain-clang"
diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/gcc.bbclass
index 2479caf22c2cd48aebcce0abd5e6ac19b1c53a0f..75f9abe999a297c7b17e64e693ffd8f441bb16b1 100644
--- a/meta/classes/toolchain/gcc.bbclass
+++ b/meta/classes/toolchain/gcc.bbclass
@@ -23,3 +23,5 @@ PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
+
+TCOVERRIDE = "toolchain-gcc"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 83e52e7afaaddb19f7418a549c9b34d8d8ee92f1..cfd70498b246fa1bf03e4730ecd5bf5be759ed44 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -803,7 +803,7 @@ DISTRO_NAME ??= "OpenEmbedded"
 # And finally '<foo>:forcevariable' overrides any standard variable, with the highest priority.
 # This works for functions as well, they are really just variables.
 #
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:${TCOVERRIDE}${LIBCOVERRIDE}:forcevariable"
 FILE_LAYERNAME ??= "config"
 LIBCOVERRIDE ?= ""
 CLASSOVERRIDE ?= "class-target"

-- 
2.49.0



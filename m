Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08B3C3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 19:02:50 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.27395.1746212560806106408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 12:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XE7vLlmq;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227914acd20so29734965ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 12:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746212560; x=1746817360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jWioAFQVY6NourV04P+lBhNNUpbZSWzIIos2YT9lz8=;
        b=XE7vLlmqLLDVRVdKK+aqMMeqbyJfsOYWDlnAzNGXaenv/jDEFDsQVmCigRdSY9U+8z
         SjYsSxAS1I/Qz6I045VmMKsZBoGERaIT38lKYS0AKKx+qNvd6BMBdOvI3YoIclHTaiIV
         CZKF1Nr9SOt5RKN0XW/RrbzDezdd5l052FOXMGmrAaO2Ju4pTrOnd3sPz8IG0LiSwhPO
         KHYHhHw1eMkdVDThixaXr8RZ48nqh6Z9U7sQ8AKFLqp6G1+T6ABc2wabiybu8YEvIWwc
         2QNfVjXfVm5oMh6XwsyGyF1ghrVFixG/kQ0fmDshwp0cCDdo+EN4oES0+AjTiY2fHI8a
         7Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746212560; x=1746817360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jWioAFQVY6NourV04P+lBhNNUpbZSWzIIos2YT9lz8=;
        b=POtRSAmLhZ7q7nnCyb3XBXmX0XJMK/5+hh0Hu8SVVmAXd/pMzyDdFODCWgoij3J9JT
         dwoy5Ja1H0TEdJIofpbVpl0HpHofjSOjJXiHAYSDbliGwmOQWO+oD5A1yRMWLjaTmtXY
         G8s25lIIYS6gZ7/Ka5OXOpbVMw1YMnwYGfD0NYmllvbusoGYk9/u2+yGFtW5U1Ve6UVX
         UVw0EO7QN40PFIeTF775Td3z8dBiyZ574tpnSqBesgQHJnkLsKwe77qCYYJJQuCyH6G6
         IWDXfIMRe2XxbB743VP1qlbyVqERUQ+i6kwD544FT7pJtFwLAJxT9j8yjlxIB21kjMb8
         3TzQ==
X-Gm-Message-State: AOJu0YyNDbiR2ZeeoP5jaT3Ob81R8H8ILJsjVzO6AP1s9/lmqAMzkdar
	HTge6/3sRvRVfwrpo/2vh3xmlzLtKa+rHNfKVp28ECGRtACvL3qjJu+MX9ch
X-Gm-Gg: ASbGnctoRgz5/qtRXofGdH+XMAFvjpsN7D4LwLAsbbi7ClZ28OtDtLx826/07jfGkyS
	6G/MjhdS+LtrENF5hUAYG7rTUqUdgxtti7qZHs6wK+sHOhBAOBGJ26s7AnH1709JqysuMWmSOu1
	PdOfcGZ+eGDtjiAUc6yxnpoSKcjv+MnsUNEMcZOP+86KRu2Uqzg6EKilQuNX8EqSO40QPxyAq1D
	f6xCu/fiC8WcqmGfEDY2WD3kvn3RVq8eq5YK1AFyhx1IhOXuRS6F0350snyDGkEQeaxeX7/fL7e
	nYKsIpvTm/PMQb9YmbW8TVE7SYVScXuR
X-Google-Smtp-Source: AGHT+IG+/Sph5MyekmwCcnEma5AHMvDPVImnWlO6GyRiwq1wo4sJkTC4H2cxMtvWQpfTUFgHoWOl2Q==
X-Received: by 2002:a17:902:c945:b0:21f:1348:10e6 with SMTP id d9443c01a7336-22e1007afc3mr65284505ad.13.1746212559780;
        Fri, 02 May 2025 12:02:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fbf8sm11181955ad.149.2025.05.02.12.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 12:02:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libcxx,compiler-rt-sanitizers: Add cflags to build with clang compiler
Date: Fri,  2 May 2025 12:02:37 -0700
Message-ID: <20250502190237.4083287-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 19:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215919

We are using clang-native to build the native versions of these recipes
but we are missing the needed compiler flags to let it c/c++ runtime
appropriately. This also ensures that meta-clang does not have to worry
about the compiler settings for nativesdk/native pieces separately.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 6 ++++++
 meta/recipes-devtools/clang/libcxx_git.bb                 | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index b3c4bfcffdc..b987a5cc768 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -18,9 +18,15 @@ inherit cmake pkgconfig python3native
 LIC_FILES_CHKSUM = "file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a"
 
 TUNE_CCARGS:remove = "-no-integrated-as"
+COMPILER_RT ??= "-rtlib=libgcc -unwindlib=libgcc"
+LIBCPLUSPLUS ??= "-stdlib=libstdc++"
 
 CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+BUILD_CC = "${CCACHE}${HOST_PREFIX}clang ${BUILD_CC_ARCH}"
+BUILD_CXX = "${CCACHE}${HOST_PREFIX}clang++ ${BUILD_CC_ARCH}$"
+CFLAGS += "${COMPILER_RT}"
+CXXFLAGS += "${COMPILER_RT} ${LIBCPLUSPLUS}"
 
 DEPENDS += "ninja-native virtual/crypt compiler-rt"
 DEPENDS:append:class-native = " clang-native libxcrypt-native libcxx-native"
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index d2655d9da94..f5987199ecf 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -49,6 +49,11 @@ OECMAKE_TARGET_INSTALL = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "instal
 
 CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+BUILD_CC = "${CCACHE}clang ${BUILD_CC_ARCH}"
+BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
+CFLAGS += "${COMPILER_RT}"
+CXXFLAGS += "${COMPILER_RT} ${LIBCPLUSPLUS}"
+
 OECMAKE_SOURCEPATH = "${S}/llvm"
 EXTRA_OECMAKE += "\
                   -DCMAKE_BUILD_TYPE=RelWithDebInfo \


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59885C8303D
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 01:56:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.13682.1751421354224354423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 18:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d6NJy2bQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234d366e5f2so54188365ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 18:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751421353; x=1752026153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0Ymy59ZPMw3jKRo6R4Afi0oSmCxyQNAR7WHXs5qSCs=;
        b=d6NJy2bQ7aatWFlKBqiKl2+iZZAKib1NjL31ykvNMkAb4PTht1wI1IE75Va2mj+Qw8
         UiPUjDcaeTmlARZtA8cZZI0gVqF/3j0S4bFBEBfGu9xcZyjxhf7Zuy9NgU58lF44xwGx
         hefY/wWC+VZmPrcOJsNnL6Ct9kRd11M1Y7BAoVERabDX8XKVen4BAN3MfYW54H9sV8+0
         54tVqO7y2qS4XOSe10k2r52DfmLBMidAXvr9kV6PgvIpG3O82YCVy5Ijij0CY/quIyfv
         PycscLNWGNNOeHuPuCgikgF1ZuYReUMkCqCnbcx5VxtewYYm/qqoqxKmITN9ywrN868r
         +K/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751421353; x=1752026153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0Ymy59ZPMw3jKRo6R4Afi0oSmCxyQNAR7WHXs5qSCs=;
        b=rgA7yaVHzvUYT/qprrvTv5MYSw2g5ivipV34+UELrFPAdxJ5B+8kiyr8GLBfMW9pBZ
         bYlpCCPFHug2F3kaxiAmE6snk4WGLquZOOuxk9zwPsgSLns+ay5ZdMgt+kqt6Z33bRFb
         j0L4cCGaqw41NV1vjX0+9rbDD7HMdbvtCZ9HzNITCCcVXmEzxgSiG0LkDdF9izmPHs4q
         hApIMfROw5d2VkEOJYPU7zma5LV1DoMHMShel2DiZz2vkf1yArS8R4Pf1ji2nPXnwSTz
         MvHPLf+cBUTNIGDxhT7FY3h5AtY8xLyXtWw5euiWrDlObPmCtQJggFlgXjZPhw10r3Ty
         sZ2Q==
X-Gm-Message-State: AOJu0YxWjLHiYD3CEE8wJ189O/XQOEoY2x1INp38lh9SRkOvcYI0BjGc
	SqPSpk2UbZL2lw0F3MXyRDfFZYTnOzGTjxQKv6AU9LEVZVvhCqnueEuQ8Duv7j2v
X-Gm-Gg: ASbGnct/7M8alrqbYAPIdW8o1vCi02VbxJAb4WraewNhxIddOTG9a9yQBe4Kp8DRSQN
	GuBJHfgQFFje5te4b6x+muQp02mI6CyW59G7+q3CM9fwBNlhGXNBTVD4S5xrvmJoiRggG9XBTQv
	1j5KwgU7aHnHq3ohuy1dsugE7FS4wdl0julA6yEZBLQnBdUI4hHtTmwFpSsOgryn2mzg56d6jaz
	3FogZudhxMC2S3z0FmNZgT2Y/64WwMGUVTSv2LhcURr0i3kmmQq3qI6IZ47INgjMD0pSAgbnUsQ
	ZzUArWi5CC1CVVLHzXTQDUr6NYUD1yRU02RaWxtQj42UUOKpariUrg==
X-Google-Smtp-Source: AGHT+IF5jpljchFzVFoNlGvRjW0ASZu8bPm+g0D/t4zK8f9S7x9g4hrQf9d1xr2GFNUBfflQRlJ66w==
X-Received: by 2002:a17:902:e886:b0:235:f45f:ed55 with SMTP id d9443c01a7336-23c6e4d342bmr13922455ad.1.1751421353295;
        Tue, 01 Jul 2025 18:55:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e25c6sm114404595ad.6.2025.07.01.18.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 18:55:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 1/4] clang-native: Add class to use clang as native compiler
Date: Tue,  1 Jul 2025 18:55:48 -0700
Message-ID: <20250702015551.1453616-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 01:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219747

Some recipes demand full clang/llvm builds e.g. chromium we need to use
clang as native toolchain. This class collects all needed bits to enable
OE built clang to provide the clang native toolchain

Setting

TOOLCHAIN_NATIVE = "clang"

in recipe will chose clang for native toolchain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain/clang-native.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes/toolchain/clang-native.bbclass

diff --git a/meta/classes/toolchain/clang-native.bbclass b/meta/classes/toolchain/clang-native.bbclass
new file mode 100644
index 00000000000..4de491a1cb5
--- /dev/null
+++ b/meta/classes/toolchain/clang-native.bbclass
@@ -0,0 +1,18 @@
+BUILD_CC = "${CCACHE}${BUILD_PREFIX}clang ${BUILD_CC_ARCH}"
+BUILD_CXX = "${CCACHE}${BUILD_PREFIX}clang++ ${BUILD_CC_ARCH}"
+BUILD_FC = "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
+BUILD_CPP = "${BUILD_PREFIX}clang ${BUILD_CC_ARCH} -E"
+BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
+BUILD_CCLD = "${BUILD_PREFIX}clang ${BUILD_CC_ARCH}"
+BUILD_AR = "${BUILD_PREFIX}llvm-ar"
+BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
+BUILD_RANLIB = "${BUILD_PREFIX}llvm-ranlib -D"
+BUILD_STRIP = "${BUILD_PREFIX}llvm-strip"
+BUILD_OBJCOPY = "${BUILD_PREFIX}llvm-objcopy"
+BUILD_OBJDUMP = "${BUILD_PREFIX}llvm-objdump"
+BUILD_NM = "${BUILD_PREFIX}llvm-nm"
+BUILD_READELF = "${BUILD_PREFIX}llvm-readelf"
+
+DEPENDS += "clang-native libcxx-native compiler-rt-native"
+
+LDFLAGS += " --rtlib=libgcc --unwindlib=libgcc"


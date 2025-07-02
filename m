Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7468C83038
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 05:32:31 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.16693.1751434343514608302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 22:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sou8JmW6;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235ef62066eso80598135ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 22:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751434342; x=1752039142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0Ymy59ZPMw3jKRo6R4Afi0oSmCxyQNAR7WHXs5qSCs=;
        b=Sou8JmW68J3f8OiTPOqp2eZERHYrWDi30C6CwUwwhOXHqnUGkHy7eu4/qWzFV4pWab
         jARds2BslyqVr31d2uPhtf5nKiCC9CHKFOamAxtrs2GRUUsFhwLBgjyT7WCNnAEvPOtG
         FHodxIE5q0W6DumhpqdD/pgIFZtBZZqs2h3HveuWSNMOynQJnILupf8oVjT3LxPOcNhu
         lSY4md88bIOLupDVaZI+QY6e9HpUW/IKLlQ6JWBglJSFEaGxdAVl/2LnIJzUPAS0K2Ku
         CGqmTbKBCbvVL2AX8OpQ6TVBaPeFpCEOp0eSDUCxD26c+/Bj9kgE6TJVEpmyMOaFXYMS
         GKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751434342; x=1752039142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0Ymy59ZPMw3jKRo6R4Afi0oSmCxyQNAR7WHXs5qSCs=;
        b=YmEN/Y6BHf0AdACUWJ3mORnkRbF1ch3ncwhYANmOFCMbj0yB/wUXElb+h9STp/kbnh
         WGLkMzRAgreBL2UB77DifqWpkuVuP7rSbCYzn0g2pQx5jEyaYIoijeD+epqbEe49b3g8
         9csrscxDG5XICb7D9D4MI2UM3tpPgbFKneDqTEkshs0juSkzz0m6iJL+nPwxb/9mbXrO
         lw4eNLJ9qDZbJwBO7Ut17Qm2d6XjW+0CXg39AkAErAyv51+hDmyzorjnRHNyTmTx7Qq4
         32wr3OK7zYjb+lZrJ0odKqUpbLV0OqPFbs8Ryg4FI21FLxWLHqJWi0fKLPpg47nFAtJV
         A0Qw==
X-Gm-Message-State: AOJu0YzIF6y7YoMZnyKbZUVQtFCKdI21qszxiXEc4AYiyK835d0XqdW4
	vwgq29914fgc5+lj24QXbzA4iRg6Up7thSkq6Y1/L9kVi2SFxktUVkUhL0SEo124
X-Gm-Gg: ASbGncvMm/ULYXJlqlZK8tzinde2qS7ZH63nIU/QKO71+6J8Z+SVrcfvjMerWxMR9Km
	7j8viiqxtUCGUoo+fgSjbm00WdYlS1I/cjvCo/zXDSZTJ10xJnFAIIKvQ+VbMZs9kLq/Rx0rxYH
	TrWq0kbAUTAV9xsapaL7h2np3LnYMK+SezByicorQ9PeAkCOeEWJUp5LoV1JajiLkxJ9wA1MDmk
	tE00Si4rR/ufrLEH/0i0G0zhvVuX6PSkcbmJPgFrG4ibPhMU9sCE36DvmKMnMZ+XC/Ss329R4pZ
	vC/O2kp7EgdTDWt4IPqFsWZrcX4eNx/ezYIwCjJ2JAiJq3sCUCUN+JapGZ/rFonA
X-Google-Smtp-Source: AGHT+IFEa+0onJkfMaKsXKEQ9K/uTG0yWnydUZxRNPSigwCfv+8icz6WooydqlK2n8gxzUfW88O4bw==
X-Received: by 2002:a17:902:d603:b0:235:779:edfe with SMTP id d9443c01a7336-23c6e5ca09fmr21619525ad.43.1751434342483;
        Tue, 01 Jul 2025 22:32:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e2423sm120125985ad.37.2025.07.01.22.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:32:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 1/5] clang-native: Add class to use clang as native compiler
Date: Tue,  1 Jul 2025 22:32:16 -0700
Message-ID: <20250702053220.4104358-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 05:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219774

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


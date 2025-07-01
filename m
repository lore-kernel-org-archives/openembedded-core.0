Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C793C8303C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 20:57:08 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.8016.1751403425161452495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 13:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NDafuKV/;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2353a2bc210so34807785ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751403424; x=1752008224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpmFxL75X8/uVd/bKt4scZ2OoIS/RttY+ftFM5SFVus=;
        b=NDafuKV/Qa7YJV2AwbyBQyXRb3L+Zy0QXc66U/TR4cnkJoG8uwSzhK/UOfbn4CJFC5
         WoWsz/QM0acbgU7Gg2s9gzyVJ0JIHnzTnH0vDfgjyDHaCyRMvb6z84fzIA+wrcTlquvi
         XMM1w879PPxwJ6Qz4X+bJCHe1C+h6N/IfJJkH6lpVCr8M90T+Q4fa/cGyqLCHvJlXUeJ
         tm9RSz3FXBJwfH44+MrolZlLc9mNRWCkWXqBd6XEVVFYwnDEHonnwlYsKN9J1Zh/mR9H
         Cmclw467SuVsGN9O8d4a/hAwz7jVQC3JT+Ei0Tb2DQSty0XjKwa9JyR/zWcSXHdibAj2
         kHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751403424; x=1752008224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpmFxL75X8/uVd/bKt4scZ2OoIS/RttY+ftFM5SFVus=;
        b=czchvCduQpdxa4BpvMNR850/nwXfP5i5+ccu9CjhXOx28COOfoM3dx/iNwR48v24hq
         Z5jZdW8ZOJ9pWmxjYi0BkSULdwSAwJHyIBlScDbOdnzH3ZmHp9Ohzn2G/yej+gFchUsB
         /SsHxycWzwzAVQ3ao0kM6whrqBQExswHvO14nP6tXe8PjdFqdP7nQ9oITmUSQNZgqxuD
         nkuN47saJdx7FPad/0l6EW11PhDnzulwk4nFieSwV0P4vkuEnh4IQjZOlNCNgJ8GRfa2
         P0+mg8TNUEjDG0KPw9bZjmeQl42rX5tw4bxt0ebe7XzTrhVf8/C3sk4NPp03VPhpm685
         M3qw==
X-Gm-Message-State: AOJu0Yw2T4X3WoPbck/t2h086F993qrRiYDYwoe5eqPbGbrw/juxezae
	Jx8C3xS4/vGxmo2xHbbW0zZSngnZepqDVCqZMC+8MdVcPFzSNusk1GAxlsrK/Jv5
X-Gm-Gg: ASbGnctHJzy3ldaBSR0hXx/BBwu74vZEaziVj9qzhWZJUAsT7e/HLUy2h1u6XWqLWkU
	jtOMZuDQYU6SUg3tQiAlHCg8t8gR4IZFlHzeMRx9Htv5C0bQqBCQIv4RHsXsRwqtsi/dBAKJP/U
	qzhDn4jtuDNri5b5bW4Br+Nnlw0APMNGl8fSFdKFaTFtY/UNqWWSv9gOhPIj/yp9vUyVSo3i0K6
	5AuwDE/C26XRfohq3bP107kjdbQ23+gLS6OlY6bj1JE/d/+t2TDm0ZPG0Xo2rHRby970fmITCXE
	pCXKQ4MMTYyzNxuGKQN6FXuDEI25TXgJYjSQDO8F9qnA2ku1Jrext91lhKXY3llI
X-Google-Smtp-Source: AGHT+IG5pSwatMKGYTVOVAc8cH6L3Jru/d5RNue/S6R0Z394XsM+3wM934NuEp3bOludhPm2UoWLZQ==
X-Received: by 2002:a17:902:d492:b0:235:e1d6:f98b with SMTP id d9443c01a7336-23c6e4cb8e1mr2590155ad.22.1751403424234;
        Tue, 01 Jul 2025 13:57:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c7028sm111549705ad.222.2025.07.01.13.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 13:57:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/3] clang-native: Add class to use clang as native compiler
Date: Tue,  1 Jul 2025 13:56:59 -0700
Message-ID: <20250701205701.3322308-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219721

Some recipes demand full clang/llvm builds e.g. chromium we need to use
clang as native toolchain. This class collects all needed bits to enable
OE built clang to provide the clang native toolchain

Setting

PREFERRED_TOOLCHAIN_NATIVE = "clang"

in recipe will chose clang for native toolchain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain/clang-native.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes/toolchain/clang-native.bbclass

diff --git a/meta/classes/toolchain/clang-native.bbclass b/meta/classes/toolchain/clang-native.bbclass
new file mode 100644
index 00000000000..adb22883806
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
+DEPENDS += " clang-native compiler-rt-native libcxx-native"
+
+LDFLAGS += " --rtlib=libgcc --unwindlib=libgcc"


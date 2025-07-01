Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1720CC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 19:06:38 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.5485.1751396797100296455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 12:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E8YFspwt;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23636167b30so33799195ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 12:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751396796; x=1752001596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpmFxL75X8/uVd/bKt4scZ2OoIS/RttY+ftFM5SFVus=;
        b=E8YFspwtSIr26xl0fIrzktr7YV3I1rfMyONK9eGu53/z0mpUmZ+u1YzO+WrdcTWvgv
         QqyDG+lPemWxAmyNmJMUkfKE38iSFkgqymshNd0gupRGpKGQRFWV/RYhd8/EVQDLV3dh
         T8Cz9SXBdt5uF0B5DtmCLTcAF43OXkgoJbyZ3jgpDzwo+noYZ3ilHzjVYxofwPzyFzTh
         n82HPpytk4jajMV04ImVwvluyrdnIHp2cMUrmRLPcLko7ToetlMoh+CX/4D7Ahhv034n
         7T3phT1XWVpxmNWT1gqUoQsHpxkUYt4JwW5o2bL3pspNvQD/0XX+RbF51HLfGBH5/k+4
         bQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396796; x=1752001596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpmFxL75X8/uVd/bKt4scZ2OoIS/RttY+ftFM5SFVus=;
        b=cBsNnpEAjKnZlERLTPUrsKm18IUnhz9+BM32OcB3jHiVYSFCcTJgElpCzujHMq2zp+
         xEauIEto1FcOf9b9qUhcsIvePcv5tvuCDkPW0ry4Z7E2RcpEinoY+dtI30AQWZHP66/V
         0zD/OGExSto9j/85eaZ1ZurYJ9JhaBVdTYjCuGXPrg5KrRQYtO6hlr7AnF25g2rY/2LT
         doorpLccCNMbCx7SjMzADv52i20CMzLgd2TMEZaxUcoBq5LRLpd7WUQRgyXD3uvr+LEt
         6LHfOEUVlQMlUHSdfG/Nvb9NI/MKZGu0cj0XoeVCpmXj4r73oCzs5sb+DU5xcK33ghv9
         0ogQ==
X-Gm-Message-State: AOJu0Yz4VK1DRpZBuGeGkcez0BMD3PYIh1WuFR+vVXno0Q4ow4FYrNqq
	5zMneGJCgfNSmeVo6Xdcic6CoCJVdAPTwQuYcocZu0Jqc039kkXO4m3/fve8m7FQ
X-Gm-Gg: ASbGnctIUBZgNL07odVV0F2GDEfYb+Oa5prze3To9bcpa6fTaD79dDdCIAp9o1pXZJP
	MlyzXEhIW3qBrbaoZQWXD6O8M47SbMiZo/xQGBmtHAOj13RkuobH9uqTBnheUz4hro5PLiIoSVu
	d/VwzXmx8P8vF035as/FF7w4latSbqC0IyYR/VhzhH/i6/YWT9pbzZGjy3uehbbHAUTepow3gJV
	6YEnTCEfvmsXOt2duTFC8ues30CbCmRr6T1u7iiGrOrFTMKu3wEJBsNkQS9w/VPSBD2igI2uxOM
	qxNL3awNV4nDPQUfQSgSHFaMy61Le5ruEcr6Xl5c27cDscTdpA14qA==
X-Google-Smtp-Source: AGHT+IHlNCKWGfUaDtIZAb93vDevqPqjCf54+7ZcINv6VZbURGks+7V6VpZ9WWhz1AOHPOsch6mH8A==
X-Received: by 2002:a17:902:ec83:b0:235:1171:6d1d with SMTP id d9443c01a7336-23ac38178fbmr276738675ad.9.1751396796059;
        Tue, 01 Jul 2025 12:06:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b97dsm119286665ad.121.2025.07.01.12.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 12:06:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] clang-native: Add class to use clang as native compiler
Date: Tue,  1 Jul 2025 12:06:32 -0700
Message-ID: <20250701190633.2324784-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 19:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219715

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


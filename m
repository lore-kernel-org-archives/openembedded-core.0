Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6E7CA0FF7
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:29 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.6604.1756330219557881768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zIqSYsYm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32519b32b6cso193037a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330219; x=1756935019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+smTV1VwE4+FJ0GlBkv2qEM95XoN6PZBwIOVSjM5/c=;
        b=zIqSYsYmvUfMLNvNrRI+3LaGyT4pga6dlHz/11qt6cxs5ogzpERBXGc0W0Yf8jOk9J
         1Ffmrainbr7AZIA6GSFmmJLP830cJ0eugcHc1VqMQC1p8BwmPeIApIJCI67V14uE8fPt
         yQsY3GtpJcUFqDj/Jj8psy4oR1ohZtXcRp6PuCpCm8HeDdp2V6sB1M3p/atbzOJ3mp7b
         l4SSy9PZBYPwlBf8kxdIo66Jh4mN1KbtfrOaZQZqZKDphqTSXpSK8LCaJtgJaG2P0qjB
         FYlvZtMmgbdIqOPIS6gyivGwgyF7JhMhSJslV8rzr04DwKFJfmbmiwKaW8S0hW5hVgMx
         FGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330219; x=1756935019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+smTV1VwE4+FJ0GlBkv2qEM95XoN6PZBwIOVSjM5/c=;
        b=rlsXhdFEThS2I3oz8G9xqMj9ufGXO3zReGrX/Se6bPk/6CUhnd4o3qJbnXadOORd5t
         XcRYaWFYDP62EOJlpqhcGQ8Gi1sh4C8APJXyOE70OFjNHDFeaO8192Amqw2CUHwQfk/R
         ti5hbgVDJANWVZpu2FuWN8gHPKRpmio43OycW0dopzgp4UF8GiOuuNxxwAAYi7zRI957
         QziAPxvyGwkxTYiYF4PsW0PYRszFvf0FznUmPMR51vk+BX9o72wCeQxxrIqryH5r8CN0
         N3tkGCvcPizC/IAMBCVwsal7NJxYgst/vXxb1fyHvBGoAc9blMz3uJoYDLiBnBYnycmu
         yigQ==
X-Gm-Message-State: AOJu0YwrwhYS9qLOqW/Ip+W6QYyigra0OIe2vXMvZvGxIrMgSGs579kt
	IZIiGICUTfnKjgcj4NnWYOLSvI5yAJU/bKSFTWaZ1oj+mYECDRMzCYavi3mCaDlbxeXtrviGEtE
	+D8Dk
X-Gm-Gg: ASbGncuNxHTR94/RpNXlfcFYQa+xU1eGC+e1NLjkXOO/V1BPQ8qn5++NN9AzZi9zYJF
	GogvLfWqhxZrN/xAPg9pEqK7LTz/TkP4THqZGFTYCo0Bobzr8vylotDtIUopx/KeYsXOvPP5w2u
	8m7LbBEXvmwE9Ggotv9yMEjZwMKN08k43JDBBWBFjni4RfrsgRjTSbTk/VSYkEiULrM2G1v7wyn
	7uhWKJLOY2nXppu2fX1kOC9bIRxBcpcB+wonNBLeteBxwrq/3704EOHXWpDobErrXeAMaXW+EaV
	gIAzIJS/BuywF1C+ngTvaE2uVuEh8/uPMd3tgT5alCANlB7F/X2q+inQQzcu0U6HjSnhSTXpVUh
	vDL7gHdKUA6q23A==
X-Google-Smtp-Source: AGHT+IGxxZ+SrNFho5vscG+R6A/V5PGF4ZKPngswZ+gFxsNx923J0f9bFbs+F8o+uibwzcxrOynjfA==
X-Received: by 2002:a17:90b:2d81:b0:323:7e82:fcc with SMTP id 98e67ed59e1d1-32517b2c440mr21761241a91.36.1756330218759;
        Wed, 27 Aug 2025 14:30:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/33] cmake: fix build with gcc-15 on host
Date: Wed, 27 Aug 2025 14:29:21 -0700
Message-ID: <bdfccaa382c1669bff8788e09953c3a770243fab.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222522

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/cmake/cmake.inc         |  1 +
 .../0001-cppdap-fix-build-with-gcc-15.patch   | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-cppdap-fix-build-with-gcc-15.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index a52506a8ea..b8667832e2 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,6 +18,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
+           file://0001-cppdap-fix-build-with-gcc-15.patch \
            "
 
 SRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cppdap-fix-build-with-gcc-15.patch b/meta/recipes-devtools/cmake/cmake/0001-cppdap-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..1ff0764018
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-cppdap-fix-build-with-gcc-15.patch
@@ -0,0 +1,30 @@
+From f742c298a0d6b70059e5c98c89d301e62a3e2087 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Christoph=20Gr=C3=BCninger?= <foss@grueninger.de>
+Date: Thu, 8 Aug 2024 20:26:35 +0200
+Subject: [PATCH] cppdap: include/dap/network.h: add <stdint.h> include for GCC
+ 15
+
+GCC 15 requires the include for the declaration of `uint32_t`.
+Backport [cppdap PR 133](https://github.com/google/cppdap/pull/133).
+
+Upstream-Status: Backport [https://gitlab.kitware.com/cmake/cmake/-/commit/f742c298a0d6b70059e5c98c89d301e62a3e2087]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ Utilities/cmcppdap/include/dap/network.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Utilities/cmcppdap/include/dap/network.h b/Utilities/cmcppdap/include/dap/network.h
+index 9d14f6b70fa..dd3e0062407 100644
+--- a/Utilities/cmcppdap/include/dap/network.h
++++ b/Utilities/cmcppdap/include/dap/network.h
+@@ -17,6 +17,7 @@
+ 
+ #include <functional>
+ #include <memory>
++#include <stdint.h>
+ 
+ namespace dap {
+ class ReaderWriter;
+-- 
+GitLab
+
-- 
2.43.0



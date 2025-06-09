Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0F2C61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:58:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.56079.1749463131543541615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L+lu2Zbs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so34549935e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463129; x=1750067929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T21Jj5+Mqcz5TiQOjfElFGXP5rFHpCUrS2ljg74a5Lo=;
        b=L+lu2ZbsdAJmNhrQbtyxS7x43ELdK6KlZuzn9NDlkYPxex75CSWejyZ9N1SdRCMwzt
         VPLc80QRv62pDq+X/nw+MR3iAWoOLjE5AxMByOVTKkARrd+EXkZi9h4Ft1wddfbZF14X
         Ze80gPgDE2v5MpqIgdfKIpODs0woVR6KmSBgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463129; x=1750067929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T21Jj5+Mqcz5TiQOjfElFGXP5rFHpCUrS2ljg74a5Lo=;
        b=hMYvklIc7N8InsNRq6hkZ08miymiEDilZZn6nN3LsFe9XrA9ziMIrCAw9tyEHGMBSk
         bU78wZprgAjPkGWHHzQfuGSPBsfGHQC1x3WRsYjGPUVru+rQHf/1plEQULeITw4iQdHh
         gmxTANQO/FpYAw3e7SfoP3pRjEjOSaLjfEm4FdwnsuvvBZx7XYTu5/dLovbOc8hhIJZz
         ArOg5Hc9lyO14Am7FyDtSqJ8um0gZKQ9g/nUVK53wMfPThH9z4QY2Z9hebIWPDtz3t+v
         PEcYUqE/4zOlkAz6JUIzJcC6QT5/EKoOaEcokF8aTl+O/sZQ2hZ4g+jTk9KwOsOEEoIz
         PVnw==
X-Gm-Message-State: AOJu0YzSmr25vP5xuKsFmb8YXNnjUYAjIOhMa8rHsSLxsW4XirI2Szgh
	y5W8t4zx9w2iBKpvflySvVk0XQCK/zl0AmP9V4vlAWqggTjdvGZ56ZvssUSEqH0Hk+3JcVZVyUW
	uL7CR3+k=
X-Gm-Gg: ASbGnctCw3x9e0qZ0vkws6v+SdvXWPHNrwl21kvc4AraaHNlNtGUSCIzbBeAFnX40Xb
	/e3pog7ermeNOY496HHqaM0TWHSmo0x5i+uS6DcpDsIZo7K9l0nxonnQjTV/dcm6i4jqeqVd3xe
	Y8USl8d7JGXYS7b++JzcxbMLjDqAqtwJH6hwHz3qnB/Svx7PZhnFeWnJzpvjFMPOgJviwAaoYN1
	W8Pvy+6KalpRJ20TJXAhyPRL7DZsLsD8YKT59jXCJB/SL6bFSQfozflyDvkGM9P0rNJYmcYcQam
	gc0cp0i2k/6f61CRvfiJYDZ1tD9QxKMGrjLzN5k4dDeLQfIzsKfGL3Z2ds6qjK+lapTQaH5ohMH
	bdFYK2UfKk7vrS/4=
X-Google-Smtp-Source: AGHT+IGi8sicX/mcg1Xl6cZuiYnj/dq3JvtLAFdv889epl1qasqiZpeP5/2GF7bj3VHDIi/dFImjzA==
X-Received: by 2002:a05:600c:4e4f:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4520159c111mr114573915e9.14.1749463129479;
        Mon, 09 Jun 2025 02:58:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375b60fsm108406455e9.40.2025.06.09.02.58.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:58:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] compiler-rt/libcxx: Use clang as compiler
Date: Mon,  9 Jun 2025 10:58:43 +0100
Message-ID: <20250609095846.937759-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250609095846.937759-1-richard.purdie@linuxfoundation.org>
References: <20250609095846.937759-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218252

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 2 ++
 meta/recipes-devtools/clang/compiler-rt_git.bb            | 2 ++
 meta/recipes-devtools/clang/libcxx_git.bb                 | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index f8e7bb13d2b..47438014b23 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -36,6 +36,8 @@ BUILD_CXX = "${CCACHE}${HOST_PREFIX}clang++ ${BUILD_CC_ARCH}$"
 CFLAGS += "${COMPILER_RT}"
 CXXFLAGS += "${COMPILER_RT} ${LIBCPLUSPLUS}"
 
+TOOLCHAIN = "clang"
+
 DEPENDS += "ninja-native virtual/crypt compiler-rt"
 DEPENDS:append:class-native = " clang-native libxcrypt-native libcxx-native"
 DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-libxcrypt nativesdk-gcc-runtime"
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index ad145f86446..7b442183efc 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -58,6 +58,8 @@ BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
 LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
 CXXFLAGS += "${LIBCPLUSPLUS}"
 
+TOOLCHAIN = "clang"
+
 def get_compiler_rt_arch(bb, d):
     if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True, False, d):
         return 'armv5te'
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index c99617c228a..f5bf17f30ae 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -54,6 +54,8 @@ BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
 LDFLAGS += "${COMPILER_RT} ${UNWINDLIB} ${LIBCPLUSPLUS}"
 CXXFLAGS += "${LIBCPLUSPLUS}"
 
+TOOLCHAIN = "clang"
+
 OECMAKE_SOURCEPATH = "${S}/llvm"
 EXTRA_OECMAKE += "\
                   -DCMAKE_BUILD_TYPE=RelWithDebInfo \


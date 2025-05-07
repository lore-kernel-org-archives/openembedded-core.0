Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0966C3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 16:26:24 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.185.1746635174842001016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 09:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=adxPQ8YQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e331215dbso10214385ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746635174; x=1747239974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xIH/C+htBiL39ohcJqKoSg+k7sM9odmGfITnMQ7al0Q=;
        b=adxPQ8YQBAkMVe/jj5nX3uAeUm30eBVGwPItKP3+a5yMC5IaEYw3otTbUz9MTLIppu
         pwQJtLU89Ju0zscf2yXo2AtIoyr2LsNIOC4Ce/xYDuaa9phfbjCJe287PqY0yyhJ1rFE
         SnIAyg+CftAUzk65o+y9J2pAeqZvByHL2NpKgePf0PUtTuFulvMUAISJ5b5ZnciIR0Ft
         BUiKVIX4VCnityIBKQ8oQkYjHs27GefM2GILZAtewLRRTiIwA9ndgH1mclGS0feFnaqu
         FLnBg8kbn7gdXbYoWK1xOkrax/juc2WS7FTXNlxSOfBvwio7qTNjN4FLxBuo81aBXrsf
         Xryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746635174; x=1747239974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIH/C+htBiL39ohcJqKoSg+k7sM9odmGfITnMQ7al0Q=;
        b=jVVwe849m8iU4Q9N4aWqT67fd6FUhnC9OtWnxmc2cKHQOmbWzkuL+w/4DVJccRrrNt
         K0TOCpustXR3nm9wiiLsQMOcDG8uaYnGNahg7xDXCY9NcSuj8GIAS4rImwPQJg/GBYxB
         UMQUFixV7QJd1dZbmLJ5DBmn/zNt6HiuDSbbxYj4NjoTCvq+B1m7E2efFcIdBMmTn/a0
         xKiTxxtLKV8LhiRP7iRrs1zKLunA9dfZzCGzrsl5jox9CtNsrVl+3c7Nqi07vgX4NwAn
         cKVHvPS8adH180vIqScm24ezQEFEkdrJepmPQMGimz8/4N/0L/ZqSAvIc+3rVo1emQiy
         A4Ew==
X-Gm-Message-State: AOJu0YwvMojB/a2TpZujMfzY8/2ZHuOSPWsz1+0dyA3u/rOZxUIEN5tL
	vw10WNXozruy7/qrisW2GRDDZLv77sx4gmsfg+Wt+yTYwszt/P5hzKQ8j7w+
X-Gm-Gg: ASbGncsF2w+zQwqWppSEavXLYzFZE4EdplnCNbzfyIcexaOPZZ1TQRPFwU0Eauswj/g
	t4D/CcGqIAbZwdRkePwnyVWGYIn0j8g5B+8yNJjbms9460k1bN1jdaypWRpjFMWojqHFBiuVGoS
	JhHRgLaAvvAIFP8AhV0qLIr4RDrgyZJ5xhGjBTi/dEckYbTBFfx3HCTEttfneAntWXQk8didxqp
	WvTVeFKlDTSlZoM5bbXdD8Lfzli6Qf7VQrE0IiSVF0NWRxmWMnNTVabpFvlfjSdrcjdX2kw2P8f
	RUir9duvmq7gF7tlvdHUz1q2r1YmVyCt
X-Google-Smtp-Source: AGHT+IHqmWJ/vytnJybc0jmv5B5aQXUu3rHLFwqgHmfBKn/R/e/fImkF0F6ET23wV160aR/TBKrj7w==
X-Received: by 2002:a17:902:f64e:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22e84783767mr1323145ad.16.1746635173852;
        Wed, 07 May 2025 09:26:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228a58sm96331695ad.169.2025.05.07.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:26:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] clang: Space optimize clang recipes
Date: Wed,  7 May 2025 09:26:10 -0700
Message-ID: <20250507162611.1139258-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 16:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216123

They can consume quite a bit of build space, we don't debug them as often

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change

 meta/conf/distro/include/yocto-space-optimize.inc | 4 +++-
 meta/recipes-devtools/clang/clang_git.bb          | 2 --
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-space-optimize.inc b/meta/conf/distro/include/yocto-space-optimize.inc
index 407e8937f08..b83ba426e78 100644
--- a/meta/conf/distro/include/yocto-space-optimize.inc
+++ b/meta/conf/distro/include/yocto-space-optimize.inc
@@ -3,6 +3,8 @@
 # and build speed.
 
 # With -g, llvm workdir is 40GB, llvm-staticdev is 1.3GB, llvm-dbg is 1GB
-DEBUG_LEVELFLAG:pn-llvm = ""
+DEBUG_LEVELFLAG:pn-clang = ""
+DEBUG_LEVELFLAG:pn-clang-native = ""
+DEBUG_LEVELFLAG:pn-nativesdk-clang = ""
 # With -g, qemu workdir is 10GB, qemu-dbg is 363MB
 DEBUG_LEVELFLAG:pn-qemu = ""
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index ba037e59785..c93554622f1 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -153,8 +153,6 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_BUILD_EXTERNAL_COMPILER_RT=ON \
                   -DCMAKE_SYSTEM_NAME=Linux \
                   -DCMAKE_BUILD_TYPE=Release \
-                  -DCMAKE_CXX_FLAGS_RELEASE='${CXXFLAGS} -DNDEBUG -g0' \
-                  -DCMAKE_C_FLAGS_RELEASE='${CFLAGS} -DNDEBUG -g0' \
                   -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
                   -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR} \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \


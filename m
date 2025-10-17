Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2ABCCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 06:44:28 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.9734.1760683458569025939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 23:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RUvBo1YV;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33ba38ed94eso1778173a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 23:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760683458; x=1761288258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xt0uGFCbd8KidXk4jsUgLJRuCFTjq2u6SW+2W8oJUsM=;
        b=RUvBo1YVI5ImWYsFLWP7Oncme2CyfCA4Ob5bO4a+GJbgoa7JN45zAnqSbMszAUjiu5
         3L+0E3oB9hFwYxuNQSOSkPlJd/ciM2FiM2osjF+4UzPc77CuD9EZJumQCrXZXSIfLche
         LFenXcphpx+Yzmvmltafh9qvEkeKK3HfDVDgmXdTFKZNzeD9QnGaQ07OZ69jZDoPU34J
         aaiiCfyy0PIfhpBiLeH10Rlj1VDhVtk1u2ekdN6DCnWsp7LARgNKghbgdiNSyPbOldWt
         MVmJEkgyhXQJmfupBK1y6EHnGTJ+ZbY/9CfBgDaqyonyksosHzC98ErJltttYSebPiB/
         m9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760683458; x=1761288258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xt0uGFCbd8KidXk4jsUgLJRuCFTjq2u6SW+2W8oJUsM=;
        b=itvXgconAoW5Z5opzQTTU4vzNfCTVOPyJImxhNck286pmIJBJxS3o3rnU2jtWONHE9
         P2WX5DkOqTgH+TSWh2y22r/XezYpUIVnOQQerwpCacQfgqJqPUa2sFEQC8JRbs8WwTw8
         AVbmDg5DpuxKhdU3ozUiXJbteqUKJ237fZ6UaYQHdBsT7I+zsjjrJZ38lSMYVnuxkmrr
         PrhEv+3vKyRmvKpjRptbdlMo7dPVN8xq/CV/g5kiFz6/4pJuVlbbHKTdYBFOfJL5WW3y
         MKbdcG1hCpRd7pNgfvZ11pS5igC2SQY9a4WC153M/EWiQoB3A6Lf9GHLC8k9i4aROv2C
         zdbg==
X-Gm-Message-State: AOJu0YwgTKPD3GBDhYXCNviEO6tPZj4AoPX3uvimlTgKiJku8lAIgQ+H
	xKGOwaK3S8XBhT4z/P8cxJ6tpUtGgtCt8G+yEutIvw77w45lZSD/MTpdogNCpgSl
X-Gm-Gg: ASbGncsBzLpfmm1imlo/oc8rWaUAK2UmttYGvbsTubWQDrnGbHP9E9yF+ggVRqRNV0T
	sKRyfwSyYSR9XN2x1yQ82m9rpS2PQo+zBSf+9x7k/Phd9BnbkemcO2RJLls76A+54/F2IlZPOKF
	1RRRS9NGhF3ISGCNpxaplZvXSrzCfqK3jtze9S93brmn60UEyQtoZZxanG3xHALh6ZMToFUiUUW
	QZEE7rM/AGDZh1Bu6U9k7f/ZmpMEVqsmGfN+BCqMe97IZgfIw/a/XFFELhvqfxub4xTK6xqStHZ
	5b8AxN97sBFi8fN386iFRNKF5eH62WhD/uxG5ZzYvQT6flMt9L+Mz4uoAoYVs2GaomRmpWH/vh1
	s3n9rSSsg93Gj5J6+ILuHPaqu7wMX18qoHla4RJ4nQ63ywMLhSt6oeh/EDxPZoDMz6vU51D+jDU
	XyH+HKIqNjsYN0zq9WP2Yr8TNKYrGiHhKdT86BiqJrDWKn0WuyCfjerZDwbeB8eg==
X-Google-Smtp-Source: AGHT+IFPsOEO+087diZinEwDaDNbbrco6GJL9Rudwy52J0jentRHUOl1PieOuCP7I2mfA4rB0IhefA==
X-Received: by 2002:a17:902:ce12:b0:26b:da03:60db with SMTP id d9443c01a7336-290c9ca6b1cmr33608135ad.13.1760683457590;
        Thu, 16 Oct 2025 23:44:17 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::a529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7b0d3sm52423435ad.66.2025.10.16.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 23:44:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Subject: [PATCH] rust: Do not use use-libcxx
Date: Thu, 16 Oct 2025 23:44:15 -0700
Message-ID: <20251017064415.3029758-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 06:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224997

use-libcxx is effective to use libcxx as standard
C++ runtime with the llvm which is built internally
with rust compiler, however, we have changed rust
toolchain to use external llvm built with llvm-native
so this option is not effective, moreover, it passes
wrong expectation to rust compiler of C++ runtime
and it ends up with mising symbol errors because it
emits symbols to one c++ library (libc++) but it is
linked with libstdc++ and vice versa

Fixes
x86_64-unknown-linux-gnu/stage1/lib/librustc_driver-06cb1cc41094667b.so: undefined symbol: _ZTINSt13__future_base12_Result_baseE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.90.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index 0319d73b930..b4fd690aab2 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -126,8 +126,6 @@ python do_configure() {
     config.add_section("llvm")
     config.set("llvm", "static-libstdcpp", e(False))
     config.set("llvm", "download-ci-llvm", e(False))
-    if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
-        config.set("llvm", "use-libcxx", e(True))
 
     # [rust]
     config.add_section("rust")


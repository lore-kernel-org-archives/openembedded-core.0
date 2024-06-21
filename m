Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764B1C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 15:57:41 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.77001.1718985452555363986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 08:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kteGbHqp;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f9885d5c04so19495465ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718985452; x=1719590252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y31EUWcKoI7jzyc8RgGNDheNy6QdNB8cOpH3mlS3fVo=;
        b=kteGbHqpJ6lPSYc08lZSoX37TMkpcQj/JCPrmpH6AxTLpQcOG4zQPMLy+1bZey5w30
         7t9lzs+TvQFArvg7+rQFPI1ELFlYZpbxTFJCbSgbmNzWhH1IkVYcFyPAlYbsrlG+fiIq
         pqkTCvMrNP1sbwP9jt1RoaB7NrCyGilP1intGM3Z3RcJW8TNlhtY+7yKcaxvSfEUZ4Im
         Rd57miAwP24GhhBvo2429FyJN9/wircrvCez3K4C25nOfNO5Q5WabIBKwUqB3jCMLORC
         8CEIRjRcR4Mr+09NH5BMU0txei/+DdCGXE1cAbPKiRQjyCTJhOT3V8CPM82kKrhS3Tru
         mY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718985452; x=1719590252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y31EUWcKoI7jzyc8RgGNDheNy6QdNB8cOpH3mlS3fVo=;
        b=Rw6HgosIiKSeKyedTtXYB+uH8GMTXrTn1KVfgSakAaZD5+O5XMmyd2x6zBglDqdZMH
         jQPp8OiIj6L59LEmfEpahtZjJaboi09q/QvIXLaPwnEJznXNUgfy1cWLY3BkbZ4AIRuq
         ixguuO8+UsejyuyO+g6u0icfVjyG+gQbgfgoecFLD0W6FKs5l904JgSEEns9Ap4QywXz
         J0wHlgIjlxAz5GIG/3qgEB2xLeO855T5GFouGXj6HKf0+mowjfUhi5ipkMfUgv54gBvV
         zFIH7top1kXeMf3e9Ri146OL2nIWB3l2BH/tCIA+4pYZ0bl5g1jGYcNuLAg7fVYUYaE1
         06gw==
X-Gm-Message-State: AOJu0YwdwC/B5lh4mR8a0mLk3wAXxXvyqcg+XzBBInfaroVyjFjdryGL
	Za7SAzthftXJFOLAVH391LIEhVvU5VEya/9L1AgMQKr4FHcc2bwC6tjVug==
X-Google-Smtp-Source: AGHT+IG1gVQk62fbaPJmPm/xeqOdLQe5rpMJVVfzMtSfqwdTT72lY7QcWxrUzy7SNJjlSwVg9HYObQ==
X-Received: by 2002:a17:902:d2d1:b0:1f9:f3a0:62a5 with SMTP id d9443c01a7336-1f9f3a065c4mr17412395ad.53.1718985451676;
        Fri, 21 Jun 2024 08:57:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9f1c27db0sm13524515ad.100.2024.06.21.08.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 08:57:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tronje Krabbe <tkrabbe@jusst.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rust-target-config: Update data layouts for 32-bit arm targets
Date: Fri, 21 Jun 2024 08:57:28 -0700
Message-ID: <20240621155728.2918194-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 15:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201030

From: Tronje Krabbe <tkrabbe@jusst.de>

update the rust data layout to sync with LLVM [1]
fixes the following build
error:

error: data-layout for target `arm-poky-linux-gnueabi`, `e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64`, differs from LLVM target's `armv7-unknown-linux-gnueabihf` default layout, `e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64`

meta-rust issue report with rust 1.76 [2]

[1] https://github.com/llvm/llvm-project/commit/308e82ecebeef1342004637db9fdf11567a299b3
[2]: https://github.com/meta-rust/meta-rust/issues/444

Signed-off-by: Tronje Krabbe <tkrabbe@jusst.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 330ad8a3f53..334f2e7d5fc 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -130,7 +130,7 @@ def llvm_features(d):
 llvm_features[vardepvalue] = "${@llvm_features(d)}"
 
 ## arm-unknown-linux-gnueabihf
-DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
 TARGET_ENDIAN[arm-eabi] = "little"
 TARGET_POINTER_WIDTH[arm-eabi] = "32"
 TARGET_C_INT_WIDTH[arm-eabi] = "32"
@@ -138,7 +138,7 @@ MAX_ATOMIC_WIDTH[arm-eabi] = "64"
 FEATURES[arm-eabi] = "+v6,+vfp2"
 
 ## armv7-unknown-linux-gnueabihf
-DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
 TARGET_ENDIAN[armv7-eabi] = "little"
 TARGET_POINTER_WIDTH[armv7-eabi] = "32"
 TARGET_C_INT_WIDTH[armv7-eabi] = "32"


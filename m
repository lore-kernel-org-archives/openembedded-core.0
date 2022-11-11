Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FFBC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 14:34:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.6142.1668177235039760721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 06:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ICTcd9uN;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id v1so6685818wrt.11
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 06:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CEPIXyFDnpb3+7dCH5/uXRnD1P3Z2/lqt6bjLbqGbeQ=;
        b=ICTcd9uNvAQ0zO7LSpt2JPeHeFlFgklSY5uFRCluG9j5/E/dv0RO/3GCv8giRvQNwf
         4mkX5ev4sR4WRSnLdLhY4xotMsSaaXtpN4KZqefZEaHfc/owGh4YHENaNMpfXyfo9xFb
         kvNjZJjt8BL1fq173L0Gfjfx8j3Pa+6iLdg0/nghGV0/6xmZuxlmFuqTnK1ApCFYzDxt
         x7MRJ8tMLElpWyWQmAUEv+Uq+h/Vydo5/Ib0TowLGihNTjVuPOHDgRmsn46evau7zwDF
         vafkqxRtlMmLZmgE42PjFQjE7I1iAbEoyIPhyp8ab19r4HgPn2Mpm+5JVcqdAPf7phWc
         PK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEPIXyFDnpb3+7dCH5/uXRnD1P3Z2/lqt6bjLbqGbeQ=;
        b=4UQGwSrtG2cf2OtCIcn3dL6ili9yzvl3YZGKbvGeVE/UQ59dxKtmw/dCtpIyUauekr
         F2s0PY5cg0FxuUsc6I67re7RgyxZfXnArjaxSq5EDtjtPmzqJx1b95wchGdrE1+hjTyW
         3duPyePWEeeEd95bofz6hrNsMSA+9lwJ7KlNeBUzrwGDND8KGvMF+lQVDDbIMSBCamxl
         FW7Sr86gHFNQA6wS2TXkzQOtBUsFP2OE+eUx8FwCFEq27rYa7mvV2/NcJAj3VTFUAl9k
         kLIWe7Myu5pEtOE1lja2eEtfqXeK2w23dXO7kgNIG98loXp8yooMOrl6KFjrlYdnu2Uh
         cs+g==
X-Gm-Message-State: ANoB5pl7xxj3ydxC2b7NPbdZRDHr2Tzb9UQEBczovN6nBzB4yEMBqXiA
	DbrfmGpQO/rCvVb5EvFOw6vWWxndVaM=
X-Google-Smtp-Source: AA0mqf7gIRPOMyTMrKj+OKn49CLZOLsixXsg/8RGRDwjD/wX1/CJaMvvYOPRSlVeoHCeI99jbyKFsQ==
X-Received: by 2002:a5d:68c1:0:b0:236:84b5:c0d8 with SMTP id p1-20020a5d68c1000000b0023684b5c0d8mr1452913wrw.342.1668177233407;
        Fri, 11 Nov 2022 06:33:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d6e92000000b0023647841c5bsm2077726wrz.60.2022.11.11.06.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 06:33:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libxext: update 1.3.4 -> 1.3.5
Date: Fri, 11 Nov 2022 15:33:49 +0100
Message-Id: <20221111143349.1756790-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 14:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173131

License-Update: copyright holders

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxext_1.3.4.bb => libxext_1.3.5.bb}        | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.4.bb => libxext_1.3.5.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
rename to meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
index a0ba54d184..d4d4119485 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
@@ -11,7 +11,7 @@ extensions."
 require xorg-lib-common.inc
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=879ce266785414bd1cbc3bc2f4d9d7c8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4234bb3b2f1521ea101e4e9db7c33c69"
 
 DEPENDS += "xorgproto virtual/libx11"
 PROVIDES = "xext"
@@ -19,8 +19,7 @@ PROVIDES = "xext"
 PE = "1"
 
 XORG_PN = "libXext"
-
+XORG_EXT = "tar.xz"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "f5b48bb76ba327cd2a8dc7a383532a95"
-SRC_URI[sha256sum] = "59ad6fcce98deaecc14d39a672cf218ca37aba617c9a0f691cac3bcd28edf82b"
+SRC_URI[sha256sum] = "db14c0c895c57ea33a8559de8cb2b93dc76c42ea4a39e294d175938a133d7bca"
-- 
2.30.2



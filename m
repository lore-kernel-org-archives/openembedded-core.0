Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09BEC41535
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.7297.1651727154549771697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=elwOZ6mF;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id n10so6556895ejk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zJsMrH6TZECtXDQeEBPb97C21nA75U1F4br/Bq44K3A=;
        b=elwOZ6mF3HKFTT2I/AI6pFme5Fiu7haez5Wc26hk6m0PqA9PQWu3EYOPbGADxllt3h
         G0mwkBZtVL4fD+iZ0th8DOxhyBZEtrFqB/ioYLNkdHVPO5UTYMyrQWzG0DoyUwegVYIV
         aNDHRL5azrgneNfWNlw7y9JKIiODuTY92jBV26uppXcRvdH71PveOUbXy/jd7ZyIAuGN
         TIZzH1znI7K37tu+2abRMBcUKswxoOcm0Nw1fyTTS6wvOi/4yLAPzCnpSb2JJPpefoot
         /U/OQ3XVohq8UZMSJ8V1u4eFeE9vUfJ6F+j9W3atStvJQojgfgwdzfKLkTEGpfjQXvZn
         /OXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zJsMrH6TZECtXDQeEBPb97C21nA75U1F4br/Bq44K3A=;
        b=u5Yk6BQnTPbyRa4xf+vzNh0LwSH7kUrIpAsiAMDrqj8Ai/iEVqCmVWr+py2iLl64l9
         gx4tT/ifLEW3ST3JctlcUcPxOwl7FC5o+yk9xhMdZdokKgYVLWbXy75Zx50RMWMzWme5
         frI/zlLuoHNNL62A9JWpkQ+x+qB0drDl1V6tyGkAw5+yRyHB8l+M2D6xy4eK/fc6Znoo
         t1+6HpdBvpt+6q7fzfpw2WFBXEyxw4gHKT7N1R0kZt9cy1ZmLEAvQajWJsEByRnOKirQ
         komD4JM5k6rmvtzyONyQhnsbQcTfAFFI+awGGwRPi2+4KW8xUBuvR0CPjQ42xRYyO8/U
         hetQ==
X-Gm-Message-State: AOAM530Ks87IDhCPZsUTzdF4emG52+PaAYdn1o/x30o9rJolRNfQJs3Z
	PbUvlKNrV5e6am6iFMiLqDhaxkp3XhM=
X-Google-Smtp-Source: 
 ABdhPJz8mhhuVOOp0L/HVFlBGdtVWSx0eJ14qfwbnJnv860g1lCf73diuFPST9o33mk29qBCzUhX/Q==
X-Received: by 2002:a17:907:a40f:b0:6f4:d2af:b720 with SMTP id
 sg15-20020a170907a40f00b006f4d2afb720mr5320589ejc.305.1651727169115;
        Wed, 04 May 2022 22:06:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/61] libx11: upgrade 1.7.5 -> 1.8
Date: Thu,  5 May 2022 07:05:11 +0200
Message-Id: <20220505050544.651895-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165257

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libx11_1.7.5.bb => libx11_1.8.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.7.5.bb => libx11_1.8.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.bb
index 2a6f66957c..6d5a8626d6 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.bb
@@ -16,7 +16,7 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 SRC_URI += "file://disable_tests.patch \
            "
-SRC_URI[sha256sum] = "5a1847e2e2c248e1a203a24a1338a5586d6f48472eac58f6f08539110a965151"
+SRC_URI[sha256sum] = "081bf42ebab023aa92cfdb20c7af8c5ae13d13e88a5e22f90f4453ef80bbdde4"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.30.2



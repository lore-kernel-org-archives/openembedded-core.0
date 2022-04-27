Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77A2C43217
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.5801.1651048818275866428
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gVC6p0bC;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id be20so1070898edb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b8pMBvKGNAUUdleWGcS6YPSQm7HAweehnGnio3jvoPQ=;
        b=gVC6p0bC0wIZxFDjevtS3YuzFcRWrRUnt+bxoFVIr79mzth5Fmrmlt41zbQfnBaMH4
         es2n8Mpxwm0kKmPT9J0CJwxOU0j5xEAmAp5VWQ/OBLyzdtLTCb9DL7aCYS44FRBuDuy4
         G9dTcdwj0i9oHekgA1QW4MPYiGcnFxg7GLDANhGTFIHjVc9D46/31+Ja8D/VnihncBIH
         EOhKge5yehw1oW3Ic7DIwHN1GW8WvQ6bXVXmSs88nYD5RU/VVbSBiaxpWWfVcVfyPiZy
         pMu2kBUcNmp6ZcUHOh8VQMITKbDA2J213/z0tW3Nh1X/Q4C9lAc3rEI6Tn5+ZZLu0dqR
         tRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8pMBvKGNAUUdleWGcS6YPSQm7HAweehnGnio3jvoPQ=;
        b=aToC/A4RNQg0Zah+SK1ndwpEDWrdOsggslAUrWRews5jc76ipkvs3JVL11l9cF3fbf
         5sPAXsNI6pBs3XItgzcJINF8dz92fqae8QyFDXPP5TL3CKNdI3Yv9zdCDGJoURo1ggg4
         OOUNuajJtM77z82WSpeh3f74ojl1EEx8e1T9+bG7C2HVkekFp9UWf3//DD9dyHVjQPo5
         XJuT9d07KBDIbuS5pqXY7WiLgOGRpehutJSlgtrxgGvoVrd4KYoC2oFCskNpNPzfeJNG
         Tl2pTETiffJ8/gJvke1PVEspmxatV6tp1oJyfd7KLSou+Bvl+AgKagBrqNIQ/RIzhCNp
         MYcQ==
X-Gm-Message-State: AOAM532eZGBtXk1uQR/qghseZSWHJ4ltz6U8KUOLqSaF7LKJL0OXqk/y
	F8RGcg9UzQC/5Eu1E/NF3OZqOxDhQEI=
X-Google-Smtp-Source: 
 ABdhPJyJajsy0o9+JCUrsr6sQkDO7NntdiUlkts2gCOxHb6MuHDeFpXa1vGVlGxNkmjsIbJwALbQEg==
X-Received: by 2002:a05:6402:3508:b0:426:1b4:a2e2 with SMTP id
 b8-20020a056402350800b0042601b4a2e2mr4745133edd.387.1651048816883;
        Wed, 27 Apr 2022 01:40:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/18] piglit: update to latest revision
Date: Wed, 27 Apr 2022 10:39:56 +0200
Message-Id: <20220427084009.3406717-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164896

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 840050bfc9..436d1b28d3 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "445711587d461539a4d8f9d35a7fe996a86d3c8d"
+SRCREV = "0d7481136080ffed96a33d31a04547012903ba25"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2



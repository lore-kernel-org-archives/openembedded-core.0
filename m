Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728A3C5479D
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.25197.1672425546636936440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KNfqlK7W;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id m3so6767786wmq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rahlXwVTxi2m/iYbNGNVPSGwK+Wn3T1+9hCIjuUEDCs=;
        b=KNfqlK7WhHRVuqcwAplAf/CdV8AgHEBEmWXb+bcRczeOHfzF7MnssY1jLlwF6p2xam
         ld5ZF5u+nRfb+px1RGE53jmKrzaDvV7XCBSlR/lN59fuGDoJTT1erIOeowxPEohGsSEb
         3ks/O23UiTI/UJUu34JNSU+KSS1kQhmMiy4r+ACC1v+XGh/P+F8YQGO4sS4T3up40gih
         GtjPpUhJxmOAPKIay1+j6tih9CIIlNut3GqUaDxp0eQ96b6ioKS5Kj4wBrBuNvXUvkGm
         1P3SEEUunub2cEWVsE77wguzVq0TGvsBvcsh5fgLYkIFnWTWxLIFgB/GfsIv6AW39i9b
         /v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rahlXwVTxi2m/iYbNGNVPSGwK+Wn3T1+9hCIjuUEDCs=;
        b=YwPKfP8TRv/SUUbRN7Zo93EnecDU2jMeR0fhn+czz1RWPmK8cIVVZI68t1es0YHesI
         lC5qqfNGxdoz9ThjUsPZ8FL8qJMYFToL2W2pBor5ykJWS0MTxvqVScTT8776PLM7VnB+
         boftTD5sDkKJ2DAxis4u4kyUqc/3NDtvP2UuqlcJ8goxx58es1MH8/vsKLGE9M2MVgl0
         OLzLR5TVCmnZ/MlC/o96aaQ42lOX4aVldLsTq6gLxH4qK/B6axph2eeQiTE8wGs+kxlD
         UlTdbrn93V437gzjMm1cx0Z3YTNP19RNvlYb/F6XGAP/NvGRM/rTopx5uQ0594NmOLI+
         eZpw==
X-Gm-Message-State: AFqh2kpIa+r52gnpb6L9BrncrCBcUfmtSTedBO+0HyT/dbq0ne968Vs8
	PjlrzOj302WgGp1YLgvhPhocDRAyzXc=
X-Google-Smtp-Source: AMrXdXu5UzwFZpOtasQdD3F5CIBBiUrTet30+fcClBRA80OlHnzgpRWx3aLyr0X9FbTLpPU0QMhWGw==
X-Received: by 2002:a05:600c:1c85:b0:3d3:4b18:27c6 with SMTP id k5-20020a05600c1c8500b003d34b1827c6mr23053088wms.11.1672425545111;
        Fri, 30 Dec 2022 10:39:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/11] vulkan-samples: update to latest revision
Date: Fri, 30 Dec 2022 19:38:47 +0100
Message-Id: <20221230183850.3089510-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230183850.3089510-1-alex@linutronix.de>
References: <20221230183850.3089510-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175171

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index d0b3458e1b..de90a88502 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "74d45aace02d99d766126711a8aaa0978276ca00"
+SRCREV = "8b945bebf8b2fd987dcf0eeca048068adf4ea44d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.30.2



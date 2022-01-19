Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E85C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.4797.1642588910190813790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L+ylFdDn;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so4912991wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1MuJRrDPhLmEQ72gNnNogj7tQhcEKr/spIsQOfoDWFw=;
        b=L+ylFdDned57d5ZJiJEByxTWterHERBONBoXFa3yDq+NA6KXuk/9BG3ZJDBNSs/OYg
         a1VWSnRdxOOw4An3J6L/5cWG4iINEJG5HoQtTD623x/wT3Q/AWR3PVspplv0DHambjp2
         +Uu5L0lgtNwpVKAANte5nufL6mxkuzkhKD9SDP1ySbtd2axqHxYCiBlAjNJYEaVs8KOH
         VTN4pg7O7rUCf5q73wj1XuwE/DeNJG0gIHA5pwr48Hz8gb2cPA1Z7EzFj4edxbtbGbBt
         c3ruIjsH4T45RUUk0YDFMvITcd3nD/rts+hgBHYgEkgQrUd8Wkoddno20Tc4BV7pk3Uz
         XIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1MuJRrDPhLmEQ72gNnNogj7tQhcEKr/spIsQOfoDWFw=;
        b=4xgvp1KMlKDbD6nR7YeFAHL9xPA7lSYKDIB06+NaeBw2t3UIY5Apty2Gt5Zp+NZfeL
         7VNK3bazvhGHBzv3qIaqOu6PnsJ3T+kFCfQR1De8Xfg7bEfJgo6VGTZsiv8aH0bVR881
         IFZ6cVX9Ydfmvm2tZJqya4k0HzOCxOprzfvi45jpa4Rmx8X3IiMTs08RIvf1a0G0NcDH
         ghWCX6bRwEaEwud9KjgTB9QfR63BY2FynY2HFYezC1KEuA0hAh3sKiZo2zTd6reKp2oB
         ChTlHB36jFXPQI9YE3GdD4dvN+MweUnckzY+wMMy60ZdRodBbdtjr3FpjT+DoFmzg2Tf
         GnjQ==
X-Gm-Message-State: AOAM5327rr37TD/vR7mQtR1zVlebWYWPDPjWGMnhTPUUHH9Gse91sejh
	jXZsynyW4/VD12hKYNOYi8mDRfgSShM=
X-Google-Smtp-Source: 
 ABdhPJxd9KcvNmAoYBn1gU7zGpwmnlj5JsHKsJ1AcLmoQbPEcWv4++NC44EtSCsC1dzJ8b6f7Uf71A==
X-Received: by 2002:adf:dfcd:: with SMTP id
 q13mr28779796wrn.487.1642588908801;
        Wed, 19 Jan 2022 02:41:48 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/39] libinput: upgrade 1.19.2 -> 1.19.3
Date: Wed, 19 Jan 2022 11:41:09 +0100
Message-Id: <20220119104117.2120127-31-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160723

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../wayland/{libinput_1.19.2.bb => libinput_1.19.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.19.2.bb => libinput_1.19.3.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.19.2.bb b/meta/recipes-graphics/wayland/libinput_1.19.3.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.19.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.19.3.bb
index 590dee42e5..a7f13240d5 100644
--- a/meta/recipes-graphics/wayland/libinput_1.19.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.19.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "0fc39f0af3ee1a77c60c34bc45391a4d0879169f7c0f7bbbeb5eef590b98b883"
+SRC_URI[sha256sum] = "3cae78ccde19d7d0f387e58bc734d4d17ab5f6426f54a9e8b728c90b17baa068"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.20.1



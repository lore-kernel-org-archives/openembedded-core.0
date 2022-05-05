Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBCEC4332F
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:33 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.7367.1651727185028393610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DIjGhLwy;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id dk23so6551020ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DMyPs+h7rkihuNSAZfu0UlNDGfs0Y1tZxy2il5hjcTo=;
        b=DIjGhLwyFf5HY7jpXZt4iVJivKr0s4T8IzeyiNRYHoT2jO57/swoiOMBfKFoQvpfeu
         tCbA0PcOxrb6731JbJ/nI3kgUrF6IV/5vCesmV5jqTeqGD54L3n4cvxaLe/SrbK0460Z
         m0F8XErDQ5URJRChCel3YlNORoJPhNDIksBhu6kWT0NjY0dagQ4dpyMlyTeNRD0r65cQ
         13ZAX796k4eDVnREC52TlJ/Yz4nHDd99pIiF/Ug7DM6EQhzBst9eYI/B5RwJD6T18BFj
         3hNrDlYgEXYYLvBC1O8I05JpGUjEvYv/K2mML+C3VbkLcuTAYTSGXBBj48os1HUGRxST
         1opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DMyPs+h7rkihuNSAZfu0UlNDGfs0Y1tZxy2il5hjcTo=;
        b=DiCcB2v6x3cLn8MMOHO/aSlml+7lx7572xf5tOYI756wdHfqRA+3ZCceJT4RKX2CPr
         GEPpC1zRYbimJNrkKrU0sllZ0hP6+uF3+zEYQeTSqvAGr/L4o6dK+G/ww3PcvgnsJGrb
         kb+yeUj66zhyesQjaPqp/ilOt9fckAg0PwFxYIn+9K4LcuILxGy9Or3UwvzdbIw1kzvb
         r7pgBX6jzL9nvnN3YPCPSuuBi8OqC+t5CkVonYwIOdi1qGe2zqQnXIZypjsR8G89goht
         3r0Q4g7z5tKfHDJ59RT0elSVsfbj6DOJPL8a3hTnFYNOGWdiZdER8PwIMSY8M/+wnk43
         UY1Q==
X-Gm-Message-State: AOAM532W6bvyji1R8dIUOBKFbriXbY1W3LIXg+KmxtNdbFhNnTYR5rOl
	lzWe6/rpMfDoz+a+7/Y45Gu6N5RwhpQ=
X-Google-Smtp-Source: 
 ABdhPJwezKO/B1zfu8mM+l7+3OX3/bffx3WSObXPdOpDf97PgCToDtApIKEYg0g2dqOTqKc7GcarBw==
X-Received: by 2002:a17:906:9744:b0:6da:9e49:9fe3 with SMTP id
 o4-20020a170906974400b006da9e499fe3mr24325618ejy.319.1651727183581;
        Wed, 04 May 2022 22:06:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 46/61] xorgproto: upgrade 2021.5 -> 2022.1
Date: Thu,  5 May 2022 07:05:29 +0200
Message-Id: <20220505050544.651895-46-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165275

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-proto/{xorgproto_2021.5.bb => xorgproto_2022.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2021.5.bb => xorgproto_2022.1.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb
index 8f1ed36291..7786318476 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=dfc4bd2b0568b31725b85b0604e69b56"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "aa2f663b8dbd632960b24f7477aa07d901210057f6ab1a1db5158732569ca015"
+SRC_URI[sha256sum] = "1d2dcc66963f234d2c1e1f8d98a0d3e8725149cdac0a263df4097593c48bc2a6"
 
 inherit meson
 
-- 
2.30.2



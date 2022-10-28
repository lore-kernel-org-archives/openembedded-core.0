Return-Path: <ciaran.courtney@activeenergy.ie>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEE1C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 10:05:55 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.4572.1666951550640308316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 03:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@activeenergy-ie.20210112.gappssmtp.com header.s=20210112 header.b=IDvGl3wm;
 spf=pass (domain: activeenergy.ie, ip: 209.85.128.54, mailfrom: ciaran.courtney@activeenergy.ie)
Received: by mail-wm1-f54.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso6250619wma.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 03:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=activeenergy-ie.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ghX/8LqRJtoXSZKaqiR78ISo78/KFoaZbmkMudg35Zs=;
        b=IDvGl3wmbnDQAt61mUtyARlztEL3XtyyVsdEGL5JCLQNFnLAE02GlA24FCWZnSkeXN
         iV36VqwP7RH97x+mza42KDnP1V0hUgtXsGW1Yzr5q6xeGAY+/UmMCwLbQ8rOK1dQzx/z
         tuARubnkwHs1jkzTtmX6hVv2Nx/nTzagPjGKXmnJ/rMPZwBWkruGlUMZN9GlzPiIf97P
         vU6McFPa2Tb32Y1MHFbbf+jFc+tkLEylUUAnciMwTppOf05q3xTrFgFlATdsBtWm4dBJ
         t96gcXN5vMEdf1XNXVpSiOARBPu/ZT+UlMPdVExQ2U6moMpKn27uCK1lhfbhGC7Fsr0h
         sTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghX/8LqRJtoXSZKaqiR78ISo78/KFoaZbmkMudg35Zs=;
        b=09rIs4P+B+j5+AHAQ9FCxIYyohorGYK+tjH/LLPI6p/KuB9odzjVuMXx3ueiuuNvev
         Pv78fhgP08x7SqgZwrUFZKLi8YnHABZJdrIsJV8cBH3rlJGYD1TrJFE/Q4Dp04pv3M7F
         8109ki4euTxaCx61ULqeIQMrX9NvhM10lZa9KBRE2XeErfyTlAE+eTki+2u30NHlKRkr
         6QVUAcmqHfqYmNx83NW6Aa2Q3qADLPS5Ypid2wtVDJ/d9F5XR3onkriUZGXyigMrGPQz
         kS08MT/qil3N+b4qjuzK1/aXXD/6aOeXQwRXn2aFPnuelP3d9XJmKrrA3/njlJXSgIc5
         0Z7Q==
X-Gm-Message-State: ACrzQf2PrfIycAaAhuuUxjegdq56VulLJZ6d15nSSlEOuZPx549ruhVU
	gTvnmD0iipjL5XJTL8NPIdcNo3TcWCLGGFA7FTs=
X-Google-Smtp-Source: AMsMyM4JN1YKgVDZHNQVqC8S9sU2JwI9GjSSiXpWIrVcTVtz3hZM2+E7bu9RBj0ZIrOeqHcVoEGbxg==
X-Received: by 2002:a05:600c:1f08:b0:3c6:75b3:f444 with SMTP id bd8-20020a05600c1f0800b003c675b3f444mr8969127wmb.74.1666951548337;
        Fri, 28 Oct 2022 03:05:48 -0700 (PDT)
Received: from jammy.nmea.abb.com (95-45-31-11-dynamic.agg2.rms.bbh-prp.eircom.net. [95.45.31.11])
        by smtp.gmail.com with ESMTPSA id l10-20020adfe58a000000b00228dbf15072sm3220615wrm.62.2022.10.28.03.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 03:05:47 -0700 (PDT)
From: ciaran.courtney@activeenergy.ie
To: openembedded-core@lists.openembedded.org
Cc: ciarancourtney <ciaran.courtney@activeenergy.ie>
Subject: [PATCH] wic: swap partitions are not added to fstab
Date: Fri, 28 Oct 2022 11:05:09 +0100
Message-Id: <20221028100509.32171-1-ciaran.courtney@activeenergy.ie>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 10:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172244

From: ciarancourtney <ciaran.courtney@activeenergy.ie>

- Regression in 7aa678ce804c21dc1dc51b9be442671bc33c4041

Signed-off-by: ciarancourtney <ciaran.courtney@activeenergy.ie>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 58965b75da..dfaa901567 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint == "/" or not part.mountpoint.startswith('/'):
+               or part.mountpoint == "/" or not (part.mountpoint.startswith('/') or part.mountpoint == "swap"):
                 continue
 
             if part.use_uuid:
-- 
2.34.1



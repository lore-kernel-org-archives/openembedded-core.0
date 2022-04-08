Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153C3C3A589
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.533.1649457287531171494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 15:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ODrCmqY1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id s11so11857475qtc.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 15:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PmZ/dTGmmbonx0EAJiMe756x48C4qSER9ovihjEKdbs=;
        b=ODrCmqY1N9Zt2ldbLIc7/0Vs7JGOf2l8r4Dwhjo8ZJ+OyfsgPYQOX5IfegS7+rW70b
         +GcmyEoZTWGHTUWMzUBR3m7Dp8+rgfQ1bnQuqeC7bwfQ1KpKVIL5McoISuz8ZV7dmrzR
         uxxF6fITmiY4Ztam3xSozL6aOen/ci5qv/djem7Zh6PLIX9G5gdpcwlY3Kp1+LM9UJGA
         PGpd8AaqtgOu0Wjf25BJ32/3DRt4v+T0iyDjdv8LmXbsWHbZByJ7eiS59yYrs+UTEV6U
         3EC9E3KrTjnovZI6Q0x9lPfBfWwNgfg2XTDXs8dvF5KCJ4HAtjBr9f3KPHXbq2rgSzyO
         KNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PmZ/dTGmmbonx0EAJiMe756x48C4qSER9ovihjEKdbs=;
        b=RqByQye5flnglWqIE4hR+Uz7gaKF0l2b/O2dcqe3PIxqdojspv4UK4wAy8Z4QG9vQf
         xloxTRBOANrJVQ8jGhsSb3QEUmz0fvZo5/rfq0tGaxcbsG2qAWW4J3agYgXpO2OeNHNU
         hH29PkoKWuRq3xzLyuamS0IMLuLonRxNYbbZgcTzoIqgQv9jY9ZI8GLM3t/ZbCQWwMtp
         90j4U0YWn0+52nLK6tTkCwcZGAACQeMoJiLXuQuaJrnGcTfDiAHHRmRq29w2nNG4FYHM
         EhnNn9fOhVEgF5ah4MV6erQzSjRix7JBPCFWz3KJp5+hEcizDs6F9THrDN88CjhbhdeG
         HoJw==
X-Gm-Message-State: AOAM533MWl1RKu3esSs9voe83I/oERN87Pcpg1f+Uk0WxqizCZjTnYUX
	VQiB5AZQDMaZ5HSzvmxa6MqlVe959QUxsA==
X-Google-Smtp-Source: 
 ABdhPJy9REgsvhwo8QgAfviMSbCjGPxUl2s+Lq8FLlo194OlD9doOaQnBSVGStOokm7cknMJJMHumw==
X-Received: by 2002:ac8:6e87:0:b0:2eb:cd0e:b260 with SMTP id
 c7-20020ac86e87000000b002ebcd0eb260mr9202012qtv.340.1649457286485;
        Fri, 08 Apr 2022 15:34:46 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 s31-20020a05622a1a9f00b002e1df010316sm20197583qtc.80.2022.04.08.15.34.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 15:34:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 5/6] poky-tiny: add a distro description
Date: Fri,  8 Apr 2022 18:34:45 -0400
Message-Id: <20220408223445.3942055-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164178

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta-poky/conf/distro/poky-tiny.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index 499af906a898..9a3106879021 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -32,6 +32,7 @@ require conf/distro/poky.conf
 require conf/distro/include/gcsections.inc
 
 DISTRO = "poky-tiny"
+DISTRO_NAME = "Poky Tiny"
 DISTROOVERRIDES = "poky:poky-tiny"
 TCLIBC = "musl"
 
-- 
2.30.2



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0075AC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 22:43:04 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.586.1637275384552515897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 14:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P9PQaZ1A;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id v23so6348903pjr.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 14:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jsojj7+hOeP4vPLFyePeYUUKWqXH/6fc41dHfCZ7Tdk=;
        b=P9PQaZ1AZSy3CLBksFeiE4RJnczJbepvUyP44BZDBDDXciaeNg570iott7CtgHsUXn
         gCQFSPHVpkRZn5YQc3bZh3H2r8ih0wYr9CXK0fTtZToMcIjronYIYKLEjrDJJtl8MoMo
         mZHL2L1ngT5BTRqrMFVuBOlZDyMSYF76/8XEL0OTUb2RyRkanqVtSpi+PMDM21fkPNCj
         h8ln6I389iXsMZzK9QwTbdj1DQoo9YXjvRAfs5mOuF6ZFiHVopxjdjlG3OdJ+6dXxALt
         QWjLqcurgRl4QuzwCbMACZj1n0OjIGq4AOyFEp2jypcsVgLbbVzVMR0x12tbS7terMob
         +B8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jsojj7+hOeP4vPLFyePeYUUKWqXH/6fc41dHfCZ7Tdk=;
        b=at3D9wmcc6h7j8VCZTkxADsNbmpIy5yjPMvSafVrOfFXlP82iTbOE0hTosRePTOfu3
         eDMGmWzGzJJRN/HMcSGLxXQ+/isvkqEwKep3Hft9C1aKBiuKvxrcoW9TZIeCSnI6pLZl
         /l9rLRElBO7z3CrOvijJ9b8lwR0N2W9e/plOxGOIMpPDE4WzNuITgpjFyk+y//0AyvUa
         yypTEUz83cj5GWrF7v2VaEtktGwd6RLn1nsksg7ccQMFD3eK/PDBOsbFiXTEmKdp1LCJ
         v8jM8yTVpUXzF3cyVacqlx9X7fQn/T4onpMsf3w6FmYKAA3HKjutVddsmiYxKZkZ7uus
         gvMQ==
X-Gm-Message-State: AOAM5301DsN0wwbga1H6dVe7IfAZEF5GMyik/bqdykjknfmPF/f83lMZ
	ThUWCaQY/HM5KPNGG2PqgYj5EzLCTk7Vdg==
X-Google-Smtp-Source: 
 ABdhPJytuP9sBd5m6adR8CdtzFk4ExhT5nbCktJ8Be0YWksMswPsMeTU4JNFb/BtqudYhIYm4KSP2w==
X-Received: by 2002:a17:903:11c4:b0:143:d220:9161 with SMTP id
 q4-20020a17090311c400b00143d2209161mr29217881plh.2.1637275383708;
        Thu, 18 Nov 2021 14:43:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 ne7sm9054215pjb.36.2021.11.18.14.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 14:43:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc-tests: Do not set SYSTEMD_SERVICE
Date: Thu, 18 Nov 2021 14:43:01 -0800
Message-Id: <20211118224301.1607470-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 22:43:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158483

These are glibc specific which comes from glibc packaging class

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-tests_2.34.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb b/meta/recipes-core/glibc/glibc-tests_2.34.bb
index d2d3cfff913..f72be0d1fb7 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.34.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
@@ -19,6 +19,8 @@ python __anonymous() {
 
        d.setVar("BBCLASSEXTEND", "")
        d.setVar("RRECOMMENDS", "")
+       d.setVar("SYSTEMD_SERVICE:nscd", "")
+       d.setVar("SYSTEMD_PACKAGES", "")
 }
 
 # Remove any lefovers from original glibc recipe
-- 
2.34.0



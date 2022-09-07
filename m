Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1D0ECAAD3
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:14:25 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.2475.1662592460543717521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QA1m43j9;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id b144so11316552pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=8T6putfhcSsiiAVzSkSKTJ4hQLBf1VyHQAa8alD+iDM=;
        b=QA1m43j9wyAlqxIGAV0UTtzcOBswLLoN8G1ToZxaBCQwfohcg2M9FuwVFYbQtmMxY0
         MJg6EEL4UHOSTAx7DGe9TMLjY+QlO9oDOD+erznzuFgfeVnpam8FwG1pGPkelRUKdwQI
         LHIZPDy3tjO4blxTAhQYqXGefYWFUngzCZHbQ0xDf1Yso9OyBD+1zSI9+HrmBWmQB23r
         yGhk2zaiXRKuwERCXeeGAStcVrpBqunQlQN4nKKC8n4vIIPTfwII2T7EHOC18745ip3V
         0QTU7x+2Nlxovtk/fyx0vbVy+tjKpyFggGp3OJ1wtZ66Ur3/Cnv0y2pBl1AKxT0flron
         jK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=8T6putfhcSsiiAVzSkSKTJ4hQLBf1VyHQAa8alD+iDM=;
        b=lc+yBo1eoi4lO0Uhbxwgs6gZV1wLPAQQgGAlk/IGbtrKsgNb4FnmFXeF1a7o5KJfXp
         DtSSL1iGG7un7hy9zGz6PfrwaWBi+tiH9Mg8my35ok1R5zeB89N88uk7z2SWOH/YsTQC
         3Ot8yMx8sSNHldaMDM6SsWzJ4JxiCq3AbikL8zJ4UTzBBGgWawvxrrzmzyXG7wAl6E7Y
         xYDXG31Cr7Ey5jJb/xLQzt7KxYW0BzTUWqOLWM8xCdfVbu1bXX4NjoGr8CBSnFJyCHOy
         /4LKERsj9Ea6Jg43AuNzb6IKdXCTh01a2RgQ28O7RX75e/xWW23n6StOVOO3U192cAgT
         o1qQ==
X-Gm-Message-State: ACgBeo27fMCONBEm/la0Z71AI7bgqZh4FV052AJ/JuPkcKofWZ8OvQKp
	RMMHOFA5rBAnXP+7Lmq04Gui2UWJDCCx0w==
X-Google-Smtp-Source: 
 AA6agR5+gk36//OOBFR/oqFxOFFcpv1BaaES3BiYq8lDiL6mI0kKh/1Ho3/2i+vH7dq6GEGEVrFtTw==
X-Received: by 2002:a05:6a00:15ce:b0:537:24ee:cbcf with SMTP id
 o14-20020a056a0015ce00b0053724eecbcfmr5949844pfu.30.1662592459736;
        Wed, 07 Sep 2022 16:14:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a170902779300b0016dc6279ab7sm12867892pll.149.2022.09.07.16.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:14:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] binutils-cross-canadian: Do not package gprofng.rc
Date: Wed,  7 Sep 2022 16:14:16 -0700
Message-Id: <20220907231417.3274392-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 23:14:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170433

This file is already packaged via nativesdk-gprofng and can cause
populate SDK conflicts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 4e8f10c1c4..c18468ad50 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -23,10 +23,9 @@ do_install () {
 	rm -f ${D}${libdir}/libiberty*
 	rm -f ${D}${libdir}/libopcodes*
 	rm -f ${D}${includedir}/*.h
+        rm -f ${D}${sysconfdir}/gprofng.rc
 	
 	cross_canadian_bindirlinks
 }
 
-FILES:${PN} += "${sysconfdir}/gprofng.rc"
-
 BBCLASSEXTEND = ""
-- 
2.37.3



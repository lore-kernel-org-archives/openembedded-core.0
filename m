Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB263C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 16:14:40 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.14071.1636042479729885674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 09:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YSbP1D/c;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id p18so7962261plf.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 09:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qfuAtockHkyRnvTgoNrheleV6xAfFsUiqTdCnW6DLsg=;
        b=YSbP1D/c/PRQqODPSRn2xTS9DCYLNucNGNFCpaVpQ9JDRE+cc7MgjAyGrgIPevCCeT
         2voXlROTD53INTy7Usceew2fzJMv9gboh6udltxjZSMnEVv2D1C7JT2Pp7rjXSODwtVa
         JOJdJX7TrDjeEwFttivqPILvwxqTpprLFE8RT52IgTlXij7utgZtJLnc8CpIXUXC3f0M
         WIP7sHu+jvF5lsWDL6L/hXcDekA/cl56SkfAfsfJsHLFibMB1GvkqxdwJfX7/hkjvu4A
         EbnRuqaXdLjE9tozTmk6e4CygXAPq/8/TATCEtmRquzVbNhgmEx1DTAqbU1Ac+h2Agwe
         X8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qfuAtockHkyRnvTgoNrheleV6xAfFsUiqTdCnW6DLsg=;
        b=akOPlDjk2+ZVNBeRZq8ltyerkmW28PGDow30PGp3gnpqoQtZF+hLsjo2dVEv34V34e
         GVANcEKBFeQvMzcl/a3zEnSgwrP0D1KaKF8SjxWPct2+auT+HWBvdsB5kF6+P1lIDK36
         /uQnamDmCs9SncUkaItWgyak+u+r6CD5KtUuvd4F3WD4TGJXKDiRIWPL6+rCK/4rItAH
         hH+FTgyPbgwtQT+qFKwsYWlXVYSj5NGQy/SOtF2mROD49HgZzvkjzZqEdCgkHEkSkVwV
         0HRaCTpvzPLNMe3zjGtVpyUY6Qij12ksxZ3SnKFnqEnirqHGutGVnDyZb+aSAiIeZcx9
         pe0g==
X-Gm-Message-State: AOAM532FxTyY4lhaJdfJAJt9IJuTYmqjPVO9mPndArfR4aWsyiZq4QEb
	JZW3ekQBxxpEY49zdJPOIOf47DD0gd0=
X-Google-Smtp-Source: 
 ABdhPJzLXEpvNnRLxOXO5RZCVCYf3zk9POEfviOI4VtO+tR1GIwSLOoob4W25YWSPABqCD74pdF+Wg==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr23020396pjg.202.1636042479092;
        Thu, 04 Nov 2021 09:14:39 -0700 (PDT)
Received: from fedora.. (75-172-38-98.tukw.qwest.net. [75.172.38.98])
        by smtp.gmail.com with ESMTPSA id
 g11sm4200130pgn.41.2021.11.04.09.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 09:14:38 -0700 (PDT)
From: Joel Winarske <joel.winarske@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joel Winarske <joel.winarske@gmail.com>
Subject: [PATCH] mesa: Broadcom v3d Vulkan driver
Date: Thu,  4 Nov 2021 09:14:21 -0700
Message-Id: <20211104161421.1642214-1-joel.winarske@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 16:14:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157852

Enables building the Vulkan 1.1 compliant v3d driver.

Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cc71114992..b687f8e4ab 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -112,6 +112,7 @@ VULKAN_DRIVERS = ""
 VULKAN_DRIVERS:append:x86:class-target = ",intel"
 VULKAN_DRIVERS:append:x86-64:class-target = ",intel"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
-- 
2.31.1



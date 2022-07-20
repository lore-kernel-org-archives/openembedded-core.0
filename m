Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6724C3F2D4
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:44:54 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.51534.1658306688169368332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PUUPWvsk;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id k30so22838087edk.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pDoaHmUkuZODaBinpaM3wkCS8xFP8sHvZRieQUcEUz8=;
        b=PUUPWvskPQ7AiqWYzpMc9VtesuowiLxnwT4aSY6eaasjbSHmP+Pbx1yONtZ1Djroan
         80KxgsPBLaL1JOuJ3msQrsyj4zec8B9rqinJnT94vYAWOxUTxLlWHRxXMrT9Xtiqw2GS
         HjNJ5Cpw721yCkyDn0spxyE3ceIWuHSl3bhHM+l0sowL6tNppL+N4BNLFbThbQqvebBr
         M+VpJ8MOF2MNxGmz5iS6r2fTOkzg7hbfTu6G7vjkgeiY3iv43T+dV1Rr7m2czzFZ5gF9
         2rHQPpxJzP78a2FD/mVmTLI37ZhK5FGVpHdrco6KlC+KZLVAJjQo0FFvswDwgVXci6dd
         p6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pDoaHmUkuZODaBinpaM3wkCS8xFP8sHvZRieQUcEUz8=;
        b=5yNrsjwCAoAyHg4gjZAVNni3fysQA3zU2TflfE1x5ePiy4ANj6eM9URDaDWii9IlIf
         nb6WZANvO1p5jEdKw1PF0x1InoUeXym85ixIwPeM6dznYPBCWPFhCGpKyF+og/dLLh9E
         SWdhghb2/b42YNYIU0bvM+d7E0MnoOykhqLMZQVBldxruzHJbml870c+IFCmhTFqJAYR
         p7ZOq/KgkIEFVdKHfM62utCTedv9/aJfRJw+PS3MGxTDeUrue1eRf28qSNkE3eUkJ/pn
         bF3AF1Q+K0dh2GaWoHTlLB18kYeIlgvn7Qjp89/VkM4SdFxzjC3TfMLdqtPok586AYfY
         e5RA==
X-Gm-Message-State: AJIora/+7Ezi/tFbtvlHiv8aQaxxtcSQpWjeCSwlqfyWdq44yYT6m/Yf
	CyCVl60P/MP5N3gM1imdISLqid3Z/9Y=
X-Google-Smtp-Source: 
 AGRyM1uCmJmpi2rU6D2IS2Xo1ftoG8cXdWHCDVBduWFG1RKW2NWr68Y3YicqSM9n1N3xc3LNkcXvAg==
X-Received: by 2002:a05:6402:438f:b0:43a:cee2:a081 with SMTP id
 o15-20020a056402438f00b0043acee2a081mr50322333edc.298.1658306686446;
        Wed, 20 Jul 2022 01:44:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:44:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/51] sato-icon-theme: check for new commits rather than tags
Date: Wed, 20 Jul 2022 10:43:52 +0200
Message-Id: <20220720084442.2940187-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:44:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168295

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
index e2140bfdd7..1ebbf010f3 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
@@ -10,6 +10,7 @@ DEPENDS = "icon-naming-utils-native libxml-simple-perl-native"
 
 SRC_URI = "git://git.yoctoproject.org/sato-icon-theme.git;protocol=https;branch=master"
 SRCREV = "d23f04ecb0328f655bf195df8eb04c1b734d53a9"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2



Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BA3C3F2D4
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:15:20 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.269.1657826117233676101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZfjEI8HV;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id e5so2233297qts.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gl/AurDpzqRPGpYpXWqMQ0+BjB2uMRmhaGrcARmFejU=;
        b=ZfjEI8HVC+bvh6OchPxJ99Eb07dC3MCEY/zesg8kf3ZytH8POS2r95Z85T8mXXAmMm
         C1bGNwPgG+/nug6Xk0n6Ql5vAkal6S9pGaiR4n7yp4As2ELitrfSleJ2LpV0lhdeYSzv
         ZeEFYV0NxF7J462myZPQPlN2DZ02L7ANquEWIi/+OFFUkdKv5UuvNc5pq8hk4N4Z/jbb
         vovnVSGVULQKROWJpZPOwJqoc1XE28a4WBJsF2nn46cMEdLeE4DBTSxcFKNLhwn3t977
         WVVmC5SvY5Kl55NmKf1Op9lee/Jc5s04Nf6SWRXXy5qZv4iwBQWUXYxIZa7GDr5uX5JH
         9Fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gl/AurDpzqRPGpYpXWqMQ0+BjB2uMRmhaGrcARmFejU=;
        b=Ji2RTROzZIhLRALdsx3UY356TpgXkFTGSZT5+2OznMzwQNn/JfkOWAjkp4fmVWUJSE
         ydd5AkE4qb/U5eM6iaQ03LDTk7jVF2GAabeztuZ5jUwe4QsXNtx0eNmSPMttxL1ibNWA
         AY6X5WuzueDYdfLV2/JomHi5lqzapR1tFg79ZOab9lR6yn2hygZV1VCjSKYri8M65I+1
         7itmsfXp/22F7uSjOltwFdV0C+7kTHAhjqSQMgFkYiCFK6SGb55I8PgKQFm+FBR+Mi4+
         pO6tW2OpPa7g6FM55jB6xaRvBbq7JfeZzp2NSIW0DEPcs8KIWTkFU2M2Xl1U2dKOhvzm
         1jzQ==
X-Gm-Message-State: AJIora+DeMFOx8CzhKBo9r7zTbAZUaI2AiWFHx87VjsYplg6v+Ur2Zb5
	Sk44DXK/E7AuVFqEdipsX58EMXrnilrGaA==
X-Google-Smtp-Source: 
 AGRyM1sEHkXJYplVtqcyuyJI59bij1ki1jInC+XRxU3kWgrHB/uDkcxTWTbQlNyAnGq/BBZdp/alkA==
X-Received: by 2002:a05:622a:1356:b0:31e:d9b7:4cc with SMTP id
 w22-20020a05622a135600b0031ed9b704ccmr595343qtk.51.1657826116133;
        Thu, 14 Jul 2022 12:15:16 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a240b00b006b253a6dd1fsm1966022qkn.125.2022.07.14.12.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:15:15 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] yocto-bsps/5.15: fix buildpaths issue with pnmtologo
Date: Thu, 14 Jul 2022 15:14:53 -0400
Message-Id: 
 <5e6c5c4efc533649eeb754502766e42ddf751f13.1657825809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1657825809.git.bruce.ashfield@gmail.com>
References: <cover.1657825809.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:15:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168050

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    a40d2daf2795 pnmtologo: use relocatable file name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_5.15.bbappend        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
index 8d2ec873fa..52aa36b2e6 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
@@ -7,10 +7,10 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 KMACHINE:beaglebone-yocto ?= "beaglebone"
 
-SRCREV_machine:genericx86 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
-SRCREV_machine:genericx86-64 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
-SRCREV_machine:edgerouter ?= "e90573857c176458965737d77b1747be83fe7edc"
-SRCREV_machine:beaglebone-yocto ?= "d91bb88e58c575e7c3b9fb111b6711a206eba64b"
+SRCREV_machine:genericx86 ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
+SRCREV_machine:genericx86-64 ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
+SRCREV_machine:edgerouter ?= "90f1ee6589264545f548d731c2480b08a007230f"
+SRCREV_machine:beaglebone-yocto ?= "9aabbaa89fcb21af7028e814c1f5b61171314d5a"
 
 COMPATIBLE_MACHINE:genericx86 = "genericx86"
 COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-- 
2.19.1



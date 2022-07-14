Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661B7C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:15:20 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.295.1657826115139991989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oEt4KrFE;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id a9so2200830qtw.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f7pnrjpKz9fXXhTqf96ltjJzPf/asgtr/fbbvsjsX2Q=;
        b=oEt4KrFEbdSHwxCh06D6Q5wNvbKvc6LP7KeSDQs8PjU+iNak6dbeoRAPcdQsBgPO/v
         jFXWSKaPsHRM4YE8HM48poXoR4VHNa41VkBamBy28AG6TV1G5rqgj6cp9FeisH1om31Y
         6VM4fnL91EOkV6wy8C8lFH1FnA4uYsF51eyJ6S4y6/yLeWeJfhNJ32AH2W3yyKJ2Qg76
         NcXbm5H7iLIsUM8DaUcAU+/EHc4auAyNMfEaW4g3orsxdea0G0jUmJiBmJ7+zzMv+cpO
         pBgrbB1hYh47hGUO93wI60JTomJr6MHJ6AZb3OYIxZh1M6apN02Fk/C7uTiK4iCjFnvr
         fbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f7pnrjpKz9fXXhTqf96ltjJzPf/asgtr/fbbvsjsX2Q=;
        b=jcDo0LW2bLtxYQyMSzgY8GnQrVlZl7xBKfyEhEpd4HXm4wOnA0BP7ElqKPA1JH5s59
         KJchI+z1P2W104MabuSlV327BwfuzYh6Bhko7MkSc4i3OI0FhZjSP4ca+VYpy97ZIFfz
         hAD+n6EpAzJ+0661a4avuTJiD7Tm/FuRKglvokf3/gh2lgU69FR8X04MvSktwnuYu0+o
         YlpjUgwLdb+GaTWcwvl/79GAPB2sZ/Ukky/oVlbHs6OKiw5V0AatodIqosvrC093pF8a
         TJcn+AYqGFc4t42U6TAfy3NE7kWdY8v1SvkYMmUswdlIlSjUeUmtbDqJG55FVArygilC
         RWMQ==
X-Gm-Message-State: AJIora+azfqIzE9FkqZs7VX7TiVdkfp6VCZN5SSZ3us8QHqabgD5RGCv
	ycT3bX7jJCTR5Agc9SS+Xa7u1ZaElyBdzA==
X-Google-Smtp-Source: 
 AGRyM1utAc9VY4x+Xh7Bi45KOJbyRpjbt4LUrusYd/65NDEgMNaVw1Utwl2zLnJltnyt4rYtrANiTA==
X-Received: by 2002:a05:622a:cb:b0:31e:a798:9423 with SMTP id
 p11-20020a05622a00cb00b0031ea7989423mr9675988qtw.92.1657826114120;
        Thu, 14 Jul 2022 12:15:14 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a240b00b006b253a6dd1fsm1966022qkn.125.2022.07.14.12.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:15:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] yocto-bsps/5.10: fix buildpaths issue with pnmtologo
Date: Thu, 14 Jul 2022 15:14:52 -0400
Message-Id: 
 <7824a11e7e2e1e1f1cc3d26d44a82bc61caccd0d.1657825809.git.bruce.ashfield@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/168049

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    2883e69e202d pnmtologo: use relocatable file name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_5.10.bbappend        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
index bfb36e173a..93466b70ed 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -7,10 +7,10 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 KMACHINE:beaglebone-yocto ?= "beaglebone"
 
-SRCREV_machine:genericx86 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
-SRCREV_machine:genericx86-64 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
-SRCREV_machine:edgerouter ?= "43a7a15cfe433584b6065c2492b2a7f9be7954c5"
-SRCREV_machine:beaglebone-yocto ?= "3651cd48f159c3b2a3a60d645baccc9d34baed54"
+SRCREV_machine:genericx86 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
+SRCREV_machine:genericx86-64 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
+SRCREV_machine:edgerouter ?= "7c9332d91089ee63581be6cd3e7197c9d3e9a883"
+SRCREV_machine:beaglebone-yocto ?= "3c44f12b9de336579d00ac0105852f4cbf7e8b7d"
 
 COMPATIBLE_MACHINE:genericx86 = "genericx86"
 COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-- 
2.19.1



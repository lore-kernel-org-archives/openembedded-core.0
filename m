Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDA0CCA47C
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:15:10 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web09.251.1657826102389827734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g8WERLxi;
 spf=pass (domain: gmail.com, ip: 209.85.219.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id l15so2165547qvo.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K1BrHC14yQZN7JLjbhIUWIoQvuCRLAobdvWAzpecT8c=;
        b=g8WERLxiWsQeJW2I1/Uc9VMoTBIfPrxONLTAEVpJ6z/MJiIvtG2Tv1aERejzVw3kPI
         MAhzELC3+qmE0W73gB+NjGa8zHe817Evsxv/4g74FUCdeJQSklvckrL2fiRO+Lu1T7/y
         rQR33D9+paEOeMzH496jwTl0isM6ShMmbcdf4xsLnM3x0SFojbQ6BKyTyunNtXBH553Z
         JqsqHAk58qdv877Op+cvj2ESEWP68JW3S/vYilJqunhBh6yirrqOQMYxt/GkC+CzM1Tu
         kAT9BrgJRg78Vzn1xqYvPTnIsEQvnP/nC6EXh9ekVL4H7YjsV3c5w/bD1ZcDNvmmiRsu
         4Y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K1BrHC14yQZN7JLjbhIUWIoQvuCRLAobdvWAzpecT8c=;
        b=TPSFNgao7LMo9eofkvXdk0Jm8WdQa3Sa7I3oVsHYPQJcSUE9gXPUsrxPqQIOEu183i
         PgbKU9mQ6agRCyDFUuP4bSlBtlwQspz1oPOUw32k6Al/mu/gwli2yvoutHwCAoC1mje3
         ymIKr9DRAZ6ufiuN8FSeVzxHECpVUqYYEE9f1KVVB/CuNu4bHxJiWNLlPhhOotDSNoIR
         pUXjSdI2yJeBbszlybdwczJ3f/EWmGT5NJrK6egywh6a8kR120VqtvrXbDdifaozCB1Z
         KYdCuYw5h0QMQVRg32G/BbsIUihmPBh0S9pYH9uLxa6LFeBpfKFfCYTqvdqnMF7UVtEo
         PaFw==
X-Gm-Message-State: AJIora/TcoRYoNX96qhKMZRTlm5e8QTe9y72yR2jsp2vvkn2yde7gSAV
	IaEWrOnW2KHvJ9Q9ZibEIoyT4aHBUFxQ+A==
X-Google-Smtp-Source: 
 AGRyM1sLAB2aUS8H5qs16eAM7aQy5KYHT1YM9fyHTnW+UfzLOEQ6ot8CL9EMPK2Ik24lluBKSRaBQA==
X-Received: by 2002:a05:6214:2aae:b0:473:7f64:714b with SMTP id
 js14-20020a0562142aae00b004737f64714bmr8936942qvb.72.1657826101529;
        Thu, 14 Jul 2022 12:15:01 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a240b00b006b253a6dd1fsm1966022qkn.125.2022.07.14.12.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:15:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] yocto-bsps/5.15: fix buildpaths issue with
 gen-mach-types
Date: Thu, 14 Jul 2022 15:14:47 -0400
Message-Id: 
 <fbe86fb0d5e8fa180b1addcba9e3e159cf736e80.1657825809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1657825809.git.bruce.ashfield@gmail.com>
References: <cover.1657825809.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:15:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168044

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    6c085baf1838 tools: use basename to identify file in gen-mach-types

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_5.15.bbappend        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
index 11e78e2be2..8d2ec873fa 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
@@ -7,10 +7,10 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 KMACHINE:beaglebone-yocto ?= "beaglebone"
 
-SRCREV_machine:genericx86 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
-SRCREV_machine:genericx86-64 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
-SRCREV_machine:edgerouter ?= "26de0a7a59c56b63833a55dc33dbf70a7984d140"
-SRCREV_machine:beaglebone-yocto ?= "3ec00e9ee0e41e4c402396425337c42da58c4d6f"
+SRCREV_machine:genericx86 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
+SRCREV_machine:genericx86-64 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
+SRCREV_machine:edgerouter ?= "e90573857c176458965737d77b1747be83fe7edc"
+SRCREV_machine:beaglebone-yocto ?= "d91bb88e58c575e7c3b9fb111b6711a206eba64b"
 
 COMPATIBLE_MACHINE:genericx86 = "genericx86"
 COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-- 
2.19.1



Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E00FC4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:18:27 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.17547.1665559103394896540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fqg3ODhp;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id s2so23296681edd.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 00:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+uEIp3jvCw2q5JRrb8zWyf8kqb8PElnZrlFAd0faKM=;
        b=Fqg3ODhpz7dYyyNL2kHf/Y8Cx/bwSGVPOdIqb0LB9FwaLoKRAgoJ/SzzU2Gcxkwmtg
         63iXS6q86lc8DfhZLez4gzXbvf3BLYaMNGs/ZLLTk0s9jRY2kVyuWf98vwhpaahDbI2o
         KRyBFvUfqnZ62CkDun8Zh2VrNXJhKdxH4ovIvMEMhKx1z+CF7nZ5Yv42w/3rl5z4xQYx
         EXo4bFnQv6VHVtN0ucHBPG20t9PM5qwoAqATKsHQXUMfZTb9ahy6zCrs8B3W9lnn2huK
         IQa1gKQSm0H2iT0uGBdEYXpN651h8xCKy3BMDc/oSSmV0y6XSCl4mzwiCUQwlwsYEKQ6
         G8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+uEIp3jvCw2q5JRrb8zWyf8kqb8PElnZrlFAd0faKM=;
        b=1MctkMDOCWHPzn0WFlPfiIO8CnBoMlsNCTWPCUtaFE2GugCjRWztEBq6gcIfNbfg6U
         O7+HusYE8nW2Lg3ZfwSU8icM+EIWO2Tu1KhMFpOmzrFuc979aew3z3BAIBAm7uW2Kv8O
         xeJPGgZfnCvtqOPnb21Wrmgucd7lwiEwX/5yQaIRweZajVPbyhpRcgyrwsxhbupI3OpR
         fbIS8p/a2t1bkXptwy5tOfOBBPCr9yQPv1Mhk3jDNQGN9f2vdQz+AT1lIny+szEYqB7B
         Wm+sZ9Bb2snE8TY94b5yYkNK47+lKU2PTEWoeph+ZajXQ2McEGn7vpdJHGacc48vQ00V
         9nCg==
X-Gm-Message-State: ACrzQf3tsinNCOuxy7+2p/Dw60Ckk9gTNaN5lfhXpDK1eHj1fot4ZQV7
	dRr4dlpdPZBFOChhs7oILxteA3n4n9k=
X-Google-Smtp-Source: AMsMyM7lonaPhU3Yqu+S/oX49MmcU/A5Pya58/gi+AFlToi72V+uP3mmTvb5w3yKG04d+M5Mp9QRjA==
X-Received: by 2002:a05:6402:2707:b0:45b:8470:9147 with SMTP id y7-20020a056402270700b0045b84709147mr19776257edd.215.1665559101677;
        Wed, 12 Oct 2022 00:18:21 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id ch8-20020a0564021bc800b00459ad800bbcsm10601960edb.33.2022.10.12.00.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 00:18:21 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 3/3] u-boot: Add savedefconfig task
Date: Wed, 12 Oct 2022 08:18:13 +0100
Message-Id: <20221012071813.778-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221012071813.778-1-alex.kiernan@gmail.com>
References: <20221012071813.778-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171652

Add savedefconfig task which U-Boot supports (unfortunately not all
consumers of cml1 support this).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index b2f33e382664..046e842289fa 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch
+inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch cml1-savedefconfig
 
 DEPENDS += "swig-native"
 
-- 
2.35.1



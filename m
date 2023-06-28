Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8457C001B0
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:24 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.7296.1687919422347084310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Sgaz9cVm;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-39eab4bbe8aso3793501b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919421; x=1690511421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmAFciUnDC/WRAPa3dST1SkfEQxCZ76i+/BYUOnjb5Q=;
        b=Sgaz9cVmGf86TNcsHfYqKdtmv3Ex4kIdc6JC0uNoBbldfcANUIMHKP/H5w0WBgApPW
         XECqcxBunZV63UBtTET+bHChZ9OfcpGGKoHq8775AB8l9R80rTHSjVG97WatDUIXmZLK
         HpSgnSR2qltZ3a2mL5NKE2R/qdTQ1ODqTaqwWK2Y+hsk5y1E+4ecXbCB3icVnjmHbyiB
         JJEsZGmX1oqmtM7gh0B+xIrVrdIHONmrdCySoM1nujvDS8jivYDq47BZBoWlRHLO3q95
         pLDiKJQGji2I15lz5ITwAb1Pv4gnmq7Bf/iaw2OquCRO55p5B18QQQFxtSB7SGbJncB7
         IInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919421; x=1690511421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmAFciUnDC/WRAPa3dST1SkfEQxCZ76i+/BYUOnjb5Q=;
        b=PmalIGLl+INzWjCyfrWrida5jUvFAQKFyCyENR03k5x2hNhiqdr7aRGOuCSqqd5g4d
         sTm/jXnrY+JZrEABg0GMVi8xPKmeWkDyJMl5oK/e5rK1+8HQ4iD7Frtd2vh8fAt/dlav
         GdClOnAR1FIRl3qKF5GLs5Zb7IlRkhyWyhPOzVq0K8J6JsAGGUMMX8R8kki1roMdTonB
         mO4EbUDVr9jbY5Q0dmVz6e+KKyFH0ll8qTn9myr6I4qZGZhxbb596CmazU8wQR5jnu6P
         kKtwhmwTk50HIvjSdWmj73sHtSsl3Zg2Qoq0oRTxVl49Xui1GI61y1NWdvwWm8ITeDcY
         33aA==
X-Gm-Message-State: AC+VfDxmic1CxuG3lz1GVMxArIMWSf0xu9GmGXUTy7aK5jeE1/u/avnV
	sGO8GS4ZVcEeDkmjc1c6IJW7JNNA/p1uimUdr+TZeA==
X-Google-Smtp-Source: ACHHUZ6RYIoFxfnPZMxsHsru7BXjTVWAUFaLY4a/E8PWad+qosqgnB5DFkd0Sq3XWjQhuq8Km2U9Jw==
X-Received: by 2002:aca:904:0:b0:3a1:df16:2f0b with SMTP id 4-20020aca0904000000b003a1df162f0bmr7047636oij.1.1687919421285;
        Tue, 27 Jun 2023 19:30:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/30] git: upgrade to 2.39.3
Date: Tue, 27 Jun 2023 16:29:32 -1000
Message-Id: <ebe205b32fd959b3d7281ec95ac7f7cf88e37ed2.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183525

From: Ross Burton <ross.burton@arm.com>

This minor point release fixes CVE-2023-25652 and CVE-2023-29007.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 469c28924ab9debe810e3277b27ad936781e7ce5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.39.2.bb => git_2.39.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.39.2.bb => git_2.39.3.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtools/git/git_2.39.3.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.39.2.bb
rename to meta/recipes-devtools/git/git_2.39.3.bb
index 9fac9d13f8..6fdf1caa74 100644
--- a/meta/recipes-devtools/git/git_2.39.2.bb
+++ b/meta/recipes-devtools/git/git_2.39.3.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "fb6807d1eb4094bb2349ab97d203fe1e6c3eb28af73ea391decfbd3a03c02e85"
+SRC_URI[tarball.sha256sum] = "2f9aa93c548941cc5aff641cedc24add15b912ad8c9b36ff5a41b1a9dcad783e"
-- 
2.34.1



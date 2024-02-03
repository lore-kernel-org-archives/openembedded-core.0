Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76930C48297
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:23 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.23487.1706987713503846212
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G2AiOiJ5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso3044558a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987712; x=1707592512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+QMTD9Br3eXxvusQSKYHfif3ZqEJtSRaNvJzxbGGpU=;
        b=G2AiOiJ53ZaOLutR+JUeJQ8QkS1lih/kmeiKEiXctwrjJG/ENykf8BnAyh1Zuj9l13
         X131i7TJsTuoQ9cILAHy61f5C4POaM2G4LD44Lli4nRCtgsy6EfpBNNCIbrDhclAwa71
         DGjCxu28aXni4cdzshmAdPdWyVXEx+z52na3FSEO/1vCyZGvlxs5jPtg+Km6kHrezP/L
         i7XyD2V3yxwcYaqawKuHIePBeyysqDN6qmNTSeTl8q4PaNSuKu8SYjBSVTNrAjRig8J3
         sRqOiT6JHQT0bkKsh6MilbyemHTqsTBQwiI402As2AM+xR1EN06OGlwz90zMj8gWgUI0
         d9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987712; x=1707592512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+QMTD9Br3eXxvusQSKYHfif3ZqEJtSRaNvJzxbGGpU=;
        b=Ouw2zR/ThPjT3nGkw6AeKZ3uzeBHr62ni8o6TUpEMGb3bPuIMgoqIbvvaeFTERKoBw
         d55JI0+N38dZZbf52i0sc1ku+pSPQyuXGAP0mHfI25mkAfYOW85IvlsE2YmER1RpkQTZ
         DLPtlBGeq5z1esi+XBKuS0w7vF4Xi+RA0gT7lyt3EP1/ttWzR08rXis8+UDEJ+xhqqs4
         j7IRmwPDqTCee3l8rSxJDsGqcimF4eQxTjr1jve6wQXfbo2ndUxbWh4JcIiloye9oNJ1
         btg1Rq0+uDQRD8J0CW75hp0gOtd+i7949hrYjp4rCY4aJGVd9DDe1iRGCK6VB8VPiF9F
         QGag==
X-Gm-Message-State: AOJu0YyBuJuid76X0JmdbXc55qwm/CRoDuuzDnilAu8TwxgrHUin3Amz
	uvaL51nK4jBlJwtcbKIBTeN8nwCu/2XxxNvadPbN25SxgOzDFo1I3szMqFZfFYUXsH5KRLVBijJ
	W69M=
X-Google-Smtp-Source: AGHT+IHcoioiFY8bis001RvV/MzFb6/hemyEJ823QcyA+hWimGY9YsTBaejvG6WGv/DGfcOr161SmQ==
X-Received: by 2002:a17:90a:9f88:b0:296:521c:4caf with SMTP id o8-20020a17090a9f8800b00296521c4cafmr4220325pjp.8.1706987712686;
        Sat, 03 Feb 2024 11:15:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.15.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:15:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 13/15] linux-firmware: Fix the linux-firmware-bcm4373 FILES variable
Date: Sat,  3 Feb 2024 09:14:40 -1000
Message-Id: <205b3990fe23dc05689ef619a4607e8903ebbec6.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194857

From: "Rodrigo M. Duarte" <rodrigo.duarte@ossystems.com.br>

This commit includes the 'cyfmac4373-sdio.clm_blob' file in
the list of files for the linux-firmware-bcm4373 package.
Without this file, the linux-firmware package adds all
firmware packages to the image.

Signed-off-by: Rodrigo M. Duarte <rodrigo.duarte@ossystems.com.br>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7886d3b77200e4488393fa11c8198658fcf386cd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 6667f00612..b1f5247975 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1071,6 +1071,7 @@ FILES:${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bi
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.clm_blob \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.clm_blob \
 "
 
 LICENSE:${PN}-bcm-0bb4-0306 = "Firmware-cypress"
-- 
2.34.1



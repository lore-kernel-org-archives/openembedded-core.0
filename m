Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F046EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 22:23:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.3242.1687299819396592523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 15:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LfZTTyhE;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f9002a1a39so36607855e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687299817; x=1689891817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmBUGkO8ropd1SPvStSWTmpMPxlMjQO6DoiDBu6laHI=;
        b=LfZTTyhEpi0s0hixa/9+s0ra+nK5aA/u/r/OqZUpUkOnlA6cHBmUdapMiCMWh5ch1L
         f6+uGkrbnR3W8XP4aXQ7g5XCtQwyLozJXCDtudZaCPmHth4Mg8b75L+kDkaaNyEg+VF0
         bETzIkljiJk43P2+sXIZ7WoaRm0jmZcvJmbtVY0WbLvK4RhcV+dDpf6iR2bB7bejyml2
         ZD6n9va2YyvRrSPD58EGWkj3IrYCGrXAuYNkLDx1nH5y/8dbV0h157YoCVeK/MP7tSRb
         iAAsr0iDYBAfSyrTu6RWsftm6tLW0FcEPS9/JHcOnXQ2BSCW4rwmzY+vkHJCcFRuRzwm
         2zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687299817; x=1689891817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmBUGkO8ropd1SPvStSWTmpMPxlMjQO6DoiDBu6laHI=;
        b=IFXs9VvWL2UxMeHIC9kIMd4NPzJZybKI2pjdld+qcg/PfobdC8rG7kYoXEe3m3xc9z
         3Hn1fKxVl3pkQzpbT1X0bVQwRrwyyqkuReKL3JuPmdfwOw9QRhWhaSmByFIgvvyXuxr8
         w4ONqUo5bDDegQ+7qOvUanzAi0eglP/tPnE57gnaFTXJvy8yX1xROgScMMX6OSGcaNAH
         7+H52PPYP6uCS+DtJ4nadqAgVADj71QYX860JkIkIoWJ/KSowSiU/aXt7vwj8BsZ/m8F
         P5U1aIhF4ciXCBsXTsZFTxGuApU0NgI/KDpaxsd0lzNtUacnmzh2IjWnj9LZkljtxCAZ
         CJAQ==
X-Gm-Message-State: AC+VfDybm3USQWY9fndfFi9Pwc9TwLhTBRG6BHxuFQV6lTbnPiVEEN4J
	Ww0KC9/+7u/+iWosD5Pye+393tv5f8BCTw==
X-Google-Smtp-Source: ACHHUZ7AJnNmTS6ScwzitZmX1Z+kDOvfRF4lMilRXhuKf1XjllQ8+pJ6WwBrOvYn/9y1V2mxWcKjUQ==
X-Received: by 2002:a1c:770a:0:b0:3f9:b972:731b with SMTP id t10-20020a1c770a000000b003f9b972731bmr1672465wmi.11.1687299817520;
        Tue, 20 Jun 2023 15:23:37 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id l13-20020a1c790d000000b003f7ed463954sm3302928wme.25.2023.06.20.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 15:23:37 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH V3 3/3] kernel: autoload and probeconf are handled by kernel-module-split
Date: Tue, 20 Jun 2023 22:19:45 +0000
Message-Id: <20230620221942.2801107-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620221942.2801107-1-jose.quaresma@foundries.io>
References: <20230620221942.2801107-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 22:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183160

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/kernel.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 81513173b1..91a33bcbdd 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -463,8 +463,6 @@ kernel_do_install() {
 	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
-	install -d ${D}${sysconfdir}/modules-load.d
-	install -d ${D}${sysconfdir}/modprobe.d
 }
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
-- 
2.34.1



Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418EEC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 14:49:34 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2467.1787928564095264973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 07:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=brjxhCPH;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: festevam@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-96723c7151eso330070241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 07:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787928563; x=1788533363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHOBA1/WbGdWimJoYimJLI4GVWmygahJG84AO3glLUw=;
        b=brjxhCPHh2tEmhqyJVCJh5yy1eNOiKa4mjbyVGgiE2Pkj6F40GSwoTHVVeiq9Vk5Od
         Xr8XZbFkcx6GZ7Bon0XY4LtgIu5HfS691KCWS7bS6NO/MQWSeDTuG9CMq/zd5XM9RrYj
         bw4HjxyHnB/HF6tKLilX9l4P+/dywytI9vKVss9rh815xDKWKD1fPKa4BLR4aukVk1Hw
         esEfDITtmn75yL4dTCl6tCjie8Gtnn+p0m4tvDGW+nwAB17sMnTlel39wFexST+uNkOH
         eA+jphlQNchp1UsHYHRNUBtcFU72zNe/pEt1x+rTRF2J3L9n7+Agg9CWGXr2xNvGd28u
         0oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928563; x=1788533363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHOBA1/WbGdWimJoYimJLI4GVWmygahJG84AO3glLUw=;
        b=Qkg0Mb6JBbvaM+qZvxMpbcL6YEM9p/vqGC3ZFLmpLq2GTBLaDscOHUgi6JutVoMnoH
         ZErKK4548UQQrZh7F+KoaCqGXqpPWHJ3nE7E0vLuzHv0RUFxjTU27IK88CYV+rsspNor
         lMA5PzTGKPfZqflNDbuLG20hqduIWlzapvUSAQtGFFmzPx9xrsKmVLLZ+Ni4PUtesEmv
         fsdY3jaKw4np0XkdKiTsvj68b2gWmkJKcVcSX6Ps/0NxvyTdtvHS+PkRsznNH+/fNa0X
         L2bkOR17aRhyG1H8zsYTF/2kxx+LPwoCfsFclerNIo1IHMvAfIWs+whr+2KPve+FX1XK
         JtcQ==
X-Gm-Message-State: AFuF++mBru14hnIEeMnG/2i6+wFHnbf1bKp7BA8eXqKsyiHQM90L9FVg
	P7Y2ju2fP9dPrH2MiPwr/11CNyHLdFNbUAy8PS5+Y+bc6x7evRLZ8j0fJNaJGw==
X-Gm-Gg: AR+sD10qIIg8uxNAQwWSc8RUvIoLP0Y6FGeTuC0PfYMrTDuvKPfVkNhwTqLF469IvfK
	wPQ6dX0SLCpdjOynXZ/JyIr086on866DRAn35gJ9H1DlTb9l0d3ObRm5glr7a9G6rUm0bRBmLiA
	MrAowvJuLyID2sZCHiBRMbBtb3w9dXqyLnblx9C9xjFlIp1siOKD7qmiVNzQQGFlvd2enmTiIe6
	0heSm9zsdWngcqiZToutmiHafdpXWE/BgkqEp1xG3EmbdBF7fNwZkx+nRueJa7XsEujeQJp2rhN
	hJs5anhnTLjeLzvXtLmf9lrX9diKmUPM95m7M3JNEQ4/uzEkwNVN0dNo3qdl549hu0IaY+S60Kn
	BypYnUD94qM4yfv/j2qcI6rc3dTz6syT64pO56x8NxZVlexPFndoKmwenzXfBwCOEvWGTQ0mwAj
	NEh0GI9zafQ77ELv/y4qEUMtx2wWmPQ6yQ3a0goTqYtgYaw0/ji9TNCREx8YQqBt8GZcfDoSvDc
	Ri6o210BB2L8J4TtSPXv5OeDqEkfznv5TVoG/U=
X-Received: by 2002:a05:6102:2c82:b0:785:76cd:ce88 with SMTP id ada2fe7eead31-785962b3bbbmr2233066137.3.1787928560223;
        Fri, 28 Aug 2026 07:49:20 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a802:ffb2:89fd:8130:d331:ce62])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aa2fsm1222207137.2.2026.08.28.07.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:49:19 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] u-boot: Update the HOMEPAGE entry
Date: Fri, 28 Aug 2026 11:48:59 -0300
Message-ID: <20260828144859.364618-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 14:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244549

The official U-Boot project URL has migrated to the
u-boot-project.org domain.

Change the HOMEPAGE entry accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index ba66abd56c..fd27dcf316 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+HOMEPAGE = "https://docs.u-boot-project.org/en/latest/"
 DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
 ARM, MIPS and several other processors, which can be installed in a boot \
 ROM and used to initialize and test the hardware or to download and run \
-- 
2.43.0



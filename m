Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ED6C4332F
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:38 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.8738.1637163337081520460
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U8GxPhec;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id u1so5444882wru.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZVUUYgeKP3+yhJPrGouv7+6LCaQypLr29uxC5vVslmQ=;
        b=U8GxPhecP5knRVd2mWRCIqO/sJBudk06xvPoUpa/yGlkLns78rvC43QI7R+zFTtJvS
         cRVOZSwUtpJ8a5ZoLwPv2k46S5eVZaeQrILmk1H7ay400vPJJmL+xVwP9lhu/3/snDMJ
         R5Z2FuHeI2GPGg8H1qhKrCCsgHg+mEORyRLB7qb7+yMWhbBEPDcs9nMk9sRN/1Lzi8Ii
         5jO3th4UDhEnPo5IUTiJmQwyUiSgbxb7YPgocN+C6QYgWwjhsw9abmj2bWjzrKFf2xpV
         3/oHylEIbUTXDuyBRvYMy79jcERzjTc85hVVJZfH7GbFq4p6UeeHObpvD0IjcKEaVFjc
         WF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZVUUYgeKP3+yhJPrGouv7+6LCaQypLr29uxC5vVslmQ=;
        b=nqY/I9gNaIVTdVZMWKSiN2YP3suNm2MFEX5f9DhxF/C/sWzCjDz4fCIDUV+Q5NpzON
         wWL5EUR0lBz+Hwjs4dh9r/T90iGMARXZVBMsfeGAqcY/DNdKYsGelnjq+utHfIdseZYf
         yZiNj2LBQ9rpMfUfOdxFd2Fbi0hM+9ywN0U0GNwPlKetROWQNB3rLRRz10gMqsna+W0F
         JRX6xJHoG9SL+nEUm0WV52x2sgT7tp1V1cmonRpIjG2W0a3iK0vIM7w6nkqf9d19riYL
         35uGp4U/b8UtI37emk/4oqXLqbOlqMChEuDv6xp+ccfYk2cUpNIj0u/g65FbtPRsn0JI
         qy4A==
X-Gm-Message-State: AOAM5325SlLI+ccrD17HBQZiqF5+4IsuQxCKGtBfdHiCJbZ6tYWL88Mq
	G1dW1s/XJ2yfOfTm5bx06Y9pQIYEuHA=
X-Google-Smtp-Source: 
 ABdhPJw/LSSK2Vqy4KHauBFM2hMMq5xsAcSR18N/GGc9mSNhIM4bbpHmaw0d+ZuJjExQgPU5Luiw4A==
X-Received: by 2002:adf:e50b:: with SMTP id
 j11mr21975031wrm.430.1637163335707;
        Wed, 17 Nov 2021 07:35:35 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/36] libpipeline: upgrade 1.5.3 -> 1.5.4
Date: Wed, 17 Nov 2021 16:35:03 +0100
Message-Id: <20211117153525.257146-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158409

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: http -> https

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libpipeline_1.5.3.bb => libpipeline_1.5.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.3.bb => libpipeline_1.5.4.bb} (72%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.4.bb
similarity index 72%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.4.bb
index ee15fd0644..bfbfdc87f1 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.4.bb
@@ -4,10 +4,10 @@ without needing to involve shell command-line parsing which is often \
 error-prone and insecure."
 HOMEPAGE = "http://libpipeline.nongnu.org/"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5dbf08faf50fad853754293e57fd4e6c69bb8e486f176596d682c67e02a0adb0"
+SRC_URI[sha256sum] = "db785bddba0a37ef14b4ef82ae2d18b8824e6983dfb9910319385e28df3f1a9c"
 
 inherit pkgconfig autotools
 
-- 
2.20.1



Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EECC44512
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 03:51:49 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40497.1784692303463215873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 20:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MiDMXH16;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97715c7df46so466138241.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 20:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784692302; x=1785297102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=luDly9ecMGxjLh3Er6lRjU1Cyp63WKQGXyyEmomEDc0=;
        b=MiDMXH16Q4JoJheWrplOfThC0/Ns/vnHFl9L0NvA5eETXB6mEYp8o4PlyJTKmnCHKU
         3EBxV1HsL5JnpMjz06obnShxazZV3novbLr0x6+hMntBgiJn0vTYkLm4zhvhYhnUqogD
         C4F3uUvhjGI2F4NW2pve08G8Qp5vU2yQ8LUkGC1oTLlgGz03VxIhFR1b8kdmJsF8pTPZ
         4/btQMxJWcdFPGxH0ESQIrb+CuWKDl9s3941Weqaf17aa9jYYsbgBlNU3X8Utz48tmQQ
         2V703HgIbrxUNlkkWVXGmYDEtCRt7+kp+fiudNsPZZ6D83cD+uDUTqqv6yVjlQrPId16
         n+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784692302; x=1785297102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luDly9ecMGxjLh3Er6lRjU1Cyp63WKQGXyyEmomEDc0=;
        b=Sw90nvVvs1qxf0BUU0oOd4ntU7xGA+0Dnn2aAwfTdk6xdSJI5AN+pDufRMlm0kpMCK
         EhC2A3QigdLBgohVeR3QgbeZekyD0n8pZidseLbMih7OwYiu4zNMXwjgRUG53K0HgNbg
         M6zIjbImHX9l6TSVoCSjA3wxDPyEWTCgh37gcUaF6bVv7/P3MqUEhOX3F5M+uwVqYPs1
         B7f9LQsSES/hl7oZ7f1ZsNC+EHqVEdqCMM19mfs/j1k2J1eNl5Az1xD1TvGsfz9V4We7
         aCu4LXYtTMgZ9oMvjmag9sKIQW40ZI/BOm9sFGxXn9FN/H1c+2sQeeOcx3abKNgO9/+H
         W82w==
X-Gm-Message-State: AOJu0YzsbLMs024/H1R+//kn9JUZlBw63Uw1ttPePEpmdfhafUYMjMfa
	+RkjCmSLF4/x0oiZe6lbM0S8aX9a6i7OHPbdVSkuM5heEHslF6YlBk5g6xK/7UB+
X-Gm-Gg: AR+sD13dzMK3mKGWhC9OjgzlCAJF+hSnLLR4Gzfct8GqW3cFeTbR5FPFvEVtrIR8liI
	MF11F9wg+tnTLUsHz2ciGMhtjpOJ4VvnUdhgvsYiWfOrUbGy2Gr7jCWhMupnMeWoLR1xwPfrrjR
	/DF6SPZA0D3+G4lTkfVDxSgHlv/EbQImYeT9uQIHPQm2ptSkm9TWJo2PUQakBspA1V56jFNGRbZ
	ECwlfIvlFuA2ufwuVnceURiW5zwww0w5sJz8cFEuRHcalXDbx9mjiBzxmmIsQ6TakEWK587nbLO
	A5BcJ+U7FwKBx8tn4gFMqsPBjXX3JKyY+6kjyr886opKpTBqIESBFUicrSdBIzZ/24fX6JBEH7B
	0X9MCQss9w0AZx+cf/OO7OEBYd3du3o2hPDPR2GDbyLD7VuG0oJyh8FX6OkhNzB9kNuxHLb+eIl
	/cgOTroQxNx9bqo03dXe12NYyXPods3y+WikABm8mT9EJxUmmU3pJRVKg2wLlFb1qim55JGZfaM
	DlmCaGPsEQE3W2PiS2eZbgqgYwQUKl8bYYJCY1e7QZPfehQeRooForcYh1Am/FeFBE0/graExzb
	GzY9EgvuajPy8VDoKdiZx8U=
X-Received: by 2002:a05:6102:f0d:b0:744:d5f9:ffb1 with SMTP id ada2fe7eead31-74753630323mr6830931137.16.1784692302228;
        Tue, 21 Jul 2026 20:51:42 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74ad320c9dfsm1645875137.4.2026.07.21.20.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:51:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto-dev: bump to v7.2
Date: Tue, 21 Jul 2026 23:51:38 -0400
Message-ID: <20260722035139.1349872-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 03:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241581

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Track the newly generated v7.2 branches in linux-yocto-dev, built on
v7.2-rc4.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 883b4e3151..f82f3c326b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v7.1/standard/base"
+KBRANCH = "v7.2/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "7.1"
+LINUX_VERSION ?= "7.2"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0



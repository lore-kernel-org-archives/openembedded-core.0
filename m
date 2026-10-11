Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE0CCA9ED4
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23560.1791708066535804730
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ECNFaKuq;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso9941515e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708065; x=1792312865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=45PCZNlExJGv8UmAX2kDETfUtaUmYHSPztKGbsZtDzk=;
        b=ECNFaKuqesftxZg8U5edsx3fxrdCkSsTSdHeUquf8vusf+E214Q2c6OuXcBage5W2W
         zjig9TmnhsNIV9BaFXzUkSQaNCE1v6lsai051MLprnMwSmLR1EinG18hk9idtbj/OYr4
         nG0U+lzPenxSE50ofhYDrzLk+yOOQYwHMMr24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708065; x=1792312865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=45PCZNlExJGv8UmAX2kDETfUtaUmYHSPztKGbsZtDzk=;
        b=WQOOw1jysa2bW0pFViK7uNR/5JjIE+uxMMfWqVfn+/8PYe3i7m5h7nfpALFSlR8eiH
         goTnP/vl6ABlLb7cxp4aJWsIhKucYBDeEtYIkpuSeib7ZpM6kSbemG36ZPUPLuzn+JD1
         56FsG3roBDsf28dloBIV7nfaouYApQnB2N0Wrc0VqUxBw07Kh4waHDAXQwH+LVQiB4/3
         xgAi5tVp0AfiN+20dSzXUsjVBxgHMSg1LqzdheDw6WbTLR39xA4Q5zwgWAbcsi9XbuMX
         2VRyO2Vx0TZIZV3XMdL251ugdJDE4BhaVr+/W/yOI4DJ8W17Hk39CdTvDA3H+UlCjKf2
         QsbA==
X-Gm-Message-State: AFq9FYLZb+/9ffqbRBbWdpKPslShwwDbYIwOVJphMw8dwR9Bh0t9joeZ
	rteEkcw0d6wcnh5GAs3YkDenfNcqwcHtNa3mHqBSOxIq6RQYCGj9i7yyTdyREDMyMNrhxbupJa0
	P6LZnnyM=
X-Gm-Gg: AYBFou30fiAQfnSvHi+mDZNrZ/+Odwaeji+/taKzQjQeS8pEBj84bNDKEWmfcNWRYgh
	1NxJjVvN1vVLK6laSpQOBcCQ5VX6VycK3QaLDiznT0RmweCfM+SAz+tDED/gL+BC0vRxNRwpCgY
	IqBxbHE/dmjA3o/bgkiTNrE8GYfDZKxqXuM1QNT8UcjXB9yt1FxtpEiHGkGjgKvnLA/mrYEqjOP
	26SoBDMMcJ5uHvlEKoDgrfzsHy4n9q3Y1p9NC2evNnYaNOYa+3Wp3ysaZ9R5Mi/BZSunFMKELLb
	1zAVSxnT8HsAJk4s6Gane+bWjV5rh26zuebDFxc2RSVgLJhzKLUWyojh0mPBMdIWcd4qiCCWLWz
	veZx85U6u5yO/Qah+ycc5IWH8jf8hfMESApnzRIBQOpd+xkruQQrVdj4o9WjUDhHRUM4UZB7+1K
	LvOtLb5oAk/JozxcFFjwn9dpYs/YZEzK6ASGhEgJrOfEfselPFCfA7nGzUwGyoKgxfVozw7jYSt
	u7Myj1gfgveAlmTKS2eTe0DACSdfpM2REg10wag9b/QawR3i2Dwws1p4cSQEhLyMSqA9YWVHg==
X-Received: by 2002:a05:600c:a00c:b0:49f:fe90:de63 with SMTP id 5b1f17b1804b1-4a18e4e0a3emr127533485e9.28.1791708064760;
        Sun, 11 Oct 2026 01:41:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/60] tzcode/tzdata: fix upstream version check
Date: Sun, 11 Oct 2026 10:39:42 +0200
Message-ID: <836c83e2df95b50485f0911b2e35eda227e2fe10.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247518

From: Alexander Kanavin <alex@linutronix.de>

The webpage no longer lists tarballs directly, but the
actual directory with them can again be listed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1486d28e70af2e297ac0a9650e782481beaa16bb)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 47f9ac2855f..a09da2617f4 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -14,7 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
-
 SRC_URI[tzcode.sha256sum] = "b1cffc3ace4c4c7cd0efba2f7add86ec3d0b79da48bcf03582671fd3c8feace8"
 SRC_URI[tzdata.sha256sum] = "e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4"


Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDBFF55124
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:53:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19046.1772923991411922768
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OPhlPHpq;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48534237460so3103385e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923990; x=1773528790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hr+ocRH4edyFsjlxf5iMqDHJFUSMtSMGbAQynXpMxvY=;
        b=OPhlPHpqFNIvuNhNVV62+7wfZXEXhKRDtFIvL3rVMWVbIFPKWm0sAp46vyXV7EYEOY
         oL2MznXCbM1jINRO8sTVmbM9n6TgDhSw/RxInZQGMkPtk5W63xiYVVNFO9xIGveQS4vJ
         wtKqAmSaMrJE/zcm/h+/D2WAjg+yhWpfYojDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923990; x=1773528790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hr+ocRH4edyFsjlxf5iMqDHJFUSMtSMGbAQynXpMxvY=;
        b=mmJeZ+7CJ3VDzVAzsLbPinbr9jzEI8AeFLWZPbIxStnc68ZvXShNm6XarxWI9qzGZA
         iPLPMKC779eWOHEzoUJm+lno0/BGDShTNfzsjC0JmpwuUjcHXurAqXuYuZTi4o0hebF8
         n1SWYRJJL6Cyn9iirtSrjC0v+L+TU8Zi0c07wgIGW9DfsN1s5eDoP7eIPBmQPN14UZKx
         zPwSOJ+15aACGn5+mRVO8K6EKESGhbbRpmVccmJgk+tmg313qmTARxeTT0IRKpuYuvNH
         gZ6TWuZam9+s0Byo/hgL/F6PR2jbgU2ffnQwLLJtoLQrA9N0pj2T2RqTxFywYz6hYZQI
         NrLA==
X-Gm-Message-State: AOJu0YwSeOpeSAQS7f50UYxHsiFVBVgK9MKssa4ybmLIsZ3lyDJfrAuk
	ldjcpXo544zHa2zBAeZL7/8Ssr8VZiGmeRXEK7+gDtrA0LJ4trbo1G7LdGJgxJFLAz01VJtwp+Z
	V4ruJ
X-Gm-Gg: ATEYQzzehJP254zbqKSz4Lj/krOFw/GhKJumJB9J6LzGdiWg1NdYbmIF+xunhzOTNJ2
	X81vIUO7GooANKdNuykPo59vpa3vwLTKr3P1W53Hnrc4UlVxHhdL0CLDyAB6YjnHwMCW5IYwHBP
	hnB3YJDZ3MF3UAmU6GiVvqFt225NZIhYXVSQHx279ajE5fP5dIuianEcwr/lzStgfRsGtuGPUDy
	QG8Zn03MaZk9rNj2SQQZ767j+ULwgN7RSli4L0/MGAIDG37TeVR9FwOCorSLWYk2t6kYwAGKN0L
	Q+GiSPtPZvfAUA6DNDrRgoNg247z7Fa4+r9vyRsOIDWR19JS0q0s+aPX/yr0CMVGehKzYahvgNQ
	5VP/AkIYeI0XieTkOhZjIorHVKMXmyHXDQO/VpJ/X7A0kpVu0sM0syrkgv6GPqki3QTFBJkwAM0
	9pL98aAzlqCpA79YW4ET/tJowq6t+cNDdzyM5R/rZUMrDko4xq4g0qTdswsGbRqkSWkly8gMTLT
	lpjo8RcQwyE15DfhOXZ6+KIcVo8romdNJD2Iw==
X-Received: by 2002:a05:600c:a00f:b0:485:379b:57bb with SMTP id 5b1f17b1804b1-485379b5d88mr2654475e9.3.1772923989609;
        Sat, 07 Mar 2026 14:53:09 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.53.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:53:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/11] README: Add scarthgap subject-prefix to git-send-email suggestion
Date: Sat,  7 Mar 2026 23:52:26 +0100
Message-ID: <45852c240a708ef49fe9dec1b3a385385c5bb4ec.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232634

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.OE-Core.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 687c58e410c..e85092ad825 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -22,7 +22,7 @@ for full details on how to submit changes.
 As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
 The git command to do that would be:
 
-     git send-email -M -1 --to openembedded-core@lists.openembedded.org
+     git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='scarthgap][PATCH'
 
 Mailing list:
 


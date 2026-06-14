Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD37DCD98D6
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105035.1781424207719244607
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ibTXQAl7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b9318997so16289095e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424206; x=1782029006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJayPPgZ0liFtKYO/JKdCSqnApXGg1Kbp0xq/diO+Yc=;
        b=ibTXQAl7LYkpQpHJvtGOIyH51ChzRfNnXCg1lstp1ivHaxwdPK6ce9LCCGIGJIFYzE
         tsB7TDW3w3qxf5TW6uvbnVsVeN3ioV/yjCPrIIeAgxbAvFAU4UnL7JIfAImboiJo/fyt
         +DIWtn0KxwGCe7agrHQd8igey9dKduhlmAAc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424206; x=1782029006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TJayPPgZ0liFtKYO/JKdCSqnApXGg1Kbp0xq/diO+Yc=;
        b=IvJKnmb9LuYrE0PNQC5nJUgXaklBl4KJ+1aWv0wTUDJFPHtzHAJG52x7ftMC8/XE4F
         iWW+wyqhh1tsWpcYKcRz6oeLimVaf5ScUoj/PVdNBy7lfyhB8W3qyT4TO4lJB6f64Ge8
         C0qh1CqQBrrUJyuXHp9LiTsUAlNbVX/3bq6T+4kb+AGovn6CY/mCsGjyvr4j0N0hGapW
         nHPY0EZJLwnPFXXcBmRBz/rka+a5V5X2+Iufo141UmawDdfgYGvslPROMbrdaEPzl7tx
         mAkktJqWkUQnb1ZF6OEJFw/MY1KhTT8jd+B+s7hmLo2SX6N3WUCzPe7LGR8YnxOGMI65
         U3xA==
X-Gm-Message-State: AOJu0Yzefg1OR4h2KWYPYzNfqHLH1Msdeu0VXT/eaTZOCmVTssTNL8zk
	mnWzeg5o+u75YTKPj37/tpVOySLniV8y4qp1xPNPe9IPOT/Ba3/hNA17hiYk/1MOSZA51UYJM4c
	7wIdv
X-Gm-Gg: Acq92OGkAz+UtSLUEVnKnUQxerE53wLBmOuPkCWld6hfMqVbiJqnEhHTd7FLmxOYwSp
	g4Aca7xM8KkJiWvk1aVg321mF/c42Dpf/s0Pc3IBUwA2enET3ZdGC1S6UENV9tWFGwfpu2zLN+N
	62MyJhuwcxL9xMbkRt/tVL1lHY0001bwzVErK2E+e12kieYkG1TvrxyOAXIJGqhcflAdKCsT5Im
	VifNAZMttLA4Ik/IuLBL60oad4AFcLXqEi6I2YnQT9FvWpJus9rAoPD0JisP060x6TGuw1ax+UC
	s3OGIDWeD16vuw+4xIj2oQDbj5qIA0+/AKm3SaO3hNCxtXhOritnUR+dx4DQeA00yoSmohWL2DX
	pSWFSNSAA4YGiZ0g52oqD9ArkywZar2gjlQ63YFwzvw+xSI+UQml13Pkp5IjBTiEOrrt+o4TozM
	yl6q+RWVdcXHl/FqIwqia3CNgiRAVBKS6SE3Rr5VyDTmUohJYe5cMe
X-Received: by 2002:a05:600c:a06:b0:490:e1a6:45b6 with SMTP id 5b1f17b1804b1-4922011df21mr73910195e9.20.1781424205966;
        Sun, 14 Jun 2026 01:03:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/56] stress-ng: upgrade 0.21.00 -> 0.21.03
Date: Sun, 14 Jun 2026 09:02:21 +0100
Message-ID: <20260614080307.4017177-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238694

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../stress-ng/{stress-ng_0.21.00.bb => stress-ng_0.21.03.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.21.00.bb => stress-ng_0.21.03.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.21.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.21.03.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.21.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.21.03.bb
index 2bfb9f32c78..cc563f636fc 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.21.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.21.03.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "19d2eea10269bac3d721701728b7bf79950b7f1a"
+SRCREV = "f882a7540accdaa38f15474594b7f0339d5f7472"
 
 DEPENDS = "coreutils-native libbsd"
 


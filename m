Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024BAC43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156326.1783358261622752750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JUW9sHPK;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so17682695e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358260; x=1783963060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXB3w62LlV3NAGKEEyjiAp78bJbqX0kFiljxvyUefx0=;
        b=JUW9sHPK3Mq4hDcsmxCnlttVR8WSiCTOL4E+WxGBiD39H59Pb/FBUq5LFwgEY7mbKu
         3QE54cUEwkA766nhcj1zPdneNY6SUfuib5Zfn+K7mmTGqqZdsckOvGRuJHJ/mIXN+itv
         bheRSx/DdR4qzEFI5iVS5ZavPt7HlcrJ7DCx93vY2/BwudxQ2TQqqFs0jxL04yO2Vgji
         Exi58bON7fyGp7RzZGbD/IDG3d/EHfQXv2b2vqphzHoawNDPpKQGq6USuE1KNJYsq66y
         hVrtvX4bJX+xE3eJ0cKFpZirv3zwi+Du4H9rpoj0FlftkocPouY6xH4OqJP4bKF9fygZ
         SB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358260; x=1783963060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXB3w62LlV3NAGKEEyjiAp78bJbqX0kFiljxvyUefx0=;
        b=iQCG11xakmV2q/4kCSxprfhoyrI+7YEWSzaDmE6U3GLt/nbBh/cT5LFQb5K5tTmng6
         5LB5TGsej8KZ4x7bNqWZsH9giuCBa42PEIX5a1EPX1S2aOznKR7P2nDQ7Eb5W5zW7YQD
         N+08Pxf4xBkA58+SkeOTW83kgOy+Fci4i68SPITuFuw8STYa+Hk0kBIRvmbPycXKdCaz
         VGcqjGO3o/jX4FB183tzW0Am2Ar/dT8zQP2cD1g1xpX6nROo04ODteBbJmOPykwE4Qs0
         Zo7PulsWLeijgkfx9jDyXW7e8Oy9y59hGcdvVjtIm0xxzhHSg1LGJQVt+/mX+OHwdrBr
         Ex6w==
X-Gm-Message-State: AOJu0YzlI5CNRr7xUdUqeFZPhWannXAt59HzSz1+aZe0OnF/LR/SE/10
	H37o5w94QILxi7U4uHvf5OJ80oV2eKEM833+3rtcdaXSWWp4rdHRyi5fg40DRQ==
X-Gm-Gg: AfdE7cnO4yVgRjP2/97WeV+d7d94G6BzMEiUrsDyAC4MYZSJk+9JaOocLj5RhIRne2P
	KtaHPA9nqwa78eT/LovTq9zGivjfbrxP6PhIwuiKsXPDKCSpriTiKT6w/+9xMczzmpKG7REYRq7
	uW2UaZrn4MXfShnJrE/0MII8moVt2X+dFGLxhPlkukYqH644X7sLcW87FDfYhdGpZd/LndytTxp
	UzZqVtLH/kyUq9xinU4DEWkjdgKIsN/eG1Th4YTD1PWsTr1BVDO2w4vYwBF4tjeWBdZcoh135qQ
	0nTcs71x+Gibe1cQG0jTjyzRSzgAq+pMoXfnyvAYJUPnIx/YYvDagGVICG22Mk8pZmGGXHVCNhC
	Qz8NQ/XdfXjwTFUvZTdb1vncnJQpHLOVcNgSXTcY1ZeZ518J03irT2/wVS6kAZoRF7SY0omSlU5
	6VyuL1ULyacUxePaXTKDxY6T7WPgWjc14zukjx+rAKWBjEatkD
X-Received: by 2002:a05:600c:3556:b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-493df314e83mr11630725e9.16.1783358259830;
        Mon, 06 Jul 2026 10:17:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/45] ttyrun: upgrade 2.42.1 -> 2.43.0
Date: Mon,  6 Jul 2026 19:16:54 +0200
Message-ID: <20260706171701.70536-40-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240326

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ttyrun/{ttyrun_2.42.1.bb => ttyrun_2.43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.42.1.bb => ttyrun_2.43.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.42.1.bb b/meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.42.1.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
index c9dd4d564d..74204013c2 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.42.1.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "77083b1cbbd463a25cf1a94fc026b5401575bc5e"
+SRCREV = "f85c8ebba0b482e677de1f2c4d8b67b588fe654d"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.3



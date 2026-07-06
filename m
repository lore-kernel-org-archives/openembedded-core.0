Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374ACC44503
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155317.1783358255274952363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nyZqcOX6;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1371413f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358253; x=1783963053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jW4n3sq/lSKluJij0rOyfD/CynQCd5Jgw+H72ueprWY=;
        b=nyZqcOX6iJoMW7BCjuE7Be4M5NrXZCFGK+LNSd6Z6QtzKAz07GDukGkkEnKBOV+5qJ
         Y9cJaNRqBEIFi7Qba9PlMlQwSY06d7X/rJOrQUlJ60sF57s7DFBfPVsARC/1i0cEv5si
         7etYVD2gLBvQone1ib/IWwCIU3/xTachYBpBrPwEKHUNOwQicTe0kTUk5Q/5yPy6ZoXv
         IaAlyzhQAEkEPXZ3FJuRXQeeG8eTFDiJzaGBx2w3rKZGhNO1TRMtYiDRM/qeJMdOhIl2
         1YosLpI/lfZZ/Qou/pp+8/uc47hg15PDnPysqg8TSE39F99vN9cR1cPwKc9S5PDwDWSV
         2drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358253; x=1783963053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jW4n3sq/lSKluJij0rOyfD/CynQCd5Jgw+H72ueprWY=;
        b=WUDn1/Ei2g4H3aMpXzPPoVsWZKgGM3ZkvqX3QzcmPkwsm0ELDhS0AY4d+gc35hD2U4
         pzwlSNETx2EWaZ+y1NgKnZo2pL8DaWzSMBBBjq+DSNtpcrSSqU24ItySB1WNSCA35XXl
         NX5C85n74B/1HPVcq5wdeKK0ewv9W9LxhX6jV6G6XU9SYmrBswfl14m5IO6NGrOlQnGr
         SwLXGunvNOG0DI9qEMaY2aICbZiOnM5ymDf5yT3s+3B6A9Isr6/ShmXOn0oYsjztHM4Q
         g5n5j4mRq5gZv8RoDDXvEPwUBNesXjnhvYJDf5MV9I8UbshBLic8Gfz6zomZgNJ8BlCd
         U81A==
X-Gm-Message-State: AOJu0Ywrp+7/yFNKcdK4JVWiDAmzn6JFyWtWzuDcyULBI0pg+TN+TzAD
	sYOHuI/mAL3KDCCp4BStoM9v1G0D/yWNNZng1xWXjArkXWaBbL6luUKJkKxJaA==
X-Gm-Gg: AfdE7cmqdR8X7eF/e9qxrEbAp9y+XhRcoyvcQea+We5j3wmTRS/o22s6RPAbKwEPNm7
	RTMqF0+7bOjrSlCIhN66T0qHHkWPMyAfkLukN6vztnRR+vYoVHrKqzt8SZe9zSw4uc/8OajQnL3
	6sDgPM5bXBvW19Nzxho7U1ar3N/mDxvUmQalRep6H0S4d2Gqs0dXY/c96pADGZLwRliLU82dzI5
	K7pgFK8441ZEf1YV2tLGYxC401Mp32SvFQZsg/RbNd8RRIlhIwrG8UAT20NgTtw9p9LR7kXeFvH
	TqlJ5j4fFpVZYi8vDDQ754p0YsEJVXcOCMawQaeJnvxG2qyr7z1fGnIkwdXJPOzPOzXyrsgeOex
	yVDE1rDZvYIxVPgB1d0wUfHvb1FiXH4yKuvC3rhT5g5qPtOHqMeZWmOhaobmZZEp43iD/9fMzXw
	DE/95aLFUmJBnBHJv0MtmRmQFs8Z9ylBKBBBG9PSPXz+/a0dSr
X-Received: by 2002:a05:600c:548b:b0:493:c337:db0e with SMTP id 5b1f17b1804b1-493df080c83mr20118035e9.18.1783358253385;
        Mon, 06 Jul 2026 10:17:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/45] python3-vcs-versioning: upgrade 1.1.1 -> 2.2.2
Date: Mon,  6 Jul 2026 19:16:46 +0200
Message-ID: <20260706171701.70536-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240318

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-vcs-versioning_1.1.1.bb => python3-vcs-versioning_2.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_1.1.1.bb => python3-vcs-versioning_2.2.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb
index 4d2f5007b4..300284e4c0 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "fabd75a3cab7dd8ac02fe24a3a9ba936bf258667b5a62ed468c9a1da0f5775bc"
+SRC_URI[sha256sum] = "4ac4ded78720cdb4d0291ae58ace87e1e9201912e1023f3029c6cce5c9152cfb"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.3



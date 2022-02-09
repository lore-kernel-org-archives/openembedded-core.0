Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427BAC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 21:21:20 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.1384.1644441678977728524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 13:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BNfQZ2oz;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id p24so10780943ejo.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 13:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ySe6B7CM0dnCLF4ItpAqpIhRMnphmv43RHp6VptNVKs=;
        b=BNfQZ2ozB8Qwmy1N1qOLH5ZUIdHLRAh3ioMZ/YMcETR8qi5M47BCLwIRGajh4bb1e6
         CZOoAEPtQ6CPc6AKPT2uFsDPXxdsF8r+Ir0eF3xRTc/RGWFwmRWYD9Hz5d2o69zJNl+t
         dXDAftg2pcgwphGeMitRwe7LvwVrEtf5GFZeQiOUVTHvyQSh+NsJXFUi6pucStVHF8z+
         HzKSpShRA8WsqyMXLqJpOIj0v2398jjgyxkqIXqhcKv6oCbf9g+pGS61LRColdcPhboE
         NQkYpKQnRZ0Wqh2TE8cThnI8chA3ca7NYPjcfwtZpDdSpNoIWSy47hYxThixpQdBNSCN
         fEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ySe6B7CM0dnCLF4ItpAqpIhRMnphmv43RHp6VptNVKs=;
        b=AOCWy2zCEWU6cohGqwKX1AtRy/aCx6Yw5OHZ5xznhYLLzUHRUQfshZ8hlxRZ0MJSLS
         W34qJM7wEU9fM8tNTenDA/auBagxfqkwH8HqDvQMcjtR+3nq9TXLX3wiB5wrkVZG75U7
         IL256W+PsIc9SMMyq+z8e7tATBf7jDYjIGxA5vAbWA2UsQ3+9Txv5lpL2IBvQhoAtF15
         pox9le3oo4x0/4FZHL5mlykptzRluMH7iJvHVdUsPXV3+cHnYlbH0288ohK/yvk7tlTS
         bJvIxBizwOdh7+ikkgljUxlPpHSAR8sGqPPwKiUdw2iIFJP7a06jWdeE7sVtIS9wGGfh
         H13g==
X-Gm-Message-State: AOAM5305d8ghZEPN0puEm3ltpueC8xHkpQZDI3QRw9Z0h0S1HGoedHTR
	AhZSb4a1Xp53dxeB7sn7Oy/oTonRAtU=
X-Google-Smtp-Source: 
 ABdhPJxlh6hiQpsFR2jiJbIcYPss7r3eIREoUJ4LODaAeNcr1cc6RRCN5yyyhP3EoUjwu0/GCK9Bmg==
X-Received: by 2002:a17:906:e8b:: with SMTP id
 p11mr3706845ejf.237.1644441677299;
        Wed, 09 Feb 2022 13:21:17 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n25sm5331026eds.89.2022.02.09.13.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 13:21:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] wget.py: use a longer timeout in checkstatus()
Date: Wed,  9 Feb 2022 22:21:09 +0100
Message-Id: <20220209212109.363516-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 21:21:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161590

The addition of 30 second timeout is recent [1], and has
proved not long enough with the AB server when mass-checking
for sstate item availability, resulting in timeout errors with
extensible SDKs[2].

[1]
https://git.yoctoproject.org/poky/commit/?id=2c46245f449d2716566ef668da0bf48f2109643a
[2]
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/4710/steps/16/logs/stdio

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/lib/bb/fetch2/wget.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index 253cabce75..2a7592ae5f 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -366,7 +366,7 @@ class Wget(FetchMethod):
                 except (TypeError, ImportError, IOError, netrc.NetrcParseError):
                     pass
 
-                with opener.open(r, timeout=30) as response:
+                with opener.open(r, timeout=300) as response:
                     pass
             except urllib.error.URLError as e:
                 if try_again:
-- 
2.20.1



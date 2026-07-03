Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE83C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88737.1783067399378030882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gwjHzkX+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c1950518so7178705e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067397; x=1783672197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Avpi+Ja0MrIB1ksYwMBsWMf+b0nLKHoZQ4qKdfgnU/0=;
        b=gwjHzkX+Zzz92ikiDR8pMz62xfs7YYNRA9e9ubQ4L7WAmQM/IoVbjjk0/93a8IO5D2
         22BvMz9BTirEqkZRbFK11u1KPynCG1vMSYbiQko+slQFpXkX7un9HYG4r3+ZAOoidnYD
         SHoFtVTyrlGaV5oQGgdqr7YE5ItLPHhYV9ZrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067397; x=1783672197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Avpi+Ja0MrIB1ksYwMBsWMf+b0nLKHoZQ4qKdfgnU/0=;
        b=hjuizfFdIsF2Rjqr/JPEsTwKcTiCnl8vCk44cEwdXZSmzk3xPRfyjJ9IPEKVqzzXDK
         gTf/im4/Ify3BCbudNlkgtT8+lU+jGwiL/ziIhFG8qUCydsjHZEUe0aE4K+oqLpGF5c4
         UijM1hXCKuxjjWnHKp2rf4wpbngP8t7EGQmnCkxodrOaCgiPFUKmcsbOSNfCfLFzC+gC
         trPvdAV/spv2uydozab+ztTfOBCVuUMERuNzFsp3Tw0yPfcsD0BWsuGw5fi64g8Ua4L/
         IJXuo8A0fHu9hZRqYIXDSx8m5KleQe9uO45jHd83M5SdSNvNQj8PxOMmONqxut5FwlsZ
         JFvQ==
X-Gm-Message-State: AOJu0YyXFaXYfCXqvfgMMr6Q1VPogCtbtebgR5IO1y+vtJHa7fHYhEc0
	YSQ135rAvt8C2SaLjMxR3DhuBAwEr0Y7nHCoS4KaPufqSHOibKRzgwzvR5TSqLxaspeF8uk1Rr4
	ndcDpE/0=
X-Gm-Gg: AfdE7clxw/cmbPM4vNGBKgC/fBnnZ2fi/igpe+IXen6wFh9WBHORh8IGqlbCDcBzD6l
	NmX0AECHA+MWH9+zBuuWdsmbi5ayWVLIBnDpSBUZwWiM0z6cPm6scNI9yO6lzEb2n4k3fDrPDGh
	8N3TtYKWu396z+O+c7gYQKd8+D0VVnQFlEkKgPMAROKGKgWy3yZCiidxFp69VDn9vtbEbN3pdLY
	7VJi8dDQHvo29DBWd0oTfysvZV6Qb8RVtbfWJkv0RqavsI0TeyEHh3ytayybNmBzrIgnNrIHxQ7
	VnaGMADaO9h7paC+3wDDJe+isGnC/UJmiAh05HjF+MRWUoWgCS35Uqsz8/jXsru6QBBss80eouB
	KQENLtrEH3L4/9JUX3F0njSnwAzRYWU5ZwBjnnc/plo8IgFrr8/w3epf032hd/8xvGlZWSxAUTJ
	WPZ9wkOWFxN0eeyC/wCfW0epDc9gbencWMOfe7E3kFOg==
X-Received: by 2002:a05:600c:4816:b0:493:c8bd:f822 with SMTP id 5b1f17b1804b1-493c9b44411mr27109805e9.6.1783067397503;
        Fri, 03 Jul 2026 01:29:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.29.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:29:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/15] hwdata: upgrade 0.408 -> 0.409
Date: Fri,  3 Jul 2026 09:29:41 +0100
Message-ID: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240083

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/hwdata/{hwdata_0.408.bb => hwdata_0.409.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.408.bb => hwdata_0.409.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.408.bb b/meta/recipes-support/hwdata/hwdata_0.409.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.408.bb
rename to meta/recipes-support/hwdata/hwdata_0.409.bb
index 5cb082d5c96..543d24dc4e6 100644
--- a/meta/recipes-support/hwdata/hwdata_0.408.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.409.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "4456b256a1a5b1d1c1c1a60a9f69c59f7743c522"
+SRCREV = "73fa04de426aefe192505fcbc6c24237a9fd9c9b"
 
 inherit allarch
 


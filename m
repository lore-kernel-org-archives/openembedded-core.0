Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A218CC4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 18:45:36 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.112453.1671043532897060167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 10:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KNBHgp+H;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id h8-20020a1c2108000000b003d1efd60b65so137651wmh.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 10:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1eaZ7HzabNHVMyKDpOX73WLL72oVqICR4C6yKnzttwM=;
        b=KNBHgp+HSQDuNoUFF3HN/jpuZqtyEy/dFsTKN8byrFJnJQ6QtCU35QNJeoYFgxPark
         vW64n3bmUttShUWErtQot4Hd7Ca56/18Xo5sb0mJTiVI34aKczNlyfg7fWAZjBLzHTnf
         qdjtBPEDYTT4hVhxH4T9ZLcHSFvSWGohAPUfpNCFqoc1fp3QWAqq1G8iVOiWtB/HI1Hs
         kV4jIFnRja2h+ZXqzqbtigU3j4llcxjufGC07Fl8vFDR6y+X7MHvNnBUFw+Dwg7mHwWv
         mCU7bEdl9OoekJQwWc2MGPBeZNFLsCoyAZDbQPQAK1uv90dnqHKuXiFIK9Nrlc0ELPJi
         RfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eaZ7HzabNHVMyKDpOX73WLL72oVqICR4C6yKnzttwM=;
        b=LUEdAFbfDpXVyY1YmKTQ90/7pWAxKJbkgAjq18dJ075Q8T6gbY0I2cR6Xu1zBu0OJL
         P9T1qSUAHMBwdmjPl+idPgmGXj9o4K6CiL2AI62D5F5lN6G5PnX8IgOxhhWyE8B3eRx/
         7JsW20+ZGtcEiFxSo+NxACJervF15DYdCizV80mDORUSj4tu3OxYxsEY5S8KDccB3qXX
         AZp//pnYClJvVw7Yf4Da5qrw5qOzowCkR5UDoN/go5VICsm/jhrg0XESg5uXfT3hTHdh
         luFTqAk6oqLatPNR+yY90JB3ix+O6lWpnnQ4v7rCxsJzoJSgvkPJOZiBg+m7r5P/rkI5
         gThg==
X-Gm-Message-State: ANoB5plJb4bPKy8YLFnR7NMoOF7kPWPS1My2oNf2Je/WCINBDKeuNvel
	kGgEpjGT5yPNMaowoxLXrCSzAuB63F4=
X-Google-Smtp-Source: AA0mqf6IhVcVgy+Wt9XWOeIWCSDmTcyJaXYDWPf2qgayljGVK1x5j0DMrpkR45pRW3kri39yR4uauQ==
X-Received: by 2002:a05:600c:3ca5:b0:3cf:ceac:94d3 with SMTP id bg37-20020a05600c3ca500b003cfceac94d3mr19238718wmb.13.1671043530807;
        Wed, 14 Dec 2022 10:45:30 -0800 (PST)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d6a41000000b00241dd5de644sm3559590wrw.97.2022.12.14.10.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 10:45:30 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@linaro.org>
Subject: [OE-core][PATCH] efibootmgr: update compilation with musl
Date: Wed, 14 Dec 2022 19:45:19 +0100
Message-Id: <20221214184519.3887972-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 18:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174558

Since the commit 005b6aba89eaf1b79fdd7565dd028fdd9bbfcc7d
(efivar: add musl libc compatibility) efibootmgr compiles with
musl too. Update the variable to take that into account.

Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
---
 meta/recipes-bsp/efibootmgr/efibootmgr_18.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
index cbcaac1e97..fbd2f5dbc8 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
@@ -30,6 +30,3 @@ do_install () {
 }
 
 CLEANBROKEN = "1"
-# https://github.com/rhboot/efivar/issues/202
-COMPATIBLE_HOST:libc-musl = 'null'
-
-- 
2.35.1



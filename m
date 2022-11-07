Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD390C07E9D
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.4132.1667832923527943959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W4GbhCEU;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id y16so16549606wrt.12
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGy46uYpvHn1w9vdNICT8l6NfRcsp1KsSajFmFqIQdM=;
        b=W4GbhCEUYK/K6lWtchfv44szXAW5q7bStUOAPk9M8FqfW7UsXew2BBsDmoDct7U9LU
         Tx1yqlWCZ+oebGf0wbgD2hXm9KXBXiwKOfbV4Ynn4lwZYHJqegzMYJgqlJhlKAy+F9d/
         T5IO618UIyn0e/WQAiKaPa7GPqqdaY07nAWMvrRTXrjleVmhZFC6Z6onb9RGdRDOSDnG
         U5b7G5UXOlgi9MiEmEn5Kr6xeSjm4bQnX2/TJ+WXdfExFu1LnJY7JonToMEQTAYxIH4I
         6AdJndkLjXjKzTEyWrNi0DMalk1zKAXMNWQTZ8ou+soGTrBC1tF9YkbRhq49yvhNLmea
         yq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGy46uYpvHn1w9vdNICT8l6NfRcsp1KsSajFmFqIQdM=;
        b=KggdV9U5B0z+biXMjw5Ou7xVjbCotw+7hsyzOhNnQ3/wRNCenBSU2rOTiCTEyM6UCi
         5j9L7yjDSpfMHGIoOR8oW+Dys3nO+FN+bjSE6nlrCgvAQ8YApZZnpb9zQF5uCzLuP2Bt
         DD+JlEqlGVwelIgmG01Jex+jA77Rv5TGEmozcsRffrpuw1OyRbAh6o8dzzNZjMVOuffN
         sEbqjnjtMkIsHCIGBBCac0WDnwMLV3PABl+Dugdg2f7Y7SqM2BpPVZwEo4tduwiqaW7A
         JPpUuGsi1AAeiG7e9QMhysCxAiqmnIyBPY5017QEbECafQrd+RUDQggmkPayRU+iy6Ry
         QVmQ==
X-Gm-Message-State: ACrzQf0qBVWTjwENusE/A9/hu4Wlx87rxiI67IginQHbIDe+inDnUBIq
	11v7+tW8swcaBZ7i/WMdG24+1LfFBXk=
X-Google-Smtp-Source: AMsMyM6q3dkodpdGHNO7Tax+3tm6LnS4u0X/br8NjJXPdc++WjupxykV4phNMiYQ4iJkC1muRigKyg==
X-Received: by 2002:a5d:47ce:0:b0:236:76de:726c with SMTP id o14-20020a5d47ce000000b0023676de726cmr32772705wrc.510.1667832922063;
        Mon, 07 Nov 2022 06:55:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/48] alsa-ucm-conf: upgrade 1.2.7.2 -> 1.2.8
Date: Mon,  7 Nov 2022 15:54:29 +0100
Message-Id: <20221107145508.1051404-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172859

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../alsa/{alsa-ucm-conf_1.2.7.2.bb => alsa-ucm-conf_1.2.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.7.2.bb => alsa-ucm-conf_1.2.8.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.2.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.8.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.2.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.8.bb
index 51314f33aa..d30b323a04 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.8.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "53ef5639c4097b228e8f5cfaa2e7b829d04b5de2dc9a38d54efa8aa350d3f5fd"
+SRC_URI[sha256sum] = "fee4a737830fd25f969d83da46a2b231beb086efd966fcc07d225e7823260ae8"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.30.2



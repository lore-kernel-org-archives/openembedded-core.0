Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D31C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.3141.1675840914807526308
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U2Yz4wG+;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so741964wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faX7TYQLlD5FZhbkILCBVVrcHEiB+vTQ5kEftWV7YZs=;
        b=U2Yz4wG+77UFoZTr/N0qCA8h/sq+xIkZ6IWI9Mc7ALcgBMpVkHF90Wbi9LgpMnHogj
         Kx2LPed9BFOHOOnj8Q5x+ll7L211MKyPnHtHhcCmnyLVLeDo9RanVt/khwtDGFMgLNi+
         eyuFbYcl2TwLlPsvZnpcibV6jApR8P72tB67erbgblFgjh6+Y+ZOz+V/aHEn3lv7S4M8
         /yCnv22VxV3Vy/pIdTdGmo/40GixgRu0k6TMUqimX9xZsgqyZaPun29Lwztz6ekk5AJJ
         1IRMSC5iMIzFJWp2XUlCTCb0/Lgt0WMjQapU5qi42w0U1eXXx/MM0NWLlr+S6Lt0xksp
         diTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faX7TYQLlD5FZhbkILCBVVrcHEiB+vTQ5kEftWV7YZs=;
        b=WIHPPAkCf67wbT/hYAKFzglnSFwj5wo29AH6w4CrfykEJlEZsDpEdBk5HmPSoL5ln3
         3JssuDa8LMJic2t39duxO9YyYbaSHnZqvhdDxlCGEdrZEBuecuGN4zljbMqhpjL8iTZB
         wg1u8KaHBx0il75y4VbDRIVM2nenl0fPbTpeshHmqf9oOjVKEEso3baHWJ69wz/8icXK
         V69LASe0Jrfk4ruvjZA83iOk/ew71+tXwYij2uigjgYA+EeYiH0TtQEQSvWc195Isup5
         DQFicJmm0ksN0Ey/VQSG686q7sdlX5HbknZniGarKttNEkhUQJtgAkNCmGbvqsYeYy45
         uV7w==
X-Gm-Message-State: AO0yUKVUUt+AzWtKRWdGaMQeBArHHHvPjI4y54yPfNNcPjrcJzAPB9ZI
	hMmN6IJWxY/us3FHxZVcJmz5Z/P/cus=
X-Google-Smtp-Source: AK7set/XwillqTUlWEg4t81+6FrdqhDx+9aapwCCcjncypnl0mJtszxQlJvwvGCuyEdl2qtpmZ7i/Q==
X-Received: by 2002:a05:600c:130f:b0:3e0:c5e:ad52 with SMTP id j15-20020a05600c130f00b003e00c5ead52mr5755131wmf.6.1675840937129;
        Tue, 07 Feb 2023 23:22:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 51/52] libgit2: upgrade 1.5.0 -> 1.5.1
Date: Wed,  8 Feb 2023 08:21:42 +0100
Message-Id: <20230208072143.2930292-51-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176891

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgit2/{libgit2_1.5.0.bb => libgit2_1.5.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.5.0.bb => libgit2_1.5.1.bb} (78%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.5.0.bb b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
similarity index 78%
rename from meta/recipes-support/libgit2/libgit2_1.5.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.5.1.bb
index ee4d79b11a..59866ce385 100644
--- a/meta/recipes-support/libgit2/libgit2_1.5.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=112e6bb421dea73cd41de09e777f2d2c"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
-SRCREV = "fbea439d4b6fc91c6b619d01b85ab3b7746e4c19"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.5;protocol=https"
+SRCREV = "42e5db98b963ae503229c63e44e06e439df50e56"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD9FC38A2B
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.10.1668103986415744183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lEYzneXA;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id bk15so3420633wrb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMBDKvv0ukVoZYMic6ws5ot3vwNzKDoC8TjdWw7uJk0=;
        b=lEYzneXAIA2JXB29gPFHQ5Its2DlDlkS7zJmBA8ql5dMCkKkz24sCaOSvSNuysHBEY
         AkRmfU25sQ15VnLJGUjEzXYlx9y1euG96F4u9ahL63ujgCx+npsU9oF6oVW27TAy+Sdy
         sq9my1Y0isFW+rbghkrdD/dsry2xWkUZnE/tPMTXFz7kyzKlZ0iQoxPI4Sxf5PzpL0HY
         /2eznar1Ki0pcu1+PJdS8LFx/HkNFLcc+5/wYxGHgzoQOG3gbi2Yn06XzNm0Zx0dzWeC
         jYJBqXjehLzDyHgXX+brgKVeeX6MXda7lM93cyp/vrx9q1fUGeWe/Y6y9kvkMVsxSL0q
         C20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMBDKvv0ukVoZYMic6ws5ot3vwNzKDoC8TjdWw7uJk0=;
        b=cMqAco0kH7UWNOn9kQqS0oLycKJuxBeJZl+d0fcQWpcCjqn2GntjoCyM+EQtvpz9dJ
         Nab6cgpP/2GlW96yFqKLHp6kLi2EVmd9JG49kTTMxHVuie/aWvkszTvDMfxGOgFZUBOQ
         /M02dif99jajF7tkKv+KPnskuTMyd0/u069JQR97dKgS2gq5zF/6ahRCWsA90s6OI9Bl
         jLjVeSbbOcC4JSBSi4VU1fIuKloVcRdyK8SKSwtKZkCMeAcqrE61yLEMeknDCb/EAfWn
         LbrGzX1RsjLY7Kzmk2yDGr+GIvXpb3fM2dqTle369cSsWqEXe2/QB5YJ9Yb7WXjHou14
         6CKg==
X-Gm-Message-State: ACrzQf0s1m87zieGk4ztx21MX54sTiC4/Fq4eevdYzHj970eE1WSHIE3
	fDbiwGMNf8zHdjNBhearUHzb9eBmk1o=
X-Google-Smtp-Source: AMsMyM72SoVvnj1GD2CzM232dHXbym1qmtKe9RxazMs3Lw2rE5VT11itWxcAcA2nxImNxJkhFvpnUg==
X-Received: by 2002:adf:fa83:0:b0:236:a97d:693c with SMTP id h3-20020adffa83000000b00236a97d693cmr41000404wrr.108.1668103984692;
        Thu, 10 Nov 2022 10:13:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/19] libxshmfence: update 1.3 -> 1.3.1
Date: Thu, 10 Nov 2022 19:12:37 +0100
Message-Id: <20221110181249.1240200-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173090

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxshmfence_1.3.bb => libxshmfence_1.3.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.3.bb => libxshmfence_1.3.1.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
rename to meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb
index b0b6cb6b56..be793882dc 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb
@@ -15,7 +15,7 @@ EXTRA_OECONF += "--with-shared-memory-dir=/dev/shm"
 
 SRC_URI += "file://0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch"
 
-SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
-SRC_URI[sha256sum] = "b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "1129f95147f7bfe6052988a087f1b7cb7122283d2c47a7dbf7135ce0df69b4f8"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2



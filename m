Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EBAC433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:16 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.3573.1652871530816043440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nIvinrvl;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id n13so1166743ejv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pUsdMV5BvYzwr6u3XGWiYGFih9+FHzj0E1j/OLWExE0=;
        b=nIvinrvlnap7NFMj5hLPwTuimN+mtukvAIWVFJbz132eE0sDbZm/zvSSsIQ43+QHRj
         ucZfeK3TKysIgfioJlSsFSSzebOL9kZPoNZ//evgOQGIwi8Sfqpu5Kop8CSL0mjiMWLI
         4+PLVbeKANLFaRVTbEPkJUR+DsaYscqqhs5HlSoJQYjyfnrxjhRTt5eQ5cwhq5BBPGCI
         8WIgzfcsJOm9MH+PqqUb1L9g1wqcewyZn1aZOG0p+U1fV7a8qZhR1ZFqrg3Qj0EeZjiL
         LJDSHeFY9u1p7ScjnCwBLyBWA2URpqOEpatflM6/Da+ssP5X1ATn0YnDYf48aJ0RCiDa
         qwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pUsdMV5BvYzwr6u3XGWiYGFih9+FHzj0E1j/OLWExE0=;
        b=SNmofRyI5Ebi65B8HM2avnHlU0GYdlI7PyStGJDsuslmnmyxFvWPWHGp1VBj8VrnnL
         y/FTpw/GOONDqtN+OXxfEIwAtYL7lHcPky8lnnGAhP4JySd4CJ8LgH/QglqCqkZL6WvI
         wvj7jVeOM8tokbTx6YZu3OKkLSQs7wUYBBmdOlmop3yiuxjqeSKLVHwmSblB15KHMkMp
         aaEkR0csrm6+SkoSInOAJs6pw03/PfQRKrWwezVpcN0gUlhsmJaaxFvKgi9ElEqM/V7h
         erIVQ+PjihMGaoGn8g2LXHhNZaeN+fxLZzJjeSPn9Uexy7fBH8Dx7q+nEfdsYEBCbDLv
         sYww==
X-Gm-Message-State: AOAM530MzaCsQ6r5X6GgqNCh/kuj7QKHM9xpA4QOmgqLGlmrFKunf8DO
	l1QKKcaQPmknpanm0K9f4PP/sfCCrRI=
X-Google-Smtp-Source: 
 ABdhPJwfmUsRt7PJomoR7zGXgZ9YnGmnix/3/z3zr3ssvM3q2vFA3VjbWzUHyNlI6rpzJHYhld4roQ==
X-Received: by 2002:a17:907:3f96:b0:6f3:cd20:b00c with SMTP id
 hr22-20020a1709073f9600b006f3cd20b00cmr23387754ejc.185.1652871545440;
        Wed, 18 May 2022 03:59:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/49] gstreamer1.0-libav: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:12 +0200
Message-Id: <20220518105843.3299331-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165815

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...streamer1.0-libav_1.20.1.bb => gstreamer1.0-libav_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.1.bb => gstreamer1.0-libav_1.20.2.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
index 16a298ab14..4ef9755c07 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "91a71fb633b75e1bd52e22a457845cb0ba563a2972ba5954ec88448f443a9fc7"
+SRC_URI[sha256sum] = "b5c531dd8413bf771c79dab66b8e389f20b3991f745115133f0fa0b8e32809f9"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.30.2



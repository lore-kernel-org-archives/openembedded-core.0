Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A61C43219
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:16 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.3413.1652871551095979225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EKqGHpcM;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id n10so3048976ejk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yrZZRCA7e8LokDQBYHLBVZrhVf+8T6Zin1VV7loZwRk=;
        b=EKqGHpcM9KDuh0nSS7YszMAzkx8aFc+USRqi5ZwNn1GOc4afJDHhaCD3IagHbUJdZq
         tyjLakbCmEGB6yZRnLlNsxs7C1wCrOI5CxHRt+FAo8WMWPU0QhXGNFo1kGNUTVN9PKbl
         1OqF5PD4rNUXKKASgbrpbvCtJsSlTRoDlQaWKDOIWTXRhKKIFlWm1W2Y0eUfXFhbL1tU
         HsifR9moj7FkUI9aj+pOVdO4EO5MpWmGPOrxz1NhjAURfN2SjtwzLwnLoAz8YHOcTRQo
         Hydo3zlmgiqPJidt2spL+PgQNkh6fiGipMAVmt92pfqsFpiVtU5TU8Kb8RxOZnnNPMw2
         Oy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yrZZRCA7e8LokDQBYHLBVZrhVf+8T6Zin1VV7loZwRk=;
        b=4qAkSNA7xULP7kCOobXpwefEACuTVEmPgDNFCAnV+sT35RZUawmzYEjp9S/pJjLWWb
         d5AAqDwQ5oZ2T6G7BXTsswXkIWmM937BuihT/9Cf5cyzdNvKF4JYgBUaEz63ahjryZcg
         DIn9dI1+9VEEmAuhFzDoUuy9O8HmE9p4Y9ycvaBCBGuHWVFdx8GDnTynHC/o8KWWj089
         psRKR6SWnGMod3cunGfjT56iHT9JIm4MopKyP+1rmJ6oZij4+tMQemcp31qO07tQ0QWW
         qj2NAnQorNAGwSeLYh58iEEoplC8zWCKbWiRjkWZiFGuUcjYYaYKJSeJ6DC73UTnd9tV
         mQIw==
X-Gm-Message-State: AOAM533pNOKjBNCkxnIkRu7c0c5jLM1hkpl2Kw3npYIDPXKoaDS4ar6R
	5oiXAgpp2R+s+JgZIQ6I5fPi4Xm42As=
X-Google-Smtp-Source: 
 ABdhPJwvZJhrFYONBuyIfVLWCo8yaySB94k3X/VH74dheU5gSm7Dk+Yezd8nvYG24MIcu3Mq/hUIqw==
X-Received: by 2002:a17:906:6a0e:b0:6f5:30c9:7c7d with SMTP id
 qw14-20020a1709066a0e00b006f530c97c7dmr23126181ejc.63.1652871549713;
        Wed, 18 May 2022 03:59:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/49] gstreamer1.0-plugins-good: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:16 +0200
Message-Id: <20220518105843.3299331-22-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/165820

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ugins-good_1.20.1.bb => gstreamer1.0-plugins-good_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.1.bb => gstreamer1.0-plugins-good_1.20.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
index 1f61d9a10e..6c52fb35b9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "3c66876f821d507bcdbebffb08b4f31a322727d6753f65a0f02c905ecb7084aa"
+SRC_URI[sha256sum] = "83589007bf002b8f9ef627718f308c16d83351905f0db8e85c3060f304143aae"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.30.2



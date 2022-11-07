Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D6CC4167B
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.4133.1667832925927497408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Or2sfzY+;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 187-20020a1c02c4000000b003cf9c3f3b80so2299925wmc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHfzegbPSTM1BKjCSg6C3/rwoGmsjBgDSgZ3niMppXY=;
        b=Or2sfzY+gVXoP0GKWiK5u1RzXT7WGX5GlqpsLDPyOV4RyxQXKNpmdDu7wti7/L0Sof
         2Tftmib0cxh5lwuH5aOEz5QBrDzKPZMKSJFraQiBQvg9HEtfll8fR9ROilxaJJPOpTvu
         AxSD7KA/w/mLs3K2Q+fXqomkUnYAwFpvwk3xtXtgMuEcsqYkH3X7DmiClzNKUYFaDomj
         z1w6G6/yC0YDCvEoyNFH1al5BuFsIlfYFWmSbq2aVYLjc+BHJ03hAYyyDTd/QL+vCbPh
         kxcLDy2G5KxFXbozSDT1PgQZVKz+pXOkIDkfW0lV0rRnKA7biiCtR5mFeW1jnciDuLs9
         cPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHfzegbPSTM1BKjCSg6C3/rwoGmsjBgDSgZ3niMppXY=;
        b=JK1vlmxA971nM3vzYaZiJduPeRvjAUK4QFozVP3jhq/Jd5wpQXLAUpjSFlpK/LUgvT
         nkToqEvGg8KaXhkcYbfwakwXJC88DF7DJTT8Lj3/KlE9SEXGTGDeIDLPTUy4nIxooIN3
         /M0Qcy9fqHvp7BF3k93A3lddQ2ehGeUJdGphvLnnMEE4KPu5lWeZnS3U2+br9YQ0J9aB
         MzUXMYQ0Zqu+0Msk3ArAv/y9me5R3QIigfdmpoTw8rtvK+U8QntGr9qdeJ34263D1bE1
         HEnB42z8XScvIyFhFifSYg/Kqxozwbzm7/oC+eNZJpvRahQEXX0jYEu+BCF1iSNk0pnX
         LY9A==
X-Gm-Message-State: ANoB5pkc9gaABjKRO3vkRVY5qFQmyzoZq/hLgA3lQEqgYCSt1oWxCVeU
	ESraY8e0ejO52ve1U12FKP31Mi0NsLk=
X-Google-Smtp-Source: AA0mqf4/LtTy4h26KRkF4TxmZZesRtQGVJg1X7AmS9UU6TZYAno/optvE94TG+f+vLwg5H5ZYHWCcA==
X-Received: by 2002:a05:600c:1547:b0:3cf:b0ed:de72 with SMTP id f7-20020a05600c154700b003cfb0edde72mr2133849wmg.63.1667832938399;
        Mon, 07 Nov 2022 06:55:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/48] libical: upgrade 3.0.15 -> 3.0.16
Date: Mon,  7 Nov 2022 15:54:45 +0100
Message-Id: <20221107145508.1051404-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172875

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libical/{libical_3.0.15.bb => libical_3.0.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.15.bb => libical_3.0.16.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.15.bb b/meta/recipes-support/libical/libical_3.0.16.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.15.bb
rename to meta/recipes-support/libical/libical_3.0.16.bb
index 1ceb0005cd..61599b20dd 100644
--- a/meta/recipes-support/libical/libical_3.0.15.bb
+++ b/meta/recipes-support/libical/libical_3.0.16.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "019085ba99936f25546d86cb3e34852e5fe2b5a7d5f1cb4423a0cc42e399f629"
+SRC_URI[sha256sum] = "b44705dd71ca4538c86fb16248483ab4b48978524fb1da5097bd76aa2e0f0c33"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.30.2



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C2FC433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:06 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.3488.1652871538844667500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HVx8jQ50;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id er5so2440169edb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gCmZk4lOn+VAgOUtAFkBASyuFGcf9xmYD4lz9zVO/jg=;
        b=HVx8jQ50OYc0gcfJ0OtmhjkrHkuxGLTylOZ6SkDiEOTb3SnFPV3ln8paG/0u64Uc+8
         wseBK2KB2D2hGrUFiy3F4PKaIAGiM2vLfUXu4ur7XfVQLyI76O02AqWlX+0s0n/UT3TQ
         xm6+aT1XpgSvLHvGH6WZrHM2QByk2sZNNm4vn1aq2KBc5BXm7un3/Yr1wH4/Cdr0zUG1
         Y4L0jBW8BD26WZmhSLwbxjGwS7nKFow8jQb6CL9IWTmOOcnIsrb4O0qUJnAIOKVGnZyY
         WapbHC4KgxQJsXnxBO0P1kw9/P5oeP+RTWWqbWV3+HHg+kWI7vUfql87HrGUL+Sqxwo6
         ABMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gCmZk4lOn+VAgOUtAFkBASyuFGcf9xmYD4lz9zVO/jg=;
        b=N0ArNrhHoovNkKtjWnHLqrXeChnV07/TBj6XjaO8HF7qP1GxMQiFUNwXvlDbZJRl+N
         E7ZN+m6G11+LDwv1iIflf+jOhnCCXhSZFJWZoEudphtkA61CXCsWIV7ihaxGR2fZAzaj
         SRm/d7FvPQFSt9dWCcTQbfUpDetpQr5NH95yDype33t1hg+wHeaLrCZPmAJ4ZTpWIEdv
         0vpH/cIMdBLeVyWLKwzCGHSLJ4rxovyr8sghG5shqM2F/RP5e/ZnXahAzqu4gqptnNIE
         URuOrtsfIHrZHg8O5YpmkxscMifYVEud+jVz5NK7J4lMabghqCDexluyckUSHDKql6Qn
         hWmQ==
X-Gm-Message-State: AOAM530PkjLpKReca5Q/BV/W2gy6X4Lx7P2kuMXX9usIbux7Qu0Rtjee
	GP2dHNBRPO53ATFAsmpM+zmBpHcfslU=
X-Google-Smtp-Source: 
 ABdhPJwykJ3IAVzvtA+hINzYYcs4Z8AVoGZXoIhtyO+ziI1oilQJVtHkb7Wq8lQraTBaLC1b1FLHeg==
X-Received: by 2002:a05:6402:2999:b0:428:bb4d:6cea with SMTP id
 eq25-20020a056402299900b00428bb4d6ceamr24003789edb.29.1652871537289;
        Wed, 18 May 2022 03:58:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/49] xcb-proto: upgrade 1.14.1 -> 1.15
Date: Wed, 18 May 2022 12:58:04 +0200
Message-Id: <20220518105843.3299331-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165807

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-proto/{xcb-proto_1.14.1.bb => xcb-proto_1.15.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.14.1.bb => xcb-proto_1.15.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
index e530a055ab..f050ed366c 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
 SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f04add9a972ac334ea11d9d7eb4fc7f8883835da3e4859c9afa971efdf57fcc3"
+SRC_URI[sha256sum] = "d34c3b264e8365d16fa9db49179cfa3e9952baaf9275badda0f413966b65955f"
 
 inherit autotools pkgconfig python3native
 
-- 
2.30.2



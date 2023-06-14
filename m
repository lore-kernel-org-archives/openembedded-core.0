Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C721EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:04 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.7506.1686734998701323401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hZogd5xk;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-518b69d5b5dso472182a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734997; x=1689326997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzeeEgFFUZxxmMsxDs+UbTbUgXP4L8crW9emHb/Vebg=;
        b=hZogd5xkAYrNvn95iDrqVnRIgO8BHzihD0CxBtW5U+GypBvBLtPkpu24vXN/gk+pD2
         YD3WlueJq9BLiqCaMO/o5eGYAOSPCCuSLgd6hJgcTJ5iM6m8ZLgAEM5fLMhfP/SfqteY
         0331i8bQ0flvNUJekgJ/J1RINURIxICCtDHgvyPK4uZcFNszfdHbhlckE2amks2y07v+
         qVvfRf+gMUKaVq6LonefGiHJY3HO3fTaNGbpq0K7SZqNqM0tUqiRi7ojj4upLJwOPzcz
         qvz3KK/9IZNNF+YIq4tt3x2pFvf3SnizIcOwDIDHyUz/yzO6ByavLLX9sR780T59j+hC
         t4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734997; x=1689326997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzeeEgFFUZxxmMsxDs+UbTbUgXP4L8crW9emHb/Vebg=;
        b=gtzBhg9wmmYD220HEtw2MiNIFGumZ4BLMOYCTZI0SdfEYc6uTqnnw4jrUxzbeRF1gB
         rAdOoWUxTcegAeZXCMQk4BvEY7xlZroLHEuQk6jVRXXX5fYTC12pjFDXFL0H1z56kKs5
         ZSHmd5p13LC1jvcUnjjqxUTiypMR9H85MajQd8y5oxAL3tX+AQYcZ4vDp3Hewyhwx2ah
         pHDIPAK9SQJSqh/WPEIGED62l7KR3kahWNDCIFIYNOswgTiywMrCvBhjVdEK1pmitmUe
         zCMWkN7kEqMMcHdjPkRL3TJC08Syk7h4pdKJdUfR1yci0P4W9GOo4iLs1J1RfGfoOyzq
         nl0g==
X-Gm-Message-State: AC+VfDweVsWTb4scnqrbZZf8oQP3Sqxa33CyZjYu8Zk5ImCJCqGDHX+A
	Rfdu21M9tC7E8hslViVMnXoexgvP5FU=
X-Google-Smtp-Source: ACHHUZ6+ul0ltKUkSHOJTzSrBlYxe0816ax7rnEpRTCDJB3oqq3qJWidoWxdlPX9y+SNvKkOH+5aow==
X-Received: by 2002:a17:906:7303:b0:974:61dc:107c with SMTP id di3-20020a170906730300b0097461dc107cmr16137020ejc.44.1686734997030;
        Wed, 14 Jun 2023 02:29:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 54/55] xf86-input-mouse: upgrade 1.9.4 -> 1.9.5
Date: Wed, 14 Jun 2023 11:29:17 +0200
Message-Id: <20230614092918.4065570-54-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182799

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{xf86-input-mouse_1.9.4.bb => xf86-input-mouse_1.9.5.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.9.4.bb => xf86-input-mouse_1.9.5.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.4.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.4.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
index 191987494e0..92e54d97014 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.4.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
@@ -8,7 +8,7 @@ functions as a pointer input device, and may be used as the X server's \
 core pointer. Multiple mice are supported by multiple instances of this \
 driver."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=90ea9f90d72b6d9327dede5ffdb2a510"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d213a69053dffe9bcab94abf60013d33"
 
-SRC_URI[sha256sum] = "7f6f8551fc238abdddcf9f38906564c1f8c7dacb0ad947cfc110487aefbd8d4c"
+SRC_URI[sha256sum] = "4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968"
 XORG_DRIVER_COMPRESSOR = ".tar.xz"
-- 
2.30.2



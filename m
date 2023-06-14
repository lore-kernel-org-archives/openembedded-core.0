Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7D5C3DA40
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:04 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.7505.1686734997968027086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZV4GTZTG;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-977c8423dccso88202766b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734996; x=1689326996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GgbV0kDLOBKynrVf6+5a501hp13MSTxrmux/U2HGP4=;
        b=ZV4GTZTGXubT2DSCZad8tjbJaB99QpZxezJlvfLr96PjrnMG3JNl3vIf2Mp0Nf72Gi
         QlTy6kKOSr6S1KTeAYjJyUi9iR79c9KceCqaTCs/6s7ZRD7dOSaTGhs9Lqfa84akFDFu
         HqQeYMV5TRoR3gbWy1dIeHReWpxY+PsrcNFc77UosZQgqUP32z+gJFYU3Tk+KsqoNDSc
         R6+h9sYW8I9uEQjI/IiFXGbM/o/1QHcS8EcMqC8JIo6RWsGEcU7rd/4RYGr5llALqVJ+
         sZ0vk27lpXyy3b3jFlmyM4+zfoP35nvF/Wb9YK15rtRyoBFBt+eQ3cino4QVz2j+Cthf
         xoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734996; x=1689326996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GgbV0kDLOBKynrVf6+5a501hp13MSTxrmux/U2HGP4=;
        b=lnn22wLCbIm2p3FnHVMCTKqtRbYxF0pEMTBEL7f+WMisb/EyEMnR9pGabPyzwuLUwz
         yBzMS5khezMdyhj5COFNd6qz3VaROYfm2CYmP3HYxyM8lCfXoRNtZmDmRF4Ml6IzyWkB
         tarPa8UiuA4O3Yld7VyE+EvggthOH/KyaRr16O6ZzsNRBnBgFdHpchM7qqhD8NUaBflC
         ILC68OXrXkXFbtRtaBYnPezJcIpHkPl5dxey2cjZxulXeYxRmTY3/D+wSleTYQ7VPFBc
         eZeFIwcjdF5P1RJlpX2/RoPhnFMQGx8GryP7s6C3Wx9sa+qTz8DvJVmoCEDj9nV8T2/P
         3G2A==
X-Gm-Message-State: AC+VfDyuLPlD0xMcDltsfQvBa2DiPef8cOrovq2GE9yD5ScKaSzXaPZp
	2+8qjs5NZM8/fQR9Y4CC4fYAlRloj4k=
X-Google-Smtp-Source: ACHHUZ7g/68dkGMjvKQzHtt2UuqjNFmfh0Gvvqx68pwKGOfIbmuCHSbcHgPZ2Ch32Z+Ejczo+BEEsw==
X-Received: by 2002:a17:907:7e9a:b0:977:d468:827 with SMTP id qb26-20020a1709077e9a00b00977d4680827mr1051594ejc.17.1686734996458;
        Wed, 14 Jun 2023 02:29:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 53/55] xf86-input-libinput: upgrade 1.2.1 -> 1.3.0
Date: Wed, 14 Jun 2023 11:29:16 +0200
Message-Id: <20230614092918.4065570-53-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182798

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...f86-input-libinput_1.2.1.bb => xf86-input-libinput_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_1.2.1.bb => xf86-input-libinput_1.3.0.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb
index e1c47aa5e7d..892046e959c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
 DEPENDS += "libinput"
 
 XORG_DRIVER_COMPRESSOR = ".tar.xz"
-SRC_URI[sha256sum] = "8151db5b9ddb317c0ce92dcb62da9a8db5079e5b8a95b60abc854da21e7e971b"
+SRC_URI[sha256sum] = "1446ba20a22bc968b5a4a0b4dbc3b8e037c50d9c59ac75fa3f7fc506c58c1abb"
 
 FILES:${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.30.2



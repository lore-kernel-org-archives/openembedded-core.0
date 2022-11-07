Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F220CC47089
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.4297.1667832955490454554
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LVU+P8co;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id h9so16657149wrt.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqAMBvE1WrQi4yIZkqvRf7yd+MFXZJziBfCH2f77gTU=;
        b=LVU+P8coiRShtPH5oyV2BsakWZJxn8BprH9FVt4rsP7hZAkb6Osq7Up5RmOGm02bFi
         glnI438Vf4mp4xKEHIvNOLfPPlfseS7IskxbMRrSSBnKLQT1QIgun3GEyOZEfL7YzZ29
         I//FdFSWEuEBojj6Xpd2xVvoEYo8AIe0uU7Vw2QSCjyQTFr/pZri0JfcpH306+I0Vp2r
         +BJ6hvkJO0OZWWjixp8DQHb72Xs00zHSe/f+MHNDH52swLwd0f9y5Qao6wf8c9XGXgDy
         8CJCBs5RJBp24QY3576B34SM8bIe6PhHDN6WrLhYbrv4zq9hx994pGiHwyqxXXaRWkAc
         ptrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqAMBvE1WrQi4yIZkqvRf7yd+MFXZJziBfCH2f77gTU=;
        b=qXLEZTEn2gesIt0Xoetb7NvCVHK9V5w2QqMeoWRyMcfM5PwtELFAZmFkiSzaBmseaI
         TRTIjv6lT7JkC0S80l8TfzvJKMiaI5O/8yaBBPi9NrER6ERenwqTlarKdLnN/PfgyXrz
         UUUzpo9ptGDlyd/kKp2dv5bZs+zIOmhFEhvv51qAKLgxW+iuvp+CqtYL6EGLZHVVImW4
         vSAqRyyt+t57AV2EDkCJsxPylRrsH4xc5OyRX670eRnr3brkDr3zu4yNb85v7kYWc1l4
         K5BHoPRTZocKiOIpApXnlmbMB8tSiWK3qYd018JeRMqTh5bXFrNm8FbvNGHQxGMtc0AG
         WKaw==
X-Gm-Message-State: ACrzQf0AjGCYRpZOxjyUvXSSPp42gd3FKl5498XLVyO0ae60fZ85JPaF
	1j3kR4B0Pi3Q9/NCRU1ITCjsVZfSCYo=
X-Google-Smtp-Source: AMsMyM6tWcs7jJOzxnzlsjTnzIScVjVbAybMx7UC7sPWPZKNguCF+/0P9i8MfI3n124FUhDYZZHHvw==
X-Received: by 2002:a05:6000:1241:b0:236:8a38:6744 with SMTP id j1-20020a056000124100b002368a386744mr33171956wrx.270.1667832953822;
        Mon, 07 Nov 2022 06:55:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/48] alsa-lib: upgrade 1.2.7.2 -> 1.2.8
Date: Mon,  7 Nov 2022 15:54:58 +0100
Message-Id: <20221107145508.1051404-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172888

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../alsa/{alsa-lib_1.2.7.2.bb => alsa-lib_1.2.8.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.7.2.bb => alsa-lib_1.2.8.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb
index 9efdae8ad5..bf968c920b 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "8a35b7218e50f2a2c79342d0de98ded81439ce19e12809385ec9be9596de7c2f"
+SRC_URI[sha256sum] = "1ab01b74e33425ca99c2e36c0844fd6888273193bd898240fe8f93accbcbf347"
 
 inherit autotools pkgconfig
 
-- 
2.30.2



Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75A1C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 07:38:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.38393.1665992314460969003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 00:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=dPi54f/0;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id i131-20020a1c3b89000000b003c6c154d528so5031092wma.4
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 00:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e3azMqNzBzJWLHdKFfj2azZVwJUXDHKDQiudbytTLH8=;
        b=dPi54f/0E5pPr/DSY5q7Jzzv8dSW4GqUo1PsyJ3ASi9BWZKBgccaKtGsuRDg3Qi4UD
         E0r4iOJMdSr9PDFm3uvyuEt25XLE/9YojEE+MEO7Tc24n+6z1Pc4pKr+UZrzf3LTVrwR
         Ts0oCG2VVby5VLLzk8nQtODk3HQxpft+DQUCxA3z1Bui5ny9UnJ9Ot/khGjjZ+VgZNvm
         dtwKUvHaHinlzWm1dDU7146ArrNV0E7Z27btEO6r2xxxvSwYU4GSCBevFzQtZRFKqVmx
         posWdCDQHNEi3Mi/nOQkNRE3on4IO1cRLZkFEnpYSJ05UdUjEum6QfAy0a88wdD0IJbB
         gEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3azMqNzBzJWLHdKFfj2azZVwJUXDHKDQiudbytTLH8=;
        b=dvkBb87LvMMsdLs7H7HBdrZlI1AKSVQKlip9G38CGZutU/c3n769Sp8j8LpaWiKxyb
         kX2l0qGCQ2YLo2CXFSh/I4//aC07wctrx8FKtfkNW+KftJY1hZ+OHyyPO95+CKItuBxl
         OzUaVik82taQRmQt42VLQE6ax8MAydWoA6UvHeJIPQFbyXqZKznmErhXMC6MdkR/EUXj
         vkMuEQE3Sq/vMn2BcM+AkechT3kNn7vq2PXGXUNkB+pC37/3L1naB3zRDUDkWd0xVLMx
         nTeKejgCgqbuS4oE9ZKkSTL2HO/nUpGpzRpiIJUrayYVeTLunP2V2naAH37HFDqNFYcT
         isiQ==
X-Gm-Message-State: ACrzQf2dT7fTSTOzt1nlH+SCbZMIPilooVR0w1kF+LGWL02xCogztLnb
	UXNCbqXA84eqThmUvIztwhEfSg==
X-Google-Smtp-Source: AMsMyM429ohXPCVcTVuFOusFo86SUAZ5yuYO/dSNVcdOIzjtBnGJ6k86BRn25JI5tYWi5nhdn84b1Q==
X-Received: by 2002:a05:600c:1da8:b0:3c6:ca7c:2e87 with SMTP id p40-20020a05600c1da800b003c6ca7c2e87mr6020924wms.126.1665992312733;
        Mon, 17 Oct 2022 00:38:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:33a8:216:13fc:c0f4])
        by smtp.gmail.com with ESMTPSA id e26-20020a05600c4b9a00b003a5537bb2besm9271875wmp.25.2022.10.17.00.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 00:38:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH v2] bluez5: add dbus to RDEPENDS
Date: Mon, 17 Oct 2022 09:38:17 +0200
Message-Id: <20221017073831.9441-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 07:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171902

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unless we're using systemd, dbus is not pulled into the system
automatically. Bluez5 will not work without dbus so add it to RDEPENDS
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- don't overwrite RDEPENDS, use '+='

 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 79d4645ca8..f07e318897 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=0ad83ca0dc37ab08af448777c581e7ac"
 DEPENDS = "dbus glib-2.0"
+RDEPENDS:${PN} += "dbus"
 PROVIDES += "bluez-hcidump"
 RPROVIDES:${PN} += "bluez-hcidump"
 
-- 
2.34.1



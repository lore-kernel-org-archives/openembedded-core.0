Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0A5C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 19:27:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.11489.1665775667891951378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 12:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=jEBCFViX;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id bv10so9064734wrb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 12:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13GIlan7du/KxF+pab/b6PWWwz2gb8h39AvpgowGGIk=;
        b=jEBCFViXxRZ58GZti78RwyjQXpRO9lrSMBkpwrP/I+6YA276R1LBPo1L1hS9ms277u
         Wlz0v0y8PLt64jPlyBEEtfXf6NZyLYnhfriIFItE+YF3igEVeiInyCXiPmlutlSJzc36
         DBOw8tNdEc0H3N29V6RQXQ3urfC1zI6J3qbv9QW9GGrsr2xuRGLwyZE1vG8dGHpfX3iK
         1DuLbN5WQWgudyjLYh5vp4uldBqiJv9zR3LLhUTIX1GGc/skLr+ZD8ke/5DJuWwqUzFg
         meip7An4bbtG2WzNrIv47J4Wi0RiIEzlgt4wYyD8lNZqZY+UVLb4qBBR2jETlFxUFk7G
         O5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13GIlan7du/KxF+pab/b6PWWwz2gb8h39AvpgowGGIk=;
        b=Wsn1g9u0BQFiNC3qBja2eE1/M6YVakrHd058C41092fE++/m0jz+BmyVZitSRBwAAn
         hQpDXGlNb2sWKV30vZ4JXvxigqG6BBLVXaOC5/p8/SvWBLY7ENyz0EX/Pwk7pF1yFUDT
         95FaJrlxxdbhQY5+24HupwVla4p/xOAW43NPoOHm2ZcEj7rq81ZZQOteURe1nErG9E5V
         KzuFIyWLdRTLp/YPnwD9xl7qURJBYgeymIgNeUssvx4uMnQasvf5+2WLjXkbWJBuRS5w
         X13xmN+S0p8O549yLHJZxhZwhO8vwBgeWwx9uF0/zolZUB4T0DCx3aHjYIOKM6avmxAS
         m0lQ==
X-Gm-Message-State: ACrzQf1k8T0nD2vE0RqiiTUkbQqF1u1iGMjFMG6ESM3i8S5FFcxuVHKp
	RRayY4LvnYab1ITmpQ0DzjoYdA==
X-Google-Smtp-Source: AMsMyM6Y2Ld/TAysnGlI1aQEGDvw2S601Pdhj1rLZu6kx5kXGXrxDodlFXbvKxWlGgPxAFGSsgIyBA==
X-Received: by 2002:adf:fd0d:0:b0:22e:299c:3656 with SMTP id e13-20020adffd0d000000b0022e299c3656mr4351593wrr.233.1665775665899;
        Fri, 14 Oct 2022 12:27:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7d4e:9c2b:b978:b3ea])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d550a000000b0022860e8ae7csm2446262wrv.77.2022.10.14.12.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 12:27:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH] bluez5: add dbus to RDEPENDS
Date: Fri, 14 Oct 2022 21:27:42 +0200
Message-Id: <20221014192742.162360-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 19:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171739

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unless we're using systemd, dbus is not pulled into the system
automatically. Bluez5 will not work without dbus so add it to RDEPENDS
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 79d4645ca8..b6f1c00c14 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=0ad83ca0dc37ab08af448777c581e7ac"
 DEPENDS = "dbus glib-2.0"
+RDEPENDS:${PN} = "dbus"
 PROVIDES += "bluez-hcidump"
 RPROVIDES:${PN} += "bluez-hcidump"
 
-- 
2.34.1



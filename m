Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA37C4708B
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.6250.1650618431439791237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=npE1uFdX;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id e2so3825979wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/6Q/Tk0ZYE/f2y7RB34egc5123AjVDPoOOSKo2huYgc=;
        b=npE1uFdXqZoRKqyfX6nE2QWvnajyijTi/bQgV/ltW9AZ7ATDOCysWLGYnoPTBwmIkD
         wmDQO9kzF+kusCkCya2IVoe4V7VRRVrtHKsqB1F2CcRusSI2I+zBemlenK8+53b+0bHC
         EemB16g5Hm/GlI2jyfUw9Q/32T+OtZ38YMHBhw202syt/zX2qggNYqv6/rgELlLlX585
         fg09dF2LKb/77FeSyvzyXwgAhtvy0SBv5OkiNsSL7tBvoxhuv57k7ZHT65EEpti2Y1wA
         MnbNNwikvEQGYHf07gLu+SZX1972DF02/RsRFeZ+XsYkM40ESd43uWMQGq19n/TZ1Ra4
         4Xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/6Q/Tk0ZYE/f2y7RB34egc5123AjVDPoOOSKo2huYgc=;
        b=aRRF7xGD6zfwMhYLW2aonqBwYFxoSx2NrK4E963INv66H8KN7BM7VNtufntpsjeG/I
         VprOx2TMP//el1iwXq8a//yTihaq9S2ssFU104zF6TaG+SepESYav7kgI4QoJj7eG2/G
         K40o7OF6TJgknjvAS+k8ekF55s4VRX/92uzFwrDDCPu6+dJEF+CWPTjavKdCaj+4H/uE
         koQwwyUgEv75/N0gSUPy1SF69I5m26PvHhsS0APSZbDNDvASB8AQBdM6D1TauyYfiwLn
         +wA3bb1pt2AqdzExP+BE8LGvQ5uzWzbXNMziCLG7jWHt7g/Hod4Zrjlri9DXqaiV9TRS
         dZKg==
X-Gm-Message-State: AOAM530jlBbAGIQNfysz3GZoMibCq+RmRBZFXEEURqKpkkmGfg7Sy7ke
	b4MUz5fKp7q8o7WLU9Eg03uGpWQJ/A8=
X-Google-Smtp-Source: 
 ABdhPJxqnHQGJ6ubzcAkSyYPcl4aQYLsV9njAOy6pvmggUHTNkGkJPYnKVvXLgY7Tl81c30RxQcDuQ==
X-Received: by 2002:a05:6000:156a:b0:20a:9c1b:6b1b with SMTP id
 10-20020a056000156a00b0020a9c1b6b1bmr2845898wrz.683.1650618429851;
        Fri, 22 Apr 2022 02:07:09 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 f4-20020a7bc8c4000000b0038ebbe10c5esm4006484wml.25.2022.04.22.02.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 02:07:09 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-core][PATCH 2/2] wpa-supplicant: Package shared library into
 wpa-supplicant-lib
Date: Fri, 22 Apr 2022 10:07:01 +0100
Message-Id: <20220422090701.25095-2-alexk@zuma.ai>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422090701.25095-1-alexk@zuma.ai>
References: <20220422090701.25095-1-alexk@zuma.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164779

When CONFIG_BUILD_WPA_CLIENT_SO is enabled, package the library into
wpa-supplicant-lib.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../wpa-supplicant/wpa-supplicant_2.10.bb                     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 97cd68d86338..aee56578d2e2 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -99,6 +99,7 @@ pkg_postinst:${PN} () {
 }
 
 PACKAGE_BEFORE_PN += "${PN}-passphrase ${PN}-cli"
+PACKAGES =+ "${PN}-lib"
 PACKAGES += "${PN}-plugins"
 ALLOW_EMPTY:${PN}-plugins = "1"
 
@@ -107,8 +108,9 @@ NOAUTOPACKAGEDEBUG = "1"
 
 FILES:${PN}-passphrase = "${sbindir}/wpa_passphrase"
 FILES:${PN}-cli = "${sbindir}/wpa_cli"
+FILES:${PN}-lib = "${libdir}/libwpa_client*${SOLIBSDEV}"
 FILES:${PN} += "${datadir}/dbus-1/system-services/* ${systemd_system_unitdir}/*"
-FILES:${PN}-dbg += "${sbindir}/.debug"
+FILES:${PN}-dbg += "${sbindir}/.debug ${libdir}/.debug"
 
 CONFFILES:${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
-- 
2.35.1



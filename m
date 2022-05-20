Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F17C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 19:47:39 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.1942.1653076050670331095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 12:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qWqNab2I;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id f21so3783673ejh.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 12:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WyWcKFVlwtR1eEw3cYe62+MDFnmK620CUtZX4dteoB0=;
        b=qWqNab2IvuBueFDV4qD2c4cFIZMrcagXHZ1fj77URqRXkGgb7H9xzLWPdrIOcMK4rP
         7p7XomJnPLYuon3wre22QAyM4w3eUSrgDgfoVSZOcjZBbFxv70CtG0tBn1cTDpFCxoGj
         01F2XPpRAEV6SFZM8Dno1T0FPIhP7Vsm2PCt5fmSGYqQJ8Veljm2+tXGSGvW8EBp1wym
         Yt6nat40SrTeCyhwycizTEyz3mXZNffggjyFS+9Rj4A8LXpxixw4NDkhoOQ/aO2vdpoT
         bzmi3zs3HaU+F39rtmCMmOgd8DMve8V63/TZM1RMyC6Zjqb+m1eHtCe+JZRaexse351Y
         uAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WyWcKFVlwtR1eEw3cYe62+MDFnmK620CUtZX4dteoB0=;
        b=69Hc/SOloq4pjCdjDmWABD+92gJYg3tLVJZTBS7Y+lf9JT943WRgvk1zKAZ2pLlCfN
         d98NA33BjC3f5Id9vOlU46JPc3440kqL5oXD63PUdbSBi0lTgxAnaUdoS3be2Q3/qQSN
         REQmmmBoM4mGbIv+xZoq36pVlxy2ynhh3I76Yy6+7LVlEuxZD+HTBDbYAsrroST/CyDa
         pfhn2HX5tNmt3xF7XrINGg1ZR8V0WTT4WRRWV0j8MK6It/UOLXFyei7D7EkiFQtxBtOQ
         yFUv4RYkP3EJYVQhoIpghJv1xDznYGJK293TE7BeHyARcz2r4fanUb45G6tGjYwuJX+O
         /gew==
X-Gm-Message-State: AOAM532hbQT3/m3raD14i/CysOn/AM/CbrHivP39p8WxnFt/Lr00oCJj
	3cFEuV1KCuW4Rahas8BPUO9P3X9VI/A=
X-Google-Smtp-Source: 
 ABdhPJyrIenGnyqRmrkeffPHB06MGWIxSe3lyFKuOElEJtcOwSQpDMY3e0sNa+kzB+cXRJrvN86m4w==
X-Received: by 2002:a17:907:a40e:b0:6fd:c29b:e0b3 with SMTP id
 sg14-20020a170907a40e00b006fdc29be0b3mr9623926ejc.542.1653076049141;
        Fri, 20 May 2022 12:47:29 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 n24-20020a056402515800b0042ad0358c8bsm4732528edd.38.2022.05.20.12.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 12:47:28 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alex.kiernan@zuma.ai>
Subject: [OE-Core][PATCH v2 2/3] eudev: Cleanup redundant configuration
Date: Fri, 20 May 2022 20:47:18 +0100
Message-Id: <20220520194719.4727-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520194719.4727-1-alex.kiernan@gmail.com>
References: <20220520194719.4727-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 19:47:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165948

hid2hci moved to bluez4 in 2011. The FILES changes for ${PN} and
${PN}-dev only added existing defaults into the set.

Signed-off-by: Alex Kiernan <alex.kiernan@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.11.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index a841a6a86cc1..1b6705ba3058 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -51,9 +51,6 @@ do_install:append() {
 
 	# Use classic network interface naming scheme
 	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
-
-	# hid2hci has moved to bluez4. removed in udev as of version 169
-	rm -f ${D}${base_libdir}/udev/hid2hci
 }
 
 do_install:prepend:class-target () {
@@ -68,11 +65,7 @@ INITSCRIPT_PARAMS = "start 04 S ."
 PACKAGES =+ "libudev"
 PACKAGES =+ "eudev-hwdb"
 
-FILES:${PN} += "${libexecdir} ${nonarch_base_libdir}/udev ${bindir}/udevadm"
-FILES:${PN}-dev = "${datadir}/pkgconfig/udev.pc \
-                   ${includedir}/libudev.h ${libdir}/libudev.so \
-                   ${includedir}/udev.h ${libdir}/libudev.la \
-                   ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
+FILES:${PN} += "${nonarch_base_libdir}/udev"
 FILES:libudev = "${base_libdir}/libudev.so.*"
 FILES:eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
 
-- 
2.35.1



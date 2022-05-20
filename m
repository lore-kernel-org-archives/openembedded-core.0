Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFB7C4332F
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 19:58:19 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.2050.1653076696595807999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 12:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=POHomfhr;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id fd25so12078795edb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=afY1I2OdGiy0oLu5Kmd8rXLY02ooDDy0xjLccwHgxqg=;
        b=POHomfhrg5gFcaD44fW4n7fFWXCurEU4S+eA1iRET1Wl0Vgi3oQwhe8VYEq4kMxIWh
         nAYqIneWbYPU2TR8wKOKgkOsyBsuO/N8dfo3ZYFte2TJp4atuDmNwlb7gUlz3oAnafOA
         fwVV31d4FkXpoP1/zDit+7WUN8jG5LYq0sJUGtx/AgKYMHYF9iJJC2nsX8u+f0us3MnV
         NK+VcKIYMoB0ryCxDRO2/bldcYa7WqKPMnopRn02+tabmBP4PKy2OvllXYwpNlVpzGMh
         SPS0DZ/7BFptUIKHhXViSaKyP03q4YSKLt6Wmz2DUPVeouT2sgR/r0kIZONiESnYudb8
         sJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=afY1I2OdGiy0oLu5Kmd8rXLY02ooDDy0xjLccwHgxqg=;
        b=kNER2Lc8Nl+rGWbpae2K9fsyFQywBKqGRo7xKj0FrUyV2Clxn2KM8FRmoQxq146Aw+
         iH7ZkdCkWFs+/SDF0Eg7DBZ1SHT4xoojIHmQfdblXfCdDa8eBVYP1BHOGGqhRZ6pEHWS
         Z/NE+EwTAbUOtWAIvjSO8nIwIBeUZwxS3Hnsi3fG5ku2FmKBP2ur7gMlOSrgzQfeGfvX
         QLk2izdaLEFxRmWjQsl3sH4gklUBiFTLNxSSVO//HitgSMqyp4Jfr2e7k3hfbzlYKkGy
         n2SOVzHf/6wjodkPYcVCB/dBF86VxBXg8j/FXjPfdPL0no7WzD1nfVttLJc3psZ6RdOe
         Z1LA==
X-Gm-Message-State: AOAM530DuBoGozxq01tvbBnEOnFJCnaHmoSs+I9nenT+xZG/LNhRYD7u
	1XWaIAacWYUJzYJPXksEbvq2Ql8FjE0=
X-Google-Smtp-Source: 
 ABdhPJz9gcCcn+dDiNct8af+3dbRCrsXvXqrfBgH1Dz1DEEhy9Qwh4PeN8uJWZ2hWN2lfPAeg+ozIg==
X-Received: by 2002:a05:6402:3219:b0:42a:e33e:54d with SMTP id
 g25-20020a056402321900b0042ae33e054dmr12529877eda.299.1653076695002;
        Fri, 20 May 2022 12:58:15 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 gx5-20020a1709068a4500b006f3ef214de6sm3448448ejc.76.2022.05.20.12.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 12:58:14 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH v3 2/3] eudev: Cleanup redundant configuration
Date: Fri, 20 May 2022 20:58:08 +0100
Message-Id: <20220520195809.4855-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520195809.4855-1-alex.kiernan@gmail.com>
References: <20220520195809.4855-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 19:58:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165951

hid2hci moved to bluez4 in 2011. The FILES changes for ${PN} and
${PN}-dev only added existing defaults into the set.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
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



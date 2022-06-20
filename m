Return-Path: <qorin.wu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E212C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 13:12:27 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.30009.1655730740148837162
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 06:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IXoqyUnK;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: qorin.wu@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id u12so21015296eja.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 06:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CaXxWJIcjfFZ6fDrU/eETw37E9I1snfEzVMsK1DLgDc=;
        b=IXoqyUnKZDF1D+8Crz3KCnb3rI5qV0OfA4LaZOfI7mw/oMThIpSZi4V4mVua4IeRYF
         VaWbj5HTQJhg3+HAbsTvZANchQq29ag48DldlkgcahE8D1H1vGbasAkaA3g9ZJesjEDQ
         gfrXpNLBjwS6CBfOV0Yb6CnAABH7jze3dDOmGD4PV/3Q2MET3VWiOzSm7M0jWQomTdcU
         +IsUEzoO/wwC5O/T4M94PIzzehNxHWcVCbOPq+30NDKdwTl/SEUNCJ2ArZgng1QXcyTy
         Dssuki7oElZIJuWXAYPhBeHIFwtVZ4YzFp/SdarBch9kBYPbBbi5Q817/90HQL4fCO/B
         u1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CaXxWJIcjfFZ6fDrU/eETw37E9I1snfEzVMsK1DLgDc=;
        b=yVQmp0OOelhXqre1Qlikezuo9DQKayjxoX5M1BJ6FZWJKVkfjuXFLzEPpK2f7nIR4P
         PO4afGe0JEEtPHeT/+/NJ1HnyFlPYNctBeJ1+pQEW50NDZ8M1r98cyMntk4Lqt1UGooF
         Z4FiKkrN7xmC2ixOxNyZC6WGB20BZT4scIhRwrqFYDjSP7Yow1abUqfzJbsn/mR6tGfp
         qgmd7U9IAriPtF0ac0kEQPFlcUivpzn8C+J/SyabONGjSxg8ljl4z53F+HzTOronEYth
         TQgxJyZFwvYL6HeSOO0yBtCNY2+tj5+55yLcSpZB44Yd6s17kdAVE0u5gwXlY6TySKJe
         K9TQ==
X-Gm-Message-State: AJIora8eETOcj4R0naFLyEounT6Xupgw4XOU3sAGM2n6wvOkIDuW+7m6
	W/mgKmAXHEDrfla53NrFeWpkt4sNGg==
X-Google-Smtp-Source: 
 AGRyM1um6p4QZZqzi8/5ci30IMUjDilTsubFwKQTsCDfRKHpHKrj3NJ8BoTYwPoJcELcegRoqsPXbA==
X-Received: by 2002:a17:907:1385:b0:710:6269:62a2 with SMTP id
 vs5-20020a170907138500b00710626962a2mr20753679ejb.537.1655730738010;
        Mon, 20 Jun 2022 06:12:18 -0700 (PDT)
Received: from localhost.localdomain
 (2001-1c00-0f23-2600-7412-8cb3-b465-5ec2.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:f23:2600:7412:8cb3:b465:5ec2])
        by smtp.gmail.com with ESMTPSA id
 o22-20020aa7c7d6000000b0042dc8dd59c7sm10270328eds.51.2022.06.20.06.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 06:12:17 -0700 (PDT)
From: Qorin <qorin.wu@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Qorin <qorin.qorinna@nl.abb.com>
Subject: [PATCH] resolvconf: Install missing normalize-resolvconf file
Date: Mon, 20 Jun 2022 15:12:11 +0200
Message-Id: <20220620131211.159930-1-qorin.wu@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 13:12:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167098

From: Qorin <qorin.qorinna@nl.abb.com>

It was moved to a separate file in version 1.90
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
index 94fd2c1a70..d2d9973852 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
-RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN} = "bash sed"
 
 SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://99_resolvconf \
@@ -46,6 +46,7 @@ do_install () {
 	chown -R root:root ${D}${sysconfdir}/
 	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
 	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
+	install -m 0755 bin/normalize-resolvconf ${D}${base_libdir}/${BPN}
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
 	install -d ${D}/${sysconfdir}/network/if-down.d
-- 
2.30.2



Return-Path: <qorin.wu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03347C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 08:08:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.17412.1655712505217961381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 01:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BimsDDF1;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: qorin.wu@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id n20so12706286ejz.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iNZRJo4p6Lhkcq4Sjp8T3WFlWHkg51QiJvV38WfctJk=;
        b=BimsDDF1Iz16qawQMpa6io840dZ6qfyvyE/CqxulyMaXUfh6drvQQO0SQjocscBsCQ
         zaEZclo3uEnyrhzUi2hIW5m50qZ/PlLsW+LBnH6YrgWP8tH1kOTG01pVBJLUEcLJLCc4
         0y91kofY5fxIQEP/M6UWhaXwCK/JygD09h9ReXc8dWJnYM2kbWrhE0r0MUKCqHsh3oYj
         Zj1PdFz3CNyTu85QtjzNTBSO7ZPbw7Qh7o9jpExdffQroOukXBbEPQJqK06W+K7xJykn
         SraU0VvnxeJX/4lQEzI5UXE1AkwDFC1zRkV0mHNqWWsYfhDmo4NHxEVfZUXRe8iLqR36
         FBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iNZRJo4p6Lhkcq4Sjp8T3WFlWHkg51QiJvV38WfctJk=;
        b=r5VZUTyDqwHU9VRsd9KJ/6TgE8sziSjwvvGMmqiU/xyJUepEVVgzx4/E1YwEedReUW
         bDJZMT5T4rDZoGZS419rAtufQIZoZuGMKHqgJnE+6nM3tTq1W678J/LLyTB5UPSPCsFk
         XepaQx1RREwCc33EJYLBc3klMrDHln8T6+bthex106W/DBPtrhuZUC2VTDtKff4Y5UTf
         uhfxErEbL/E0DtwO7l5EFl3TScY0DG7EwTgXb1C1jMLJMsxvj3LgtyBxakaffc5xEfuK
         8W/iKjr3qs5qZ+fMll3pg6ZwfpJWfzud1cAjxakV/hUGWZ7YdyIVE15xtdrSS1rJLn+j
         0nqQ==
X-Gm-Message-State: AJIora8Sjr0LDrzo30ZFEmp0QVA7bZQY+CnZj2SBZHC7+GOe5nGZ3pga
	pB7Zu4a3vDlQQ55poXwXJghVh5jl0g==
X-Google-Smtp-Source: 
 AGRyM1uWPLOfolRUH+4pPKKNHQii3pnEuP4reZI7y6+ZPqcEaNrVi7+LuGaGCnOZvFNFNWMCBdJX1A==
X-Received: by 2002:a17:907:248b:b0:70d:cedd:6c99 with SMTP id
 zg11-20020a170907248b00b0070dcedd6c99mr19309122ejb.675.1655712503409;
        Mon, 20 Jun 2022 01:08:23 -0700 (PDT)
Received: from localhost.localdomain
 (2001-1c00-0f23-2600-7412-8cb3-b465-5ec2.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:f23:2600:7412:8cb3:b465:5ec2])
        by smtp.gmail.com with ESMTPSA id
 w12-20020a056402268c00b0042aaaf3f41csm9921282edd.4.2022.06.20.01.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 01:08:23 -0700 (PDT)
From: Qorin <qorin.wu@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Qorin <qorin.qorinna@nl.abb.com>
Subject: [PATCH] add missing normalize-resolvconf file since it has been moved
 to a separate file since version 1.90
Date: Mon, 20 Jun 2022 10:08:20 +0200
Message-Id: <20220620080820.10211-1-qorin.wu@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 08:08:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167087

From: Qorin <qorin.qorinna@nl.abb.com>

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



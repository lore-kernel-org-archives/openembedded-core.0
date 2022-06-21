Return-Path: <qorin.wu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576BDC43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 08:55:33 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.41092.1655801723063832783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 01:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ly8qaXR4;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: qorin.wu@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id lw20so3665961ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 01:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QSphPzW2upvyYbnJ2rEDCx41HO2bu5zjD9sZXxvXRkQ=;
        b=ly8qaXR4wwXm8AICntt/X/7MEqytGhXabJC00uSt/MGFR1tfjscgi5MF5HbOiW0GZT
         RX4402XCPjvwWk9rJ+cdXnLFbda6qYYAqWZat3BsLWTw+KZ7TZNwnU76I0WGNsRbjsLB
         VUKKwaZMsl/N6ECMZefPUGvx7oM9/UdFce+YxkKVVNH/nH+jQCaMwQP1QQ7N7ZFaBn8z
         S4bryG8WxAY6CU2/9+OIkoSj8DjI1ctKAdMb78LeJ8Tu6QrcWBrDGLkqXImGe9niDgzU
         XoiTvC0/ISu8ED1R1r9+MWE/VKlRuIFbP45w+vHtU2KBdFetXH/nciTJcOekKmCq3L5c
         nixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QSphPzW2upvyYbnJ2rEDCx41HO2bu5zjD9sZXxvXRkQ=;
        b=e1n32BbgGl4q07/DU1PaAxGg+zo3pnDtxC15dWEqTR2jIneXdwNGnKs34gsU2HSMzA
         heo07vuSu9HBvCeIEWVv2kePyqbLSzr9PgNHRWcjhXNmEj6D5ypiL3o+fbjdEVrDR0bf
         59QAqSMtd34wnpsbhaJxtNTPPRkfMxqcsqIdzJhBusauR2MOJy3SOSkfXfr5dsowhwDe
         VgFiXTp/lWFmylJ5M6MaWhhrlXfPJMf4BoTqmPiTpyRLtvf1WNdkv6Ly9/t72+A8hWTY
         NEdPduBRzxI6LFgopNHFb46gDMtHCNjVr8mEltq7vaFuU9QZhWCycRA94QRK4oYH8tEf
         ZMnA==
X-Gm-Message-State: AJIora/vox85TTGeFMkHDNwa1nY5vAOx8eWTXa/e9DicmiBDDpbADMWN
	DWtNQdJ5z9YARJoh/88xFm+ZgQrwoWSd
X-Google-Smtp-Source: 
 AGRyM1vJt4RPWj1o/yP2ZrhY9Yqxi+yaRgHUGMopR2e1fI9kGRB4Dvi429h2H+cnW4X4aUSolgwqPg==
X-Received: by 2002:a17:907:971e:b0:71d:955c:b296 with SMTP id
 jg30-20020a170907971e00b0071d955cb296mr16600452ejc.633.1655801721363;
        Tue, 21 Jun 2022 01:55:21 -0700 (PDT)
Received: from localhost.localdomain
 (static-45-121-100-159.thenetworkfactory.nl. [159.100.121.45])
        by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b006fee7b5dff2sm7260945ejo.143.2022.06.21.01.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 01:55:21 -0700 (PDT)
From: Qorin <qorin.wu@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Qorin <qorin.wu@gmail.com>
Subject: [PATCH v2] resolvconf: Install missing normalize-resolvconf file
Date: Tue, 21 Jun 2022 10:55:19 +0200
Message-Id: <20220621085519.10167-1-qorin.wu@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 08:55:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167139

It was moved to a separate file in version 1.90.

Signed-off-by: Qorin <qorin.wu@gmail.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
index 94fd2c1a70..dba58ad2d6 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
@@ -25,6 +25,10 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/"
 
 inherit allarch
 
+# The normalize-resolvconf sed script uses /bin/sed on the shebang line.
+# Ignore the file-rdeps test to avoid having to add a runtime dependency on sed.
+INSANE_SKIP:${PN} += "file-rdeps"
+
 do_compile () {
 	:
 }
@@ -46,6 +50,7 @@ do_install () {
 	chown -R root:root ${D}${sysconfdir}/
 	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
 	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
+	install -m 0755 bin/normalize-resolvconf ${D}${base_libdir}/${BPN}
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
 	install -d ${D}/${sysconfdir}/network/if-down.d
-- 
2.30.2



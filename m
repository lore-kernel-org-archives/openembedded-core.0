Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D350C7EE33
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:41 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.81.1685068179210567935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ePoNZM6O;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2537909d28cso299941a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068178; x=1687660178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hti6Y2j5citvZ7loHxQY6XsC/72NYTLiJ1JCdvc/vsI=;
        b=ePoNZM6ONjc4PVSzeaQhkukX8B1rEvwWVxj9cWm4DbfozYmMSD4IIYX3UqMhjWVSEm
         7sArzdWh0/YKog7V/MLm7AMu+ai4AUVijOO3n9jcx0gJ6aDL01/9O2QdH3xNSJOTH+IK
         ZfpAkLvsIoLtA+iu+fWHbosjr9NvzwKfmazfCvSa4HNzfYGMjYj54MSOWWlp9em04N3B
         r2YBTm0T8PBvLvN0+bElkuvWsxeQi30I5Z6cJno4qFXMUyP43tu9pUuRzvvNGqClqXI7
         SMnr8/Yhy6pqhWIaDEHTWrujzb2oRMDhSsIc2yTDE6VPhiYx/lgPrzPCOEDx9LUUvZ5P
         6XOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068178; x=1687660178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hti6Y2j5citvZ7loHxQY6XsC/72NYTLiJ1JCdvc/vsI=;
        b=WRJQwfMk0sFiMhmG/g4v46J6iCuCDMIdtiy9BVrT5STeM+7InD75SamYUiuelW2AT8
         fYDiB+XRUr/9j/5tW1xQP26YuZYAM+q9av4+i09TSLgxfFmOt1Kh7RD2EViPe0D3ku2H
         CdFzpULZN3zFiI2598fHbcUd+qXYVAhCuUqHwPDMqqBL3YQzWDY53PDDpfVPKnaRj/dx
         teK3GoO9XZf/Ssv3+RuBqSlqgyDzmn+hkskgcXjGW0vPwLTjHlitzkMZlJ2UgGycAohd
         /whd+2w46cAkoiNCh8Ng+e9mpm9DAsHpVOLJMLckBVpEppmCsb7T8TcFC9rabg4S/hc1
         VtMQ==
X-Gm-Message-State: AC+VfDxZuNKHHY+VZ6DDzs8pHOHGq/9s9fwJgdTnYT6nRU1dhYR5gshM
	QofScOnfySXOhZ2sBSEiVo4W1HiaGuQB1sB2pz0=
X-Google-Smtp-Source: ACHHUZ4qbgI1e44rg6AgdD+1pGlMVwdfeH4rWRXIlFB3PaXwRFh4bbmz7pp88QP4qe0a1TpEepDmQA==
X-Received: by 2002:a17:902:e5cc:b0:1ac:6d4c:c24b with SMTP id u12-20020a170902e5cc00b001ac6d4cc24bmr1020704plf.3.1685068178339;
        Thu, 25 May 2023 19:29:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/21] avahi: fix D-Bus introspection
Date: Thu, 25 May 2023 16:28:57 -1000
Message-Id: <45714f9ea8bde1c8047d493667b1a1d808ea7949.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181741

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

Install and package the D-Bus introspection files.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b8183ad25af3bcf23f04dd649b6ef665569fac8c)
Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 9bb5e5861e..b5c966c102 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -83,7 +83,6 @@ RRECOMMENDS:${PN}:append:libc-glibc = " libnss-mdns"
 do_install() {
 	autotools_do_install
 	rm -rf ${D}/run
-	rm -rf ${D}${datadir}/dbus-1/interfaces
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
 
@@ -135,7 +134,7 @@ FILES:avahi-daemon = "${sbindir}/avahi-daemon \
                       ${sysconfdir}/avahi/services \
                       ${sysconfdir}/dbus-1 \
                       ${sysconfdir}/init.d/avahi-daemon \
-                      ${datadir}/avahi/introspection/*.introspect \
+                      ${datadir}/dbus-1/interfaces \
                       ${datadir}/avahi/avahi-service.dtd \
                       ${datadir}/avahi/service-types \
                       ${datadir}/dbus-1/system-services"
-- 
2.34.1



Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE591C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 17:55:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.9493.1658426091461063725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 10:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RbYuUqG4;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id b6so1456383wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KciLPacHcX37PiLMQRto16dU2m2MX3ZL05z9dd2Idp0=;
        b=RbYuUqG4xKh7KKPp/Xdknk0WHajno//svh+lCbnxjRIBHK7nI30i8BYUT66iajO2vP
         VYKqljPvyXpNN6vwYwS9h6aAqKKNunvaSfiq2nUNy+3Nsjmv52rqOAkte8c8oRBLiKML
         GHxCcVskDgnP4PpyZmErRdkZrmcnuB1H+vfKHOEk3LPOrH3e4GYTwXvPq5MMkXP3hlmy
         KNlsejvztaM9z/z26K25VTH5pspCI8XhCNQztk7AHxZEPVWnPpIuc3SlblqMx76ZpOdA
         hdtKepxkEoZzM/Aa8iaN496zvVk7k1/Fkn7hAq3eBHIqVlN50O77dL64SUgTLEmqeJMh
         ucIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KciLPacHcX37PiLMQRto16dU2m2MX3ZL05z9dd2Idp0=;
        b=eRXgnyLlVnDl2qdjNooC6BcI58szR5vXJ91rxkaCSGN/0eHSepMtIkjeYFBsb5knWX
         /axfodplkmvsFCLo8f9d1bicX2jq87MKgHTDakXmVfoVuaB1rLoqk1mWs4/sL7nqRXtw
         R34D4/tiYvT5bflRWKnhq1m8gYJi+DjmuPYsYl88MBvz8cX7q2PpGGV+FKNEZ1lEM9cT
         wlUj4Q3uxybSIMgO2ya4ldk1BAENwEuwTiZnxXS/ibaADJrZ3SzOTgTufuidr4iefF19
         cDc17Eg5ECBR+Rx50DvkvcMTpf2lJshDj2L09wzLYYcdtQHIVTUmx7Pi0VdrnXdwKbJT
         kkFw==
X-Gm-Message-State: AJIora+/Kr8BEQY/LZduTOYKYJbfbT8Xk8XHZGhUAhY4LsSIeIs4Trod
	eNEABleZ5F+2ApcdQZseHsoJLZRU0Y4=
X-Google-Smtp-Source: 
 AGRyM1tOkI9M7ZlWyuvTO+yod7sF6e4DqJkIL8+DuQD6kvy/IWEVWKzT26hqv1gNNiuK5lHP5/XJAQ==
X-Received: by 2002:a05:600c:4304:b0:3a3:2e32:8a8f with SMTP id
 p4-20020a05600c430400b003a32e328a8fmr4805362wme.104.1658426089680;
        Thu, 21 Jul 2022 10:54:49 -0700 (PDT)
Received: from localhost.localdomain (ip-185-104-136-29.ptr.icomera.net.
 [185.104.136.29])
        by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6849000000b0021e48dfe790sm2897064wrw.54.2022.07.21.10.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 10:54:49 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] bind: Remove legacy python3 PACKAGECONFIG code
Date: Thu, 21 Jul 2022 18:54:01 +0100
Message-Id: <20220721175401.4923-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 17:55:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168391

Python support was dropped upstream and removed in 8a9a5885995c ("bind:
update 9.16.26 -> 9.18.1"), clean up the remaining pieces of python3 in
the recipe.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/bind/bind_9.18.4.bb | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.4.bb b/meta/recipes-connectivity/bind/bind_9.18.4.bb
index c68816c06ec1..8c62fc771d4c 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.4.bb
@@ -46,8 +46,6 @@ EXTRA_OECONF = " --disable-devpoll --disable-auto-validation --enable-epoll \
                "
 LDFLAGS:append = " -lz"
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native setuptools3-base', '', d)}
-
 # dhcp needs .la so keep them
 REMOVE_LIBTOOL_LA = "0"
 
@@ -67,12 +65,6 @@ do_install:append() {
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
 	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
-        if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'false', d)}; then
-		sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
-		${D}${sbindir}/dnssec-coverage \
-		${D}${sbindir}/dnssec-checkds \
-		${D}${sbindir}/dnssec-keymgr
-	fi
 
 	# Install systemd related files
 	install -d ${D}${sbindir}
@@ -119,9 +111,4 @@ FILES_SOLIBSDEV = "${libdir}/*[!0-9].so ${libdir}/libbind9.so"
 FILES:${PN}-libs = "${libdir}/named/*.so* ${libdir}/*-${PV}.so"
 FILES:${PN}-staticdev += "${libdir}/*.la"
 
-PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-bind', '', d)}"
-FILES:python3-bind = "${sbindir}/dnssec-coverage ${sbindir}/dnssec-checkds \
-                ${sbindir}/dnssec-keymgr ${PYTHON_SITEPACKAGES_DIR}"
-
 DEV_PKG_DEPENDENCY = ""
-RDEPENDS:python3-bind = "python3-core python3-ply"
-- 
2.35.1



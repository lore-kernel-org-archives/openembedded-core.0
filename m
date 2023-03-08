Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8A0C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 22:44:59 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.7771.1678315490180098487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 14:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bBrVNSjI;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id r16so100764qtx.9
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 14:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678315489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YI9LQvXniCVpyAOn2y2qWGoj+t670mySCnKNo6CECJ8=;
        b=bBrVNSjI5uNKPbXG2ziEuW/g148oBID3FZ7r5H1XOspVoShkEEE1k0xLl7Ydr6q5p6
         dPHqtFlyihTvQyUxxoGobtJrzvPVuaI3os+BAsl8qm2t4DO0OtATEsxIU32O7IguxRCC
         ex70fCfYusvHuI3w+TIZD+saXbjE409KwWHYOI8nZgKYZjKv8eCm1q07mZvbaXqIbkJT
         P7DQECeIQRey6IROQ3c4OhV6DOgdqgpjfnMG9dAFFaP0bQETOiLMfMA60B4tLy/T0m11
         ZM6j0FB6hXr90XRHuXr6S0TxRYdU1oyzJGahX6Qo+cx6EQvjIDAe30UoJow1psXzX1Pn
         0kQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678315489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YI9LQvXniCVpyAOn2y2qWGoj+t670mySCnKNo6CECJ8=;
        b=K1Gcx73RBsjNDAWh87ch2kCqzewf8DIgNnbD5UuNUNJEvPk85zp+6KFXwt1pi7n+Xd
         GdiuT46xdXkhb2zUGR3/AMRojETNNv0NSvJuo0BEQmvO+22KKexmmLWvteWuLUi3urKV
         gitlcL8jN80RI5MypDmTIeVBy9jp1KyBuXeHyRefRTcwiIRUlO+Pz+ZbuXiJMSAdubpX
         SpoPJpwjDAnyRSICmyDVCYhFYlZnqex2RnJCMBIS9NDYt2cs2/Ym/2MpQCySkb+XUS98
         GXVSDdphuKeqZNS5NcgZ45NdX3TDtBptaEkmXYpH/JQA0O0smoYnb3Lmkz1d/h1pg1qD
         LYnA==
X-Gm-Message-State: AO0yUKXJctEhIdcnPLr2Hp4Z9A3SgWPqPTSvMxgunUipxe+c6LfZZw7X
	z37JztysP1jX32fxJMrL4NA54COvyzA=
X-Google-Smtp-Source: AK7set830boJjtnEXIPJrS7PDBpN4Jeebd3mOMWFFIzr5EkCzIoerSXDpCTz+F46A+fUaFDlUOYJAw==
X-Received: by 2002:ac8:5e0f:0:b0:3b9:b761:b0a0 with SMTP id h15-20020ac85e0f000000b003b9b761b0a0mr1366202qtx.12.1678315488931;
        Wed, 08 Mar 2023 14:44:48 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id dt17-20020a05620a479100b00742f250ebc0sm12228087qkb.9.2023.03.08.14.44.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 14:44:48 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] cups: add/fix web interface packaging
Date: Wed,  8 Mar 2023 17:44:42 -0500
Message-Id: <20230308224442.33516-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230308224442.33516-1-twoerner@gmail.com>
References: <20230308224442.33516-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 22:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178204

cups includes a web server. Users can surf to port 631 (default) of a
machine running cups to (potentially, based on configuration, default off)
view jobs, add printers, and perform other forms of administration.

The location of the various resources that are used by the built-in web server
(e.g. index.html) are installed under ${datadir}/doc/cups. By default these
artifacts would be included in the ${PN}-doc package. The comments in this
recipe, however, would suggest an attempt was made to have them added to
${PN}; albeit unsuccessfully.

These resources add roughly 1.8M to an image.

Since cups does include a configuration option to disable the web interface
(--enable-webif), add a PACKAGECONFIG (default off) to allow the user to
decide whether or not they would like the web interface configured and its
pieces added to the image. Enabling this PACKAGECONFIG both enables the
web interface to be configured and built into cups, and also adds (by way
of a recommendation) the web interface package to the image. Considering
that the previous intention was not working, defaulting this option to off
preserves the existing behaviour. Previously in order to have the web
interface data included in an image, a user would have needed to explicitly
add the ${PN}-doc package to their image.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-extended/cups/cups.inc | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 1b522d7d8535..da320b108552 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -47,6 +47,7 @@ PACKAGECONFIG[gnutls] = "--with-tls=gnutls,--with-tls=no,gnutls"
 PACKAGECONFIG[pam] = "--enable-pam --with-pam-module=unix, --disable-pam, libpam"
 PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
+PACKAGECONFIG[webif] = "--enable-webif,--disable-webif"
 
 EXTRA_OECONF = " \
                --enable-dbus \
@@ -92,7 +93,7 @@ do_install () {
 	fi
 }
 
-PACKAGES =+ "${PN}-lib ${PN}-libimage"
+PACKAGES =+ "${PN}-lib ${PN}-libimage ${PN}-webif"
 
 RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps', '', d)}"
 FILES:${PN} += "${libexecdir}/cups/"
@@ -101,13 +102,10 @@ FILES:${PN}-lib = "${libdir}/libcups.so.*"
 
 FILES:${PN}-libimage = "${libdir}/libcupsimage.so.*"
 
-#package the html for the webgui inside the main packages (~1MB uncompressed)
+# put the html for the web interface into its own PACKAGE
+FILES:${PN}-webif += "${datadir}/doc/cups/ ${datadir}/icons/"
+RRECOMMENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'webif', '${PN}-webif', '', d)}"
 
-FILES:${PN} += "${datadir}/doc/cups/images \
-                ${datadir}/doc/cups/*html \
-                ${datadir}/doc/cups/*.css \
-                ${datadir}/icons/ \
-               "
 CONFFILES:${PN} += "${sysconfdir}/cups/cupsd.conf"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/cups-config"
-- 
2.36.0.rc2.17.g4027e30c53



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31061C76195
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:43:19 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.482.1679092992169800602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GWOa8P9X;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so10722051pjt.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sbqHlBFBOVI9T7GahVIo91tdzf0CiFDRR14OpJ4O+I=;
        b=GWOa8P9XA0InjWYmwhZ3Rnr/2q6Ky2LtASiXGOODZ+1YHaRuXItgAeXFcriJie5IOB
         BBF8Vm7x/mWyAprpgmS+tw8UIpvPENRkG3/l3NJOaUwiESElWpzqh+1IdHoVpjhNyMQW
         j7U0qtCkqnU6lT1JUndkGP2/00sWsLe3VZj30BNYe/gkjalooa01AEWNX8QvTxsmsCAg
         vKfe0/KVmz7KvTEsdr/8Wf8W73lyvtrrWaPf4920Hq3yjyDyws66wmyikkF1yY5oL33u
         /NhPN+oA/5Hbn9h70fevMvtqCB4HEG9Nl4AykRuY/XNkRCm/UxzijAwkRmdcP4euaMUr
         mIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sbqHlBFBOVI9T7GahVIo91tdzf0CiFDRR14OpJ4O+I=;
        b=MeQIKxGvjKeMPa0yTjwjmqF7nSduuUaq800TeMc0lp49avbb1AmSmHwr1ERp9SUrCu
         mp6fhvy72MgVi6DPXNCpMsAHDZGIy7uLyOqik7rP5SMB/ZWmNlIttUhmE480EWzN2PJF
         ysg0q5NmPibtD+VXfLqbPpBfwJMt0TBSNuZ566CFgAEXAniu8sSenGYagXr0EH+pnuhh
         VNoP45G8cf0ZZqmuHClgx3jQ4TK8jV++m2i3XlykJN4Ql/3e7p9D4ZRL5FFdQu5PwgcA
         LPHUQ5BTw5Z9lmcXb7zPf8S3YXDvg8mGMTxubPOesisU0Tb4euR7UOXE/hAHkH3J/+uI
         SYPQ==
X-Gm-Message-State: AO0yUKXXkgMDOpotMDaOOu8PPRkqQasJ/z8VmlJNJcRcz0Q2NTlETNTf
	rIbWsR3KcjBzxHwZNeGhZXKpLnZdb7ldcOBIAVc=
X-Google-Smtp-Source: AK7set+LNzYwYI9Q3LgogaBl7EFjHFM0A5ilWYp7h9oEYSaBQyweqgnj4fveiEhvwZHLIuBkIhCK6Q==
X-Received: by 2002:a17:903:4111:b0:19a:b6bf:1df6 with SMTP id r17-20020a170903411100b0019ab6bf1df6mr7827549pld.20.1679092991280;
        Fri, 17 Mar 2023 15:43:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.43.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:43:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/21] cups: add/fix web interface packaging
Date: Fri, 17 Mar 2023 12:42:30 -1000
Message-Id: <18194378508beda1ca1fee84e10351b5bf0d86a5.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178777

From: Trevor Woerner <twoerner@gmail.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2c9bd267ec532cd86a4a1be1d4e499e2aae89aba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 714be4b26c..0acc5c575e 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -48,6 +48,7 @@ PACKAGECONFIG[gnutls] = "--with-tls=gnutls,--with-tls=no,gnutls"
 PACKAGECONFIG[pam] = "--enable-pam --with-pam-module=unix, --disable-pam, libpam"
 PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
+PACKAGECONFIG[webif] = "--enable-webif,--disable-webif"
 
 EXTRA_OECONF = " \
                --enable-dbus \
@@ -93,7 +94,7 @@ do_install () {
 	fi
 }
 
-PACKAGES =+ "${PN}-lib ${PN}-libimage"
+PACKAGES =+ "${PN}-lib ${PN}-libimage ${PN}-webif"
 
 RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps', '', d)}"
 FILES:${PN} += "${libexecdir}/cups/"
@@ -102,13 +103,10 @@ FILES:${PN}-lib = "${libdir}/libcups.so.*"
 
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
2.34.1



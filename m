Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FD6C7618A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:46:04 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.5090.1679003157594842028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uwLLxmF/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso6654101pjf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQu4cZ//BHmsblYerq9w3at+0FlnktvgmdgwCPhYRgs=;
        b=uwLLxmF/GuINd7fUtaZqAIblIjJwAmQaHdz21ErtsVsual2jDzegcONWxCEvu8J4la
         16eviKxhKyu+/Y03DF30xURnLGqhcFcXxfF/wLYQVzMYNr60FPhHWaJ0ztU+cvMj2l0l
         3Um5VPhUR+GXy6uDyz6uQoLp3gpJ6V2UvedoDQ0L0d9hYYKqV06n5kcrp++gGqe4fbmq
         E/22swAB24FSpg/ZSJ/UqT2RyQa+ABOyYGTR4b54dlG49iG7EbfTjAc5VA+pNjvzHg+G
         Yn+FYOsRDzIDUlcvcM+O5qHtjsGjqlYS+YHukfNtTn27jrJaOXhe4gS+VrjAUxFStNaM
         GIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQu4cZ//BHmsblYerq9w3at+0FlnktvgmdgwCPhYRgs=;
        b=nESP1bIWJhoYmL7XtbcYxVdPJwGpKZeCRDLFSJAUjxRCPlBaleuSKTnKvxOV+6ntSd
         /OoE2peE8MjmNtjMZHM5JAyGBWNIyYWHitrmjKjnZnTg+1J7+Fzpfuc1q8lHm3biMtR4
         rgSRw6oFn4SImUg0hEIbMFOAJKVyA5FlK585BX6pYgq462iSLdWBR7rnOcZefIWS1oAC
         epLkrGxfrJDJAg2Dxzvs6Npq8wzQTjeAVxo5+idybKkMCcp8r9PQlCvdbg8KKMqvA4wG
         YVDiDNFT4Im/2VQ2vhhG247MBotjujMndRlG/f9/9yUdbmWZdJ+CShim6GTgjzH4L/F0
         i2bA==
X-Gm-Message-State: AO0yUKWndHlmwNEFBqehzH5v8Abbo2G9HyWDQeHi+O4Uc8rO/C5PFsIJ
	2YilDt3ctEUQH5GcjmbtnaIcSj8Lg4liEb00fj4=
X-Google-Smtp-Source: AK7set/MLj8238nfVpAcwE5q0TSSqHm68Iv2P7Dh3Z8Tx23jVuSVHeWgA+wVPezwWoSrxZxdo53aXw==
X-Received: by 2002:a05:6a20:8353:b0:d4:a6b3:d9e3 with SMTP id z19-20020a056a20835300b000d4a6b3d9e3mr5081058pzc.8.1679003156651;
        Thu, 16 Mar 2023 14:45:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/23] cups: add/fix web interface packaging
Date: Thu, 16 Mar 2023 11:45:13 -1000
Message-Id: <dd7c7fe83490758df0b30f0d8748746b32cd3d09.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178727

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
index 1b522d7d85..da320b1085 100644
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
2.34.1



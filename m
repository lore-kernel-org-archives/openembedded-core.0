Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8796AC3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:38 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.76.1659106113130715131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GAEegAYD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id y9so4801926pff.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Di/SosvR0mw1OVBS6MHaKOdkhWI2wER4nt5pInl6aho=;
        b=GAEegAYD+YI30QgehHrDaoS7tuOJqLUU+nTW/PpxQyRogyn8SE7mEYhqjX95rjb14t
         yCwyHEkWyaFQoaRQLMJPtH4Inkxl671IucnCJ37wsjL7eJmnlCerXixXSq+pcTgcjFWK
         hbcSq43HhKIriT0Jd9bgfB9JuEImTsKS7dw0Ul1Cy6F58XzeO7AjE7MGzG0ouoJPM3Qn
         DljGbG/CUk/hUbAOTcHevkfk/UBlZNB+SPk4MzZ7djiJEEmQ/DkArzhP+qBZYc6ninSa
         HOnelMzKXHuFHhlX2Vb8/jbKBctEXWqWjusCzsS+65hi6hGmWNMhfTaCF4ErYvmST396
         Xlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Di/SosvR0mw1OVBS6MHaKOdkhWI2wER4nt5pInl6aho=;
        b=pBYAuAm/iGMekyhymKDw+pO0TQE2Im4rzEt6kVVt4VJl2e2K17ENhVr33UAyA41PWj
         6cnZrA1VB7gJnsCxqhtgrtDsHjJeclrVRYNKbaRVtFSCMQ5dbxJYFVVJTFaCpmu9FAP8
         z2KlHdyNczqxITIyigTNUBVrw2ApFKDRS69RkypupUfKzAkAtyOm8k6/MK8bu8nNGQMq
         4OheaVPaYueUV5Y7wBHovJUN7apncYS5Z+fcco1R/qV18x+hgOXgQFVjW1l2/kHkLR2s
         KjgaXojIThPraiCKrPcDQ0revr2uuG4TD4Cv806kbR4URnZvoUn8/9lrZ2A7GDAxTLpq
         Jggw==
X-Gm-Message-State: AJIora/cw2xJHO48r4AchPhwCwrePGkMxQGAN4qOLVIR7qoYWd4Hg2Jp
	+JziUOjCtyyrNXXKP/Zs2I9cWwvgOcHX4TRp
X-Google-Smtp-Source: 
 AGRyM1vGct/asmzFifBiwlh7JL3+cM/Cnjneou5fsY3fe32YwzPz3S0utRAx3SMBkciy9h8nl2Z+Dg==
X-Received: by 2002:aa7:8554:0:b0:52b:cfed:168b with SMTP id
 y20-20020aa78554000000b0052bcfed168bmr3955857pfn.4.1659106112012;
        Fri, 29 Jul 2022 07:48:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/29] bind: Remove legacy python3 PACKAGECONFIG
 code
Date: Fri, 29 Jul 2022 04:46:44 -1000
Message-Id: 
 <acda23e0d985049ae83e9516315c33afae763ad9.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168663

From: Alex Kiernan <alex.kiernan@gmail.com>

Python support was dropped upstream and removed in 8a9a5885995c ("bind:
update 9.16.26 -> 9.18.1"), clean up the remaining pieces of python3 in
the recipe.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee4e4eb16a3729dcafad075c42aec1695b8ea15f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bind/bind_9.18.4.bb | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.4.bb b/meta/recipes-connectivity/bind/bind_9.18.4.bb
index 5af2022129..c3efaffeda 100644
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
 RDEPENDS:${PN}-dev = ""
-RDEPENDS:python3-bind = "python3-core python3-ply"
-- 
2.25.1



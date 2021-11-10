Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C32C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.334.1636573186184920158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jlimUD3P;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id z200so3198312wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3AbgOOEx87rWR8fty2XZIG3ZhYQ8xwjpogBkJnQ6d1I=;
        b=jlimUD3PfNU8SzFGEpSdszEsy+ADHYrX+SbM0W2oGL6bqU8EiVviBO5AIeLnM+PeFB
         v7QNTrVDIqBWA7k40XLrhzUS72BjMP9dHr3duzXQzemsbCnHCiTh40rZsDksVBV7QlN6
         Lnq+QIm4nkl68QmaMk4Ag0oSGtIOxIeQOKhGzRwmKjpoHWtN6zPgsk6TGkqxSHHGCAqE
         +qW84be7mIBrKW9igwvfGMBY3QSOmyUUjFaY+Fo8MEGbQgTYjLdwrmjonsMh6wv3dKnU
         gGLaedZOBCnXxydoD8uNHmhZJeneG450kX4eUwk/onkEydYovy8QbuDjfhRp5tMMgGcC
         gVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3AbgOOEx87rWR8fty2XZIG3ZhYQ8xwjpogBkJnQ6d1I=;
        b=In4T4zwfJ3/8zH9A1mis/XgNOlrm6x/+yCiSJwvqx0pk4Bs38Kx06JfWBgFXx0Q+gz
         j0KGvwer9DdFt5h/+n3ELNOqb5wBK7+mNpMUzrlfDC6pzTEL9O5EpwBp/m8rp6f4V2ht
         rcpnuRH2jMWxHLoqu/JS3fSZc50xnZqm+6yoI0LSW6aB//+E0FxIlYW3ftWOB8UyZTKY
         JAPvRYTUdCGk+7YtNODNnLi12jQFrcR99GT42dMsYgtsEQaBgadPORArxGm2eHnQlsft
         +Ih2xOYWU9JeflB0EyRDbQni9Kjp5z3qSuQECGejp3QXcGur8wIf8K7KwQ2QP8coVzFR
         eUDQ==
X-Gm-Message-State: AOAM5301HAxqfuGPEhFVGv/QNbBZfdp5yoOuYe6GDNKQWFo9x8tna6oZ
	lyhividzOBXsz6vd8I3MjlB41bbszM8=
X-Google-Smtp-Source: 
 ABdhPJy4I9GOw+THpYsmJQ2a+NbzGmoh1dzslqSFQALs7bq+ZtGaLCTcWHqcgvWvtm7tbw1OVveFug==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr19587649wmj.52.1636573184606;
        Wed, 10 Nov 2021 11:39:44 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/24] xserver-xorg: convert from autotools to meson
Date: Wed, 10 Nov 2021 20:39:18 +0100
Message-Id: <20211110193937.2606747-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158089

Not every option was carried over, drop them accordingly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-xserver/xserver-xorg.inc             | 55 ++++++++-----------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6a5f274046..4a7048aced 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -23,7 +23,7 @@ CVE_PRODUCT = "xorg-server"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-inherit autotools pkgconfig
+inherit meson pkgconfig
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -105,50 +105,39 @@ FILES:${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
 FILES:${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
 FILES:xf86-video-modesetting = "${libdir}/xorg/modules/drivers/modesetting_drv.so"
 
-EXTRA_OECONF += "--with-fop=no \
-                 --with-pic \
-                 --disable-static \
-                 --disable-record \
-                 --disable-xnest \
-                 --enable-xvfb \
-                 --enable-composite \
-                 --without-dtrace \
-                 --with-int10=x86emu \
-                 --sysconfdir=/etc/X11 \
-                 --localstatedir=/var \
-                 --with-xkb-output=/var/lib/xkb \
+EXTRA_OEMESON += " \
+                 -Dxnest=false \
+                 -Dxvfb=true \
+                 -Ddtrace=false \
+                 -Dint10=x86emu \
+                 -Dxkb_output_dir=/var/lib/xkb \
 "
 
-OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
+OPENGL_PKGCONFIGS = "dri glx glamor dri3"
 PACKAGECONFIG ??= "dga dri2 udev ${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-logind', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-logind', '', d)} \
 "
 
-PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
-PACKAGECONFIG[dga] = "--enable-dga,--disable-dga"
-PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,virtual/mesa"
-PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2"
-# DRI3 requires xshmfence to also be enabled
-PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3"
-PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,virtual/libgl virtual/libx11"
-PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy virtual/libgbm,libegl"
-PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
-PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
-PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
-PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd"
-PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama"
+PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,udev"
+PACKAGECONFIG[dga] = "-Ddga=true,-Ddga=false"
+PACKAGECONFIG[dri] = "-Ddri1=true,-Ddri1=false,virtual/mesa"
+PACKAGECONFIG[dri2] = "-Ddri2=true,-Ddri2=false"
+PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false"
+PACKAGECONFIG[glx] = "-Dglx=true,-Dglx=false,virtual/libgl virtual/libx11"
+PACKAGECONFIG[glamor] = "-Dglamor=true,-Dglamor=false,libepoxy virtual/libgbm,libegl"
+PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
+PACKAGECONFIG[systemd-logind] = "-Dsystemd_logind=true,-Dsystemd_logind=false,dbus,"
+PACKAGECONFIG[xinerama] = "-Dxinerama=true,-Dxinerama=false"
 
 # Xorg requires a SHA1 implementation, pick one
 XORG_CRYPTO ??= "openssl"
-PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
-PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
-PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
+PACKAGECONFIG[openssl] = "-Dsha1=libcrypto,,openssl"
+PACKAGECONFIG[nettle] = "-Dsha1=libnettle,,nettle"
+PACKAGECONFIG[gcrypt] = "-Dsha1=libgcrypt,,libgcrypt"
 
 do_install:append () {
 	# Its assumed base-files creates this for us
-	rmdir ${D}${localstatedir}/log/
         sed -i -e 's,${libdir}/xorg/modules,${prefix}/lib*/xorg/modules,' ${D}${mandir}/man5/xorg.conf.5
 }
 
-- 
2.20.1



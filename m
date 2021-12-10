Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543A8C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:38:16 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web12.8701.1639150694960089072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FKOgWU74;
 spf=pass (domain: gmail.com, ip: 209.85.167.174,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id m6so13741852oim.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/v6cH9RDWsHj9vH15WlrpLpTXgb4/Kdkct9UOi1obT4=;
        b=FKOgWU74uo1OqU3YjFUXW4aqHscXYLaAIT+0CBnPXDJ/3rttqYDKcByAtyHKtwh0oe
         vKVEjqEqtCvPdtFUS15NzHkaEshcr+OM6Y4mNHFw7F1Xga9Kn58HsZPuR/1BV4Lu49eH
         k1lyaFs3DOr7TFP03Bcl1WoODSYvks4XbRrfpELdWKf9vl3RhqBGw84Sn6AGy+FzMbhB
         LI6k1Ne4fC9G/VzWEaFF/4m/mEBL6wvS39FPHPfx3FiKC5OEhid2yYj3EbCAFcVk8S/t
         tfuiZvwYz0GGTDPCy4R6U+kfj3Ui1ra0p+HbS7KsmP0B8G1ZHk1Dw6lvwtIf8wfA4B9k
         zRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/v6cH9RDWsHj9vH15WlrpLpTXgb4/Kdkct9UOi1obT4=;
        b=eSOReBqv/HkrZyGX9CyR+ZiD2LaSNdtYz6rZCwbTUKud+jrHUwAaeROxC92bM5+57W
         BRAuSPrUlrP2k4pR4Vb1roxXdFVXQ23FERwQt9yjGvWOItii7DIglJyzzYeqNG2QH7f3
         fyEQyMGWWJVv1e8luSiu3nvg+uk+F7zwtmEUukKWKKwi671Dwu21MSxPNRc84SHb6e7V
         F/wfKiYFVMkwi0NkkOulhGI8mBNbq0NrjThJW+PftxuYEbiGlObx0+AhBJeugDBl4lom
         pLovBC3pf6XdwDrYXdURzSL12/UQKEGR0gM+xh9wH8tBd7yblaqydhpxXjzJ08mq6Qfs
         ckvg==
X-Gm-Message-State: AOAM53036zH3ast7sj9b7A0xLDqgPLrm+nTkOtkReZC4hg4WFiUL6ZgL
	pB+HwWWPkHFvC5JtzMQCeswbr3JDKAQ=
X-Google-Smtp-Source: 
 ABdhPJzTLj7KoTnYrviLc5BMbeOQij+E7LecpivvKgPhM9qwASVDO10nurRIf7GFHO7BhsBJ1gRG4A==
X-Received: by 2002:a05:6808:1509:: with SMTP id
 u9mr13634090oiw.13.1639150694027;
        Fri, 10 Dec 2021 07:38:14 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c9sm637097oog.43.2021.12.10.07.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 07:38:13 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] webkitgtk: Add packageconfig for libsoup2
Date: Fri, 10 Dec 2021 09:37:41 -0600
Message-Id: <20211210153741.348447-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211209204417.3924102-1-JPEWhacker@gmail.com>
References: <20211209204417.3924102-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:38:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159546

Adds a PACKAGECONFIG option to use libsoup2 instead of libsoup3.
Including libsoup2 and libsoup3 in the same process can cause strange
runtime failures, and the latest release of each major version will
cause the process to exit if both are detected on startup.

The default is changed from libsoup3 back to libsoup2. Most GNOME
packages are still using libsoup2, and a large number of these pull in
webkitgtk either directly or indirectly. If webkitgtk uses libsoup3,
this causes all of these packages to fail at startup. It appears that
most GNOME packages will have to switch to libsoup3 when they transition
to GTK4.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.34.2.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
index 413e0cdf92..a9b151e3c3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
@@ -38,7 +38,6 @@ DEPENDS = " \
           atk \
           libwebp \
           gtk+3 \
-          libsoup \
           libxslt \
           libtasn1 \
           libnotify \
@@ -46,12 +45,14 @@ DEPENDS = " \
           gstreamer1.0-plugins-base \
           "
 
+PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2 angle', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
                    enchant \
                    libsecret \
+                   ${PACKAGECONFIG_SOUP} \
                   "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
@@ -70,6 +71,8 @@ PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
 PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
 PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
+PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
+PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
 
 # webkitgtk is full of /usr/bin/env python, particular for generating docs
 do_configure[postfuncs] += "setup_python_link"
@@ -124,7 +127,7 @@ EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
 SECURITY_CFLAGS:remove:aarch64 = "-fpie"
 SECURITY_CFLAGS:append:aarch64 = " -fPIE"
 
-FILES:${PN} += "${libdir}/webkit2gtk-4.1/injected-bundle/libwebkit2gtkinjectedbundle.so"
+FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
 
 RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
 
-- 
2.33.0



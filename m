Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.61223.1594051907079562431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kn/8ZYru;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id x11so15508111plo.7
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=n6zzgJoHrFe72za4Bw96YZ0pOFpzErj5p1gf5wnU4/Y=;
        b=kn/8ZYruYq8xRCmttra5zrQtc3ndEej7RjmayehK/EyksGBhRuQpSQnTHK2+3C+vCe
         4KRSNuEP6P6z9UfYJUB1uV6uKKVwOeKf65JJk3N5tBuBoLteWFKx6rV+ziSM2wW8L2tn
         MIX6vJzCfuOjGnF3BUIi/ijhTm3RZefhfsXM8g/p3rxhoUGXEKJyJ0VIAupnzQtfHJe6
         SUb4oW9QvC7dTH6Vke7cop6tZQ5HVEX0MkNIDaAzry7wwh5MqcTq+3va5yR5TktDQXFb
         1/vpotxpPHBp5z1B7QCkWZpML30BMHZQxXslvz4QQH/OYBpp+EmlqZK/g4jAGhWG11N0
         JNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=n6zzgJoHrFe72za4Bw96YZ0pOFpzErj5p1gf5wnU4/Y=;
        b=IGe+KahE2oteI8cNhaQ/z5czeSi09M9qu07Duqrv9Dfz2L6EvzZG+LNKiN9eV3Wxq/
         vTAGHgkkK2EIgPt6EnWQ8ppCqY2mhXAuK7ot4p4ZhKS0ksl7tSKdmt35Ox92A1yOMS1D
         ERoZowBslCS51Tca0XWT+dhHo+Zz5AVRDeumjy5euf+ijOIAfVteq4XIy9AQj+OTNUHM
         9e9pv7sngqxRlPUGM7TvmVwiOw/awbMdP3DmslOvXQp7dgp8iT25fTpBZ+zWmsLNhJto
         kckSWO5jzkVzWSsl+VCh085o+hWTtoKTPqCqkSinUGJU4FTyeD2BxV3wzZuwQ+b5DKRV
         IxAA==
X-Gm-Message-State: AOAM531y2TPILzNi0cPSMkwd38X5hn2T1p6Bo/Pc1+GQSZSkp4uKLlWD
	yMLRtiJqzMrfvwwXKwl+SMjv/Qhy3ZiYEg==
X-Google-Smtp-Source: ABdhPJxhh7kBxsAPh0nKFUuUPklYAOyBcwzSh3dJMoeylUHrS6IwHEmWQfY6EPLcWqPN0YoMvOVw7g==
X-Received: by 2002:a17:90a:be06:: with SMTP id a6mr4173pjs.136.1594051906086;
        Mon, 06 Jul 2020 09:11:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/25] gtk-icon-cache.bbclass: add runtime dependency
Date: Mon,  6 Jul 2020 06:10:19 -1000
Message-Id: <90da201e79584ce9b29cf660d7efc3611fa91861.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

fix error:
+ /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
/var/tmp/rpm-tmp.mdYxY6: line 12: /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders: No such file or directory
%post(adwaita-icon-theme-3.36.1-r0.0.noarch): waitpid(2961) rc 2961 status 7f00
warning: %post(adwaita-icon-theme-3.36.1-r0.0.noarch) scriptlet failed, exit status 127

when install adwaita-icon-theme on target, which inherit gtk-icon-cache
above error reported,  fix by add runtime dependency to pkgs

we don't use explicit RDEPENDS, so fix do_rootfs breaking by adding it into DEPENDS.
Error:
 Problem: conflicting requests
  - nothing provides gdk-pixbuf needed by adwaita-icon-theme-3.36.1-r0.noarch
  - nothing provides gtk+3 needed by adwaita-icon-theme-3.36.1-r0.noarch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/gtk-icon-cache.bbclass | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 91cb4ad409..dd394af27c 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,6 +1,10 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
-DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+3-native"
+DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} \
+            ${@['gdk-pixbuf', '']['${BPN}' == 'gdk-pixbuf']} \
+            ${@['gtk+3', '']['${BPN}' == 'gtk+3']} \
+            gtk+3-native \
+"
 
 PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
 
@@ -48,9 +52,18 @@ python populate_packages_append () {
         bb.note("adding hicolor-icon-theme dependency to %s" % pkg)
         rdepends = ' ' + d.getVar('MLPREFIX', False) + "hicolor-icon-theme"
         d.appendVar('RDEPENDS_%s' % pkg, rdepends)
-    
+
+        #gtk_icon_cache_postinst depend on gdk-pixbuf and gtk+3
+        bb.note("adding gdk-pixbuf dependency to %s" % pkg)
+        rdepends = ' ' + d.getVar('MLPREFIX', False) + "gdk-pixbuf"
+        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
+
+        bb.note("adding gtk+3 dependency to %s" % pkg)
+        rdepends = ' ' + d.getVar('MLPREFIX', False) + "gtk+3"
+        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
+
         bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
-        
+
         postinst = d.getVar('pkg_postinst_%s' % pkg)
         if not postinst:
             postinst = '#!/bin/sh\n'
-- 
2.17.1


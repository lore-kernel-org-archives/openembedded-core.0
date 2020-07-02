Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2235.1593678976600788947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 01:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0628Zimb009239
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Jul 2020 01:36:05 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 2 Jul 2020 01:35:46 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gtk-icon-cache.bbclass: add runtime dependency
Date: Thu, 2 Jul 2020 16:33:13 +0800
Message-ID: <20200702083313.1348201-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <161D7D453D89CA61.29179@lists.openembedded.org>
References: <161D7D453D89CA61.29179@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain

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


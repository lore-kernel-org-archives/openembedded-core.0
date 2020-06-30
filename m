Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.12082.1593510697804371466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 02:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05U9pa0v028196
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 02:51:36 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 30 Jun 2020 02:51:36 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gtk-icon-cache.bbclass: update RDEPENDS
Date: Tue, 30 Jun 2020 17:49:07 +0800
Message-ID: <20200630094907.1396284-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
+ /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
/var/tmp/rpm-tmp.mdYxY6: line 12: /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders: No such file or directory
%post(adwaita-icon-theme-3.36.1-r0.0.noarch): waitpid(2961) rc 2961 status 7f00
warning: %post(adwaita-icon-theme-3.36.1-r0.0.noarch) scriptlet failed, exit status 127

when install adwaita-icon-theme, which inherit gtk-icon-cache
on target, above error reported,  fix by add needeed packages
in RDEPENDS

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/gtk-icon-cache.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 91cb4ad409..7f218ce7ae 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -4,6 +4,8 @@ DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk
 
 PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
 
+RDEPENDS_${PN} += "gdk-pixbuf gtk+3"
+
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG} \
-- 
2.17.1


Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUcvT-0002cB-W6
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 12:57:24 +0200
Received: by wye20 with SMTP id 20so1122399wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 03:54:04 -0700 (PDT)
Received: by 10.227.32.84 with SMTP id b20mr612022wbd.105.1307616844140;
	Thu, 09 Jun 2011 03:54:04 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o38sm1121387wba.54.2011.06.09.03.54.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 03:54:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 12:54:00 +0200
Message-Id: <1307616840-10973-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] metacity 2.30.3: fix build on GNOME-less hosts and fix packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2011 10:57:24 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-gnome/gnome/metacity_2.30.3.bb |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/gnome/metacity_2.30.3.bb b/meta/recipes-gnome/gnome/metacity_2.30.3.bb
index 18105f2..44e21c9 100644
--- a/meta/recipes-gnome/gnome/metacity_2.30.3.bb
+++ b/meta/recipes-gnome/gnome/metacity_2.30.3.bb
@@ -5,11 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
 
 DEPENDS = "startup-notification gtk+ gconf gdk-pixbuf-native libcanberra"
-PR = "r0"
+PR = "r1"
 
 inherit gnome update-alternatives
 
 SRC_URI += "file://crosscompile.patch;patch=1"
+SRC_URI[archive.md5sum] = "553784f376d96b902e19ff437cd5b339"
+SRC_URI[archive.sha256sum] = "08f887018fa5e447cf184d03bae3fe2c05fdb7583bed6768e3b4d66392fc18dd"
 
 ALTERNATIVE_NAME = "x-window-manager"
 ALTERNATIVE_LINK = "${bindir}/x-window-manager"
@@ -19,11 +21,12 @@ ALTERNATIVE_PRIORITY = "10"
 EXTRA_OECONF += "--disable-verbose \
 	         --disable-xinerama"
 
-FILES_${PN} += "${datadir}/themes"
-
+do_configure_prepend() {
+	sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
+}
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS} -I${STAGING_LIBDIR_NATIVE}/glib-2.0/include -I${STAGING_INCDIR_NATIVE}/glib-2.0 -I${STAGING_INCDIR_NATIVE}/glib-2.0/include -I${STAGING_INCDIR_NATIVE}"
 export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS} -L${STAGING_LIBDIR_NATIVE} -lglib-2.0"
 
-SRC_URI[archive.md5sum] = "553784f376d96b902e19ff437cd5b339"
-SRC_URI[archive.sha256sum] = "08f887018fa5e447cf184d03bae3fe2c05fdb7583bed6768e3b4d66392fc18dd"
+FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
+
-- 
1.6.6.1




Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RlQGV-0000LB-3Q
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 20:24:47 +0100
Received: by wibhm17 with SMTP id hm17so1563414wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 11:17:16 -0800 (PST)
Received: by 10.180.75.7 with SMTP id y7mr8716412wiv.2.1326395835777;
	Thu, 12 Jan 2012 11:17:15 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id g11sm6948072wbo.6.2012.01.12.11.17.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 11:17:15 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 20:17:11 +0100
Message-Id: <1326395831-5121-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [Patch v3] gconf: enable gtk+ 2.0 support to build gconf-sanity-check-2
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
X-List-Received-Date: Thu, 12 Jan 2012 19:24:47 -0000

This is needed for e.g. gnome-session:

gnome-session[424]: WARNING: Failed to run gconf-sanity-check-2: Failed to execute child process "/usr/libexec/gconf-sanity-check-2" (No such file or directory)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index f7d3594..412f01c 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -3,10 +3,10 @@ SECTION = "x11/gnome"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"
+DEPENDS = "glib-2.0 gtk+ dbus dbus-glib libxml2 intltool-native polkit"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
 
-PR = "r3"
+PR = "r5"
 
 inherit gnomebase
 
@@ -21,8 +21,10 @@ S = "${WORKDIR}/GConf-${PV}"
 
 POLKIT_OECONF = "--enable-defaults-service"
 POLKIT_OECONF_virtclass-native = "--disable-defaults-service"
-EXTRA_OECONF = "--disable-gtk-doc --disable-gtk --enable-shared --disable-static --enable-debug=yes \
-                --disable-introspection --disable-orbit --with-openldap=no ${POLKIT_OECONF}"
+GTKOECONF = "--with-gtk=2.0 --enable-gtk"
+GTKOECONF_virtclass-native = "--disable-gtk"
+EXTRA_OECONF = "--disable-gtk-doc --enable-shared --disable-static --enable-debug=yes \
+                --disable-introspection --disable-orbit --with-openldap=no ${POLKIT_OECONF} ${GTKOECONF}"
 
 do_configure_prepend () {
 	touch gtk-doc.make
@@ -42,11 +44,11 @@ RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)
 RDEPENDS_${PN}_virtclass-native = ""
 
 FILES_${PN} += "${libdir}/GConf/* \
-	        ${libdir}/gio/*/*.so \
-		${datadir}/polkit* \
-	       	${datadir}/dbus-1/services/*.service \
-	       	${datadir}/dbus-1/system-services/*.service \
-	        "
+                ${libdir}/gio/*/*.so \
+                ${datadir}/polkit* \
+                ${datadir}/dbus-1/services/*.service \
+                ${datadir}/dbus-1/system-services/*.service \
+               "
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd"
 
-- 
1.7.2.5




Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jonas.danielsson@lundinova.se>) id 1SKbfp-0003KC-At
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 22:40:21 +0200
Received: from jkd-desktop.lundinova.se (unknown [10.240.22.76])
	by mailhost.lundinova.se (Postfix) with ESMTP id 7430BB94016;
	Wed, 18 Apr 2012 22:30:50 +0200 (CEST)
From: Jonas Danielsson <jonas.danielsson@lundinova.se>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 22:30:49 +0200
Message-Id: <1334781049-7980-1-git-send-email-jonas.danielsson@lundinova.se>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] bluez4: make alsa support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Wed, 18 Apr 2012 20:40:21 -0000

Do not enable alsa in bluez4 unless it's included in DISTRO_FEATURES.

Signed-off-by: Jonas Danielsson <jonas.danielsson@lundinova.se>
---
 meta/recipes-connectivity/bluez/bluez4.inc     |    7 +++++--
 meta/recipes-connectivity/bluez/bluez4_4.99.bb |   11 +++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index fbbe0bf..0ce7c31 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
+DEPENDS = "\
+  udev ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
+  libusb dbus-glib glib-2.0 libcheck \
+  "
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
 ASNEEDED = ""
@@ -21,7 +24,7 @@ inherit autotools
 
 EXTRA_OECONF = "\
   --disable-gstreamer \
-  --enable-alsa \
+  ${@base_contains('DISTRO_FEATURES', 'alsa', '--enable-alsa', '--disable-alsa', d)} \
   --enable-usb \
   --enable-tools \
   --enable-bccmd \
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
index 5033d34..5f1ef45 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch \
@@ -19,13 +19,16 @@ do_install_append() {
 
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
-PACKAGES =+ "libasound-module-bluez"
+PACKAGES =+ "${@base_contains('DISTRO_FEATURES', 'alsa', 'libasound-module-bluez', '', d)}"
 
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
+FILES_libasound-module-bluez = "\
+  ${@base_contains('DISTRO_FEATURES', 'alsa', '${libdir}/alsa-lib/lib*.so', '', d)} \
+  ${@base_contains('DISTRO_FEATURES', 'alsa', '${datadir}/alsa', '', d)} \
+"  
 FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
-  ${libdir}/alsa-lib/*.la \
+  ${@base_contains('DISTRO_FEATURES', 'alsa', '${libdir}/alsa-lib/*.la', '', d)} \
 "
 
 FILES_${PN}-dbg += "\
-- 
1.7.5.4




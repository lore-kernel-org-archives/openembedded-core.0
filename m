Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6d4L-0002i4-0W
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 08:47:37 +0200
Received: by fxi1 with SMTP id 1so2459659fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 23:42:18 -0700 (PDT)
Received: by 10.223.8.2 with SMTP id f2mr2494694faf.23.1316673737068;
	Wed, 21 Sep 2011 23:42:17 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id t19sm6546610faj.23.2011.09.21.23.42.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 23:42:16 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 08:42:13 +0200
Message-Id: <1316673733-24576-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] bluez4: split gstreamer plugin into a seperate recipe
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
X-List-Received-Date: Thu, 22 Sep 2011 06:47:37 -0000

This eliminates a good chunk of buildtime when building console-only image.

The bluez4 and this recipe share a .inc file since the source is the same.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/bluez/bluez4.inc         |   37 +++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.96.bb     |   49 +++-----------------
 .../bluez/gst-plugin-bluetooth_4.96.bb             |   28 +++++++++++
 3 files changed, 72 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4.inc
 create mode 100644 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
new file mode 100644
index 0000000..5dacd92
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -0,0 +1,37 @@
+SUMMARY = "Linux Bluetooth Stack Userland V4"
+DESCRIPTION = "Linux Bluetooth stack V4 userland components.  These include a system configurations, daemons, tools and system libraries."
+HOMEPAGE = "http://www.bluez.org"
+SECTION = "libs"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
+                    file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
+                    file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
+DEPENDS = "udev alsa-lib libusb dbus-glib"
+RDEPENDS_${PN}-dev = "bluez-hcidump"
+
+ASNEEDED = ""
+
+SRC_URI = "\
+  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
+"
+S = "${WORKDIR}/bluez-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF = "\
+  --disable-gstreamer \
+  --enable-alsa \
+  --enable-usb \
+  --enable-tools \
+  --enable-bccmd \
+  --enable-hid2hci \
+  --enable-dfutool \
+  --enable-hidd \
+  --enable-pand \
+  --enable-dund \
+  --disable-cups \
+  --enable-test \
+  --enable-datafiles \
+"
+
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
index 7ca6ac1..5c170c1 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -1,47 +1,12 @@
-SUMMARY = "Linux Bluetooth Stack Userland V4"
-DESCRIPTION = "Linux Bluetooth stack V4 userland components.  These include a system configurations, daemons, tools and system libraries."
-HOMEPAGE = "http://www.bluez.org"
-SECTION = "libs"
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
-                    file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
-                    file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev gst-plugins-base alsa-lib libusb dbus-glib"
-RDEPENDS_${PN}-dev = "bluez-hcidump"
-
-ASNEEDED = ""
+require bluez4.inc
 
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "\
-  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
-  file://bluetooth.conf \
-"
+SRC_URI += "file://bluetooth.conf"
 
 SRC_URI[md5sum] = "296111afac49e3f9035085ac14daf518"
 SRC_URI[sha256sum] = "c06fd50fd77909cad55e3181a42c6bce7cfcf7abb8cd87871c13d0d70f87fa99"
 
-S = "${WORKDIR}/bluez-${PV}"
-
-inherit autotools
-
-EXTRA_OECONF = "\
-  --enable-gstreamer \
-  --enable-alsa \
-  --enable-usb \
-  --enable-tools \
-  --enable-bccmd \
-  --enable-hid2hci \
-  --enable-dfutool \
-  --enable-hidd \
-  --enable-pand \
-  --enable-dund \
-  --disable-cups \
-  --enable-test \
-  --enable-datafiles \
-"
-
 do_install_append() {
 	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
 	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
@@ -50,19 +15,19 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
 }
 
-PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
+RDEPENDS_${PN}-dev = "bluez-hcidump"
+
+PACKAGES =+ "libasound-module-bluez"
 
-FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
 FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${base_libdir}/systemd/"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
   ${libdir}/alsa-lib/*.la \
-  ${libdir}/gstreamer-0.10/*.la \
 "
 
 FILES_${PN}-dbg += "\
   ${libdir}/bluetooth/plugins/.debug \
   ${libdir}/*/.debug \
   ${base_libdir}/udev/.debug \
-"
+
diff --git a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
new file mode 100644
index 0000000..a137b12
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
@@ -0,0 +1,28 @@
+require bluez4.inc
+require recipes-multimedia/gstreamer/gst-plugins-package.inc
+
+DEPENDS = "bluez4 gst-plugins-base"
+
+EXTRA_OECONF = "\
+  --enable-gstreamer \
+"
+
+# clean unwanted files
+do_install_append() {
+	rm -rf ${D}${bindir}
+	rm -rf ${D}${sbindir}
+	rm -f  ${D}${libdir}/lib*
+	rm -rf ${D}${sysconfdir}
+	rm -rf ${D}${base_libdir}
+}
+
+FILES_${PN} = "${libdir}/gstreamer-0.10/lib*.so"
+FILES_${PN}-dev += "\
+  ${libdir}/gstreamer-0.10/*.la \
+"
+
+FILES_${PN}-dbg += "\
+  ${libdir}/*/.debug \
+"
+
+
-- 
1.6.6.1




Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9hy-0006oq-JW
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980337"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:39 -0700
Message-Id: <d5063523f156b596965f966e04f9969a8776f812.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/32] bluez4: update recipe from meta-oe
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
X-List-Received-Date: Thu, 18 Aug 2011 21:01:00 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* fix DEPENDS
* fix typo in --enable-pandd option
* remove unsupported options
* update packaging
* remove distro override which doesn't belong to oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.96.bb |   17 ++++++-----------
 1 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
index ebd2849..edba167 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -7,12 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "gst-plugins-base alsa-lib libusb dbus-glib libnl"
+DEPENDS = "udev gst-plugins-base alsa-lib libusb dbus-glib usbpath"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
-# For angstrom we want this to replace at least bluez-libs
-PROVIDES_append_angstrom = " bluez-utils bluez-libs"
-
 ASNEEDED = ""
 
 PR = "r0"
@@ -24,6 +21,7 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "296111afac49e3f9035085ac14daf518"
 SRC_URI[sha256sum] = "c06fd50fd77909cad55e3181a42c6bce7cfcf7abb8cd87871c13d0d70f87fa99"
+
 S = "${WORKDIR}/bluez-${PV}"
 
 inherit autotools
@@ -32,20 +30,16 @@ EXTRA_OECONF = "\
   --enable-gstreamer \
   --enable-alsa \
   --enable-usb \
-  --enable-netlink \
   --enable-tools \
   --enable-bccmd \
   --enable-hid2hci \
   --enable-dfutool \
   --enable-hidd \
-  --enable-pandd \
+  --enable-pand \
   --enable-dund \
   --disable-cups \
   --enable-test \
-  --enable-manpages \
   --enable-configfiles \
-  --enable-initscripts \
-  --disable-pcmciarules \
 "
 
 do_install_append() {
@@ -59,8 +53,8 @@ do_install_append() {
 PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
 
 FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so"
-FILES_${PN} += "${libdir}/bluetooth/plugins/*.so"
+FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
+FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${base_libdir}/systemd/"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
   ${libdir}/alsa-lib/*.la \
@@ -70,4 +64,5 @@ FILES_${PN}-dev += "\
 FILES_${PN}-dbg += "\
   ${libdir}/bluetooth/plugins/.debug \
   ${libdir}/*/.debug \
+  ${base_libdir}/udev/.debug \
 "
-- 
1.7.6




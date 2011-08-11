Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QrXkg-0002Kz-CM
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 18:04:58 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QrXgJ-0002ma-O9 from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 09:00:27 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 11 Aug 2011 18:00:26 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 21:00:12 +0500
Message-Id: <1313078412-6872-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 11 Aug 2011 16:00:26.0770 (UTC)
	FILETIME=[C9248720:01CC583F]
Subject: [PATCH] bluez4: Added new recipe version 4.96
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
X-List-Received-Date: Thu, 11 Aug 2011 16:04:58 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Added new recipe version 4.96.


Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../bluez/bluez4-4.96/bluetooth.conf               |   16 ++++
 meta/recipes-connectivity/bluez/bluez4_4.96.bb     |   73 ++++++++++++++++++++
 2 files changed, 89 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.96/bluetooth.conf b/meta/recipes-connectivity/bluez/bluez4-4.96/bluetooth.conf
new file mode 100644
index 0000000..ca5e9e4
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4-4.96/bluetooth.conf
@@ -0,0 +1,16 @@
+<!-- This configuration file specifies the required security policies
+     for Bluetooth core daemon to work. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+
+  <!-- ../system.conf have denied everything, so we just punch some holes -->
+
+  <policy context="default">
+    <allow own="org.bluez"/>
+    <allow send_destination="org.bluez"/>
+    <allow send_interface="org.bluez.Agent"/>
+  </policy>
+
+</busconfig>
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
new file mode 100644
index 0000000..ebd2849
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -0,0 +1,73 @@
+SUMMARY = "Linux Bluetooth Stack Userland V4"
+DESCRIPTION = "Linux Bluetooth stack V4 userland components.  These include a system configurations, daemons, tools and system libraries."
+HOMEPAGE = "http://www.bluez.org"
+SECTION = "libs"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
+                    file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
+                    file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
+DEPENDS = "gst-plugins-base alsa-lib libusb dbus-glib libnl"
+RDEPENDS_${PN}-dev = "bluez-hcidump"
+
+# For angstrom we want this to replace at least bluez-libs
+PROVIDES_append_angstrom = " bluez-utils bluez-libs"
+
+ASNEEDED = ""
+
+PR = "r0"
+
+SRC_URI = "\
+  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
+  file://bluetooth.conf \
+"
+
+SRC_URI[md5sum] = "296111afac49e3f9035085ac14daf518"
+SRC_URI[sha256sum] = "c06fd50fd77909cad55e3181a42c6bce7cfcf7abb8cd87871c13d0d70f87fa99"
+S = "${WORKDIR}/bluez-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF = "\
+  --enable-gstreamer \
+  --enable-alsa \
+  --enable-usb \
+  --enable-netlink \
+  --enable-tools \
+  --enable-bccmd \
+  --enable-hid2hci \
+  --enable-dfutool \
+  --enable-hidd \
+  --enable-pandd \
+  --enable-dund \
+  --disable-cups \
+  --enable-test \
+  --enable-manpages \
+  --enable-configfiles \
+  --enable-initscripts \
+  --disable-pcmciarules \
+"
+
+do_install_append() {
+	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
+	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
+	install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
+	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
+	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
+}
+
+PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
+
+FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
+FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so"
+FILES_${PN} += "${libdir}/bluetooth/plugins/*.so"
+FILES_${PN}-dev += "\
+  ${libdir}/bluetooth/plugins/*.la \
+  ${libdir}/alsa-lib/*.la \
+  ${libdir}/gstreamer-0.10/*.la \
+"
+
+FILES_${PN}-dbg += "\
+  ${libdir}/bluetooth/plugins/.debug \
+  ${libdir}/*/.debug \
+"
-- 
1.7.0.4




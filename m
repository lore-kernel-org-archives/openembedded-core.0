Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UF3TL-0005IM-HC
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:13:07 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Mar 2013 06:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,822,1355126400"; 
	d="scan'208,217";a="212736139"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Mar 2013 06:56:23 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 15:56:49 +0200
Message-Id: <1363010209-18220-3-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 2/2] bluez5: new package for v5.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 14:13:15 -0000

- bluez5 does not replace bluez4
- bluez5 is integrated with systemd

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../bluez5/bluez5-5.3/bluetooth.conf               |   16 +++++++
 .../bluez5/bluez5-5.3/fix-udev-paths.patch         |   35 +++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5.inc        |   45 ++++++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5_5.3.bb     |   35 +++++++++++++++
 4 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.3.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf b/meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf
new file mode 100644
index 0000000..ca5e9e4
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf
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
diff --git a/meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch b/meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch
new file mode 100644
index 0000000..37362f5
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch
@@ -0,0 +1,35 @@
+Add udevdir/udevrulesdir options
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+
+Index: bluez-5.0/Makefile.am
+===================================================================
+--- bluez-5.0.orig/Makefile.am	2012-12-24 19:46:54.000000000 +0200
++++ bluez-5.0/Makefile.am	2013-01-30 14:33:15.760615474 +0200
+@@ -175,7 +175,7 @@
+ include Makefile.obexd
+ 
+ if HID2HCI
+-rulesdir = @UDEV_DIR@/rules.d
++rulesdir = @UDEV_RULES_DIR@
+ 
+ rules_DATA = tools/97-hid2hci.rules
+ 
+Index: bluez-5.0/configure.ac
+===================================================================
+--- bluez-5.0.orig/configure.ac	2012-12-24 19:46:54.000000000 +0200
++++ bluez-5.0/configure.ac	2013-01-30 14:34:59.068613895 +0200
+@@ -160,6 +160,11 @@
+ 	AC_SUBST(UDEV_DIR, [${path_udevdir}])
+ fi
+ 
++AC_ARG_WITH([udevrulesdir],
++    AS_HELP_STRING([--with-udevrulesdir=DIR], [udev rules directory]),
++    [], [with_udevrulesdir=/lib/udev/rules.d])
++AC_SUBST([UDEV_RULES_DIR], [$with_udevrulesdir])
++
+ AM_CONDITIONAL(HID2HCI, test "${enable_tools}" != "no" &&
+ 		test "${enable_udev}" != "no" && test "${enable_usb}" != "no")
+ 
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
new file mode 100644
index 0000000..db9c766
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -0,0 +1,45 @@
+SUMMARY = "Linux Bluetooth Stack Userland V5"
+DESCRIPTION = "Linux Bluetooth stack V5 userland components.  These include a system configurations, daemons, tools and system libraries."
+HOMEPAGE = "http://www.bluez.org"
+SECTION = "libs"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
+                    file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
+DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck libical"
+
+PACKAGECONFIG ??= "\
+    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
+    ${@base_contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
+"
+PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,"
+
+ASNEEDED = ""
+
+SRC_URI = "\
+  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
+"
+S = "${WORKDIR}/bluez-${PV}"
+
+inherit autotools pkgconfig systemd
+
+EXTRA_OECONF = "\
+  --disable-gstreamer \
+  --enable-usb \
+  --enable-tools \
+  --enable-bccmd \
+  --enable-hid2hci \
+  --enable-dfutool \
+  --disable-hidd \
+  --disable-pand \
+  --disable-dund \
+  --disable-cups \
+  --enable-test \
+  --enable-datafiles \
+  --with-udevdir=${base_libdir}/udev \
+  --with-udevrulesdir=${nonarch_base_libdir}/udev/rules.d \
+  ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--disable-systemd', d)} \
+"
+
+SYSTEMD_SERVICE_${PN} = "bluetooth.service"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.3.bb b/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
new file mode 100644
index 0000000..311562f
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
@@ -0,0 +1,35 @@
+require bluez5.inc
+
+SRC_URI += "file://bluetooth.conf \
+            file://fix-udev-paths.patch"
+
+SRC_URI[md5sum] = "44de20f6422bf90a01b8df48e7dfe4ed"
+SRC_URI[sha256sum] = "828e2cd1109835c2fc1d731fb7fd7b46951044e451cc8556a37e1312d8c8c9a6"
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/bluetooth/
+	install -m 0644 ${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
+	install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
+	install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
+	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
+	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
+}
+
+ALLOW_EMPTY_libasound-module-bluez = "1"
+PACKAGES =+ "libasound-module-bluez ${PN}-test"
+
+FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
+FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
+FILES_${PN}-dev += "\
+  ${libdir}/bluetooth/plugins/*.la \
+  ${libdir}/alsa-lib/*.la \
+"
+
+FILES_${PN}-test = "${libdir}/bluez/test/*"
+
+FILES_${PN}-dbg += "\
+  ${libdir}/${PN}/bluetooth/.debug \
+  ${libdir}/bluetooth/plugins/.debug \
+  ${libdir}/*/.debug \
+  ${base_libdir}/udev/.debug \
+  "
-- 
1.7.10.4




Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3282C6B1B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 14:04:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2013 07:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,653,1367996400"; 
	d="scan'208,217";a="344562762"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2013 07:04:52 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 17:06:25 +0300
Message-Id: <1373637989-24991-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1373637989-24991-1-git-send-email-cristian.iorga@intel.com>
References: <1373637989-24991-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 1/5] bluez5: new package for v5.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jul 2013 14:04:53 -0000

- bluez5 does not replace bluez4
- bluez5 is integrated with systemd
- RCONFLICTS/RREPLACES bluez4

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../bluez5/bluez5-5.4/bluetooth.conf               |   16 +++++++
 .../bluez5/bluez5-5.4/fix-udev-paths.patch         |   35 +++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5.inc        |   45 ++++++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5_5.4.bb     |   38 +++++++++++++++++
 4 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.4/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.4/fix-udev-paths.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.4.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5-5.4/bluetooth.conf b/meta/recipes-connectivity/bluez5/bluez5-5.4/bluetooth.conf
new file mode 100644
index 0000000..ca5e9e4
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5-5.4/bluetooth.conf
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
diff --git a/meta/recipes-connectivity/bluez5/bluez5-5.4/fix-udev-paths.patch b/meta/recipes-connectivity/bluez5/bluez5-5.4/fix-udev-paths.patch
new file mode 100644
index 0000000..37362f5
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5-5.4/fix-udev-paths.patch
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
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.4.bb b/meta/recipes-connectivity/bluez5/bluez5_5.4.bb
new file mode 100644
index 0000000..4379de6
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.4.bb
@@ -0,0 +1,38 @@
+require bluez5.inc
+
+SRC_URI += "file://bluetooth.conf \
+            file://fix-udev-paths.patch"
+
+SRC_URI[md5sum] = "e4a7d8bab9c28053a53f00bc940382a8"
+SRC_URI[sha256sum] = "65b2d0d7eead2b3c49216b9f94ea71c3d15da92fb3fd49fce1ee6e91af1b4430"
+
+RCONFLICTS_${PN} = "bluez4"
+RREPLACES_${PN} = "bluez4"
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



Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0242D605FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 02:46:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Feb 2016 18:46:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="926702970"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga002.fm.intel.com with ESMTP; 29 Feb 2016 18:46:44 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 02:46:49 +0000
Message-Id: <b785917f134b3782adc450c65bb055d454219b50.1456800309.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
In-Reply-To: <cover.1456800309.git.alejandro.hernandez@linux.intel.com>
References: <cover.1456800309.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 1/4] eudev: Replaces udev with eudev for compatibility when using sysvinit on newer kernels
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
X-List-Received-Date: Tue, 01 Mar 2016 02:46:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

udev has started to fail on new kernels (4.4), due to being deprecated in favor
of systemd's udev implementation. To maintain a sysvinit alternative we also
need to provide an alternative to udev. Eudev is a fork of systemds udev,
this new eudev recipe provides upstream udev 220 funcitonality.

  - Removes patches that dont apply anymore
  - ToDo: eudev-ptest?

[YOCTO #8998]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/conf/distro/include/default-providers.inc     |   2 +-
 .../udev/{udev => eudev}/devfs-udev.rules          |   0
 meta/recipes-core/udev/{udev => eudev}/init        |   0
 meta/recipes-core/udev/{udev => eudev}/links.conf  |   0
 meta/recipes-core/udev/{udev => eudev}/local.rules |   0
 .../udev/{udev => eudev}/permissions.rules         |   0
 meta/recipes-core/udev/{udev => eudev}/run.rules   |   0
 meta/recipes-core/udev/{udev => eudev}/udev-cache  |   0
 .../udev/{udev => eudev}/udev-cache.default        |   0
 meta/recipes-core/udev/{udev => eudev}/udev.rules  |   0
 meta/recipes-core/udev/eudev_3.1.5.bb              |  83 +++++++++++++++
 meta/recipes-core/udev/udev.inc                    | 112 ---------------------
 ...yboard_force_release.sh-shell-script-path.patch |  35 -------
 ...-Add-stdint.h-as-it-was-removed-from-mtd-.patch |  29 ------
 ...c-Makefile.am-Check-for-input.h-and-input.patch |  52 ----------
 .../recipes-core/udev/udev/add-install-ptest.patch |  86 ----------------
 .../udev/udev/avoid-mouse-autosuspend.patch        |  25 -----
 .../udev/udev/fix_rule-syntax-regex-ptest.patch    |  58 -----------
 meta/recipes-core/udev/udev/run-ptest              |   5 -
 meta/recipes-core/udev/udev_182.bb                 |   9 --
 20 files changed, 84 insertions(+), 412 deletions(-)
 rename meta/recipes-core/udev/{udev => eudev}/devfs-udev.rules (100%)
 rename meta/recipes-core/udev/{udev => eudev}/init (100%)
 rename meta/recipes-core/udev/{udev => eudev}/links.conf (100%)
 rename meta/recipes-core/udev/{udev => eudev}/local.rules (100%)
 rename meta/recipes-core/udev/{udev => eudev}/permissions.rules (100%)
 rename meta/recipes-core/udev/{udev => eudev}/run.rules (100%)
 rename meta/recipes-core/udev/{udev => eudev}/udev-cache (100%)
 rename meta/recipes-core/udev/{udev => eudev}/udev-cache.default (100%)
 rename meta/recipes-core/udev/{udev => eudev}/udev.rules (100%)
 create mode 100644 meta/recipes-core/udev/eudev_3.1.5.bb
 delete mode 100644 meta/recipes-core/udev/udev.inc
 delete mode 100644 meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
 delete mode 100644 meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch
 delete mode 100644 meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch
 delete mode 100644 meta/recipes-core/udev/udev/add-install-ptest.patch
 delete mode 100644 meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch
 delete mode 100644 meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
 delete mode 100644 meta/recipes-core/udev/udev/run-ptest
 delete mode 100644 meta/recipes-core/udev/udev_182.bb

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index bb382bd..ba85c78 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -44,7 +44,7 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_make ?= "make"
-PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
+PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
 # There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
 # on this rather strange entry.
 PREFERRED_PROVIDER_bluez4 ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez4',d)}"
diff --git a/meta/recipes-core/udev/udev/devfs-udev.rules b/meta/recipes-core/udev/eudev/devfs-udev.rules
similarity index 100%
rename from meta/recipes-core/udev/udev/devfs-udev.rules
rename to meta/recipes-core/udev/eudev/devfs-udev.rules
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/eudev/init
similarity index 100%
rename from meta/recipes-core/udev/udev/init
rename to meta/recipes-core/udev/eudev/init
diff --git a/meta/recipes-core/udev/udev/links.conf b/meta/recipes-core/udev/eudev/links.conf
similarity index 100%
rename from meta/recipes-core/udev/udev/links.conf
rename to meta/recipes-core/udev/eudev/links.conf
diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/eudev/local.rules
similarity index 100%
rename from meta/recipes-core/udev/udev/local.rules
rename to meta/recipes-core/udev/eudev/local.rules
diff --git a/meta/recipes-core/udev/udev/permissions.rules b/meta/recipes-core/udev/eudev/permissions.rules
similarity index 100%
rename from meta/recipes-core/udev/udev/permissions.rules
rename to meta/recipes-core/udev/eudev/permissions.rules
diff --git a/meta/recipes-core/udev/udev/run.rules b/meta/recipes-core/udev/eudev/run.rules
similarity index 100%
rename from meta/recipes-core/udev/udev/run.rules
rename to meta/recipes-core/udev/eudev/run.rules
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/eudev/udev-cache
similarity index 100%
rename from meta/recipes-core/udev/udev/udev-cache
rename to meta/recipes-core/udev/eudev/udev-cache
diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/eudev/udev-cache.default
similarity index 100%
rename from meta/recipes-core/udev/udev/udev-cache.default
rename to meta/recipes-core/udev/eudev/udev-cache.default
diff --git a/meta/recipes-core/udev/udev/udev.rules b/meta/recipes-core/udev/eudev/udev.rules
similarity index 100%
rename from meta/recipes-core/udev/udev/udev.rules
rename to meta/recipes-core/udev/eudev/udev.rules
diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.1.5.bb
new file mode 100644
index 0000000..22021a0
--- /dev/null
+++ b/meta/recipes-core/udev/eudev_3.1.5.bb
@@ -0,0 +1,83 @@
+SUMMARY = "eudev is a fork of systemd's udev"
+HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
+SRC_URI = "https://github.com/gentoo/${PN}/archive/v${PV}.tar.gz \
+	file://init \
+	file://local.rules \
+	file://udev-cache \
+	file://udev-cache.default \
+        file://run.rules \
+        file://udev.rules \
+        file://devfs-udev.rules \
+        file://links.conf \
+        file://permissions.rules \
+	"
+
+LICENSE = "GPLv2.0+"
+
+inherit autotools update-rc.d
+
+SRC_URI[md5sum] = "e130f892d8744e292cb855db79935f68"
+SRC_URI[sha256sum] = "ce9d5fa91e3a42c7eb95512ca0fa2a631e89833053066bb6cdf42046b2a88553"
+
+LIC_FILES_CHKSUM="file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "glib-2.0-native glib-2.0 util-linux libxslt-native gperf-native kmod"
+
+PROVIDES = "udev"
+RPROVIDES_${PN} = "hotplug udev"
+
+PACKAGES =+ "udev-cache"
+PACKAGES =+ "libudev"
+
+INITSCRIPT_PACKAGES = "eudev udev-cache"
+INITSCRIPT_NAME_eudev = "udev"
+INITSCRIPT_PARAMS_eudev = "start 04 S ."
+INITSCRIPT_NAME_udev-cache = "udev-cache"
+INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
+
+RRECOMMENDS_${PN} += "udev-cache"
+
+
+FILES_libudev = "${base_libdir}/libudev.so.*"
+
+FILES_${PN} += "${libexecdir} ${nonarch_base_libdir}/udev ${bindir}/udevadm"
+
+
+FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
+                   ${includedir}/libudev.h ${libdir}/libudev.so \
+                   ${includedir}/udev.h ${libdir}/libudev.la \
+                   ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc \
+		   "
+FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
+
+EXTRA_OECONF = "--with-rootlibdir=${base_libdir} \
+	     --sbindir=${base_sbindir} \
+	     --libexecdir=${nonarch_base_libdir} \
+	     --with-rootprefix= \
+"
+do_install_append(){
+	install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
+        install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
+        sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
+        sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev-cache
+
+        install -d ${D}${sysconfdir}/default
+        install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
+
+        touch ${D}${sysconfdir}/udev/cache.data
+
+        install -d ${D}${sysconfdir}/udev/rules.d/
+
+        install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
+
+        # hid2hci has moved to bluez4. removed in udev as of version 169
+        rm -f ${D}${base_libdir}/udev/hid2hci
+
+        echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
+}
+
+python () {
+    if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
+}
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
deleted file mode 100644
index 93d7369..0000000
--- a/meta/recipes-core/udev/udev.inc
+++ /dev/null
@@ -1,112 +0,0 @@
-SUMMARY = "/dev/ and hotplug management daemon"
-DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
-/dev/, handles hotplug events and loads drivers at boot time."
-HOMEPAGE = "http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev/udev.html"
-LICENSE = "GPLv2.0+ & LGPLv2.1+"
-LICENSE_${PN} = "GPLv2.0+"
-LICENSE_libudev = "LGPLv2.1+"
-LICENSE_libgudev = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/COPYING;md5=17c4e5fb495e6707ac92a3864926f979 \
-                    file://src/gudev/COPYING;md5=fb494485a7d0505308cb68e4997cc266"
-
-LDFLAGS += "-lrt"
-
-DEPENDS = "glib-2.0 libusb usbutils pciutils glib-2.0-native gperf-native libxslt-native util-linux"
-RPROVIDES_${PN} = "hotplug"
-
-PROVIDES = "libgudev"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-           file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
-           file://avoid-mouse-autosuspend.patch \
-           file://run.rules \
-           file://udev.rules \
-           file://devfs-udev.rules \
-           file://links.conf \
-           file://permissions.rules \
-           file://local.rules \
-           file://udev-cache \
-           file://udev-cache.default \
-           file://add-install-ptest.patch \
-           file://fix_rule-syntax-regex-ptest.patch \
-           file://run-ptest \
-           file://init \
-           file://0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch \
-           file://0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch \
-           "
-
-inherit autotools pkgconfig update-rc.d ptest
-RDEPENDS_${PN}-ptest += "make perl python"
-
-libexecdir = "${base_libdir}"
-EXTRA_OECONF = "--disable-introspection \
-                --with-rootlibdir=${base_libdir} \
-                --with-pci-ids-path=${datadir}/pci.ids \
-                ac_cv_file__usr_share_pci_ids=no \
-                ac_cv_file__usr_share_hwdata_pci_ids=no \
-                ac_cv_file__usr_share_misc_pci_ids=yes \
-                --sbindir=${base_sbindir} \
-                --libexecdir=${nonarch_base_libdir} \
-                --with-rootlibdir=${base_libdir} \
-                --with-rootprefix= \
-                --without-systemdsystemunitdir \
-               "
-
-PACKAGES =+ "udev-cache"
-PACKAGES =+ "libudev"
-PACKAGES =+ "libgudev"
-
-INITSCRIPT_PACKAGES = "udev udev-cache"
-INITSCRIPT_NAME_udev = "udev"
-INITSCRIPT_PARAMS_udev = "start 04 S ."
-INITSCRIPT_NAME_udev-cache = "udev-cache"
-INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
-
-FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit ${nonarch_base_libdir}/udev ${bindir}/udevadm"
-RRECOMMENDS_${PN} += "udev-cache"
-
-# udev-utils has been removed as a package.  Note that udev conflicts with udev-utils so that
-# udev-utils is removed from systems on upgrade.
-RCONFLICTS_${PN} += "udev-utils"
-RREPLACES_${PN} += "udev-utils"
-
-FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
-                   ${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
-                   ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc \
-                   ${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
-                   ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
-FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
-FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
-
-do_install_append () {
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
-	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
-	sed -i s%@UDEVD@%${nonarch_base_libdir}/udev/udevd% ${D}${sysconfdir}/init.d/udev
-	sed -i s%@UDEVD@%${nonarch_base_libdir}/udev/udevd% ${D}${sysconfdir}/init.d/udev-cache
-
-	install -d ${D}${sysconfdir}/default
-	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
-
-	touch ${D}${sysconfdir}/udev/cache.data
-
-	install -d ${D}${sysconfdir}/udev/rules.d/
-
-	install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
-
-	# hid2hci has moved to bluez4. removed in udev as of version 169
-	rm -f ${D}${base_libdir}/udev/hid2hci
-
-	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
-}
-
-# As systemd also builds udev, skip this package if we're doing a systemd build.
-python () {
-    if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
-        raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
-}
-do_compile_ptest() {
-    oe_runmake test-udev
-}
diff --git a/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch b/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
deleted file mode 100644
index 41deafa..0000000
--- a/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0f8290c943da298abd269ca60fd8375dfb219971 Mon Sep 17 00:00:00 2001
-From: Alexandru DAMIAN <alexandru.damian@intel.com>
-Date: Thu, 12 Jul 2012 12:54:48 +0300
-Subject: [PATCH] Fixing keyboard_force_release.sh shell script path
-
-With the introduction of rootprefix, the keyboard-force-release.sh.in
-was modified to be executed with @rootprefix@/bin/sh, which is wrong
-because @rootprefix@ defaults to /usr (which is correct), but the
-shell is always at /bin/sh (IEEE Std 1003.2-1992).
-
-Therefore the interpreter for shell scripts needs to be /bin/sh at all times.
-
-The upstream moved to configurable root prefix, this patch taclkes a 
-transition bug, and will not be applied upstream.
-
-Upstream-Status: Inappropriate [legacy version]
-
-Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
----
- src/keymap/keyboard-force-release.sh.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/keymap/keyboard-force-release.sh.in b/src/keymap/keyboard-force-release.sh.in
-index dd040ce..597a3a6 100755
---- a/src/keymap/keyboard-force-release.sh.in
-+++ b/src/keymap/keyboard-force-release.sh.in
-@@ -1,4 +1,4 @@
--#!@rootprefix@/bin/sh -e
-+#!/bin/sh -e
- # read list of scancodes, convert hex to decimal and
- # append to the atkbd force_release sysfs attribute
- # $1 sysfs devpath for serioX
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch b/meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch
deleted file mode 100644
index 8d2df1a..0000000
--- a/meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2935f9b2dfb92c3ce4376a988cd01b624430905b Mon Sep 17 00:00:00 2001
-From: Saul Wold <sgw@linux.intel.com>
-Date: Tue, 19 Jan 2016 09:49:56 -0800
-Subject: [PATCH 1/2] mtd_probe.h: Add stdint.h as it was removed from
- mtd-user.h in the kernel
-
-
-Upstream-Status: Inappropriate [Upstream unsupported]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- src/mtd_probe/mtd_probe.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/mtd_probe/mtd_probe.h b/src/mtd_probe/mtd_probe.h
-index 2a37ede..49c1918 100644
---- a/src/mtd_probe/mtd_probe.h
-+++ b/src/mtd_probe/mtd_probe.h
-@@ -18,6 +18,7 @@
-  */
- 
- #include <mtd/mtd-user.h>
-+#include <stdint.h>
- 
- /* Full oob structure as written on the flash */
- struct sm_oob {
--- 
-2.5.0
-
diff --git a/meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch b/meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch
deleted file mode 100644
index a9dc627..0000000
--- a/meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 63ae7ebb0c6177efed46734061fb59c458a47a26 Mon Sep 17 00:00:00 2001
-From: Saul Wold <sgw@linux.intel.com>
-Date: Tue, 19 Jan 2016 09:49:19 -0800
-Subject: [PATCH 2/2] configure.ac/Makefile.am: Check for input.h and
- input-event-codes.h
-
-Add INPUT_HEADER to know which header file to use because it changed
-in the 4.4 kernel code.
-
-Set INPUT_HEADER with default linux/input.h if it exists and if the
-newer input-events-codes.h exists from 4.4 use it instead.
-
-Upstream-Status: Inappropriate [Upstream unsupported]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- Makefile.am  | 2 +-
- configure.ac | 4 +++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 2e32e69..04eb194 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -591,7 +591,7 @@ dist_udevkeymapforcerel_DATA = \
- 	src/keymap/force-release-maps/samsung-other \
- 	src/keymap/force-release-maps/common-volume-keys
- 
--src/keymap/keys.txt: $(INCLUDE_PREFIX)/linux/input.h
-+src/keymap/keys.txt: $(INCLUDE_PREFIX)/$(INPUT_HEADER)
- 	$(AM_V_at)mkdir -p src/keymap
- 	$(AM_V_GEN)$(AWK) '/^#define.*KEY_[^ ]+[ \t]+[0-9]/ { if ($$2 != "KEY_MAX") { print $$2 } }' < $< | sed 's/^KEY_COFFEE$$/KEY_SCREENLOCK/' > $@
- 
-diff --git a/configure.ac b/configure.ac
-index 0500313..9674620 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -154,8 +154,10 @@ AS_IF([test "x$enable_keymap" = "xyes"], [
-        if test -z "$GPERF"; then
-               AC_MSG_ERROR([gperf is needed])
-        fi
-+       
-+       AC_CHECK_HEADER([linux/input.h], [AC_SUBST([INPUT_HEADER], [$(echo 'linux/input.h')])], AC_MSG_ERROR([kernel headers not found]))
-+       AC_CHECK_HEADER([linux/input-event-codes.h], [AC_SUBST([INPUT_HEADER], [$(echo 'linux/input-event-codes.h')])], [:])
- 
--       AC_CHECK_HEADER([linux/input.h], [:], AC_MSG_ERROR([kernel headers not found]))
-        AC_SUBST([INCLUDE_PREFIX], [$(echo '#include <linux/input.h>' | eval $ac_cpp -E - | sed -n '/linux\/input.h/ {s:.*"\(.*\)/linux/input.h".*:\1:; p; q}')])
- ])
- AM_CONDITIONAL([ENABLE_KEYMAP], [test "x$enable_keymap" = "xyes"])
--- 
-2.5.0
-
diff --git a/meta/recipes-core/udev/udev/add-install-ptest.patch b/meta/recipes-core/udev/udev/add-install-ptest.patch
deleted file mode 100644
index bfc2e94..0000000
--- a/meta/recipes-core/udev/udev/add-install-ptest.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-Adjustements for ptest:
-
-- Add 'install-ptest' rule.
-- Print a standard result line for each test.
-- Replace the use of "tree" with "find".
-
-Signed-off-by: Björn Stenberg <bjst@enea.com>
-Signed-off-by: Alexandra Safta <alst@enea.com>
-Upstream-Status: Pending
-
-Add missing files for rule-syntax-check
-- Add rule-syntax-check.py
-- Add the deployed udev rules to the testdata
-
-Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
-Upstream-Status: Pending
---- a/Makefile.am	2012-03-18 16:28:14.000000000 +0100
-+++ b/Makefile.am	2013-02-18 10:03:36.531101244 +0100
-@@ -708,3 +708,18 @@
- 	for i in src/docs/html/*.{html,css,png}; do echo $$i; kup put $$i $$i.sign /pub/linux/utils/kernel/hotplug/libudev/; done
- 	for i in src/gudev/docs/html/*.{html,css,png}; do rm -f $$i.sign; gpg --armor --detach-sign --output=$$i.sign $$i; done
- 	for i in src/gudev/docs/html/*.{html,css,png}; do echo $$i; kup put $$i $$i.sign /pub/linux/utils/kernel/hotplug/gudev/; done
-+
-+RULES = rules/* src/accelerometer/61-accelerometer.rules \
-+	 src/cdrom_id/60-cdrom_id.rules \
-+	 src/keymap/95-keyboard-force-release.rules src/keymap/95-keymap.rules \
-+	 src/mtd_probe/75-probe_mtd.rules src/v4l_id/60-persistent-v4l.rules
-+
-+install-ptest:
-+	install test-udev $(DESTDIR)
-+	cp Makefile $(DESTDIR)
-+	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
-+	install -d $(DESTDIR)/test $(DESTDIR)/rules
-+	(cd $(top_srcdir) && install $(TESTS) $(DESTDIR)/test)
-+	(cd $(top_srcdir) && install test/rule-syntax-check.py $(DESTDIR)/test)
-+	(cd $(top_srcdir) && install $(RULES) $(DESTDIR)/rules)
-+	cp $(top_srcdir)/test/sys.tar.xz $(DESTDIR)/test/
---- a/test/udev-test.pl	2012-03-18 16:43:36.000000000 +0100
-+++ b/test/udev-test.pl	2013-02-18 10:31:29.706357321 +0100
-@@ -1459,11 +1459,13 @@
-                 print "add:         error";
-                 if ($rules->{exp_add_error}) {
-                         print " as expected\n";
-+                        print "XFAIL: TEST $number: $rules->{desc}: add\n";
-                 } else {
-                         print "\n";
--                        system("tree $udev_root");
-+                        system("find $udev_root");
-                         print "\n";
-                         $error++;
-+                        print "FAIL: TEST $number: $rules->{desc}: add\n";
-                         sleep(1);
-                 }
-         }
-@@ -1479,15 +1481,18 @@
-                 print "remove:      error";
-                 if ($rules->{exp_rem_error}) {
-                         print " as expected\n";
-+                        print "XFAIL: TEST $number: $rules->{desc}: remove\n";
-                 } else {
-                         print "\n";
--                        system("tree $udev_root");
-+                        system("find $udev_root");
-                         print "\n";
-                         $error++;
-+                        print "FAIL: TEST $number: $rules->{desc}: remove\n";
-                         sleep(1);
-                 }
-         } else {
-                 print "remove:      ok\n";
-+                print "PASS: TEST $number: $rules->{desc}: remove\n";
-         }
- 
-         print "\n";
---- a/configure.ac      2013-11-28 09:14:02.814248826 +0100
-+++ b/configure.ac      2013-11-28 09:14:34.260874296 +0100
-@@ -6,7 +6,7 @@
-        [http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html])
- AC_CONFIG_SRCDIR([src/udevd.c])
- AC_CONFIG_AUX_DIR([build-aux])
--AM_INIT_AUTOMAKE([check-news foreign 1.11 -Wall -Wno-portability silent-rules tar-pax no-dist-gzip dist-xz subdir-objects])
-+AM_INIT_AUTOMAKE([check-news foreign 1.11 -Wall -Wno-portability silent-rules tar-pax no-dist-gzip dist-xz subdir-objects serial-tests])
- AC_USE_SYSTEM_EXTENSIONS
- AC_SYS_LARGEFILE
- AC_CONFIG_MACRO_DIR([m4])
-
diff --git a/meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch b/meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch
deleted file mode 100644
index 2c31b33..0000000
--- a/meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Source: http://cgit.freedesktop.org/systemd/systemd/commit/rules/42-usb-hid-pm.rules?id=e0386cf2809219bbdd30895f46f1f567b56902b6
-
-Some USB ports on external hubs may be reported as "fixed". We only want
-to auto-enable this on ports that are internal to the machine, so check
-the parent state as well.
-
-Upstream-Status: backport
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2013/09/13
-
-Index: udev-182/rules/42-usb-hid-pm.rules
-===================================================================
---- udev-182.orig/rules/42-usb-hid-pm.rules
-+++ udev-182/rules/42-usb-hid-pm.rules
-@@ -46,4 +46,9 @@ ACTION=="add", SUBSYSTEM=="usb", ATTRS{i
- ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="14dd", ATTR{idProduct}="0002", TEST=="power/control", ATTR{power/control}="auto"
-
- # USB HID devices that are internal to the machine should also be safe to autosuspend
-+# And skip it for devices which are external but say "fixed"
-+ACTION=="add", SUBSYSTEM=="usb", SUBSYSTEMS=="usb", ATTRS{removable}=="removable", GOTO="usb_hid_pm_end"
-+ACTION=="add", SUBSYSTEM=="usb", SUBSYSTEMS=="usb", ATTRS{removable}=="unknown", GOTO="usb_hid_pm_end"
- ACTION=="add", SUBSYSTEM=="usb", ATTR{bInterfaceClass}=="03", ATTRS{removable}=="fixed", TEST=="../power/control", ATTR{../power/control}="auto"
-+LABEL="usb_hid_pm_end"
-+
diff --git a/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch b/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
deleted file mode 100644
index 593c46c..0000000
--- a/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-The rule-syntax-check script fails with errors like this:
-
-Invalid line /lib/udev/rules.d/95-keymap.rules:49: ENV{DMI_VENDOR}=="ASUS*", KERNELS=="input*", ATTRS{name}=="Asus Extra Buttons", ATTR{[dmi/id]product_name}=="W3J", RUN+="keymap $name module-asus-w3j"
-('  clause:', 'ATTR{[dmi/id]product_name}=="W3J"')
-()
-
-
-Move line comment from end of rules file to its own line, the regex used to
-test correct syntax choke on it.
-
-The rule-syntax-check.py uses regex which errournessly complains on ATTR rules
-of the form ATTR{[dmi/id]board_name}=="30B7"
-Use the regex from systemd's script which allow [] characters and additional
-compare operators
-
-The Makefile passes rules-test.sh script a build host path to the testdata.
-Ignore the argument and use a relative path instead.
-
-
-Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
-Upstream-Status: Inappropriate (cross environment path)
-
-diff -Naur udev-182.orig/src/keymap/95-keymap.rules udev-182/src/keymap/95-keymap.rules
---- udev-182.orig/src/keymap/95-keymap.rules	2012-02-07 00:01:55.154640792 +0100
-+++ udev-182/src/keymap/95-keymap.rules	2015-01-24 20:58:40.156930520 +0100
-@@ -94,7 +94,8 @@
- ENV{DMI_VENDOR}=="Hewlett-Packard", ATTR{[dmi/id]product_name}=="HP G62 Notebook PC", RUN+="keymap $name 0xB2 www"
- ENV{DMI_VENDOR}=="Hewlett-Packard", ATTR{[dmi/id]product_name}=="HP ProBook*", RUN+="keymap $name 0xF8 rfkill"
- # HP Pavillion dv6315ea has empty DMI_VENDOR
--ATTR{[dmi/id]board_vendor}=="Quanta", ATTR{[dmi/id]board_name}=="30B7", ATTR{[dmi/id]board_version}=="65.2B", RUN+="keymap $name 0x88 media" # "quick play
-+# "quick play"
-+ATTR{[dmi/id]board_vendor}=="Quanta", ATTR{[dmi/id]board_name}=="30B7", ATTR{[dmi/id]board_version}=="65.2B", RUN+="keymap $name 0x88 media"
- 
- # Gateway clone of Acer Aspire One AOA110/AOA150
- ENV{DMI_VENDOR}=="Gateway*", ATTR{[dmi/id]product_name}=="*AOA1*", RUN+="keymap $name acer"
-diff -Naur udev-182.orig/test/rule-syntax-check.py udev-182/test/rule-syntax-check.py
---- udev-182.orig/test/rule-syntax-check.py	2012-02-15 20:10:12.872333342 +0100
-+++ udev-182/test/rule-syntax-check.py	2015-01-24 21:08:00.496049600 +0100
-@@ -28,7 +28,7 @@
- no_args_tests = re.compile('(ACTION|DEVPATH|KERNELS?|NAME|SYMLINK|SUBSYSTEMS?|DRIVERS?|TAG|RESULT|TEST)\s*(?:=|!)=\s*"([^"]*)"$')
- args_tests = re.compile('(ATTRS?|ENV|TEST){([a-zA-Z0-9/_.*%-]+)}\s*(?:=|!)=\s*"([^"]*)"$')
- no_args_assign = re.compile('(NAME|SYMLINK|OWNER|GROUP|MODE|TAG|PROGRAM|RUN|LABEL|GOTO|WAIT_FOR|OPTIONS|IMPORT)\s*(?:\+=|:=|=)\s*"([^"]*)"$')
--args_assign = re.compile('(ATTR|ENV|IMPORT){([a-zA-Z0-9/_.*%-]+)}\s*=\s*"([^"]*)"$')
-+args_assign = re.compile('(ATTR|ENV|IMPORT|RUN){([][a-zA-Z0-9/_.*%-]+)}\s*(=|==|\+=)\s*"([^"]*)"$')
- 
- result = 0
- buffer = ''
---- udev-182.orig/test/rules-test.sh	2012-01-29 01:15:46.000000000 +0100
-+++ udev-182/test/rules-test.sh	2015-01-24 17:53:51.201858658 +0100
-@@ -4,7 +4,7 @@
- # (C) 2010 Canonical Ltd.
- # Author: Martin Pitt <martin.pitt@ubuntu.com>
- 
--[ -n "$srcdir" ] || srcdir=`dirname $0`/..
-+srcdir=`dirname $0`/..
- 
- # skip if we don't have python
- type python >/dev/null 2>&1 || {
diff --git a/meta/recipes-core/udev/udev/run-ptest b/meta/recipes-core/udev/udev/run-ptest
deleted file mode 100644
index 0e39806..0000000
--- a/meta/recipes-core/udev/udev/run-ptest
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-tar -C test/ -xJf test/sys.tar.xz
-make -k check-TESTS
-make test-sys-distclean
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
deleted file mode 100644
index b216352..0000000
--- a/meta/recipes-core/udev/udev_182.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-include udev.inc
-
-PR = "r9"
-
-# module-init-tools from kmod_git will provide libkmod runtime
-DEPENDS += "module-init-tools"
-
-SRC_URI[md5sum] = "1b964456177fbf48023dfee7db3a708d"
-SRC_URI[sha256sum] = "7857ed19fafd8f3ca8de410194e8c7336e9eb8a20626ea8a4ba6449b017faba4"
-- 
2.6.2



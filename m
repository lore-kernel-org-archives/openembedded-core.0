Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tkvty-0006aP-Mi
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:04:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2012 03:47:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="258889676"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2012 03:48:19 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 13:48:45 +0200
Message-Id: <99918f92b83e91fce44a9b3893cd0f1ac1b0d47c.1355830852.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
Subject: [PATCH v2 5/7] bluez: set correct udevdir
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
X-List-Received-Date: Tue, 18 Dec 2012 12:04:03 -0000

fix-udev-paths.patch: add udevdir/udevrulesdir options

Fix the following warning:
WARNING: QA Issue: bluez4: Files/directories were installed but not shipped
  /lib/udev/hid2hci
  /lib/udev/.debug
  /lib/udev/.debug/hid2hci

[YOCTO #3438]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../bluez/bluez4-4.101/fix-udev-paths.patch        | 37 ++++++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4.inc         |  2 ++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |  7 ++--
 3 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
new file mode 100644
index 0000000..8089914
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
@@ -0,0 +1,37 @@
+Add udevdir/udevrulesdir options
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: bluez-4.101/Makefile.am
+===================================================================
+--- bluez-4.101.orig/Makefile.am
++++ bluez-4.101/Makefile.am
+@@ -395,7 +395,7 @@ EXTRA_DIST += audio/bluetooth.conf
+ include Makefile.tools
+ 
+ if DATAFILES
+-rulesdir = @UDEV_DIR@/rules.d
++rulesdir = @UDEV_RULES_DIR@
+ 
+ udev_files =
+ 
+Index: bluez-4.101/configure.ac
+===================================================================
+--- bluez-4.101.orig/configure.ac
++++ bluez-4.101/configure.ac
+@@ -61,4 +61,14 @@ if (test -n "${path_systemdunit}"); then
+ fi
+ AM_CONDITIONAL(SYSTEMD, test -n "${path_systemdunit}")
+ 
++AC_ARG_WITH([udevdir],
++    AS_HELP_STRING([--with-udevdir=DIR], [udev directory]),
++    [], [with_udevdir=/lib/udev/])
++AC_SUBST([UDEV_DIR], [$with_udevdir])
++
++AC_ARG_WITH([udevrulesdir],
++    AS_HELP_STRING([--with-udevrulesdir=DIR], [udev rules directory]),
++    [], [with_udevrulesdir=/lib/udev/rules.d])
++AC_SUBST([UDEV_RULES_DIR], [$with_udevrulesdir])
++
+ AC_OUTPUT(Makefile doc/version.xml src/bluetoothd.8 src/bluetooth.service bluez.pc)
diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index 6ddd58d..bff24d3 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -39,5 +39,7 @@ EXTRA_OECONF = "\
   --disable-cups \
   --enable-test \
   --enable-datafiles \
+  --with-udevdir=${base_libdir}/udev \
+  --with-udevrulesdir=${nonarch_base_libdir}/udev/rules.d \
 "
 
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index f1a2fe7..4225999 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,9 +1,10 @@
 require bluez4.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://bluetooth.conf \
-            file://sbc_mmx.patch"
+            file://sbc_mmx.patch \
+            file://fix-udev-paths.patch"
 
 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
 SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
@@ -22,7 +23,7 @@ ALLOW_EMPTY_libasound-module-bluez = "1"
 PACKAGES =+ "libasound-module-bluez"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
+FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
   ${libdir}/alsa-lib/*.la \
-- 
1.7.11.7




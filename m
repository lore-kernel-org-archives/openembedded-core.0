Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgu1E-0003mE-BC
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:38:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 00:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25272070"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 00:34:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 00:33:46 -0700
Message-Id: <e952c3fc280158938a1eda095a9518b58ba578a2.1310541680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
Subject: [PATCH V2 14/25] udev: Use bitbake default FILES for packaging
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
X-List-Received-Date: Wed, 13 Jul 2011 07:38:05 -0000

This will ensure correct -dev and -staticdev packging

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/udev-new.inc |   26 ++++++++++++++++----------
 meta/recipes-core/udev/udev_164.bb  |    2 +-
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 4c4451f..6e49e42 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://libudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://extras/gudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
+INC_PR = "r4"
+
 DEPENDS = "acl glib-2.0 libusb usbutils pciutils linux-libc-headers gperf-native libxslt-native"
 RPROVIDES_${PN} = "hotplug"
 RRECOMMENDS_${PN} += "udev-extraconf udev-cache usbutils-ids pciutils-ids"
@@ -35,8 +37,8 @@ libexecdir = "${base_libdir}/udev"
 EXTRA_OECONF = "--disable-introspection --with-rootlibdir=${base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids"
 
-PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg"
-PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
+PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg libudev-staticdev"
+PACKAGES =+ "libgudev libgudev-dev libgudev-dbg libgudev-staticdev"
 
 INITSCRIPT_PACKAGES = "udev udev-cache"
 INITSCRIPT_NAME_udev = "udev"
@@ -47,14 +49,18 @@ INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit"
 FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
-FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
-FILES_libudev-dev = "${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
-                     ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
-FILES_libgudev = "${libdir}/libgudev*.so.*"
-FILES_libgudev-dbg = "${libdir}/.debug/libgudev*.so.*"
-FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
-                     ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
+FILES_libudev = "${base_libdir}/libudev${SOLIBS}"
+FILES_libudev-dbg = "${base_libdir}/.debug/libudev${SOLIBS}"
+FILES_libudev-dev = "${includedir}/libudev.h ${libdir}/libudev${SOLIBSDEV} ${libdir}/libudev.la \
+                     ${libdir}/pkgconfig/libudev.pc"
+FILES_libudev-staticdev = "${libdir}/libudev.a"
+RDEPENDS_libudev-staticdev = "libudev-dev (= ${EXTENDPKGV})"
+FILES_libgudev = "${libdir}/libgudev*${SOLIBS}"
+FILES_libgudev-dbg = "${libdir}/.debug/libgudev*${SOLIBS}"
+FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*${SOLIBSDEV} ${libdir}/libgudev*.la \
+                     ${libdir}/pkgconfig/gudev*.pc"
+FILES_libgudev-staticdev = "${libdir}/libgudev.a"
+RDEPENDS_libgudev-staticdev = "libgudev-dev (= ${EXTENDPKGV})"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
 
 do_install_append () {
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 567e62e..bee0bad 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r3"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
 SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
-- 
1.7.3.4




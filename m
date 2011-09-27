Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R8MF9-0003aT-KW
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 03:13:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2011 18:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56151554"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2011 18:08:29 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 09:03:59 +0800
Message-Id: <4f9d7fab604a93ebdc478178c82746e0e10f8cde.1317084972.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317084972.git.edwin.zhai@intel.com>
References: <cover.1317084972.git.edwin.zhai@intel.com>
Subject: [PATCH 1/3] eGalax touchscreen offical xorg driver
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
X-List-Received-Date: Tue, 27 Sep 2011 01:13:55 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../xf86-input-egalax/88eGalaxCalibrate.sh         |    5 ++
 .../xorg-driver/xf86-input-egalax_3.06.5605.bb     |   49 ++++++++++++++++++++
 2 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100755 meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax/88eGalaxCalibrate.sh
 create mode 100644 meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax_3.06.5605.bb

diff --git a/meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax/88eGalaxCalibrate.sh b/meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax/88eGalaxCalibrate.sh
new file mode 100755
index 0000000..0cb075f
--- /dev/null
+++ b/meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax/88eGalaxCalibrate.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+# start egalax touch screen calibration tools for the 1st time boot
+if [ ! -s /var/lib/eeti.param ]; then
+     eGalaxTouch &
+fi
diff --git a/meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax_3.06.5605.bb b/meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax_3.06.5605.bb
new file mode 100644
index 0000000..b4ff5fa
--- /dev/null
+++ b/meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax_3.06.5605.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "eGalax touscreen X driver"
+HOMEPAGE = "http://home.eeti.com.tw/web20/eGalaxTouchDriver/linuxDriver.htm"
+BUGTRACKER = "touch_fae@eeti.com"
+SECTION = "x11/drivers"
+LICENSE = "??"
+LIC_FILES_CHKSUM = "file://readme;endline=10;md5=afb35411768cea26b28e5b20a2a65c9b"
+
+SRC_URI = "http://home.eeti.com.tw/web20/drivers/touch_driver/Linux/20110810/eGalaxTouch-${PV}-32b-k26.tar.gz \
+           file://88eGalaxCalibrate.sh"
+
+PR = "r0"
+
+S = "${WORKDIR}/eGalaxTouch32"
+
+do_unpack_append() {
+	bb.build.exec_func('do_drv_unpack', d)
+}
+
+do_drv_unpack() {
+    tar xzf ${S}/eGalaxTouch.tar.gz
+
+    #make an empty touch screen parameter file
+    touch ${S}/eeti.param
+}
+
+do_install() {
+    install -d ${D}${libdir}/xorg/modules/input
+    install -m 0755 ${S}/eGalaxTouch32/Module/x110/egalax_drv.so ${D}${libdir}/xorg/modules/input/
+
+    install -d ${D}${bindir}
+    install -d ${D}/usr/local/eGalaxTouch32
+    install -m 0755 ${S}/eGalaxTouch32/eGalaxTouch ${D}/usr/local/eGalaxTouch32/
+    ln -s /usr/local/eGalaxTouch32/eGalaxTouch ${D}${bindir}/eGalaxTouch
+
+    install -m 0644 ${S}/eGalaxTouch32/Rule/eGalaxTouch48.png ${D}/usr/local/eGalaxTouch32/eGalaxTouch.png
+
+    install -d ${D}${datadir}/applications
+    install -m 0644  ${S}/eGalaxTouch32/Rule/eGalaxTouch.desktop ${D}${datadir}/applications
+
+    # calibration tools read/write /var/lib/eeti.param, so create one empty file with rw mode for all user
+    install -d ${D}${localstatedir}/lib
+    install -m 0666  ${S}/eeti.param ${D}${localstatedir}/lib/
+
+    install -d ${D}/${sysconfdir}/X11/Xsession.d
+    install -m 755 ${WORKDIR}/88eGalaxCalibrate.sh ${D}/${sysconfdir}/X11/Xsession.d/
+}
+
+FILES_${PN} += "${libdir}/xorg/modules/input/*.so \
+                /usr/local/eGalaxTouch32/*"
-- 
1.7.1




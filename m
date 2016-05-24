Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBAD6E688
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:53:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109497979"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:53:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:53:55 +0300
Message-Id: <99380a2a2c720599b311866dbcb992420941b0ab.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/45] avahi-ui: remove support for building a python module
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
X-List-Received-Date: Tue, 24 May 2016 11:53:54 -0000

It's not used by anything and hasn't been ported to Python 3.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
index 3966b4c..1b3e918 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
@@ -6,12 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 require avahi.inc
 
-inherit python-dir pythonnative distro_features_check
+inherit distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-PACKAGECONFIG ??= "dbus python"
-PACKAGECONFIG[python] = "--enable-python,--disable-python,python-native python"
-
 SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
 SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
 
@@ -21,7 +18,7 @@ AVAHI_GTK = "--enable-gtk --disable-gtk3 --disable-pygtk"
 
 S = "${WORKDIR}/avahi-${PV}"
 
-PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc python-avahi avahi-discover"
+PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc avahi-discover"
 
 FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
 FILES_${PN}-dev += "${libdir}/libavahi-ui${SOLIBSDEV}"
@@ -29,15 +26,11 @@ FILES_${PN}-staticdev += "${libdir}/libavahi-ui.a"
 
 FILES_${PN}-utils = "${bindir}/b* ${datadir}/applications/b*"
 
-FILES_python-avahi = "${PYTHON_SITEPACKAGES_DIR}/avahi ${PYTHON_SITEPACKAGES_DIR}/avahi_discover"
 FILES_avahi-discover = "${datadir}/applications/avahi-discover.desktop \
                         ${datadir}/avahi/interfaces/avahi-discover* \
                         ${bindir}/avahi-discover-standalone \
                         ${datadir}/avahi/interfaces/avahi-discover.glade"
 
-RDEPENDS_python-avahi = "python-core python-dbus"
-
-
 do_install_append () {
 	rm ${D}${sysconfdir} -rf
 	rm ${D}${base_libdir} -rf
-- 
2.8.1



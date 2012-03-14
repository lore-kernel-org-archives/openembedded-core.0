Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jmi-0004Xk-2z
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:42:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 01:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138551609"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2012 01:33:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 01:33:16 -0700
Message-Id: <7ccb68ddb9280c18740fe989bf00ebb42f9a1fc6.1331713807.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
Subject: [PATCH 05/14] qt4: package static libraries correctly to fix warnings
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
X-List-Received-Date: Wed, 14 Mar 2012 08:42:16 -0000

WARNING: QA Issue: non -staticdev package contains static .a library: qt4-demos path '/work/i586-poky-linux/qt4-x11-free-4.7.4-r39.7/packages-split/qt4-demos/usr/bin/qt4/demos/shared/libdemo_shared.a'
WARNING: QA Issue: non -staticdev package contains static .a library: qt4-examples path '/work/i586-poky-linux/qt4-x11-free-4.7.4-r39.7/packages-split/qt4-examples/usr/bin/qt4/examples/tools/plugandpaint/plugins/libpnp_basictools.a'
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |   19 ++++++++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 56f349a..e1bef64 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r39"
+INC_PR = "r40"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 77fb06f..8f2cbd5 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -45,30 +45,33 @@ python __anonymous () {
     lib_packages = []
     dev_packages = []
     dbg_packages = []
+    staticdev_packages = []
     for name in d.getVar("QT_LIB_NAMES", True).split():
         pkg = d.getVar("QT_BASE_LIB", True) + name.lower().replace("qt", "").replace("_", "-") + "4"
         # NOTE: the headers for QtAssistantClient are different
         incname = name.replace("QtAssistantClient", "QtAssistant")
         d.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s${QT_LIBINFIX}.so.*" % locals())
         d.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s${QT_LIBINFIX}.prl
-                  ${libdir}/lib%(name)s${QT_LIBINFIX}.a
                   ${libdir}/lib%(name)s${QT_LIBINFIX}.la
                   ${libdir}/lib%(name)s${QT_LIBINFIX}.so
                   ${includedir}/${QT_DIR_NAME}/%(incname)s
                   ${libdir}/pkgconfig/%(name)s${QT_LIBINFIX}.pc""" % locals())
+        d.setVar("FILES_%s-staticdev" % pkg, "${libdir}/lib%(name)s${QT_LIBINFIX}.a" % locals())
         d.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s${QT_LIBINFIX}.so*" % locals())
         d.setVar("RRECOMMENDS_%s-dbg" % pkg, "${PN}-dbg")
         lib_packages.append(pkg)
         dev_packages.append("%s-dev" % pkg)
         dbg_packages.append("%s-dbg" % pkg)
+        staticdev_packages.append("%s-staticdev" % pkg)
     for name in d.getVar("OTHER_PACKAGES", True).split():
         dbg_packages.append("%s-dbg" % name)
+        dbg_packages.append("%s-staticdev" % name)
 
     for name in d.getVar("QT_EXTRA_LIBS", True).split():
         pkg = d.getVar("QT_BASE_LIB", True) + name.lower().replace("qt", "").replace("_", "-") + "4"
         d.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s.so.*" % locals())
+        d.setVar("FILES_%s-staticdev" % pkg, "${libdir}/lib%(name)s.a" % locals())
         d.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s.prl
-                  ${libdir}/lib%(name)s.a
                   ${libdir}/lib%(name)s.la
                   ${libdir}/lib%(name)s.so
                   ${includedir}/${QT_DIR_NAME}/%(incname)s
@@ -78,10 +81,12 @@ python __anonymous () {
         lib_packages.append(pkg)
         dev_packages.append("%s-dev" % pkg)
         dbg_packages.append("%s-dbg" % pkg)
+        staticdev_packages.append("%s-staticdev" % pkg)
 
     d.setVar("LIB_PACKAGES", " ".join(lib_packages))
     d.setVar("DEV_PACKAGES", " ".join(dev_packages))
     d.setVar("DBG_PACKAGES", " ".join(dbg_packages))
+    d.setVar("STATICDEV_PACKAGES", " ".join(staticdev_packages))
 }
 
 OTHER_PACKAGES = "\
@@ -109,7 +114,13 @@ OTHER_PACKAGES = "\
 
 #We prepend so ${QT_BASE_NAME}-demos-doc comes before ${PN}-doc,so the packaging of FILES_ get done before.
 PACKAGES =+ "${QT_BASE_NAME}-demos-doc"
-PACKAGES += "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_PACKAGES}"
+PACKAGES += " \
+             ${LIB_PACKAGES} \
+             ${DEV_PACKAGES} \
+             ${DBG_PACKAGES} \
+             ${STATICDEV_PACKAGES} \
+             ${OTHER_PACKAGES}"
+
 PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-phrasebook-* ${QT_BASE_NAME}-fonts-*"
 
 ALLOW_EMPTY_${PN} = "1"
@@ -153,10 +164,12 @@ FILES_${QT_BASE_NAME}-common-dbg           = "${bindir}/.debug/qtconfig"
 FILES_${QT_BASE_NAME}-dbus                 = "${bindir}/qdbus ${bindir}/qdbusxml2cpp ${bindir}/qdbuscpp2xml ${bindir}/qdbusviewer"
 FILES_${QT_BASE_NAME}-dbus-dbg             = "${bindir}/.debug/qdbus ${bindir}/.debug/qdbusxml2cpp ${bindir}/.debug/qdbuscpp2xml ${bindir}/.debug/qdbusviewer"
 FILES_${QT_BASE_NAME}-demos                = "${bindir}/qtdemo* ${bindir}/${QT_DIR_NAME}/demos/*"
+FILES_${QT_BASE_NAME}-demos-staticdev      = "${bindir}/${QT_DIR_NAME}/shared/libdemo_shared.a"
 FILES_${QT_BASE_NAME}-demos-dbg            = "${bindir}/.debug/qtdemo* ${bindir}/${QT_DIR_NAME}/demos/.debug/*  ${bindir}/${QT_DIR_NAME}/demos/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/*/.debug"
 FILES_${QT_BASE_NAME}-designer             = "${bindir}/*designer*"
 FILES_${QT_BASE_NAME}-designer-dbg         = "${bindir}/.debug/*designer*"
 FILES_${QT_BASE_NAME}-examples             = "${bindir}/${QT_DIR_NAME}/examples/*"
+FILES_${QT_BASE_NAME}-examples-staticdev   = "${bindir}/${QT_DIR_NAME}/examples/tools/plugandpaint/plugins/libpnp_basictools.a"
 FILES_${QT_BASE_NAME}-examples-dbg         = "${bindir}/${QT_DIR_NAME}/examples/.debug ${bindir}/${QT_DIR_NAME}/examples/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/declarative/*/*/*/*/*/.debug/* ${bindir}/${QT_DIR_NAME}/examples/declarative/*/*/*/*/.debug/*"
 FILES_${QT_BASE_NAME}-fonts-ttf-vera       = "${libdir}/fonts/Vera*.ttf"
 FILES_${QT_BASE_NAME}-fonts-ttf-dejavu     = "${libdir}/fonts/DejaVu*.ttf"
-- 
1.7.7.6




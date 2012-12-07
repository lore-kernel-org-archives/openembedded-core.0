Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1TgzUH-0001En-J0
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 16:05:13 +0100
Received: (qmail invoked by alias); 07 Dec 2012 14:44:07 -0000
Received: from unknown (EHLO pink.cheepee.homedns.org) [78.96.83.205]
	by mail.gmx.net (mp072) with SMTP; 07 Dec 2012 15:44:07 +0100
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX18QqsY1Qg0QEixUofi9VetGBFiEsa/1nnTBIU3Lt2
	HZpT3sjgabDJEv
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2012 16:44:02 +0200
Message-Id: <1354891442-6766-1-git-send-email-cheepeero@gmx.net>
X-Mailer: git-send-email 1.7.8.6
X-Y-GMX-Trusted: 0
Subject: [PATCH] qt-mobility: split into smaller packages
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
X-List-Received-Date: Fri, 07 Dec 2012 15:05:13 -0000

Applications may require only some of the modules/plugins/imports
provided by qt-mobility. Most likely none require the demos and
examples, while tools may be used only during development.

The weird package names are dues to debian.bbclass.
---
 meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb |    1 +
 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb      |    1 +
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc         |  123 ++++++++++++++++++++-
 3 files changed, 121 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb b/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
index 0c30e5f..cff6db3 100644
--- a/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
+++ b/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
@@ -5,6 +5,7 @@ qtm_embedded := "embedded"
 qtm_dir = "qtopia"
 qtm_glflags := "-=opengl"
 qtm_extra_config := "gstreamer-photography_enabled = no"
+qtm_suffix="E"
 
 inherit qt4e
 require qt-mobility_${PV}.inc
diff --git a/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
index cd7d5b5..7475833 100644
--- a/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
+++ b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
@@ -5,6 +5,7 @@ qtm_embedded := ""
 qtm_dir = "qt4"
 qtm_glflags := "${@base_contains('DISTRO_FEATURES', 'opengl', '+=opengl', '-=opengl', d)} "
 qtm_extra_config := ""
+qtm_suffix="1"
 
 inherit qt4x11
 require qt-mobility_${PV}.inc
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index 7778630..72528ba 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -17,7 +17,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
 SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
 
-PR = "r7"
+PR = "r8"
 
 S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
 
@@ -63,10 +63,125 @@ do_install() {
 	oe_runmake install INSTALL_ROOT=${D}
 }
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-dev"
+# the weird names in QTM_MODULES are due to the rename in debian.bbclass
+# the ${qtm_suffix} avoids name conflicts between qt-mobility-x11 and qt-mobility-embedded
+# note that using PREFERRED_PROVIDER does not work for some unknown reason
+QTM_MODULES = "\
+    libqtbearer${qtm_suffix} \
+    libqtconnectivity${qtm_suffix} \
+    libqtcontacts${qtm_suffix} \
+    libqtfeedback${qtm_suffix} \
+    libqtgallery${qtm_suffix} \
+    libqtlocation${qtm_suffix} \
+    libqtmultimediakit${qtm_suffix} \
+    libqtorganizer${qtm_suffix} \
+    libqtpublishsubscribe${qtm_suffix} \
+    libqtsensors${qtm_suffix} \
+    libqtserviceframework${qtm_suffix} \
+    libqtsysteminfo${qtm_suffix} \
+    libqtversit${qtm_suffix} \
+    libqtversitorganizer${qtm_suffix}"
+
+QTM_PLUGINS = "\
+    ${PN}-plugin-audio \
+    ${PN}-plugin-contacts \
+    ${PN}-plugin-feedback \
+    ${PN}-plugin-geoservices \
+    ${PN}-plugin-landmarks \
+    ${PN}-plugin-mediaservice \
+    ${PN}-plugin-playlistformats \
+    ${PN}-plugin-sensors \
+    ${PN}-plugin-serviceframework \
+    ${PN}-plugin-versit"
+
+QTM_IMPORTS = "\
+    ${PN}-import-connectivity \
+    ${PN}-import-contacts \
+    ${PN}-import-feedback \
+    ${PN}-import-gallery \
+    ${PN}-import-location \
+    ${PN}-import-multimedia \
+    ${PN}-import-organizer \
+    ${PN}-import-publishsubscribe \
+    ${PN}-import-sensors \
+    ${PN}-import-serviceframework \
+    ${PN}-import-systeminfo"
+
+
+PACKAGES += "\
+    ${PN}-demos \
+    ${PN}-examples \
+    ${PN}-tools \
+    ${QTM_MODULES} \
+    ${QTM_PLUGINS} \
+    ${QTM_IMPORTS}"
+
+### demos, examples and tools
+
+FILES_${PN}-demos = "${qtm_demos}"
+RDEPENDS_${PN}-demos = "${PN}"
+
+FILES_${PN}-examples = "${qtm_examples}"
+RDEPENDS_${PN}-examples = "${PN}"
+
+FILES_${PN}-tools = "${qtm_bin}/*"
+RDEPENDS_${PN}-tools = "${PN}"
+
+
+### modules
+
+FILES_libqtbearer${qtm_suffix} = "${qtm_lib}/libQtBearer${QT_LIBINFIX}.so.*"
+FILES_libqtconnectivity${qtm_suffix} = "${qtm_lib}/libQtConnectivity${QT_LIBINFIX}.so.*"
+FILES_libqtcontacts${qtm_suffix} = "${qtm_lib}/libQtContacts${QT_LIBINFIX}.so.*"
+FILES_libqtfeedback${qtm_suffix} = "${qtm_lib}/libQtFeedback${QT_LIBINFIX}.so.*"
+FILES_libqtgallery${qtm_suffix} = "${qtm_lib}/libQtGallery${QT_LIBINFIX}.so.*"
+FILES_libqtlocation${qtm_suffix} = "${qtm_lib}/libQtLocation${QT_LIBINFIX}.so.*"
+FILES_libqtmultimediakit${qtm_suffix} = "${qtm_lib}/libQtMultimediaKit${QT_LIBINFIX}.so.*"
+FILES_libqtorganizer${qtm_suffix} = "${qtm_lib}/libQtOrganizer${QT_LIBINFIX}.so.*"
+FILES_libqtpublishsubscribe${qtm_suffix} = "${qtm_lib}/libQtPublishSubscribe${QT_LIBINFIX}.so.*"
+FILES_libqtsensors${qtm_suffix} = "${qtm_lib}/libQtSensors${QT_LIBINFIX}.so.*"
+FILES_libqtserviceframework${qtm_suffix} = "${qtm_lib}/libQtServiceFramework${QT_LIBINFIX}.so.*"
+FILES_libqtsysteminfo${qtm_suffix} = "${qtm_lib}/libQtSystemInfo${QT_LIBINFIX}.so.*"
+FILES_libqtversit${qtm_suffix} = "${qtm_lib}/libQtVersit${QT_LIBINFIX}.so.*"
+FILES_libqtversitorganizer${qtm_suffix} = "${qtm_lib}/libQtVersitOrganizer${QT_LIBINFIX}.so.*"
+
+### plugins
+
+FILES_${PN}-plugin-audio = "${qtm_plugins}/audio"
+FILES_${PN}-plugin-contacts = "${qtm_plugins}/contacts"
+FILES_${PN}-plugin-feedback = "${qtm_plugins}/feedback"
+FILES_${PN}-plugin-geoservices = "${qtm_plugins}/geoservices"
+FILES_${PN}-plugin-landmarks = "${qtm_plugins}/landmarks"
+FILES_${PN}-plugin-mediaservice = "${qtm_plugins}/mediaservice"
+FILES_${PN}-plugin-playlistformats = "${qtm_plugins}/playlistformats"
+FILES_${PN}-plugin-sensors = "${qtm_plugins}/sensors"
+FILES_${PN}-plugin-serviceframework = "${qtm_plugins}/serviceframework"
+FILES_${PN}-plugin-versit = "${qtm_plugins}/versit"
+
+### imports
+
+FILES_${PN}-import-connectivity = "${qtm_imports}/QtMobility/connectivity"
+FILES_${PN}-import-contacts = "${qtm_imports}/QtMobility/contacts"
+FILES_${PN}-import-feedback = "${qtm_imports}/QtMobility/feedback"
+FILES_${PN}-import-gallery = "${qtm_imports}/QtMobility/gallery"
+FILES_${PN}-import-location = "${qtm_imports}/QtMobility/location"
+FILES_${PN}-import-multimedia = "${qtm_imports}/QtMultimediaKit"
+FILES_${PN}-import-organizer = "${qtm_imports}/QtMobility/organizer"
+FILES_${PN}-import-publishsubscribe = "${qtm_imports}/QtMobility/publishsubscribe"
+FILES_${PN}-import-sensors = "${qtm_imports}/QtMobility/sensors"
+FILES_${PN}-import-serviceframework = "${qtm_imports}/QtMobility/serviceframework"
+FILES_${PN}-import-systeminfo = "${qtm_imports}/QtMobility/systeminfo"
+
+
+### root package, bringing them all
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
+RDEPENDS_${PN} = "${QTM_MODULES} ${QTM_PLUGINS} ${QTM_IMPORTS}"
+
 
 FILES_${PN}-dbg = "${qtm_bin}/.debug ${qtm_examples}/.debug ${qtm_demos}/.debug \
                    ${qtm_lib}/.debug ${qtm_plugins}/*/.debug  ${qtm_imports}/*/.debug \
                    ${qtm_imports}/*/*/.debug ${bindir}/.debug /usr/src/debug"
-FILES_${PN} = "${qtm_bin} ${qtm_examples} ${qtm_demos} ${qtm_lib}/*.so.1* ${qtm_plugins} ${qtm_imports}"
-FILES_${PN}-dev = "${exec_prefix}"
+FILES_${PN}-dev += "${qtm_lib}/*.prl ${datadir}/${qtm_dir}"
+
-- 
1.7.8.6




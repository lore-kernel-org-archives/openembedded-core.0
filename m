Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Svzcc-0003TG-Cx
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 01:43:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2012 16:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="173360912"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2012 16:31:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 00:31:01 +0100
Message-Id: <f45f3d2b5d415b44e4229df5071f63b7c6e12536.1343691019.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343691019.git.paul.eggleton@linux.intel.com>
References: <cover.1343691019.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343691019.git.paul.eggleton@linux.intel.com>
References: <cover.1343691019.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] qt4: make font packaging specific to embedded version
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
X-List-Received-Date: Mon, 30 Jul 2012 23:43:35 -0000

Qt 4's lib/fonts files are intended only for installation with
Qt Embedded [1] so only install and package them with the embedded
version.

Fixes [YOCTO #2809].

[1] http://lists.qt-project.org/pipermail/interest/2012-July/003062.html

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |   30 ++++++++++++++++++++++++++++++
 meta/recipes-qt/qt4/qt4.inc          |   25 +------------------------
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 9e8bf3a..de1b88e 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -21,6 +21,9 @@ QT_CONFIG_FLAGS += " \
 require qt4.inc
 
 do_install_append() {
+    install -d ${D}/${libdir}/fonts
+    touch ${D}/${libdir}/fonts/fontdir
+
     install -d ${D}${sysconfdir}/profile.d/
     install -m 0755 ${WORKDIR}/qte.sh ${D}${sysconfdir}/profile.d/
 }
@@ -31,5 +34,32 @@ PACKAGES += " ${PN}-conf"
 FILES_${PN}-conf += " ${sysconfdir}/profile.d/qte.sh"
 RRECOMMENDS_${PN} += " ${PN}-conf"
 
+OTHER_PACKAGES += "\
+             ${QT_BASE_NAME}-fonts \
+             ${QT_BASE_NAME}-fonts-ttf-vera \
+             ${QT_BASE_NAME}-fonts-ttf-dejavu \
+             ${QT_BASE_NAME}-fonts-pfa \
+             ${QT_BASE_NAME}-fonts-pfb \
+             ${QT_BASE_NAME}-fonts-qpf"
+
+RRECOMMENDS_${QT_BASE_NAME}-fonts = " \
+             ${QT_BASE_NAME}-fonts-ttf-vera \
+             ${QT_BASE_NAME}-fonts-ttf-dejavu \
+             ${QT_BASE_NAME}-fonts-pfa \
+             ${QT_BASE_NAME}-fonts-pfb \
+             ${QT_BASE_NAME}-fonts-qpf"
+RRECOMMENDS_${QT_BASE_NAME}-demos += " \
+            ${QT_BASE_NAME}-fonts"
+
+ALLOW_EMPTY_${QT_BASE_NAME}-fonts = "1"
+PACKAGES_DYNAMIC += "${QT_BASE_NAME}-fonts-*"
+
+FILES_${QT_BASE_NAME}-fonts-ttf-vera       = "${libdir}/fonts/Vera*.ttf"
+FILES_${QT_BASE_NAME}-fonts-ttf-dejavu     = "${libdir}/fonts/DejaVu*.ttf"
+FILES_${QT_BASE_NAME}-fonts-pfa            = "${libdir}/fonts/*.pfa"
+FILES_${QT_BASE_NAME}-fonts-pfb            = "${libdir}/fonts/*.pfb"
+FILES_${QT_BASE_NAME}-fonts-qpf            = "${libdir}/fonts/*.qpf*"
+FILES_${QT_BASE_NAME}-fonts                = "${libdir}/fonts/README ${libdir}/fonts/fontdir"
+
 inherit qt4e
 
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 9b42f69..b8c6baf 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -93,12 +93,6 @@ OTHER_PACKAGES = "\
              ${QT_BASE_NAME}-demos \
              ${QT_BASE_NAME}-designer \
              ${QT_BASE_NAME}-examples \
-             ${QT_BASE_NAME}-fonts \
-             ${QT_BASE_NAME}-fonts-ttf-vera \
-             ${QT_BASE_NAME}-fonts-ttf-dejavu \
-             ${QT_BASE_NAME}-fonts-pfa \
-             ${QT_BASE_NAME}-fonts-pfb \
-             ${QT_BASE_NAME}-fonts-qpf \
              ${QT_BASE_NAME}-linguist \
              ${QT_BASE_NAME}-makeqpf \
              ${QT_BASE_NAME}-mkspecs \
@@ -117,10 +111,9 @@ PACKAGES += " \
              ${STATICDEV_PACKAGES} \
              ${OTHER_PACKAGES}"
 
-PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-phrasebook-* ${QT_BASE_NAME}-fonts-*"
+PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-phrasebook-*"
 
 ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${QT_BASE_NAME}-fonts = "1"
 FILES_${PN}     = ""
 FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
 FILES_${PN}-dbg = "${exec_prefix}/src/debug/"
@@ -128,14 +121,7 @@ FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/qtopia/qch/qt.qch"
 RRECOMMENDS_${PN} = "${LIB_PACKAGES} ${OTHER_PACKAGES}"
 RRECOMMENDS_${PN}-dev = "${DEV_PACKAGES}"
 RRECOMMENDS_${PN}-dbg = "${DBG_PACKAGES}"
-RRECOMMENDS_${QT_BASE_NAME}-fonts = " \
-             ${QT_BASE_NAME}-fonts-ttf-vera \
-             ${QT_BASE_NAME}-fonts-ttf-dejavu \
-             ${QT_BASE_NAME}-fonts-pfa \
-             ${QT_BASE_NAME}-fonts-pfb \
-             ${QT_BASE_NAME}-fonts-qpf"
 RRECOMMENDS_${QT_BASE_NAME}-demos += " \
-            ${QT_BASE_NAME}-fonts \
             ${QT_BASE_NAME}-examples \
             ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
             ${QT_BASE_NAME}-plugin-imageformat-jpeg \
@@ -170,12 +156,6 @@ FILES_${QT_BASE_NAME}-designer-dbg         = "${bindir}/.debug/*designer*"
 FILES_${QT_BASE_NAME}-examples             = "${bindir}/${QT_DIR_NAME}/examples/*"
 FILES_${QT_BASE_NAME}-examples-staticdev   = "${bindir}/${QT_DIR_NAME}/examples/tools/plugandpaint/plugins/libpnp_basictools.a"
 FILES_${QT_BASE_NAME}-examples-dbg         = "${bindir}/${QT_DIR_NAME}/examples/.debug ${bindir}/${QT_DIR_NAME}/examples/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/declarative/*/*/*/*/*/.debug/* ${bindir}/${QT_DIR_NAME}/examples/declarative/*/*/*/*/.debug/*"
-FILES_${QT_BASE_NAME}-fonts-ttf-vera       = "${libdir}/fonts/Vera*.ttf"
-FILES_${QT_BASE_NAME}-fonts-ttf-dejavu     = "${libdir}/fonts/DejaVu*.ttf"
-FILES_${QT_BASE_NAME}-fonts-pfa            = "${libdir}/fonts/*.pfa"
-FILES_${QT_BASE_NAME}-fonts-pfb            = "${libdir}/fonts/*.pfb"
-FILES_${QT_BASE_NAME}-fonts-qpf            = "${libdir}/fonts/*.qpf*"
-FILES_${QT_BASE_NAME}-fonts                = "${libdir}/fonts/README ${libdir}/fonts/fontdir"
 FILES_${QT_BASE_NAME}-linguist             = "${bindir}/*linguist* ${bindir}/lrelease ${bindir}/lupdate ${bindir}/lconvert ${bindir}/qm2ts"
 FILES_${QT_BASE_NAME}-linguist-dbg         = "${bindir}/.debug/*linguist* ${bindir}/.debug/lrelease ${bindir}/.debug/lupdate ${bindir}/.debug/lconvert ${bindir}/.debug/qm2ts"
 FILES_${QT_BASE_NAME}-pixeltool            = "${bindir}/pixeltool"
@@ -368,9 +348,6 @@ do_install() {
 				-e 's:IP{:I${:g' $pc
 	done
 
-	install -d ${D}/${libdir}/fonts
-	touch ${D}/${libdir}/fonts/fontdir
-
 	#Append an E to the qtdemo file
 	if [ -n "${QT_LIBINFIX}" ] ; then
 		[ -f ${D}${bindir}/qtdemo ] && mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
-- 
1.7.9.5




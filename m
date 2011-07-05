Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qe2iA-00058s-7q
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:18:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Jul 2011 03:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,478,1304319600"; d="scan'208";a="22761017"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.114])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2011 03:14:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 11:14:37 +0100
Message-Id: <fe15b38c2ff66cc45f38d1359dedb5f29353a46e.1309860717.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309860717.git.paul.eggleton@linux.intel.com>
References: <cover.1309860717.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1309860717.git.paul.eggleton@linux.intel.com>
References: <cover.1309860717.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] qt4: ensure target packages don't include host binaries
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
X-List-Received-Date: Tue, 05 Jul 2011 10:18:34 -0000

Remove uic, rcc, moc and lrelease from packaged files. This fixes the
following QA warnings:

qt4-x11-free-4.7.3, wrong architecture, qt4-tools-dbg,
  ${WORKDIR}/packages-split/qt4-tools-dbg/usr/bin/.debug/uic
qt4-x11-free-4.7.3, wrong architecture, qt4-tools-dbg,
  ${WORKDIR}/packages-split/qt4-tools-dbg/usr/bin/.debug/rcc
qt4-x11-free-4.7.3, wrong architecture, qt4-tools-dbg,
  ${WORKDIR}/packages-split/qt4-tools-dbg/usr/bin/.debug/moc
qt4-x11-free-4.7.3, wrong architecture, qt4-tools,
  ${WORKDIR}/packages-split/qt4-tools/usr/bin/uic
qt4-x11-free-4.7.3, wrong architecture, qt4-tools,
  ${WORKDIR}/packages-split/qt4-tools/usr/bin/rcc
qt4-x11-free-4.7.3, wrong architecture, qt4-tools,
  ${WORKDIR}/packages-split/qt4-tools/usr/bin/moc
qt4-x11-free-4.7.3, wrong architecture, qt4-linguist,
  ${WORKDIR}/packages-split/qt4-linguist/usr/bin/lrelease

These utilities are all provided by qt4-tools-nativesdk in any case.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |   15 +++++++--------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index fc02fe0..de311dc 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r26"
+INC_PR = "r27"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 87145a3..7a30af6 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r23"
+INC_PR = "r24"
 
 QT_GLFLAGS ?= "-no-opengl"
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 7e15b61..284586f 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -126,8 +126,8 @@ RRECOMMENDS_${QT_BASE_NAME}-examples += " \
             ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
             ${QT_BASE_NAME}-plugin-imageformat-jpeg"
 
-FILES_${QT_BASE_NAME}-tools                = "${bindir}/uic* ${bindir}/moc ${bindir}/rcc ${bindir}/qttracereplay ${bindir}/qdoc*"
-FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/uic* ${bindir}/.debug/moc ${bindir}/.debug/rcc ${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*"
+FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc*"
+FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*"
 FILES_${QT_BASE_NAME}-assistant            = "${bindir}/*assistant* ${bindir}/qcollectiongenerator ${bindir}/qhelpconverter ${bindir}/qhelpgenerator"
 FILES_${QT_BASE_NAME}-assistant-dbg        = "${bindir}/.debug/*assistant* ${bindir}/.debug/qcollectiongenerator ${bindir}/.debug/qhelpconverter ${bindir}/.debug/qhelpgenerator"
 FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig"
@@ -267,7 +267,11 @@ do_install() {
 	oe_runmake install INSTALL_ROOT=${D}
 
 	# These are host binaries, we should only use them in staging
-	rm -rf ${D}/${bindir}/qmake
+	rm ${D}/${bindir}/qmake
+	rm ${D}/${bindir}/uic
+	rm ${D}/${bindir}/moc
+	rm ${D}/${bindir}/rcc
+	rm ${D}/${bindir}/lrelease
 
 	# fix pkgconfig, libtool and prl files
 	sed -i -e s#-L${S}/lib##g \
@@ -302,11 +306,6 @@ do_install() {
 	install -d ${D}/${libdir}/fonts
 	touch ${D}/${libdir}/fonts/fontdir
 
-	install -d ${D}${bindir}
-	for i in rcc uic moc ; do
-		install -m 0755 ${S}/bin/$i ${D}${bindir}/
-	done
-
 	#Append an E to the qtdemo file
 	if [ -n "${QT_LIBINFIX}" ] ; then
 		mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
-- 
1.7.4.1




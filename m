Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RaB2L-00061V-FA
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 19:55:42 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2011 10:48:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101352761"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.29])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2011 10:48:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2011 18:48:34 +0000
Message-Id: <cda94110e16a2fb5d760fd728435b7cbb4142392.1323715541.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1323715541.git.paul.eggleton@linux.intel.com>
References: <cover.1323715541.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1323715541.git.paul.eggleton@linux.intel.com>
References: <cover.1323715541.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] qt4.inc : Add uic, moc, rcc, and lrelease to tools package.
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
X-List-Received-Date: Mon, 12 Dec 2011 18:55:42 -0000

From: Philip Balister <philip@balister.org>

These binaries are needed in the target tools package so we can build
qt apps on the target. You also need to install qmake from meta-oe.

Tested by building gnuradio on the USRP e100 with qt support.

(This effectively reverses OE-core rev
69eeb3d2276e5b10d084b47d308ecfc8daf8b467, however test builds for
qemux86 and qemumips produced no packaging warnings such as those
described in that commit, and the architecture of the executables is
correct.)

Signed-off-by: Philip Balister <philip@balister.org>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |    9 ++-------
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 06b2432..39f7398 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r38"
+INC_PR = "r39"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 53a44ad..5b93a98 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r35"
+INC_PR = "r36"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 3155cbb..87a12e6 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -142,8 +142,8 @@ RRECOMMENDS_${QT_BASE_NAME}-qmlviewer += " \
 RRECOMMENDS_${QT_BASE_NAME}-doc += " \
             ${QT_BASE_NAME}-demos-doc"
 
-FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc*"
-FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*"
+FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc* ${bindir}/moc ${bindir}/uic* ${bindir}/rcc"
+FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc* ${bindir}/.debug/uic* ${bindir}/.debug/moc ${bindir}/.debug/rcc"
 FILES_${QT_BASE_NAME}-assistant            = "${bindir}/*assistant* ${bindir}/qcollectiongenerator ${bindir}/qhelpconverter ${bindir}/qhelpgenerator"
 FILES_${QT_BASE_NAME}-assistant-dbg        = "${bindir}/.debug/*assistant* ${bindir}/.debug/qcollectiongenerator ${bindir}/.debug/qhelpconverter ${bindir}/.debug/qhelpgenerator"
 FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig"
@@ -291,11 +291,6 @@ do_install() {
 
 	# These are host binaries, we should only use them in staging
 	rm ${D}/${bindir}/qmake
-	rm -f ${D}/${bindir}/uic
-	rm -f ${D}/${bindir}/uic3
-	rm ${D}/${bindir}/moc
-	rm ${D}/${bindir}/rcc
-	rm -f ${D}/${bindir}/lrelease
 
 	# fix pkgconfig, libtool and prl files
 	sed -i -e 's#-L${S}/lib/\?##g' \
-- 
1.7.5.4




Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R9g6y-00060s-IZ
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:38:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Sep 2011 09:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="57738527"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.157])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2011 09:33:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:33:16 +0100
Message-Id: <7caffb617932529028127584fa041b5412ef7cd9.1317400021.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] qt4.inc: package qtdemo's docs in a separate package
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
X-List-Received-Date: Fri, 30 Sep 2011 16:38:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denis Carikli <denis@eukrea.com>

The documentation was 285M and doesn't fit on the NAND of many machines,
  but in another had part of the documentation is needed for the
  QT demos, so we split the documentation: so qt demo only RRECOMMAND
  the documentation that it really needs.

Thanks to Eric Bénard for explaining me how to split it.

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |    8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index a360ec3..93feb0e 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r28"
+INC_PR = "r30"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 23832db..eb01a1b 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -101,6 +101,8 @@ OTHER_PACKAGES = "\
              ${QT_BASE_NAME}-qt3to4 \
              ${QT_BASE_NAME}-qml-plugins"
 
+#We prepend so ${QT_BASE_NAME}-demos-doc comes before ${PN}-doc,so the packaging of FILES_ get done before.
+PACKAGES =+ "${QT_BASE_NAME}-demos-doc"
 PACKAGES += "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_PACKAGES}"
 PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-fonts-*"
 
@@ -109,6 +111,7 @@ ALLOW_EMPTY_${QT_BASE_NAME}-fonts = "1"
 FILES_${PN}     = ""
 FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
 FILES_${PN}-dbg = "${exec_prefix}/src/debug/"
+FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/qtopia/qch/qt.qch"
 RRECOMMENDS_${PN} = "${LIB_PACKAGES} ${OTHER_PACKAGES}"
 RRECOMMENDS_${PN}-dev = "${DEV_PACKAGES}"
 RRECOMMENDS_${PN}-dbg = "${DBG_PACKAGES}"
@@ -124,13 +127,16 @@ RRECOMMENDS_${QT_BASE_NAME}-demos += " \
             ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
             ${QT_BASE_NAME}-plugin-imageformat-jpeg \
             ${QT_BASE_NAME}-qml-plugins \
-            ${QT_BASE_NAME}-assistant"
+            ${QT_BASE_NAME}-assistant \
+            ${QT_BASE_NAME}-demos-doc"
 RRECOMMENDS_${QT_BASE_NAME}-examples += " \
             ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
             ${QT_BASE_NAME}-plugin-imageformat-jpeg \
             ${QT_BASE_NAME}-qml-plugins"
 RRECOMMENDS_${QT_BASE_NAME}-qmlviewer += " \
             ${QT_BASE_NAME}-qml-plugins"
+RRECOMMENDS_${QT_BASE_NAME}-doc += " \
+            ${QT_BASE_NAME}-demos-doc"
 
 FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc*"
 FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*"
-- 
1.7.4.1




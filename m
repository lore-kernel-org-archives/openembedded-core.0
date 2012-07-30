Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Svzcb-0003TG-9g
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 01:43:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2012 16:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="173360908"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2012 16:31:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 00:31:00 +0100
Message-Id: <f9af0748fc3018446da4062b3050bac72c83d7c2.1343691019.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343691019.git.paul.eggleton@linux.intel.com>
References: <cover.1343691019.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343691019.git.paul.eggleton@linux.intel.com>
References: <cover.1343691019.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] qt4: allow recipes building commercial edition
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
X-List-Received-Date: Mon, 30 Jul 2012 23:43:33 -0000

To enable building the commercial edition of Qt (through additional
recipes that are *not* provided by OE-Core) we need to tweak a few
things:

* Don't make recipes that inherit qt4x11.bbclass depend on qt4-x11-free
  - instead add qt4-x11 to DEPENDS and then have qt4-x11-free include
  this in its PROVIDES. A commercial equivalent recipe should do the
  same.
* Add a QT_LICENSE_FILE variable that can be used to specify the license
  file required by the commercial edition.
* Add a QT_LICENSE_FLAGS variable which the recipe can set to select the
  license option being used. The default of "-opensource" retains the
  current behaviour; a commercial recipe should set it to "-commercial".

Fixes [YOCTO #2505].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/qt4x11.bbclass          |    2 +-
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    3 ++-
 meta/recipes-qt/qt4/qt4.inc          |    7 ++++++-
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/qt4x11.bbclass b/meta/classes/qt4x11.bbclass
index 610397d..52190f4 100644
--- a/meta/classes/qt4x11.bbclass
+++ b/meta/classes/qt4x11.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_prepend = "${@["qt4-x11-free ", ""][(d.getVar('BPN', True)[:12] == 'qt4-x11-free')]}"
+DEPENDS_prepend = "${@base_contains("PROVIDES", "qt4-x11", "", "qt4-x11 ", d)}"
 
 inherit qmake2
 
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 9c5b4af..9e8bf3a 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r46"
+INC_PR = "r47"
 
 QT_BASE_LIB  ?= "libqt-embedded"
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 29bbfc6..e229b85 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -4,8 +4,9 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+PROVIDES += "qt4-x11"
 
-INC_PR = "r44"
+INC_PR = "r45"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index df70e09..9b42f69 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -192,6 +192,10 @@ FILES_${QT_BASE_NAME}-xmlpatterns-dbg      = "${bindir}/.debug/xmlpatterns*"
 FILES_${QT_BASE_NAME}-qml-plugins          = "${libdir}/${QT_DIR_NAME}/imports/* ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/*"
 FILES_${QT_BASE_NAME}-qml-plugins-dbg      = "${libdir}/${QT_DIR_NAME}/imports/*/*/*/.debug/* ${libdir}/${QT_DIR_NAME}/imports/*/.debug ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/.debug"
 
+# License options, to be set by the recipe if different values are needed
+QT_LICENSE_FILE ?= ""
+QT_LICENSE_FLAGS ?= "-opensource"
+
 do_configure() {
 	unset QMAKESPEC
 	unset QTDIR
@@ -231,7 +235,7 @@ do_configure() {
 
 	${EXTRA_QMAKE_MUNGE}|| true
 
-	(echo o; echo yes) | ./configure -v \
+	echo yes | QT_LICENSE_FILE="${QT_LICENSE_FILE}" ./configure -v \
 			-prefix ${prefix}/ \
 			-bindir ${bindir} \
 			-libdir ${libdir} \
@@ -248,6 +252,7 @@ do_configure() {
 			-xplatform ${TARGET_OS}-oe-g++ \
 			${QT_ENDIAN} \
 			-crossarch ${QT_ARCH} \
+			${QT_LICENSE_FLAGS} \
 			${QT_CONFIG_FLAGS} -no-fast \
 			-L${STAGING_LIBDIR} -I${STAGING_INCDIR} \
 			-I${STAGING_INCDIR}/freetype2
-- 
1.7.9.5




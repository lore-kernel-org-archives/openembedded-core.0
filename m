Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S5Nt8-0005PU-QF
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 21:55:10 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2012 21:36:28 +0100
Message-Id: <1331152588-27456-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] qt4: fix deps in libQtWebkit.la and QtWebKit.pc
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
X-List-Received-Date: Wed, 07 Mar 2012 20:55:11 -0000

* Both files contain -L../../WebCore/release -L../../JavaScriptCore/release -lwebcore -ljscore
* These paths and libs don't get installed.
* When building a shared lib with libtool, that links
  with libQtWebKit, libtool adds these unneeded parameters
  to the linker command-line, thus linking fails.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |    1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 80948f3..0e57e5a 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r41"
+INC_PR = "r42"
 
 QT_BASE_LIB  ?= "libqt-embedded"
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 75487f7..56f349a 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r38"
+INC_PR = "r39"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 2e70bd9..77fb06f 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -328,6 +328,7 @@ do_install() {
 			-e 's#" -Wl,-rpath-link,${S}/lib/\?"##g' \
 			-e 's#" -Wl,-rpath-link,${libdir}/\?"##g' \
 			-e 's#Iin#I${in#g' \
+			-e 's#-L\.\./\.\./WebCore/release\s\+-L\.\./\.\./JavaScriptCore/release\s\+-lwebcore\s\+-ljscore##g' \
 			${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
 
 	sed -i -e s#" -Wl,-rpath-link,${S}/lib"##g \
-- 
1.7.5.4




Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1R7oTe-0007ct-Qm
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 15:10:38 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id DAC12799044; Sun, 25 Sep 2011 14:57:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (dslb-092-076-167-122.pools.arcor-ip.net
	[92.76.167.122]) by gravedo.de (Postfix) with ESMTPSA id 8E94879903C;
	Sun, 25 Sep 2011 14:57:48 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 14:57:43 +0200
Message-Id: <1316955464-19997-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/2] meta: qt4: fix postprocessing of pkg-config files
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
X-List-Received-Date: Sun, 25 Sep 2011 13:10:38 -0000

When building qt4-embedded the generated and cleaned pkg-config files for qt are wrong.
The Cflags variable contains something like ${includedir}/qtopia/QtCore where
${includedir} is already /usr/include/qtopia/QtCore.

This patch reverts the fix up of the Cflags variable implemented in do_install.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |    4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 9914c61..1ede922 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r30"
+INC_PR = "r31"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 0a714be..a360ec3 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r27"
+INC_PR = "r28"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 5545be7..7f3e1a4 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -293,7 +293,6 @@ do_install() {
 			-e s#'$(OE_QMAKE_LIBS_X11)'#"${OE_QMAKE_LIBS_X11}"#g \
 			-e s#" -Wl,-rpath-link,${S}/lib"##g \
 			-e s#" -Wl,-rpath-link,${libdir}"##g \
-			-e 's#I/usr/include#Iincludedir}#g' \ 
 			-e 's#Iin#I${in#g' \
 			${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
 
@@ -310,8 +309,7 @@ do_install() {
 
 	# QT abuses $includedir to point to its headers, which breaks pkgconfig sysroot, so manually fix it up here:
 	for pc in ${D}${libdir}/pkgconfig/*.pc ; do
-		sed -i -e "s:prefix}include/${QT_BASE_NAME}/$(basename $pc .pc):prefix}/include:" \
-				-e "s,Cflags: ,Cflags: -IP{includedir}/${QT_BASE_NAME}/$(basename $pc .pc) ," \
+		sed -i -e "s:prefix}include/${QT_DIR_NAME}/$(basename $pc .pc):prefix}/include:" \
 				-e 's:IP{:I${:g' $pc
 	done
 
-- 
1.7.4.1




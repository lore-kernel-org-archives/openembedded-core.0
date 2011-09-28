Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oIt-000423-K8
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360945"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:45 -0700
Message-Id: <b40b9c024be5e1ec81a31961158b3e6b529acfe0.1317193250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/29] meta: qt4: fix postprocessing of pkg-config files
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:39 -0000

From: Simon Busch <morphis@gravedo.de>

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
1.7.6




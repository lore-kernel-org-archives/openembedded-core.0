Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrMH-0002iM-LX
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:21 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587143"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:49 -0800
Message-Id: <fff02c7c2c1c6ab0ceb1f888134d381d8b612884.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/17] qmmp: update to 0.5.2
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:22 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

qmmp: remove old recipe and add new recipe

Use do_split_package for each grouping and name them correctly besides updating package.
The format to name plugins of qmmp:
qmmp-plugin-<group>-<library>   with the Description: Qmmp<Group>  plugin for %s"

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Fix dESCRIPTION -> DESCRIPTION

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../qt-apps/{qmmp_0.5.1.bb => qmmp_0.5.2.bb}       |   51 +++++++++++--------
 1 files changed, 29 insertions(+), 22 deletions(-)
 rename meta/recipes-qt/qt-apps/{qmmp_0.5.1.bb => qmmp_0.5.2.bb} (48%)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
similarity index 48%
rename from meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
rename to meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
index 948c32a..b3ecc45 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -6,18 +6,15 @@ SECTION = "multimedia"
 
 PR = "r0"
 
-DEPENDS = "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
-RDEPENDS_${PN} += "taglib alsa-lib curl"
+DEPENDS = "taglib libmad libvorbis libogg alsa-lib"
 
 SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "7934c069256bf2fc4ab762ad2683db2f"
-SRC_URI[sha256sum] = "16ab0334f368a5ef14d631a1d43d7cae876ee06b7185643377b5e9cfd6143099"
+SRC_URI[md5sum] = "20852f3cce3471bfc5affa9b2e947dc6"
+SRC_URI[sha256sum] = "6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
 
 
-PARALLEL_MAKE = ""
-
-inherit qmake2 cmake
+inherit qmake2 cmake qt4x11
 
 export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                         -DQT_LRELEASE_EXECUTABLE=${OE_QMAKE_LRELEASE} \
@@ -28,20 +25,30 @@ export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                         -DQT_HEADERS_DIR=${OE_QMAKE_INCDIR_QT} \
                         -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
                         "
-
-FILES_${PN} = "${bindir}/qmmp ${libdir}/*.so* \ 
-               ${libdir}/qmmp/PlaylistFormats/*.so \
-               ${libdir}/qmmp/Output/libalsa.so \
-               ${libdir}/qmmp/Transports/libhttp.so \
-               ${libdir}/qmmp/Visual/libanalyzer.so \
-               ${datadir}/icons/* \
-               ${datadir}/qmmp/images/* \
-               ${datadir}/applications/qmmp.desktop \
+PACKAGES_DYNAMIC = "qmmp-plugin-* "
+
+
+python populate_packages_prepend () {
+	import os
+	qmmp_libdir = bb.data.expand('${libdir}/qmmp', d)
+	gd = bb.data.expand('${D}/${libdir}/qmmp', d)
+	plug_dirs = os.listdir(gd)
+
+	for plug_dir in plug_dirs:
+		g_plug_dir = os.path.join(qmmp_libdir,plug_dir)
+		do_split_packages(d, g_plug_dir, '^lib(.*)\.so$', 'qmmp-plugin-' + plug_dir.lower() + '-%s', 'Qmmp' + plug_dir  + 'plugin for %s')
+} 
+
+FILES_${PN} = "\
+		${bindir}/qmmp \
+                ${libdir}/lib*${SOLIBS} \ 
+		${datadir}/icons/* \
+                ${datadir}/qmmp/images/* \
+                ${datadir}/applications/* \
+		"
+
+FILES_${PN}-dbg += "\
+                ${libdir}/qmmp/*/.debug/* \
                "
 
-PACKAGES += "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis"
-
-FILES_${PN}-plugin-input-mad = "${libdir}/qmmp/Input/libmad.so"
-RDEPENDS_${PN}-plugin-input-mad = "libmad"
-FILES_${PN}-plugin-input-vorbis = "${libdir}/qmmp/Input/libvorbis.so"
-RDEPENDS_${PN}-plugin-input-vorbis = "libvorbis libogg"
+RDEPENDS_${PN} += "taglib alsa-lib libmad curl"
-- 
1.7.6.4




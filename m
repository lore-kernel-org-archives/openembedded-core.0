Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RJFkn-0002Z5-70
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 04:31:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9R2PbRx026453
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 19:25:37 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 26 Oct 2011 19:25:36 -0700
Message-ID: <b179f5f8d3a6fdf9c62a4f871fcc0f56a8577363.1319682417.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1319682417.git.xiaofeng.yan@windriver.com>
References: <cover.1319682417.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 27 Oct 2011 10:20:16 +0800
Date: Thu, 27 Oct 2011 10:32:25 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qmmp: update to 0.5.2
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
X-List-Received-Date: Thu, 27 Oct 2011 02:31:37 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Remove recipe qmmp_0.5.1 and add qmmp_0.5.2

Use do_split_package for each grouping and name them correctly besides updating package.
The format to name plugins of qmmp:
qmmp-plugin-<group>-<library>   with the Description: Qmmp<Group>  plugin for %s"

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    9 +++-
 meta/recipes-qt/qt-apps/qmmp_0.5.1.bb              |   47 ----------------
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |   57 ++++++++++++++++++++
 3 files changed, 64 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
 create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1f3540e..6e8eaea 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5726,11 +5726,16 @@ RECIPE_LAST_UPDATE_pn-libgdata = "Dec 29, 2010"
 RECIPE_MAINTAINER_pn-libgdata = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_LATEST_VERSION_pn-man-pages = "3.32"
-RECIPE_LATEST_VERSION_pn-qmmp = "0.4.3"
-RECIPE_MAINTAINER_pn-qmmp = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 RECIPE_LATEST_VERSION_pn-sysprof = "6b5b8432711ef5c747f8375073cd9af88922d3c6"
 RECIPE_LATEST_VERSION_pn-table = "d42a44938699ee30a998fc42bc149aebf69389db"
 
+RECIPE_STATUS_pn-qmmp = "green"
+RECIPE_LATEST_VERSION_pn-qmmp = "0.5.2"
+RECIPE_LATEST_RELEASE_DATE_pn-qmmp = "Sep 02, 2011"
+RECIPE_LAST_UPDATE_pn-qmmp = "Oct 27, 2011"
+RECIPE_MAINTAINER_pn-qmmp = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+
 RECIPE_LATEST_VERSION_pn-texinfo = "4.13a"
 RECIPE_LATEST_RELEASE_DATE_pn-texinfo = "Sep 22, 2008"
 RECIPE_LAST_UPDATE_pn-texinfo = "Sep 16, 2011"
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
deleted file mode 100644
index 948c32a..0000000
--- a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-DESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written with help of Qt library"
-HOMEPAGE = "http://qmmp.ylsoftware.com"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-SECTION = "multimedia"
-
-PR = "r0"
-
-DEPENDS = "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
-RDEPENDS_${PN} += "taglib alsa-lib curl"
-
-SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "7934c069256bf2fc4ab762ad2683db2f"
-SRC_URI[sha256sum] = "16ab0334f368a5ef14d631a1d43d7cae876ee06b7185643377b5e9cfd6143099"
-
-
-PARALLEL_MAKE = ""
-
-inherit qmake2 cmake
-
-export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
-                        -DQT_LRELEASE_EXECUTABLE=${OE_QMAKE_LRELEASE} \
-                        -DQT_MOC_EXECUTABLE=${OE_QMAKE_MOC} \
-                        -DQT_UIC_EXECUTABLE=${OE_QMAKE_UIC} \
-                        -DQT_RCC_EXECUTABLE=${OE_QMAKE_RCC} \
-                        -DQT_LIBRARY_DIR=${OE_QMAKE_LIBDIR_QT} \
-                        -DQT_HEADERS_DIR=${OE_QMAKE_INCDIR_QT} \
-                        -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
-                        "
-
-FILES_${PN} = "${bindir}/qmmp ${libdir}/*.so* \ 
-               ${libdir}/qmmp/PlaylistFormats/*.so \
-               ${libdir}/qmmp/Output/libalsa.so \
-               ${libdir}/qmmp/Transports/libhttp.so \
-               ${libdir}/qmmp/Visual/libanalyzer.so \
-               ${datadir}/icons/* \
-               ${datadir}/qmmp/images/* \
-               ${datadir}/applications/qmmp.desktop \
-               "
-
-PACKAGES += "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis"
-
-FILES_${PN}-plugin-input-mad = "${libdir}/qmmp/Input/libmad.so"
-RDEPENDS_${PN}-plugin-input-mad = "libmad"
-FILES_${PN}-plugin-input-vorbis = "${libdir}/qmmp/Input/libvorbis.so"
-RDEPENDS_${PN}-plugin-input-vorbis = "libvorbis libogg"
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
new file mode 100644
index 0000000..98ee907
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -0,0 +1,57 @@
+dESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written with help of Qt library"
+HOMEPAGE = "http://qmmp.ylsoftware.com"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+SECTION = "multimedia"
+
+PR = "r4"
+
+PROVIDES = "qmmp"
+DEPENDS = "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
+RDEPENDS_${PN} += "taglib alsa-lib libmad curl"
+
+SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "20852f3cce3471bfc5affa9b2e947dc6"
+SRC_URI[sha256sum] = "6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
+
+
+PARALLEL_MAKE = ""
+
+inherit qmake2 cmake package
+
+export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
+                        -DQT_LRELEASE_EXECUTABLE=${OE_QMAKE_LRELEASE} \
+                        -DQT_MOC_EXECUTABLE=${OE_QMAKE_MOC} \
+                        -DQT_UIC_EXECUTABLE=${OE_QMAKE_UIC} \
+                        -DQT_RCC_EXECUTABLE=${OE_QMAKE_RCC} \
+                        -DQT_LIBRARY_DIR=${OE_QMAKE_LIBDIR_QT} \
+                        -DQT_HEADERS_DIR=${OE_QMAKE_INCDIR_QT} \
+                        -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
+                        "
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
+		do_split_packages(d, g_plug_dir, '^lib(.*)\.so$', 'qmmp-plugin-' + plug_dir + '-%s', 'Qmmp' + plug_dir  + 'plugin for %s')
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
+               "
+
-- 
1.7.0.4




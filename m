Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RIBKx-00063i-9w
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 05:36:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9O3UYUL003755
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 20:30:34 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 23 Oct 2011 20:30:34 -0700
Message-ID: <3eac60f2d638250e038ad9be06b12fd553b9f0b7.1319427162.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1319427162.git.xiaofeng.yan@windriver.com>
References: <cover.1319427162.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 24 Oct 2011 11:21:52 +0800
Date: Mon, 24 Oct 2011 11:37:05 +0800
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
X-List-Received-Date: Mon, 24 Oct 2011 03:36:31 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Use do_split_package for each grouping and name them correctly besides updating package.
The format to name plugins of qmmp:
qmmp-plugin-<group>-<library>  with the Description: Qmmp <Group> plugin for %s"

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb |   60 +++++++++++++++++++++++++++++++++
 1 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
new file mode 100644
index 0000000..58dd825
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -0,0 +1,60 @@
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
+		
+
+	
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




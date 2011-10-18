Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RG27c-0002Gs-Vg
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 07:21:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9I5G3wY028863
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 22:16:03 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 17 Oct 2011 22:16:03 -0700
Message-ID: <ff63f110f1f657a011c24f5c8cfb8e7328fae49a.1318904555.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1318904555.git.xiaofeng.yan@windriver.com>
References: <cover.1318904555.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 18 Oct 2011 10:07:14 +0800
Date: Tue, 18 Oct 2011 13:21:58 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] qmmp: update to 0.5.2
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
X-List-Received-Date: Tue, 18 Oct 2011 05:21:53 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The new version of qmmp can run on core-image-sato by test.
$qmmp *.mp3

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb |   49 +++++++++++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
new file mode 100644
index 0000000..f31409b
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -0,0 +1,49 @@
+dESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written with help of Qt library"
+HOMEPAGE = "http://qmmp.ylsoftware.com"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+SECTION = "multimedia"
+
+PR = "r3"
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
+inherit qmake2 cmake
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
+
+FILES_${PN} =+ "\
+               ${libdir}/qmmp/*/*.so \
+               ${datadir}/icons/* \
+               ${datadir}/qmmp/images/* \
+               ${datadir}/applications/qmmp.desktop \
+               "
+
+FILES_${PN}-dbg += "\
+                ${libdir}/qmmp/*/.debug/* \
+               "
+
+PACKAGES += "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis"
+
+FILES_${PN}-plugin-input-mad = "${libdir}/qmmp/Input/libmad.so"
+RDEPENDS_${PN}-plugin-input-mad = "libmad"
+FILES_${PN}-plugin-input-vorbis = "${libdir}/qmmp/Input/libvorbis.so"
+RDEPENDS_${PN}-plugin-input-vorbis = "libvorbis libogg"
-- 
1.7.0.4




Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEo-0003VD-D6
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375157"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:11 -0700
Message-Id: <d8bdf3a41a8a090bccb7ffdbe937d9a586876a59.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
Subject: [v2 -CONSOLIDATED PULL 09/14] qmmp: Fix QA Packaging Errors
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:14 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-qt/qt-apps/qmmp_0.5.1.bb |   36 +++++++++++++++++++++++++++-----
 1 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
index 948c32a..3f710f5 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "multimedia"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
 RDEPENDS_${PN} += "taglib alsa-lib curl"
@@ -29,16 +29,40 @@ export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                         -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
                         "
 
-FILES_${PN} = "${bindir}/qmmp ${libdir}/*.so* \ 
-               ${libdir}/qmmp/PlaylistFormats/*.so \
-               ${libdir}/qmmp/Output/libalsa.so \
-               ${libdir}/qmmp/Transports/libhttp.so \
-               ${libdir}/qmmp/Visual/libanalyzer.so \
+FILES_${PN} = "${bindir}/qmmp ${libdir}/*${SOLIBS} \ 
+               ${libdir}/qmmp/PlaylistFormats/*${SOLIBS} \
+               ${libdir}/qmmp/Output/libalsa${SOLIBS} \
+               ${libdir}/qmmp/Transports/libhttp${SOLIBS} \
+               ${libdir}/qmmp/Visual/libanalyzer${SOLIBS} \
                ${datadir}/icons/* \
                ${datadir}/qmmp/images/* \
                ${datadir}/applications/qmmp.desktop \
                "
 
+FILES_${PN}-dev += "${libdir}/qmmp/PlaylistFormats/*${SOLIBSDEV} \
+               ${libdir}/qmmp/Output/libalsa${SOLIBSDEV} \
+               ${libdir}/qmmp/Transports/libhttp${SOLIBSDEV} \
+               ${libdir}/qmmp/Visual/libanalyzer${SOLIBSDEV} \
+               "
+
+FILES_${PN}-dbg += "${libdir}/qmmp/PlaylistFormats/.debug \
+               ${libdir}/qmmp/Output/.debug/libalsa* \
+               ${libdir}/qmmp/Transports/.debug/libhttp* \
+               ${libdir}/qmmp/Visual/.debug/libanalyzer* \
+               "
+
+FILES_${PN}-others-dbg = "${libdir}/qmmp/PlaylistFormats/.debug \
+               ${libdir}/qmmp/General/.debug \
+               ${libdir}/qmmp/Input/.debug \
+               ${libdir}/qmmp/Output/.debug \
+               ${libdir}/qmmp/Effect/.debug \
+               ${libdir}/qmmp/Engines/.debug \
+               ${libdir}/qmmp/FileDialogs/.debug \
+               ${libdir}/qmmp/Transports/.debug \
+               ${libdir}/qmmp/Visual/.debug \
+               ${libdir}/qmmp/CommandLineOptions/.debug \
+               "
+
 PACKAGES += "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis"
 
 FILES_${PN}-plugin-input-mad = "${libdir}/qmmp/Input/libmad.so"
-- 
1.7.6.2




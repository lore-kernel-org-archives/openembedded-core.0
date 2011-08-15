Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QsuER-0002c2-AI
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 12:17:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 03:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,373,1309762800"; d="scan'208";a="41534191"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.70])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 03:12:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 11:12:35 +0100
Message-Id: <7fa50b7c7056076e5d87e98c072f2be7a658c230.1313402929.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313402929.git.paul.eggleton@linux.intel.com>
References: <cover.1313402929.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1313402929.git.paul.eggleton@linux.intel.com>
References: <cover.1313402929.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] qt4: replace qt4-tools-native with qt4-native
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
X-List-Received-Date: Mon, 15 Aug 2011 10:17:20 -0000

Installs native versions of the Qt libraries in addition to the tools,
allowing compilation of external native tools that require Qt libs.
PROVIDES qt4-tools-native so it should be a drop-in replacement.

Developed with reference to the corresponding qt4-native changes in OE.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../qt4/{qt4-tools-native.inc => qt4-native.inc}   |   20 ++++++++++++++------
 ...4-tools-native_4.7.3.bb => qt4-native_4.7.3.bb} |    2 +-
 2 files changed, 15 insertions(+), 7 deletions(-)
 rename meta/recipes-qt/qt4/{qt4-tools-native.inc => qt4-native.inc} (87%)
 rename meta/recipes-qt/qt4/{qt4-tools-native_4.7.3.bb => qt4-native_4.7.3.bb} (92%)

diff --git a/meta/recipes-qt/qt4/qt4-tools-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
similarity index 87%
rename from meta/recipes-qt/qt4/qt4-tools-native.inc
rename to meta/recipes-qt/qt4/qt4-native.inc
index c4a58ed..3baea20 100644
--- a/meta/recipes-qt/qt4/qt4-tools-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -1,7 +1,8 @@
-DESCRIPTION = "Native tools for Qt/[X11|Mac|Embedded] version 4.x"
+DESCRIPTION = "Native version of Qt/[X11|Mac|Embedded]"
 DEPENDS = "zlib-native dbus-native"
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
+PROVIDES = "qt4-tools-native"
 
 LICENSE = "LGPLv2.1 | GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
@@ -25,11 +26,11 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -no-libjpeg -no-libpng -no-libmng -no-libtiff \
                 -no-accessibility \
                 -no-cups \
-                -no-exceptions  \
                 -no-nas-sound \
                 -no-nis -no-openssl \
-                -verbose -release -static \
+                -verbose -release \
                 -embedded -no-freetype -no-glib -no-iconv \
+                -exceptions -xmlpatterns \
                 -qt3support"
 
 # yank default -e, otherwise we get the following error:
@@ -44,12 +45,15 @@ TOBUILD = "\
   src/tools/moc \
   src/corelib \
   src/sql \
-  src/dbus \
-  src/qt3support \
   src/xml \
+  src/network \
   src/tools/uic \
   src/tools/rcc \
-  src/network \
+  src/xmlpatterns \
+  src/dbus \
+  src/gui \
+  src/testlib \
+  src/qt3support \
   tools/linguist/lrelease \
   tools/linguist/lupdate \
 "
@@ -73,4 +77,8 @@ do_install() {
 	cp -f ${WORKDIR}/g++.conf ${WORKDIR}/linux.conf ${D}${datadir}/qt4/mkspecs/common/
 
 	install -m 0644 tools/porting/src/q3porting.xml ${D}${datadir}/qt4/
+
+	for i in ${TOBUILD}; do
+		cd ${S}/$i && oe_runmake install INSTALL_ROOT=${D}
+	done
 }
diff --git a/meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb b/meta/recipes-qt/qt4/qt4-native_4.7.3.bb
similarity index 92%
rename from meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb
rename to meta/recipes-qt/qt4/qt4-native_4.7.3.bb
index 8d292af..5c84d4d 100644
--- a/meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb
+++ b/meta/recipes-qt/qt4/qt4-native_4.7.3.bb
@@ -1,4 +1,4 @@
-require qt4-tools-native.inc
+require qt4-native.inc
 
 PR = "${INC_PR}.1"
 
-- 
1.7.4.1




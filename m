Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R9g70-00060y-1a
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:38:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Sep 2011 09:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="57738538"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.157])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2011 09:33:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:33:17 +0100
Message-Id: <d8b9aad9e3fa0cacbde4597d45f68652009af001.1317400021.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] qt4: fix translation support
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
X-List-Received-Date: Fri, 30 Sep 2011 16:38:58 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

The translation support was disable in build. The
fix-translation.patch was imported from OpenEmbedded to fix a linking
issue in phonon translation support.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-qt/qt4/qt-4.7.3.inc                   |    9 ++---
 .../recipes-qt/qt4/qt-4.7.3/fix-translations.patch |   32 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 6 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.3/fix-translations.patch

diff --git a/meta/recipes-qt/qt4/qt-4.7.3.inc b/meta/recipes-qt/qt4/qt-4.7.3.inc
index a5b8b05..16c7b08 100644
--- a/meta/recipes-qt/qt4/qt-4.7.3.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.3.inc
@@ -13,6 +13,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://0009-support-2bpp.patch \
            file://0001-Added-Openembedded-crossarch-option.patch \
            file://blacklist-diginotar-certs.diff \
+           file://fix-translations.patch \
            file://g++.conf \
            file://linux.conf \
            "
@@ -26,7 +27,9 @@ FILES_${QT_BASE_NAME}-tools                += "${bindir}/qml"
 
 do_configure_prepend() {
     for pro in $(find ${S} -name "*.pro") ; do
-        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $pro
+        sed -i \
+            -e 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' \
+            -e 's:qtPrepareTool(LRELEASE, lrelease):LRELEASE = ${OE_QMAKE_LRELEASE}:g' $pro
     done
 
     sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
@@ -38,10 +41,6 @@ do_configure_prepend() {
     ${S}/configure
 }
 
-do_configure_append() {
-    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makefile
-}
-
 QT_GLFLAGS ?= ""
 QT_CONFIG_FLAGS += " -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
 
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/fix-translations.patch b/meta/recipes-qt/qt4/qt-4.7.3/fix-translations.patch
new file mode 100644
index 0000000..906d4e3
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.3/fix-translations.patch
@@ -0,0 +1,32 @@
+fix phony translation linking error
+
+  | .../usr/lib/crt1.o: In function `_start':
+  | .../../sysdeps/i386/elf/start.S:115: undefined reference to `main'
+  | collect2: ld returned 1 exit status
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/translations/translations.pro b/translations/translations.pro
+index cdaf04a..24fa668 100644
+--- a/translations/translations.pro
++++ b/translations/translations.pro
+@@ -20,7 +20,7 @@ updateqm.name = LRELEASE ${QMAKE_FILE_IN}
+ updateqm.CONFIG += no_link
+ QMAKE_EXTRA_COMPILERS += updateqm
+ 
+-isEmpty(vcproj) {
++!isEmpty(vcproj) {
+     QMAKE_LINK = @: IGNORE THIS LINE
+     OBJECTS_DIR =
+     win32:CONFIG -= embed_manifest_exe
+@@ -30,7 +30,7 @@ isEmpty(vcproj) {
+     phony_src.input = PHONY_DEPS
+     phony_src.output = phony.c
+     phony_src.variable_out = GENERATED_SOURCES
+-    phony_src.commands = echo int main() { return 0; } > phony.c
++    phony_src.commands = echo \"int main() { return 0; }\" > phony.c
+     phony_src.name = CREATE phony.c
+     phony_src.CONFIG += combine
+     QMAKE_EXTRA_COMPILERS += phony_src
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index ffa5288..53e1297 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r33"
+INC_PR = "r34"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 59c0059..ebbee9b 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 inherit native
 
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index 097fadc..a71c3ae 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 93feb0e..f76a97f 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r30"
+INC_PR = "r31"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
-- 
1.7.4.1




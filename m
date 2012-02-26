Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S1mhT-0004wH-VJ
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 23:36:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Feb 2012 14:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129643777"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.61])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2012 14:27:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 22:27:43 +0000
Message-Id: <92f5b08231f9219bdede342b14149e3a5b1b6070.1330294151.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330294151.git.paul.eggleton@linux.intel.com>
References: <cover.1330294151.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1330294151.git.paul.eggleton@linux.intel.com>
References: <cover.1330294151.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] qt4-tools-nativesdk: improve and tidy up qmake build
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
X-List-Received-Date: Sun, 26 Feb 2012 22:36:16 -0000

* Use the same method to build qmake as in the qt4 target recipes
* We always have qmake from qt4-native so don't check if it exists -
  just skip the check like we do in the qt4 target recipes. This
  saves us a patch.
* Replace qt4-tools-native in DEPENDS with qt4-native

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/files/qmake-exists-check.patch |   19 -----------------
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |   22 +++++++++++--------
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb   |    2 +
 3 files changed, 15 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/files/qmake-exists-check.patch

diff --git a/meta/recipes-qt/qt4/files/qmake-exists-check.patch b/meta/recipes-qt/qt4/files/qmake-exists-check.patch
deleted file mode 100644
index 27d21e0..0000000
--- a/meta/recipes-qt/qt4/files/qmake-exists-check.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-qt4-tools-nativesdk: avoid rebuilding qmake
-
-qt4-tools-nativesdk patch to avoids building qmake in configure if it already exists 
-(as it will, since we symlink it in from the native sysroot in do_configure)
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Upstream-Status: Inappropriate [configuration]
-
---- qt-everywhere-opensource-src-4.6.3.orig/configure	2011-01-10 12:01:56.260607001 +0000
-+++ qt-everywhere-opensource-src-4.6.3/configure	2011-01-10 12:02:20.584607015 +0000
-@@ -4286,7 +4286,7 @@
- }
- 
- # build qmake
--if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-+if [ '!' -f "$outpath/bin/qmake" ]; then
-     echo "Creating qmake. Please wait..."
- 
-     OLD_QCONFIG_H=
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index 64cc1ae..efb61bf 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -1,21 +1,22 @@
 DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "zlib-nativesdk dbus-nativesdk libx11-nativesdk qt4-tools-native"
+DEPENDS = "zlib-nativesdk dbus-nativesdk libx11-nativesdk qt4-native"
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
 inherit nativesdk qmake2
 
 SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+           file://0004-no-qmake.patch \
            file://configure-lflags.patch \
            file://qt-config.patch \
-           file://qmake-exists-check.patch \
            file://configure-paths.patch \
            file://qt-dbus-const.patch \
+           file://target_qmake.patch \
            file://g++.conf \
            file://linux.conf"
 
@@ -66,11 +67,7 @@ do_configure() {
         sed -i -e "s#gcc#${CC}#" mkspecs/common/g++-base.conf
     fi
 
-    # first launch configure to get qmake compiled for the nativesdk
-    (echo o; echo yes) | CC="${CC}" CXX="${CXX}" ./configure ${EXTRA_OECONF} || true
-
-    # then backup the binary and start again with a qmake which can run on the build host
-    mv bin/qmake bin/qmake_nativesdk
+    # Use qmake from qt4-native for building
     if [ ! -e bin/qmake ]; then
         ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
     fi
@@ -99,11 +96,18 @@ do_compile() {
     for i in ${TOBUILD}; do
         cd ${S}/$i && oe_runmake CC="${CC}" CXX="${CXX}"
     done
+
+    # Build nativesdk qmake
+    export QMAKESPEC="${S}/mkspecs/${TARGET_OS}-oe-g++"
+    cd ${S}/qmake
+    ${OE_QMAKE_QMAKE}
+    oe_runmake CC="${CC}" CXX="${CXX}"
+    cd ${S}
 }
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 bin/qmake_nativesdk ${D}${bindir}/qmake2
+    install -m 0755 bin/qmake2 ${D}${bindir}/qmake2
     for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
         install -m 0755 bin/${i} ${D}${bindir}/${i}4
     done
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
index e615d36..02917fe 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
@@ -2,6 +2,8 @@ require qt4-tools-nativesdk.inc
 
 PR = "${INC_PR}.0"
 
+SRC_URI += "file://qmake_pri_fixes.patch"
+
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI[md5sum] = "e8a5fdbeba2927c948d9f477a6abe904"
-- 
1.7.5.4




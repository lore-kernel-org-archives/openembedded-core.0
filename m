Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U2mHQ-0006Ul-HL
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:26:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Feb 2013 09:10:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="283126336"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.42])
	by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2013 09:10:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 17:09:58 +0000
Message-Id: <1c9151ca6d6addce9cc0e97a81c517e6422a6ea3.1360084153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360084153.git.paul.eggleton@linux.intel.com>
References: <cover.1360084153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360084153.git.paul.eggleton@linux.intel.com>
References: <cover.1360084153.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] qmmp: update to 0.6.6 and fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 17:26:02 -0000

* Update to 0.6.6
* Fix compilation failure due to call to QApplication::commitData()
* Disable /usr/local host paths to avoid compilation warnings
* Force use of the cmake configure instead of qmake as the latter is not
  dynamic with Qmmp and doesn't let you disable certain dependencies
  (e.g. enca)
* Add libsndfile1 and libsamplerate0 to DEPENDS since their use will be
  non-deterministic otherwise
* Explicitly disable library-requiring options that we don't have
  available in OE-Core so that they don't get used if they happen to be
  in the sysroot
* Update LIC_FILES_CHKSUM since there were cosmetic changes to the
  license file (mostly reformatting and change of references to LGPL
  from "Library" to "Lesser".)

Fixes [YOCTO #3882].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch   |   25 +++++++++++++
 .../qt-apps/qmmp/no-sessionmanager.patch           |   21 +++++++++++
 .../qt-apps/{qmmp_0.6.1.bb => qmmp_0.6.6.bb}       |   39 ++++++++++++++++----
 3 files changed, 77 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
 create mode 100644 meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch
 rename meta/recipes-qt/qt-apps/{qmmp_0.6.1.bb => qmmp_0.6.6.bb} (56%)

diff --git a/meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch b/meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
new file mode 100644
index 0000000..de17b4e
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
@@ -0,0 +1,25 @@
+Do not include /usr/include host paths
+
+These were added upstream apparently for freebsd support, but trigger
+compiler warnings during the build and could be dangerous, so remove
+them.
+
+Upstream-Status: Inappropriate [cross]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,12 +1,5 @@
+ cmake_minimum_required(VERSION 2.6.0)
+ 
+-#freebsd support
+-include_directories(SYSTEM /usr/local/include)
+-link_directories(/usr/local/lib)
+-link_directories(/usr/local/lib32)
+-link_directories(/usr/local/lib64)
+-SET(CMAKE_REQUIRED_INCLUDES ${CMAKE_REQUIRED_INCLUDES} /usr/local/include)
+-
+ #extract version from qmmp.h
+ FILE(STRINGS "${CMAKE_CURRENT_SOURCE_DIR}/src/qmmp/qmmp.h"
+      QMMP_VERSION_DATA REGEX "^#define[ \t]+QMMP_VERSION_[A-Z]+[ \t]+[0-9]+.*$")
diff --git a/meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch b/meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch
new file mode 100644
index 0000000..5e2978b
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch
@@ -0,0 +1,21 @@
+Don't call session manager function if not enabled
+
+If session management has been disabled we will get a compilation
+failure if we try to call QApplication::commitData() so don't do so if
+it is disabled.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- a/src/app/qmmpapplication.cpp
++++ b/src/app/qmmpapplication.cpp
+@@ -29,6 +29,8 @@ void QmmpApplication::commitData(QSessionManager &manager)
+ {
+     if(UiHelper::instance())
+         UiHelper::instance()->exit();
++#ifndef QT_NO_SESSIONMANAGER
+     else
+         QApplication::commitData(manager);
++#endif
+ }
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb b/meta/recipes-qt/qt-apps/qmmp_0.6.6.bb
similarity index 56%
rename from meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
rename to meta/recipes-qt/qt-apps/qmmp_0.6.6.bb
index ed096e9..2f5e0d5 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.6.6.bb
@@ -2,20 +2,37 @@ DESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written wit
 HOMEPAGE = "http://qmmp.ylsoftware.com"
 LICENSE = "GPLv2"
 LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SECTION = "multimedia"
 
-PR = "r1"
+DEPENDS = "taglib libmad libvorbis libogg alsa-lib libsndfile1 libsamplerate0 curl"
 
-DEPENDS = "taglib libmad libvorbis libogg alsa-lib"
+SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2 \
+           file://no-host-paths.patch \
+           file://no-sessionmanager.patch"
 
-SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "23a1a3aa924da901ebc8327ea76135d4"
-SRC_URI[sha256sum] = "b48be8c0e3882088919a77ce7b619cfc99d32af29cc688ba8749a58cbb25fb6f"
+SRC_URI[md5sum] = "0131a9bf7b98737c1a6fd6e1a897e2b2"
+SRC_URI[sha256sum] = "dfa973cca80c020a85a11bb66701a3804f9fde326440abb179559c98bf3b5b99"
 
 inherit cmake qt4x11
 
+QMMP_PLUGIN_OPTIONS ??= "\
+                        -DUSE_MMS:BOOL=FALSE \
+                        -DUSE_MPC:BOOL=FALSE \
+                        -DUSE_MODPLUG:BOOL=FALSE \
+                        -DUSE_WAVPACK:BOOL=FALSE \
+                        -DUSE_FFMPEG:BOOL=FALSE \
+                        -DUSE_AAC:BOOL=FALSE \
+                        -DUSE_CDA:BOOL=FALSE \
+                        -DUSE_MIDI:BOOL=FALSE \
+                        -DUSE_GME:BOOL=FALSE \
+                        -DUSE_OSS4:BOOL=FALSE \
+                        -DUSE_JACK:BOOL=FALSE \
+                        -DUSE_BS2B:BOOL=FALSE \
+                        -DUSE_PROJECTM:BOOL=FALSE \
+                        -DUSE_ENCA:BOOL=FALSE \
+                        "
+
 export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                         -DQT_LRELEASE_EXECUTABLE=${OE_QMAKE_LRELEASE} \
                         -DQT_MOC_EXECUTABLE=${OE_QMAKE_MOC} \
@@ -24,9 +41,15 @@ export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                         -DQT_LIBRARY_DIR=${OE_QMAKE_LIBDIR_QT} \
                         -DQT_HEADERS_DIR=${OE_QMAKE_INCDIR_QT} \
                         -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
+                        ${QMMP_PLUGIN_OPTIONS} \
                         "
-PACKAGES_DYNAMIC += "^qmmp-plugin-.* "
 
+do_configure() {
+	# Ensure we get the cmake configure and not qmake
+	cmake_do_configure
+}
+
+PACKAGES_DYNAMIC += "^qmmp-plugin-.* "
 
 python populate_packages_prepend () {
     qmmp_libdir = d.expand('${libdir}/qmmp')
-- 
1.7.10.4




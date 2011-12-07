Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYLa5-0004X3-VM
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 18:46:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2011 09:40:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93564370"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.2])
	by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2011 09:39:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 17:39:47 +0000
Message-Id: <7b4fd0770d25c8b6bc6ddd71e614876e80be8390.1323279373.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1323279373.git.paul.eggleton@linux.intel.com>
References: <cover.1323279373.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1323279373.git.paul.eggleton@linux.intel.com>
References: <cover.1323279373.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] qt4: various tidy-ups
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
X-List-Received-Date: Wed, 07 Dec 2011 17:46:58 -0000

* -reduce-relocations is already specified in qt4.inc, no need to add it
  in qt-${PV}.inc
* Add QT_GLFLAGS to QT_CONFIG_FLAGS in qt4.inc rather than spreading it
  through other inc files.
* Add "-xmlpatterns -no-rpath -qt3support -silent" to QT_CONFIG_FLAGS in
  qt4.inc rather than qt-${PV}.inc; these have been supported since at
  least 4.5.2 and therefore shouldn't be version-specific.
* Move "-no-fast -silent -no-rpath" to EXTRA_OECONF in qt4-native.inc
  rather than the versioned recipes for the same reason
* Remove redundant setting of LICENSE in qt4-embedded.inc

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt-4.7.4.inc        |    3 ---
 meta/recipes-qt/qt4/qt4-embedded.inc    |    3 +--
 meta/recipes-qt/qt4/qt4-native.inc      |    3 ++-
 meta/recipes-qt/qt4/qt4-native_4.7.4.bb |    2 --
 meta/recipes-qt/qt4/qt4-x11-free.inc    |    4 ++--
 meta/recipes-qt/qt4/qt4.inc             |    6 +++++-
 6 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
index 7a3ba54..8fda9ce 100644
--- a/meta/recipes-qt/qt4/qt-4.7.4.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -43,9 +43,6 @@ do_configure_prepend() {
     ${S}/configure
 }
 
-QT_GLFLAGS ?= ""
-QT_CONFIG_FLAGS += " -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
-
 do_compile() {
     # Fixup missing wsegl header in some SGX SDKs
     if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index c4f6e98..06b2432 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -1,9 +1,8 @@
 DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the embedded version."
 SECTION = "libs"
-LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r37"
+INC_PR = "r38"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index ebbee9b..8a6eb4b 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -31,7 +31,8 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -verbose -release \
                 -embedded -no-freetype -no-glib -no-iconv \
                 -exceptions -xmlpatterns \
-                -qt3support"
+                -qt3support \
+                -no-fast -silent -no-rpath"
 
 # yank default -e, otherwise we get the following error:
 # moc_qbuffer.cpp: No such file or directory
diff --git a/meta/recipes-qt/qt4/qt4-native_4.7.4.bb b/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
index 3be4d73..688fb50 100644
--- a/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
@@ -8,8 +8,6 @@ SRC_URI += "file://blacklist-diginotar-certs.diff \
 # Find the g++.conf/linux.conf in the right directory.
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
-EXTRA_OECONF += " -no-fast -silent -no-rpath"
-
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
 
 SRC_URI[md5sum] = "9831cf1dfa8d0689a06c2c54c5c65aaf"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 029c61e..53a44ad 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,12 +5,12 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r34"
+INC_PR = "r35"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
 QT_GLFLAGS_qemuppc = "-opengl"
-QT_CONFIG_FLAGS += "-no-xinerama -no-xkb ${QT_GLFLAGS}"
+QT_CONFIG_FLAGS += "-no-xinerama -no-xkb"
 QT_BASE_NAME ?= "qt4"
 QT_BASE_LIB  ?= "libqt"
 
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index bec81b4..3155cbb 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -11,12 +11,16 @@ QT_DISTRO_FLAGS_linuxstdbase = "-sm"
 
 QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite"
 
+QT_GLFLAGS ?= ""
+
 QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -shared -no-nas-sound -no-nis \
                     -qt-gif -system-libjpeg -system-libpng -system-zlib \
                     -no-pch -qdbus -stl -glib -phonon -webkit \
+                    -xmlpatterns -no-rpath -qt3support -silent \
                     ${QT_SQL_DRIVER_FLAGS} \
-                    ${QT_DISTRO_FLAGS} "
+                    ${QT_DISTRO_FLAGS} \
+                    ${QT_GLFLAGS}"
 
 EXTRA_OEMAKE = "-e"
 
-- 
1.7.5.4




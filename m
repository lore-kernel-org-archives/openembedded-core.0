Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S2R6f-0000NJ-01
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 18:44:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Feb 2012 09:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="71423201"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.68])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Feb 2012 09:36:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 17:36:22 +0000
Message-Id: <35a00c35bf914f035dd2ee8f1d4e8081e41c40be.1330450342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330450342.git.paul.eggleton@linux.intel.com>
References: <cover.1330450342.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1330450342.git.paul.eggleton@linux.intel.com>
References: <cover.1330450342.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] qt4: make pulseaudio support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Tue, 28 Feb 2012 17:44:57 -0000

Add a pulseaudio DISTRO_FEATURES item and disable pulseaudio support in
phonon within Qt4 if it is not present; otherwise it is a race condition
as to whether it is enabled or disabled or breaks the build.

Note that this adds pulseaudio to DISTRO_FEATURES_BACKFILL thus leaving
existing distro configurations unaffected.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf                             |    2 +-
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |    1 +
 .../qt4/qt-4.7.4/pulseaudio-config.patch           |   45 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.8.0.inc                   |    1 +
 .../qt4/qt-4.8.0/pulseaudio-config.patch           |   45 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4.inc                        |    2 +
 6 files changed, 95 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/pulseaudio-config.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/pulseaudio-config.patch

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f67bf50..18879c8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -700,7 +700,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = ""
+DISTRO_FEATURES_BACKFILL = "pulseaudio"
 DISTRO_FEATURES_append = "${@oe.utils.distro_features_backfill(d)}"
 
 COMBINED_FEATURES = "\
diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
index 216472c..f8956f7 100644
--- a/meta/recipes-qt/qt4/qt-4.7.4.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://fix-translations.patch \
            file://add_nostrip_for_debug_packages.diff \
            file://target_qmake.patch \
+           file://pulseaudio-config.patch \
            file://g++.conf \
            file://linux.conf \
            file://fix-qtbug-20925.patch \
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/pulseaudio-config.patch b/meta/recipes-qt/qt4/qt-4.7.4/pulseaudio-config.patch
new file mode 100644
index 0000000..bbdc8bf
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/pulseaudio-config.patch
@@ -0,0 +1,45 @@
+From 85f9264773407f2bf8d0495c9fc8bd83683ab2f0 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 23 Nov 2011 14:36:10 +0000
+Subject: [PATCH] configure: make pulseaudio a configurable option
+
+Allows disabling pulseaudio support within phonon at configure time.
+(This is the Qt 4.7.4 version.)
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ configure |    9 ++++++++-
+ 1 files changed, 8 insertions(+), 1 deletions(-)
+
+diff --git a/configure b/configure
+index 3b7a1f3..7616fd3 100755
+--- a/configure
++++ b/configure
+@@ -941,7 +941,7 @@ while [ "$#" -gt 0 ]; do
+         VAL=no
+         ;;
+     #Qt style yes options
+-    -incremental|-qvfb|-profile|-shared|-static|-sm|-xinerama|-xshape|-xsync|-xinput|-egl|-reduce-exports|-pch|-separate-debug-info|-stl|-freetype|-xcursor|-xfixes|-xrandr|-xrender|-mitshm|-fontconfig|-xkb|-nis|-qdbus|-dbus|-dbus-linked|-glib|-gstreamer|-gtkstyle|-cups|-iconv|-largefile|-h|-help|-v|-verbose|-debug|-release|-fast|-accessibility|-confirm-license|-gnumake|-framework|-qt3support|-debug-and-release|-exceptions|-cocoa|-carbon|-universal|-prefix-install|-silent|-armfpa|-optimized-qmake|-dwarf2|-reduce-relocations|-sse|-openssl|-openssl-linked|-ptmalloc|-xmlpatterns|-phonon|-phonon-backend|-multimedia|-audio-backend|-svg|-declarative|-declarative-debug|-javascript-jit|-script|-scripttools|-rpath|-force-pkg-config|-s60|-usedeffiles)
++    -incremental|-qvfb|-profile|-shared|-static|-sm|-xinerama|-xshape|-xsync|-xinput|-egl|-reduce-exports|-pch|-separate-debug-info|-stl|-freetype|-xcursor|-xfixes|-xrandr|-xrender|-mitshm|-fontconfig|-xkb|-nis|-qdbus|-dbus|-dbus-linked|-glib|-gstreamer|-pulseaudio|-gtkstyle|-cups|-iconv|-largefile|-h|-help|-v|-verbose|-debug|-release|-fast|-accessibility|-confirm-license|-gnumake|-framework|-qt3support|-debug-and-release|-exceptions|-cocoa|-carbon|-universal|-prefix-install|-silent|-armfpa|-optimized-qmake|-dwarf2|-reduce-relocations|-sse|-openssl|-openssl-linked|-ptmalloc|-xmlpatterns|-phonon|-phonon-backend|-multimedia|-audio-backend|-svg|-declarative|-declarative-debug|-javascript-jit|-script|-scripttools|-rpath|-force-pkg-config|-s60|-usedeffiles)
+         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
+         VAL=yes
+         ;;
+@@ -1863,6 +1863,13 @@ while [ "$#" -gt 0 ]; do
+             UNKNOWN_OPT=yes
+         fi
+         ;;
++    pulseaudio)
++        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
++            CFG_PULSEAUDIO="$VAL"
++        else
++            UNKNOWN_OPT=yes
++        fi
++        ;;
+     gtkstyle)
+         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
+             CFG_QGTKSTYLE="$VAL"
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc b/meta/recipes-qt/qt4/qt-4.8.0.inc
index 28586be..c0d90cd 100644
--- a/meta/recipes-qt/qt4/qt-4.8.0.inc
+++ b/meta/recipes-qt/qt4/qt-4.8.0.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://configure_oe_compiler.patch \
            file://target_qmake.patch \
            file://qmake_pri_fixes.patch \
+           file://pulseaudio-config.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/pulseaudio-config.patch b/meta/recipes-qt/qt4/qt-4.8.0/pulseaudio-config.patch
new file mode 100644
index 0000000..0992efa
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/pulseaudio-config.patch
@@ -0,0 +1,45 @@
+From 677f5b4bec03972c8cada19d2e4530252c9ac4ef Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Tue, 28 Feb 2012 15:10:24 +0000
+Subject: [PATCH] configure: make pulseaudio a configurable option
+
+Allows disabling pulseaudio support within phonon at configure time.
+(This is the Qt 4.8.0 version.)
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ configure |    9 ++++++++-
+ 1 files changed, 8 insertions(+), 1 deletions(-)
+
+diff --git a/configure b/configure
+index 5a5ef1d..e43b920 100755
+--- a/configure
++++ b/configure
+@@ -1043,7 +1043,7 @@ while [ "$#" -gt 0 ]; do
+         VAL=no
+         ;;
+     #Qt style yes options
+-    -incremental|-qvfb|-profile|-shared|-static|-sm|-xinerama|-xshape|-xsync|-xinput|-egl|-reduce-exports|-pch|-separate-debug-info|-stl|-freetype|-xcursor|-xfixes|-xrandr|-xrender|-mitshm|-fontconfig|-xkb|-nis|-qdbus|-dbus|-dbus-linked|-glib|-gstreamer|-gtkstyle|-cups|-iconv|-largefile|-h|-help|-v|-verbose|-debug|-release|-fast|-accessibility|-confirm-license|-gnumake|-framework|-qt3support|-debug-and-release|-exceptions|-cocoa|-carbon|-universal|-harfbuzz|-prefix-install|-silent|-armfpa|-optimized-qmake|-dwarf2|-reduce-relocations|-sse|-openssl|-openssl-linked|-ptmalloc|-xmlpatterns|-phonon|-phonon-backend|-multimedia|-audio-backend|-svg|-declarative|-declarative-debug|-javascript-jit|-script|-scripttools|-rpath|-force-pkg-config|-s60|-usedeffiles|-icu)
++    -incremental|-qvfb|-profile|-shared|-static|-sm|-xinerama|-xshape|-xsync|-xinput|-egl|-reduce-exports|-pch|-separate-debug-info|-stl|-freetype|-xcursor|-xfixes|-xrandr|-xrender|-mitshm|-fontconfig|-xkb|-nis|-qdbus|-dbus|-dbus-linked|-glib|-gstreamer|-pulseaudio|-gtkstyle|-cups|-iconv|-largefile|-h|-help|-v|-verbose|-debug|-release|-fast|-accessibility|-confirm-license|-gnumake|-framework|-qt3support|-debug-and-release|-exceptions|-cocoa|-carbon|-universal|-harfbuzz|-prefix-install|-silent|-armfpa|-optimized-qmake|-dwarf2|-reduce-relocations|-sse|-openssl|-openssl-linked|-ptmalloc|-xmlpatterns|-phonon|-phonon-backend|-multimedia|-audio-backend|-svg|-declarative|-declarative-debug|-javascript-jit|-script|-scripttools|-rpath|-force-pkg-config|-s60|-usedeffiles|-icu)
+         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
+         VAL=yes
+         ;;
+@@ -2000,6 +2000,13 @@ while [ "$#" -gt 0 ]; do
+             UNKNOWN_OPT=yes
+         fi
+         ;;
++    pulseaudio)
++        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
++            CFG_PULSEAUDIO="$VAL"
++        else
++            UNKNOWN_OPT=yes
++        fi
++        ;;
+     gtkstyle)
+         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
+             CFG_QGTKSTYLE="$VAL"
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 75abe6e..2956aed 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -1,6 +1,7 @@
 inherit qmake_base
 
 DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3 tiff"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 
 require qt4_arch.inc
 QT_ARCH := "${@qt_arch(d)}"
@@ -18,6 +19,7 @@ QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -system-libjpeg -system-libpng -system-libtiff -system-zlib \
                     -no-pch -qdbus -stl -glib -phonon -webkit \
                     -xmlpatterns -no-rpath -qt3support -silent \
+                    ${@base_contains('DISTRO_FEATURES', 'pulseaudio', '--enable-pulseaudio', '--disable-pulseaudio', d)} \
                     ${QT_SQL_DRIVER_FLAGS} \
                     ${QT_DISTRO_FLAGS} \
                     ${QT_GLFLAGS}"
-- 
1.7.5.4




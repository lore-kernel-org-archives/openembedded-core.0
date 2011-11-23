Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RTEuf-0002xG-6F
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 16:39:06 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Nov 2011 07:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79220124"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.207])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2011 07:32:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2011 15:32:23 +0000
Message-Id: <26acc9e71d541e274d6a7412289c91a53de10850.1322061836.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1322061836.git.paul.eggleton@linux.intel.com>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1322061836.git.paul.eggleton@linux.intel.com>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] qt4: make pulseaudio support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Wed, 23 Nov 2011 15:39:06 -0000

If pulseaudio is not in DISTRO_FEATURES then disable pulseaudio support
in phonon within Qt4; otherwise it auto-detects it and it may be enabled
or disabled depending on what gets built first.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/files/pulseaudio-config.patch |   44 +++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                  |    7 +++-
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb         |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb         |    2 +-
 4 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/pulseaudio-config.patch

diff --git a/meta/recipes-qt/qt4/files/pulseaudio-config.patch b/meta/recipes-qt/qt4/files/pulseaudio-config.patch
new file mode 100644
index 0000000..d5e6bc0
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/pulseaudio-config.patch
@@ -0,0 +1,44 @@
+From 85f9264773407f2bf8d0495c9fc8bd83683ab2f0 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 23 Nov 2011 14:36:10 +0000
+Subject: [PATCH] configure: make pulseaudio a configurable option
+
+Allows disabling pulseaudio support within phonon at configure time.
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
diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
index bc33b6b..171a7a1 100644
--- a/meta/recipes-qt/qt4/qt-4.7.4.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -3,6 +3,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+
 FILESPATH =. "${FILE_DIRNAME}/qt-${PV}:"
 
 SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
@@ -17,6 +19,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://g++.conf \
            file://linux.conf \
            file://fix-qtbug-20925.patch \
+           file://pulseaudio-config.patch \
            "
 
 SRC_URI[md5sum] = "9831cf1dfa8d0689a06c2c54c5c65aaf"
@@ -43,7 +46,9 @@ do_configure_prepend() {
 }
 
 QT_GLFLAGS ?= ""
-QT_CONFIG_FLAGS += " -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
+QT_CONFIG_FLAGS += "-xmlpatterns -no-rpath -qt3support -reduce-relocations \
+                    ${@base_contains('DISTRO_FEATURES', 'pulseaudio', '--enable-pulseaudio', '--disable-pulseaudio', d)} \
+                    -silent ${QT_GLFLAGS}"
 
 do_compile() {
     # Fixup missing wsegl header in some SGX SDKs
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
index e34ec8d..6b9f97a 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
index 8c48936..0db090f 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
 
-- 
1.7.5.4




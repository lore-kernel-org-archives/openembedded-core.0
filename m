Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RRQ5K-0004Hd-92
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 16:10:34 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Nov 2011 07:03:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,533,1315206000"; d="scan'208";a="92477206"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.185])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2011 07:03:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2011 15:03:41 +0000
Message-Id: <dee6ab006094693ede5ec6669fa5616a3a00b067.1321628513.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1321628513.git.paul.eggleton@linux.intel.com>
References: <cover.1321628513.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1321628513.git.paul.eggleton@linux.intel.com>
References: <cover.1321628513.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 1/1] qt4: disable pulseaudio
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
X-List-Received-Date: Fri, 18 Nov 2011 15:10:34 -0000

Disable pulseaudio support in phonon within Qt4; otherwise it
auto-detects it and it may be enabled or disabled depending on what gets
built first.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/files/pulseaudio-config.patch |   31 +++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                  |    3 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb         |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb         |    2 +-
 4 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/pulseaudio-config.patch

diff --git a/meta/recipes-qt/qt4/files/pulseaudio-config.patch b/meta/recipes-qt/qt4/files/pulseaudio-config.patch
new file mode 100644
index 0000000..5b32815
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/pulseaudio-config.patch
@@ -0,0 +1,31 @@
+# Allows disabling pulseaudio support within phonon at configure time
+# 
+# Upstream-status: pending
+#
+# Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+#
+--- qt-everywhere-opensource-src-4.7.4.orig/configure
++++ qt-everywhere-opensource-src-4.7.4/configure
+@@ -941,7 +941,7 @@ while [ "$#" -gt 0 ]; do
+         VAL=no
+         ;;
+     #Qt style yes options
+-    -incremental|-qvfb|-profile|-shared|-static|-sm|-xinerama|-xshape|-xsync|-xinput|-egl|-reduce-exports|-pch|-separate-debug-info|-stl|-freetype|-xcursor|-xfixes|-xrandr|-xrender|-mitshm|-fontconfig|-xkb|-nis|-qdbus|-dbus|-dbus-linked|-glib|-gstreamer|-gtkstyle|-cups|-iconv|-largefile|-h|-help|-v|-verbose|-debug|-release|-fast|-accessibility|-confirm-license|-gnumake|-framework|-qt3support|-debug-and-release|-exceptions|-cocoa|-carbon|-universal|-prefix-install|-silent|-armfpa|-optimized-qmake|-dwarf2|-reduce-relocations|-sse|-openssl|-openssl-linked|-ptmalloc|-xmlpatterns|-phonon|-phonon-backend|-multimedia|-audio-backend|-svg|-declarative|-declarative-debug|-javascript-jit|-script|-scripttools|-rpath|-force-pkg-config|-s60|-usedeffiles)
++    -incremental|-qvfb|-profile|-shared|-static|-sm|-xinerama|-xshape|-xsync|-xinput|-egl|-reduce-exports|-pch|-separate-debug-info|-stl|-freetype|-xcursor|-xfixes|-xrandr|-xrender|-mitshm|-fontconfig|-xkb|-nis|-qdbus|-dbus|-dbus-linked|-glib|-gstreamer|-pulseaudio|-gtkstyle|-cups|-iconv|-largefile|-h|-help|-v|-verbose|-debug|-release|-fast|-accessibility|-confirm-license|-gnumake|-framework|-qt3support|-debug-and-release|-exceptions|-cocoa|-carbon|-universal|-prefix-install|-silent|-armfpa|-optimized-qmake|-dwarf2|-reduce-relocations|-sse|-openssl|-openssl-linked|-ptmalloc|-xmlpatterns|-phonon|-phonon-backend|-multimedia|-audio-backend|-svg|-declarative|-declarative-debug|-javascript-jit|-script|-scripttools|-rpath|-force-pkg-config|-s60|-usedeffiles)
+         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
+         VAL=yes
+         ;;
+@@ -1866,6 +1866,13 @@ while [ "$#" -gt 0 ]; do
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
diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
index bc33b6b..bd3409c 100644
--- a/meta/recipes-qt/qt4/qt-4.7.4.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://g++.conf \
            file://linux.conf \
            file://fix-qtbug-20925.patch \
+           file://pulseaudio-config.patch \
            "
 
 SRC_URI[md5sum] = "9831cf1dfa8d0689a06c2c54c5c65aaf"
@@ -43,7 +44,7 @@ do_configure_prepend() {
 }
 
 QT_GLFLAGS ?= ""
-QT_CONFIG_FLAGS += " -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
+QT_CONFIG_FLAGS += " -xmlpatterns -no-rpath -qt3support -reduce-relocations --disable-pulseaudio -silent ${QT_GLFLAGS}"
 
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




Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWnZ1-0006nS-W8
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 13:47:44 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 13:37:25 +0200
Message-Id: <1337686647-1027-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] qt4(-embedded).inc: create variables to ease overriding
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
X-List-Received-Date: Tue, 22 May 2012 11:47:44 -0000

* No functional change besides ordering of configure arguments.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* This doesn't cover all possible flags, but only those that I need
  to customize in my layer. Other flags may be added later if need
  arises.

 meta/recipes-qt/qt4/qt4-embedded.inc |   12 +++++++++---
 meta/recipes-qt/qt4/qt4.inc          |   17 ++++++++++++++---
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 8c15352..158ee17 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -9,12 +9,18 @@ QT_BASE_LIB  ?= "libqt-embedded"
 # Set necessary variables in the profile
 SRC_URI += "file://qte.sh"
 
+QT_DECORATION_FLAGS ?= ""
+QT_GFX_DRIVER_FLAGS ?= "-plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb"
+QT_KBD_DRIVER_FLAGS ?= "-qt-kbd-tty"
+QT_MOUSE_DRIVER_FLAGS ?= "-plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput"
+
 QT_CONFIG_FLAGS += " \
     -embedded ${QT_ARCH} \
     -qtlibinfix ${QT_LIBINFIX} \
-    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
-    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
-    -qt-kbd-tty \
+    ${QT_DECORATION_FLAGS} \
+    ${QT_GFX_DRIVER_FLAGS} \
+    ${QT_KBD_DRIVER_FLAGS} \
+    ${QT_MOUSE_DRIVER_FLAGS} \
     -DQT_KEYPAD_NAVIGATION \
     "
 
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 468a46f..c70b335 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -10,17 +10,28 @@ QT_ENDIAN = "${@qt_endian(d)}"
 QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
 QT_DISTRO_FLAGS_linuxstdbase = "-sm"
 
+QT_GLIB_FLAGS ?= "-glib"
+QT_IMAGEFORMAT_FLAGS ?= "-system-libjpeg -system-libpng -system-libtiff -system-zlib"
+QT_PHONON_FLAGS ?= "-phonon"
+QT_QDBUS_FLAGS ?= "-qdbus"
+QT_QT3SUPPORT_FLAGS ?= "-qt3support"
 QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite"
+QT_WEBKIT_FLAGS ?= "-webkit"
 
 QT_GLFLAGS ?= ""
 
 QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -shared -no-nas-sound -no-nis \
-                    -system-libjpeg -system-libpng -system-libtiff -system-zlib \
-                    -no-pch -qdbus -stl -glib -phonon -webkit \
-                    -xmlpatterns -no-rpath -qt3support -silent \
+                    -no-pch -stl \
+                    -xmlpatterns -no-rpath -silent \
                     ${@base_contains('DISTRO_FEATURES', 'pulseaudio', '--enable-pulseaudio', '--disable-pulseaudio', d)} \
+                    ${QT_GLIB_FLAGS} \
+                    ${QT_IMAGEFORMAT_FLAGS} \
+                    ${QT_PHONON_FLAGS} \
+                    ${QT_QDBUS_FLAGS} \
+                    ${QT_QT3SUPPORT_FLAGS} \
                     ${QT_SQL_DRIVER_FLAGS} \
+                    ${QT_WEBKIT_FLAGS} \
                     ${QT_DISTRO_FLAGS} \
                     ${QT_GLFLAGS}"
 
-- 
1.7.9.5




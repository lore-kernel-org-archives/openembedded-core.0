Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 93A5A7067B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:47:10 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 01AA523655
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 16:47:10 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 16:47:03 +0200
Message-Id: <1409150824-32683-3-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1409150824-32683-1-git-send-email-dv@pseudoterminal.org>
References: <1409150824-32683-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 3/4] gstreamer1.0-plugins-bad: Fix GL/GLES configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Aug 2014 14:47:11 -0000

* Replace --disable/enable-gl with the individual EGL, GLES, GL switches
  (--disable-gl turns off GL support entirely)
* Put the default opengl packageconfig into its own variable to make it
  easier for distros and BSP layers to define what to use (GL, GLES,
  or neither)
* Add libglu as a dependency for desktop GL
* Patch configure.ac to ensure libraries are only searched and linked to
  if the corresponding API isn't disabled (this prevents cases where
  libgstgl is linked to GLU even though desktop GL is dis- and GLES
  enabled)

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  9 +++--
 ...heck-for-GL-GLU-EGL-GLES2-libs-if-disable.patch | 41 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb    |  3 ++
 3 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 67ee7f7..055eed2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -8,19 +8,24 @@ S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
 inherit gettext
 
+# opengl packageconfig factored out to make it easy for distros
+# and BSP layers to pick either (desktop) opengl, gles2, or no GL
+PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2', '', d)}"
 
 PACKAGECONFIG ??= " \
+    ${PACKAGECONFIG_GL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
     orc curl uvch264 neon sndfile \
     hls sbc dash bz2 smoothstreaming \
     "
+
 # dash = Dynamic Adaptive Streaming over HTTP
 PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
 PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[gl]              = "--enable-gl,--disable-gl,virtual/egl virtual/libgles2"
+PACKAGECONFIG[gles2]           = "--enable-gles2 --enable-egl,--disable-gles2 --disable-egl,virtual/libgles2 virtual/egl"
+PACKAGECONFIG[opengl]          = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
 PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
 PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch
new file mode 100644
index 0000000..042a32c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch
@@ -0,0 +1,41 @@
+From deba0da45ec821209a7ed148a4521d562e6512cd Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Wed, 27 Aug 2014 14:47:25 +0200
+Subject: [PATCH] gl: do not check for GL/GLU/EGL/GLES2 libs if disabled in
+ configuration
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=735522]
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ configure.ac | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1a46afb..e85d4ba 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -661,10 +661,16 @@ case $host in
+     fi
+   ;;
+   *)
+-    AG_GST_CHECK_LIBHEADER(GL, GL, glTexImage2D,, GL/gl.h)
+-    AG_GST_CHECK_LIBHEADER(GLU, GLU, gluSphere,, GL/glu.h)
+-    AG_GST_CHECK_LIBHEADER(GLES2, GLESv2, glTexImage2D,, GLES2/gl2.h)
+-    AG_GST_CHECK_LIBHEADER(EGL, EGL, eglGetError,, EGL/egl.h)
++    if test "x$NEED_GL" != "xno"; then
++      AG_GST_CHECK_LIBHEADER(GL, GL, glTexImage2D,, GL/gl.h)
++      AG_GST_CHECK_LIBHEADER(GLU, GLU, gluSphere,, GL/glu.h)
++    fi
++    if test "x$NEED_GLES2" != "xno"; then
++      AG_GST_CHECK_LIBHEADER(GLES2, GLESv2, glTexImage2D,, GLES2/gl2.h)
++    fi
++    if test "x$NEED_EGL" != "xno"; then
++      AG_GST_CHECK_LIBHEADER(EGL, EGL, eglGetError,, EGL/egl.h)
++    fi
+ 
+     old_LIBS=$LIBS
+     old_CFLAGS=$CFLAGS
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb
index e6edb26..ff92f09 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb
@@ -4,6 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
+
+SRC_URI += "file://0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch"
+
 SRC_URI[md5sum] = "3bc0fcfe8d16ad1295f0454c1fcb4ba3"
 SRC_URI[sha256sum] = "ff2cb754f7725b205aec66002b1406e440f3a03194b6cad2d126ef5cd00902f9"
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
-- 
1.8.3.2



Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQEaD-0003uY-Ob
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 11:46:06 +0200
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 02:32:13 -0700
Received: by mail-fa0-f69.google.com with SMTP id t1so2007048fae.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=+HL9EegzwbZbNNIYI8wF94WnFmRv5iCx6bNVGJBaXms=;
	b=Il3ZXK1Q9u3z7Rsa1Eroy8JI7GLwRQlhhzita861RrkUufuMj/d0GFHlQ1I4OLMvnw
	NbvCqfuZ7yEPthRXW8Jh1wRQ6PY0XoSZQbRGpGiCIjPXeBzu0IJPL8somdzxnzwOkdso
	asjUZTiHipaYCYZN0AiiUGwHRaJEvqfOXbTyuoUWfiUF/jeFY9NKtnBGpZzcgsfZRMT4
	33a1T++c+zzUAIuNMAIiwH1dfoflheT1BnOo/tZElQjv6RvHMwgCVF4GqB/uoW72Cvpq
	A4tvBpHCT1r/kg0MvQlzmkx9yGl/hbU7hOyRHSYzrP5Ak3fC/o5QZGsE7YakN65hGAkU
	O7Rw==
Received: by 10.180.101.230 with SMTP id fj6mr19756387wib.16.1350898357579;
	Mon, 22 Oct 2012 02:32:37 -0700 (PDT)
Received: by 10.180.101.230 with SMTP id fj6mr19756344wib.16.1350898357170;
	Mon, 22 Oct 2012 02:32:37 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k20sm50388167wiv.11.2012.10.22.02.32.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:32:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 10:31:26 +0100
Message-Id: <1350898286-14049-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkhlDKiyluCc77uzJFxPxWFuhLU8qi/VDa/1yYFtv+s0YhbQLTohvMQZUgqdR715wEVpqT2oRhSpCqZa+AnFi8AOHNEJW7MiH/deAno3iVwMoutcgCY2j0ogHeAUeq8SkKHdtf+0AT+6iEEY7XIPJCf6/o9LFr0bjvnKnvsuwN37FGaakMcozlAlx9g45kfizz5fKGL
Subject: [PATCH] mesa: Build separate GLU library
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
X-List-Received-Date: Mon, 22 Oct 2012 09:46:06 -0000

From: Daniel Stone <daniel@fooishbar.org>

Mesa has removed GLU from the core tree upstream, so remove it from the
Mesa build, add support for the new GLU tree, and introduce a new
virtual/libglu package.

Signed-off-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/glew/glew_1.9.0.bb     |    4 ++--
 meta/recipes-graphics/mesa/mesa-common.inc   |    7 ++----
 meta/recipes-graphics/mesa/mesa-glu_9.0.0.bb |   31 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-glu_9.0.0.bb

diff --git a/meta/recipes-graphics/glew/glew_1.9.0.bb b/meta/recipes-graphics/glew/glew_1.9.0.bb
index 00fff11..3b466d3 100644
--- a/meta/recipes-graphics/glew/glew_1.9.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.9.0.bb
@@ -5,9 +5,9 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
-DEPENDS = "virtual/libx11 virtual/libgl libxext libxi libxmu"
+DEPENDS = "virtual/libx11 virtual/libgl virtual/libglu libxext libxi libxmu"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://autotools.patch \
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index faa8183..1ad8ff3 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r3"
+INC_PR = "r4"
 PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
@@ -24,7 +24,7 @@ FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
 
 inherit autotools pkgconfig pythonnative
 
-EXTRA_OECONF = "--enable-glu \
+EXTRA_OECONF = "--disable-glu \
                 --disable-glw \
                 --disable-glut \
                 --enable-shared-glapi"
@@ -42,7 +42,6 @@ EXCLUDE_FROM_WORLD = "1"
 RDEPENDS_${PN}-dev = ""
 
 PACKAGES =+ "libegl libegl-dev \
-             libglu libglu-dev \
              libosmesa libosmesa-dev \
              libgl libgl-dev \
              libglapi libglapi-dev \
@@ -57,7 +56,6 @@ FILES_libgles1 = "${libdir}/libGLESv1*.so.*"
 FILES_libgles2 = "${libdir}/libGLESv2.so.*"
 FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
-FILES_libglu = "${libdir}/libGLU.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
 FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
@@ -66,7 +64,6 @@ FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
 FILES_libgles1-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES_libgles2-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
-FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
diff --git a/meta/recipes-graphics/mesa/mesa-glu_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-glu_9.0.0.bb
new file mode 100644
index 0000000..d3fffe7
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-glu_9.0.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "The OpenGL utility toolkit"
+DESCRIPTION = "GLU is a utility toolkit used with OpenGL implementations"
+
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b356456e7d44471d9 \
+                    file://src/libtess/tess.c;endline=29;md5=6b79c570f644363b356456e7d44471d9"
+
+# Epoch as this used to be part of mesa-dri
+PE = "2"
+PR = "0"
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/glu/glu-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "be9249132ff49275461cf92039083030"
+SRC_URI[sha256sum] = "1f7ad0d379a722fcbd303aa5650c6d7d5544fde83196b42a73d1193568a4df12"
+
+S = "${WORKDIR}/glu-${PV}"
+
+DEPENDS = "virtual/libgl"
+
+inherit autotools pkgconfig
+
+# ie mesa-glu could be empty and mesa-glu-dev RDEPENDS on it
+ALLOW_EMPTY_${PN} = "1"
+
+PROVIDES = "virtual/libglu"
+
+FILES_mesa-glu-dev = "${libdir}/pkgconfig/glu.pc"
-- 
1.7.10




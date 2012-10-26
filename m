Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TRlcf-0000eG-3N
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 17:14:57 +0200
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2012 08:01:24 -0700
Received: by mail-fa0-f69.google.com with SMTP id t1so2587696fae.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 08:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=/iho654BEtL/002XTq1rBqp/kCwqjyKVhdIsCKCPRhY=;
	b=VSxwJUe4Bgb/brDlTizJob+xTjFjU1mDJ0cLhHKmItLmOTqR6YGv6XklwBFJjXGgEm
	l3YskuZrKJmkdaJXdSAcaUL1rnPPkwcgb/D1x1duTlcw9eWXPsDQiIYC5w2hJweD0Qr1
	8ZGtXwKmjpiy6vnICnLNhhxki1iuSTw+ZNeFoMxgHt0gYhSGr375Xp8LiZ362rcS2k5j
	g9EWRdAbmQClzhL72RdZBAyM61m/tmSnJn/SuUIX2+c3SBVvK0LVmeiib2tmbY3igqC5
	jZRcIkEz0RDx2+eW35I+Z15lVvkZbohwvv2YeIQdyOOrE+H304dj1gEGO6LhCv9g/We3
	f3HA==
Received: by 10.216.214.198 with SMTP id c48mr13017918wep.216.1351263682061;
	Fri, 26 Oct 2012 08:01:22 -0700 (PDT)
Received: by 10.216.214.198 with SMTP id c48mr13017913wep.216.1351263681731;
	Fri, 26 Oct 2012 08:01:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cn6sm3333590wib.9.2012.10.26.08.01.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Oct 2012 08:01:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 16:00:09 +0100
Message-Id: <1351263609-4115-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnIJj7ZQ/GU2il4Xgmt9FvtWtvHOoV//U7/x2kMNNBu9e/pj3FLIl9KApOzQp9aW3IybD/fFwaWv/L6hdaMjw1d9/KKHNy7VEkNx0AI2A67D/gfwTfeaOAEK//BJi1BzF+Y17j/QCNyFo9JtUGSrngt0wIpzJdjLMEr6t2K7nFIaJ0REawASPB2Qrp96RzIN/iT4Rfe
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
X-List-Received-Date: Fri, 26 Oct 2012 15:14:57 -0000

From: Daniel Stone <daniel@fooishbar.org>

Mesa has removed GLU from the core tree upstream, so remove it from the
Mesa build and add the separate tarball as a new recipe.

Signed-off-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/glew/glew_1.9.0.bb   |    4 ++--
 meta/recipes-graphics/mesa/libglu_9.0.0.bb |   27 +++++++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-common.inc |   12 +++++++-----
 3 files changed, 36 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/libglu_9.0.0.bb

diff --git a/meta/recipes-graphics/glew/glew_1.9.0.bb b/meta/recipes-graphics/glew/glew_1.9.0.bb
index 00fff11..599d64b 100644
--- a/meta/recipes-graphics/glew/glew_1.9.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.9.0.bb
@@ -5,9 +5,9 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
-DEPENDS = "virtual/libx11 virtual/libgl libxext libxi libxmu"
+DEPENDS = "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://autotools.patch \
diff --git a/meta/recipes-graphics/mesa/libglu_9.0.0.bb b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
new file mode 100644
index 0000000..7980749
--- /dev/null
+++ b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
@@ -0,0 +1,27 @@
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
+# Remove the mesa-glu dependency in mesa-glu-dev, as mesa-glu is empty
+RDEPENDS_${PN}-dev = ""
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index faa8183..460877c 100644
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
@@ -51,13 +50,17 @@ PACKAGES =+ "libegl libegl-dev \
              libgles2 libgles2-dev \
             "
 
+do_install_append () {
+    # GLU is now in libglu (this shouldn't be required in Mesa 9.x)
+    rm -f ${D}${includedir}/GL/glu*
+}
+
 FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
 FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgles1 = "${libdir}/libGLESv1*.so.*"
 FILES_libgles2 = "${libdir}/libGLESv2.so.*"
 FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
-FILES_libglu = "${libdir}/libGLU.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
 FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
@@ -66,7 +69,6 @@ FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
 FILES_libgles1-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES_libgles2-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
-FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
-- 
1.7.10




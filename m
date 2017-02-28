Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E071372F84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:27:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 28 Feb 2017 01:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,218,1484035200"; d="scan'208";a="829253598"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Feb 2017 01:27:10 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 08D976A4080;
	Tue, 28 Feb 2017 01:27:07 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 11:26:56 +0200
Message-Id: <47e6c54b6dcb3882b63776fc5ea8cbec84a92414.1488272553.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488272553.git.jussi.kukkonen@intel.com>
References: <cover.1488272553.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 3/6] mesa: Upgrade 13.0.4 -> 17.0.0
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
X-List-Received-Date: Tue, 28 Feb 2017 09:27:09 -0000

17.0.0 is considered a development release: 17.0.1 is expected to be
the first stable in this series. Typically the .1 release comes about
two weeks after .0.

* New feature release with lots of changes
* Versioning change (17 as in 2017, no longer relates to GL bumps)
* OpenGL 4.5 support on Haswell
* mesa now implements its own sha1 instead of having 5
  configurable sha-providers
* Remove libxvmcsoftpipe packaging, the library hasn't
  existed since 2013

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../mesa/{mesa-gl_13.0.4.bb => mesa-gl_17.0.0.bb}             |  0
 meta/recipes-graphics/mesa/mesa.inc                           | 11 +----------
 meta/recipes-graphics/mesa/{mesa_13.0.4.bb => mesa_17.0.0.bb} |  7 +++----
 3 files changed, 4 insertions(+), 14 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_13.0.4.bb => mesa-gl_17.0.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_13.0.4.bb => mesa_17.0.0.bb} (74%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb b/meta/recipes-graphics/mesa/mesa-gl_17.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.0.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5d882b1..f982dd4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 
 EXTRA_OECONF = "--enable-shared-glapi"
 
-PACKAGECONFIG ??= "gbm egl gles dri ${MESA_CRYPTO} \
+PACKAGECONFIG ??= "gbm egl gles dri \
 		${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
 		${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
 		"
@@ -67,12 +67,6 @@ PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
 OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium-osmesa', 'osmesa', d)}"
 PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
 
-# Mesa requires one of the following crypto implementation, pick one of them
-MESA_CRYPTO ??= "openssl"
-PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
-PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
-PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
-
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
@@ -94,7 +88,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
              libwayland-egl libwayland-egl-dev \
-             libxvmcsoftpipe libxvmcsoftpipe-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver \
             "
@@ -178,7 +171,6 @@ FILES_libgl-mesa = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
-FILES_libxvmcsoftpipe = "${libdir}/libXvMCsoftpipe.so.*"
 FILES_libxatracker = "${libdir}/libxatracker.so.*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
@@ -191,7 +183,6 @@ FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/p
 FILES_libgles3-mesa-dev = "${includedir}/GLES3"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayland-egl.*"
-FILES_libxvmcsoftpipe-dev = "${libdir}/libXvMCsoftpipe.so ${libdir}/libXvMCsoftpipe.la"
 FILES_libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
                           ${libdir}/pkgconfig/xatracker.pc"
diff --git a/meta/recipes-graphics/mesa/mesa_13.0.4.bb b/meta/recipes-graphics/mesa/mesa_17.0.0.bb
similarity index 74%
rename from meta/recipes-graphics/mesa/mesa_13.0.4.bb
rename to meta/recipes-graphics/mesa/mesa_17.0.0.bb
index 1416c9f..6576e3c 100644
--- a/meta/recipes-graphics/mesa/mesa_13.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.0.0.bb
@@ -1,13 +1,12 @@
 require ${BPN}.inc
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
            file://disable-asm-on-non-gcc.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
 "
-
-SRC_URI[md5sum] = "d088a921e935218833a8071cb672a574"
-SRC_URI[sha256sum] = "a95d7ce8f7bd5f88585e4be3144a341236d8c0fc91f6feaec59bb8ba3120e726"
+SRC_URI[md5sum] = "932e4171a86b14940c06812356486155"
+SRC_URI[sha256sum] = "39db3d59700159add7f977307d12a7dfe016363e760ad82280ac4168ea668481"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.1.4



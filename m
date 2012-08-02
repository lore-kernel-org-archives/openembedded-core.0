Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymS-0006WN-21
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:48 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:50:07 -0700
Received: by mail-wi0-f178.google.com with SMTP id hr14so4182449wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=PVy1dwBFTQ2Kf/wZzKPC8c74Ru1pgecEHQY5Z6VS7Rs=;
	b=ZdAze9RKS43asiu6k4R2pzQVNg7Nj/Hwcl6qmcbx9+JnMz1sCyTeR4wAUYkQoNlk8X
	AYT2W1ANJpJl4dS4Vuj04yORfkfiT/Ceolg2eBf1zbAPfU2gEZo2nTPBa7rhsRJURHKJ
	NhDuuss7F1F1+HBUeVNoYFX0VY/Trevrp5z40aoviMTjUoRX7Fnv8laiDvRz9bx1bdd7
	KMs1miomRUkVSGgQEIAykZqFTUOD7sTCwO2dp5TW6ki5SacqInl2qYA7/w05LXGc61ct
	8b1F9jjLQRHEhniRliqgr+46v9tvW86nlIJPB2gFL5FeFHGTOZLQPm8YCz51xGiy8sVD
	qTMw==
Received: by 10.217.1.197 with SMTP id n47mr10696899wes.27.1343926206924;
	Thu, 02 Aug 2012 09:50:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.50.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:50:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:49:05 +0100
Message-Id: <5de29e150a720ccb8749362cfe5fb56f234fb385.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkc9fTIzkKwIlHxBm6Om6XSVlojkPoz3eEz3/LCzd6o0bC3s4cGuMvwa3g0ATqaRuLstBku
Subject: [PATCH V3 11/11] mesa: enable EGL, with DRM and X11 platforms
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:48 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    7 ++++---
 meta/recipes-graphics/mesa/mesa-dri.inc    |    7 ++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 77107ab..b0d7a9e 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -17,7 +17,7 @@ PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
 
-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2"
+PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
@@ -29,7 +29,8 @@ EXTRA_OECONF = "--enable-glu \
                 --disable-glut \
                 --enable-shared-glapi"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'egl', 'egl', '', d)}"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
@@ -59,7 +60,7 @@ FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
-FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
+FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index ab4487f..35d17a4 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -8,10 +8,15 @@ DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",i915,i965"
 DRIDRIVERS_append_x86-64 = ",i915,i965"
 
+EGL_PLATFORMS  = "drm"
+EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'x11', ',x11', '', d)}"
+
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
 EXTRA_OECONF += "--enable-gles1 --enable-gles2"
-EXTRA_OECONF += "--disable-egl --enable-gbm"
+EXTRA_OECONF += "--enable-gbm"
+
+PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}", "--disable-egl"
 
 python populate_packages_prepend() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-- 
1.7.10




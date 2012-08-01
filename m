Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbAI-0001px-Md
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:48:50 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:37:13 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so4758818wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=W592rmion/uZtsq4lB84m/W6WF2KbQbRztUMsQSe6bM=;
	b=R1bzl8v1ZquiKRC5a69AMQj2wmQ1CKpYSb6nBE7GgAN7zmuhfX1ezL+ilYkVasyqFz
	z4r/+gLFOD+x9tCgweHPyubIAFiUoLEw1wo3XavjvzB5hO9/tlVkUL4GQp8OyDdoWKxV
	6iBz8VNRDJx3LC5eTzO4O6q2LjAVF/AVl4PENR74jJXzRP5YhuAtK60KjZVcgCPgVjTE
	5qJRIazIsjs8AqdG8fxoJt8JhKoZE9bVmHDkBoxGHSJnl3BMOhiiQ4BWIcj4offVDZnr
	5i3l9dVDa55Jj6OR/03eslRDw5JmsBd8oOi1eU5n4PIETYbqOXdKVXE8mW0pIAGAEVVF
	WMbg==
Received: by 10.216.242.204 with SMTP id i54mr8119792wer.99.1343835433536;
	Wed, 01 Aug 2012 08:37:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm9489001wiv.10.2012.08.01.08.37.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:37:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:36:35 +0100
Message-Id: <3a39494da1abf9b05c9e04643d469e94494910d9.1343835237.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkAeWloXueUFkeFaUixent18NfynygCluXql3uQNVCk+abtcwfPpkJ2cHGIWO+aAo74G3gn
Subject: [PATCH 08/11] mesa: enable EGL, with DRM and X11 platforms
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
X-List-Received-Date: Wed, 01 Aug 2012 15:48:51 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    6 +++---
 meta/recipes-graphics/mesa/mesa-dri.inc    |    7 ++++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index e1e5cb1..e5eb28c 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r1"
+INC_PR = "r2"
 PE = "2"
 
 
@@ -21,7 +21,7 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 
 DEPENDS = "makedepend-native python-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
 
-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2"
+PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
@@ -59,7 +59,7 @@ FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
-FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
+FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index ab4487f..d558f06 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -8,10 +8,15 @@ DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",i915,i965"
 DRIDRIVERS_append_x86-64 = ",i915,i965"
 
+EGL_PLATFORMS  = "drm,x11"
+
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
 EXTRA_OECONF += "--enable-gles1 --enable-gles2"
-EXTRA_OECONF += "--disable-egl --enable-gbm"
+EXTRA_OECONF += "--enable-gbm"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'egl', 'egl', '', d)}"
+PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}", "--disable-egl"
 
 python populate_packages_prepend() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-- 
1.7.10




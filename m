Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T102s-0001X2-C5
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:11:22 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 11:59:29 -0700
Received: by mail-wi0-f178.google.com with SMTP id hr14so2974409wib.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 11:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=EH1AbRAGUUWir7x5SUV6hO2W1lzYLeLckBbwq+elJQY=;
	b=fQglUW2DeYCFvfQ2UswtxDum2lGnmWiI+MYnkgeiaunKoW5oSRJprB9hJEFaOnkyX0
	gHgu7XLyqR7v9uuM8qfoc8jjBj87KhqRlhXd30uAsViHBKzPa5yJS+w1fZpkDJnjy89F
	9O6D1Zf22mOutsL3Vk9725x0eAmoQKHLYFG+oSGtiaZH6PJzQ9jNcicXrkrNoUT6ZXGw
	RAl7JSLK7QB3+bzZcY+6T6QfEf8SbN/m3jhOMVrpT3N8w/vTIZdeLyys0L5SHir2A+F9
	WbIG1biZY/bLZP+i8dHcBQ1+hWIIpW/B/gokrw9c/9KKWtjzzZbMDEMXS8jyfjXJu+fN
	6k5w==
Received: by 10.180.100.131 with SMTP id ey3mr20717969wib.15.1344884369869;
	Mon, 13 Aug 2012 11:59:29 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm17936447wiz.1.2012.08.13.11.59.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 11:59:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 19:58:47 +0100
Message-Id: <938675e4208fd34908653e1a7565c58f53067d77.1344884283.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm+M9zrRMjDPKQeO1cL47A7vMqb2+F5NYkX5SpYNlEGPw5QQ/B/2RGWtOgVKJtnoc/Dipn1
Subject: [PATCH 8/8] mesa: enable EGL, with DRM and X11 platforms
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
X-List-Received-Date: Mon, 13 Aug 2012 19:11:23 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    5 +++--
 meta/recipes-graphics/mesa/mesa-dri.inc    |    6 +++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index feb152b..de171f0 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -17,7 +17,7 @@ PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
 
-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2"
+PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
@@ -30,6 +30,7 @@ EXTRA_OECONF = "--enable-glu \
                 --enable-shared-glapi"
 
 PACKAGECONFIG ??= "${@base_contains('MACHINE_FEATURES', 'x86', 'gles', '', d)} \
+                   ${@base_contains('MACHINE_FEATURES', 'x86', 'egl', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
@@ -60,7 +61,7 @@ FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
-FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
+FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 32ca4b2..8b04e5b 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -10,10 +10,14 @@ DRIDRIVERS_append_x86-64 = ",i915,i965"
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
-EXTRA_OECONF += "--disable-egl --enable-gbm"
+EXTRA_OECONF += "--enable-gbm"
 
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
 
+EGL_PLATFORMS  = "drm"
+EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'x11', ',x11', '', d)}"
+PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
+
 python populate_packages_prepend() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
 
-- 
1.7.10




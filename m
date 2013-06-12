Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id B23806A96F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:48 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so4277477ead.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pUmOrmu9CE5I19sFr4E460J6gob2hKy6HN7/GRS7leA=;
	b=KCc18f65UFdhyHQjA5n2kxz5f8mK/U/OyVDTg/Q1o6tvW9BBIrStbF9nVg2lfuSfhj
	aPMBb+jBcl//GVlWeC6RqEX8VjuN3NrtjJ2JMiJsiFUcL+63A/gEEimz+TY7VQ7fxs2R
	8V1hr6pB27qkhKeq0yYnCeHSldt6XD0YFjzLS/LcqoqHmPRw735rIQu4Vhum8rGNMQwT
	0IhlAqTo8Yp5DdmUMi6Ta4aqhL2tslRltIDsnMkXNiCrmLos4jBjuvmL/IIrLwbl7rJ9
	eyRVAtQAd4l/UI3ZKvUiUq90f1pIHjRK6WXUOMQzsuXObzi4+ffbBufe2eUzc59KuFwi
	2Jiw==
X-Received: by 10.14.110.66 with SMTP id t42mr23885497eeg.48.1371079189409;
	Wed, 12 Jun 2013 16:19:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y44sm39768641eel.10.2013.06.12.16.19.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:20:00 +0200
Message-Id: <18f9f0b18af898e898f1dabed649418dcd7818c4.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
References: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
Subject: [PATCH 07/10] mesa: introduce gallium PACKAGECONFIG
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a210415..6207bb6 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -37,7 +37,6 @@ DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm udev"
 
-EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-gbm"
 
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
@@ -47,6 +46,9 @@ EGL_PLATFORMS .="${@base_contains('PACKAGECONFIG', 'x11', ',x11', '', d)}"
 EGL_PLATFORMS .="${@base_contains('PACKAGECONFIG', 'wayland', ',wayland', '', d)}"
 PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
 
+GALLIUMDRIVERS = "swrast"
+PACKAGECONFIG[gallium] = "--enable-gallium --with-gallium-drivers=${GALLIUMDRIVERS}, --disable-gallium --without-gallium-drivers"
+
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
@@ -63,6 +65,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
              libwayland-egl libwayland-egl-dev \
+             libegl-gallium libgbm-gallium \
             "
 
 do_install_append () {
@@ -108,6 +111,9 @@ python populate_packages_prepend() {
         d.setVar("RPROVIDES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
         d.setVar("RCONFLICTS_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
         d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
+    
+    pipe_drivers_root = os.path.join(d.getVar('libdir', True), "gallium-pipe")
+    do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
 }
 
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
@@ -123,6 +129,8 @@ FILES_libgl-mesa = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
+FILES_libegl-gallium = "${libdir}/egl/egl_gallium.so*"
+FILES_libgbm-gallium = "${libdir}/gbm/gbm_gallium_drm.so*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
 FILES_libdricore-dev = "${libdir}/libdricore*.*"
@@ -136,4 +144,4 @@ FILES_libgles3-mesa-dev = "${includedir}/GLES3"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayland-egl.*"
 
-FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
+FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/* ${libdir}/gbm/.debug/* ${libdir}/gallium-pipe/.debug"
-- 
1.8.2.1



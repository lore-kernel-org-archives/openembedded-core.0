Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TvVn8-0006vk-PO
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:24:43 +0100
Received: from mail-wg0-f72.google.com ([74.125.82.72])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 16 Jan 2013 08:09:05 -0800
Received: by mail-wg0-f72.google.com with SMTP id fg15so1629771wgb.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 08:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=/Z7B0+FcZFIH4u27ccTeZLOB2QKmlMARtNqjrXxUNLI=;
	b=LrXgoXbEXkjBJMnY6sumPxKDkpmzJkD52TYioD+0oycYwvBaP3PQZUJj9uChrC2ctK
	+++Ff0vNLvZeK8O5h+BkeRQHnVmT53LPsSo75//HXuENCNslSTpX2asa6u4Q5KWTDl/Z
	dO5q2IT3mnxkTwJcfVymiiTO/ZJk1bL+SaGXfHFDRZanvVZUEY3ehbl5q/Al4IHS7q5p
	1t7rgXcb/t28AZRT9J3r69dlSHwnueLbPSYdhalr88OpKtbDsrdSv88XxfEudQnj+jnT
	caG2cuGSjHhMryscnmAuxuCH6pNLdesTdB3V4Aa1wccPfJkGuPChngh0YJuOQU25Wlga
	ejVg==
X-Received: by 10.194.23.37 with SMTP id j5mr3193848wjf.28.1358352543280;
	Wed, 16 Jan 2013 08:09:03 -0800 (PST)
X-Received: by 10.194.23.37 with SMTP id j5mr3193839wjf.28.1358352543203;
	Wed, 16 Jan 2013 08:09:03 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ex6sm9768803wid.3.2013.01.16.08.09.01
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 08:09:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 16:06:58 +0000
Message-Id: <c7c9c3f167e1956ec7f77c9d26e16930458b9c07.1358351050.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358351050.git.ross.burton@intel.com>
References: <cover.1358351050.git.ross.burton@intel.com>
In-Reply-To: <cover.1358351050.git.ross.burton@intel.com>
References: <cover.1358351050.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlNfKpffkgQeTCimSOTCjkeQq7Fk/ddx8U2KogYOoEUSfUNXzqMU/CIDxUfJMptMAuMqxiNWPg++o3rmMRypro6hi3usOk+7Fq7DMfCL0GDU5okKm14Pl2rAECl7tFdk7Rw5kndElCXhYDVxPjlxxNtH7kvKs78pRUQvskvnDHwW7fHI31JlHKnDfsjLf5RBd8AYwGX
Subject: [PATCH 3/4] mesa-dri: enable the wayland-egl platform
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
X-List-Received-Date: Wed, 16 Jan 2013 16:24:43 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

If the "wayland" DISTRO_FEATURE is present, enable the Wayland EGL platform.
This is required by the reference Wayland compositor, Weston.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   10 +++++++++-
 meta/recipes-graphics/mesa/mesa-dri.inc    |    1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 838ce11..1ff08fb 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -28,10 +28,15 @@ EXTRA_OECONF = "--disable-glu \
                 --disable-glut \
                 --enable-shared-glapi"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} egl gles"
+PACKAGECONFIG ??= "egl gles \
+		${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
+		${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
+		"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
+PACKAGECONFIG[wayland] = ",,wayland"
+
 
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
@@ -48,6 +53,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
+             libwayland-egl libwayland-egl-dev \
             "
 
 do_install_append () {
@@ -89,6 +95,7 @@ FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES_libgl-mesa = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
+FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
 FILES_libdricore-dev = "${libdir}/libdricore*.*"
@@ -100,5 +107,6 @@ FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/p
 FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES_libgles3-mesa-dev = "${includedir}/GLES3"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
+FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayland-egl.*"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 07544ab..1f6ec78 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -13,6 +13,7 @@ PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-
 
 EGL_PLATFORMS  = "drm"
 EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'x11', ',x11', '', d)}"
+EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'wayland', ',wayland', '', d)}"
 PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
 
 python populate_packages_prepend() {
-- 
1.7.10.4




Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5416573231
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 07:38:30 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so11318057wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 00:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZLhEEZO4tHio0yOUxm8XLrrw9+j0bMZrudtgQOR9dTQ=;
	b=Jqc4hBGJa5WMZT/es5SmF3vK5asKMO5L+E78+3JF3FWXXAuwdcDYsMBf3D1OAiq9Mq
	gGen0B5h2E9AdSUCCVtsgkafu236GkzSU8SiXUrVv4l7iQcFt1hnsLkNdhhACs7GO3ZY
	WBSPedeOzT0CGCF6XfHFQ5FjL5/8gEzf8acPJzI03wBeLNGSim/IXPmUsvV/NLGbDC1h
	mtOog8y1x48s8BIVR8OeXCVqJCX/bt8iRADLpMH31+MefZgyoF6i+ORorsRzx6OR5DB5
	e6ZoVUtF9YGtbOxU6pRfja4yosXlrg/gdmbbQaDi5W3IF83tRTq91OVr0CM+FXvlVxho
	MU8w==
X-Gm-Message-State: ALoCoQnv+1qpqTNUbWod3myDoHpRLhy88GXhsmQEjVrxaco+pW5EZiJsmpTVBL1/2fdzVQ/zmzR6
X-Received: by 10.194.60.226 with SMTP id k2mr4955731wjr.10.1438673910772;
	Tue, 04 Aug 2015 00:38:30 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id lg6sm343368wjb.10.2015.08.04.00.38.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Aug 2015 00:38:29 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Aug 2015 08:37:49 +0100
Message-Id: <1438673869-18266-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.3.5
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, patches@linaro.org
Subject: [PATCH v2] mesa: upgrade 10.5.8 -> 10.6.3
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
X-List-Received-Date: Tue, 04 Aug 2015 07:38:31 -0000

* Removed openvg references in PACKAGECONFIG, FILES and PACKAGES since OpenVG
  support was removed in mesa 10.6
* Tested with X11 :
 * xf86-video-freedreno on IFC6410 and DragonBoard 410c
 * softpipe on DragonBoard 410c
 * using meta-qualcomm BSP

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 * Since v1
  * remove openvg support

 meta/recipes-graphics/mesa/{mesa-gl_10.5.8.bb => mesa-gl_10.6.3.bb} | 0
 meta/recipes-graphics/mesa/mesa.inc                                 | 6 ------
 meta/recipes-graphics/mesa/{mesa_10.5.8.bb => mesa_10.6.3.bb}       | 4 ++--
 3 files changed, 2 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.5.8.bb => mesa-gl_10.6.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_10.5.8.bb => mesa_10.6.3.bb} (78%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.5.8.bb b/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_10.5.8.bb
rename to meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 09e80e8..af7a2c4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,8 +49,6 @@ EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'x11', ',x11', '', d)}"
 EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'wayland', ',wayland', '', d)}"
 PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
 
-PACKAGECONFIG[openvg] = "--enable-openvg, --disable-openvg"
-
 GALLIUMDRIVERS = "swrast"
 GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'radeonsi,r600', '', d)}"
 PACKAGECONFIG[r600] = ""
@@ -84,7 +82,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
              libwayland-egl libwayland-egl-dev \
-             libopenvg libopenvg-dev \
              libxvmcsoftpipe libxvmcsoftpipe-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver \
@@ -167,7 +164,6 @@ FILES_libgl-mesa = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
-FILES_libopenvg = "${libdir}/libOpenVG.so.*"
 FILES_libxvmcsoftpipe = "${libdir}/libXvMCsoftpipe.so.*"
 FILES_libxatracker = "${libdir}/libxatracker.so.*"
 
@@ -181,8 +177,6 @@ FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/p
 FILES_libgles3-mesa-dev = "${includedir}/GLES3"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayland-egl.*"
-FILES_libopenvg-dev = "${libdir}/libOpenVG.so ${libdir}/libOpenVG.la* \
-                       ${includedir}/VG ${libdir}/pkgconfig/vg.pc"
 FILES_libxvmcsoftpipe-dev = "${libdir}/libXvMCsoftpipe.so ${libdir}/libXvMCsoftpipe.la"
 FILES_libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
diff --git a/meta/recipes-graphics/mesa/mesa_10.5.8.bb b/meta/recipes-graphics/mesa/mesa_10.6.3.bb
similarity index 78%
rename from meta/recipes-graphics/mesa/mesa_10.5.8.bb
rename to meta/recipes-graphics/mesa/mesa_10.6.3.bb
index 072cde9..8c55064 100644
--- a/meta/recipes-graphics/mesa/mesa_10.5.8.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.6.3.bb
@@ -2,8 +2,8 @@ require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "5332a3576c5e3a0c3947ee6668dd4157"
-SRC_URI[sha256sum] = "2866b855c5299a4aed066338c77ff6467c389b2c30ada7647be8758663da2b54"
+SRC_URI[md5sum] = "553e525d2f20ed48fca8f1ec3176fd83"
+SRC_URI[sha256sum] = "58592e07c350cd2e8969b73fa83048c657a39fe2f13f3b88f5e5818fe2e4676d"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.3.5



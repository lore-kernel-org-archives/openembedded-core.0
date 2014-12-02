Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 91FC860030
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 21:06:44 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so22325448wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 13:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TyNXeSalvy/+10gJ9KwG5rcX7Zfn3w5ZU6DOIt3Mrww=;
	b=Am0Tbrd+AHOaOshxFmUNhyakJoIpprjM0FdjftgqaUUljvwozabhGka79jmh5Di6lC
	AZT7Y9OJr27pEVwdOE1TIU6wwRnVciqF73spW5aiuUA0XGlYaHu3ZhFHm+OYdt92TPXj
	xFm195PX5PUAlrDOicqfzEpoBhP05oUXlfC+9R/2bmvYszDOyNOAj/WYUORkMTZhMb+i
	UTb9b8CyaTimms7aE94w4rCYqWK3KrQ8QyCe3A7pxtRLXsNIKKGYpWgeu4cMEIsswBvu
	UF9G/V4kfqXRZyw3zsetXLSitbHwMXpeaHpkuEwFfiKLtdsesAdAZE/4pVnkYUXXV/N6
	AjCg==
X-Gm-Message-State: ALoCoQneMe2p2mZxBi4rRfvjD7ByspL2M/E3Lz1e+INiTmxC0OnG28m+PyFw6Yjpf75mmheoPKRo
X-Received: by 10.181.13.42 with SMTP id ev10mr8112847wid.78.1417554404191;
	Tue, 02 Dec 2014 13:06:44 -0800 (PST)
Received: from nikaia.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by mx.google.com with ESMTPSA id
	bm1sm33460626wjb.45.2014.12.02.13.06.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Dec 2014 13:06:43 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 22:06:33 +0100
Message-Id: <1417554393-29368-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.1.3
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [RFC PATCH] mesa: add PACKAGECONFIG support for gallium XA state tracker
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
X-List-Received-Date: Tue, 02 Dec 2014 21:06:47 -0000

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 ++++++
 1 file changed, 6 insertions(+)
---
I have tested:
- on IFC6410 with Snapdragon 600 and Adreno 320 running the freedreno
  Gallium driver from mesa
- with Mesa 10.3 so i would recommend we wait for 10.3 to be merged first
- with branch xorg-1.16 from this BSP layer [1]

Sending as RFC to see if this is the right way to enable this
feature...

[1] https://git.linaro.org/people/nicolas.dechesne/meta-qualcomm.git/

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1857f3c..cb1837a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -65,6 +65,7 @@ MESA_LLVM_RELEASE ?= "3.3"
 PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --with-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
+PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
 
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
@@ -87,6 +88,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libegl-gallium libgbm-gallium \
              libopenvg libopenvg-dev \
              libxvmcsoftpipe libxvmcsoftpipe-dev \
+             libxatracker libxatracker-dev \
              mesa-megadriver \
             "
 
@@ -171,6 +173,7 @@ FILES_libegl-gallium = "${libdir}/egl/egl_gallium.so*"
 FILES_libgbm-gallium = "${libdir}/gbm/gbm_gallium_drm.so*"
 FILES_libopenvg = "${libdir}/libOpenVG.so.*"
 FILES_libxvmcsoftpipe = "${libdir}/libXvMCsoftpipe.so.*"
+FILES_libxatracker = "${libdir}/libxatracker.so.*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
 FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
@@ -185,5 +188,8 @@ FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayl
 FILES_libopenvg-dev = "${libdir}/libOpenVG.so ${libdir}/libOpenVG.la* \
                        ${includedir}/VG ${libdir}/pkgconfig/vg.pc"
 FILES_libxvmcsoftpipe-dev = "${libdir}/libXvMCsoftpipe.so ${libdir}/libXvMCsoftpipe.la"
+FILES_libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
+                          ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
+                          ${libdir}/pkgconfig/xatracker.pc"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/* ${libdir}/gbm/.debug/* ${libdir}/gallium-pipe/.debug"
-- 
2.1.3



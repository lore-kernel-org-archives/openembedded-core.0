Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92C7C021B6
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 14:38:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.24237.1740148693365503575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 06:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4147424817=rob.woolley@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LCiPXQ002957
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:38:13 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44xqcar7ff-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:38:12 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 21 Feb 2025 06:38:11 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 21 Feb 2025 06:38:11 -0800
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe] [OE-Core][PATCH 2/2] mesa: enable glvnd support
Date: Fri, 21 Feb 2025 06:38:11 -0800
Message-ID: <20250221143811.2072024-3-rob.woolley@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221143811.2072024-1-rob.woolley@windriver.com>
References: <20250221143811.2072024-1-rob.woolley@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: F9Q_5Ger5Ot5te866fJfxUUc-dJC8rYw
X-Authority-Analysis: v=2.4 cv=Xb9zzJ55 c=1 sm=1 tr=0 ts=67b88fd4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=eTaXBizktOVO8qBCtcoA:9 a=d3PnA9EDa4IxuAV0gXij:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: F9Q_5Ger5Ot5te866fJfxUUc-dJC8rYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 14:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211804

This is a backport of 1c0577d66b5c26b9b248797f17d652daf6d9dfd1 from
openembedded-core. It is needed to properly find OpenGL using
FindOpenGL.cmake.

Allows mesa to be built with glvnd support.
Thus, creates libEGL_mesa.so* and libGLX_mesa.so*
mesa(vendor) libraries meant to coexist with vendor
neutral dispatch libraries from libglvnd.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
 .../conf/distro/include/default-providers.inc |  1 +
 meta/recipes-graphics/mesa/mesa.inc           | 20 +++++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 6defdca12d..3a4e989c1f 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -5,6 +5,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libglx ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
 PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index afac8014fe..27c3322b8b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -30,15 +30,18 @@ UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
-    fi
+  # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled.
+  # So, check if EGL/eglplatform.h exists before running sed.
+  if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
+      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+  fi
 }
 
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
@@ -113,6 +116,7 @@ VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broa
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
+PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false, libglvnd"
 
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
@@ -196,6 +200,7 @@ RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'lib
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
+             libglx-mesa libglx-mesa-dev \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
@@ -214,7 +219,7 @@ do_install:append () {
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
 
-    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
+    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
     chrpath --delete ${D}${libdir}/dri/*_dri.so || true
 
     # libwayland-egl has been moved to wayland 1.15+
@@ -232,6 +237,7 @@ python __anonymous() {
         suffix = "-native"
     for p in (("egl", "libegl", "libegl1"),
               ("opengl", "libgl", "libgl1"),
+              ("glvnd", "libglx",),
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
               ("gles", "libgles3",),
@@ -290,20 +296,22 @@ PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
 FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
 FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
-FILES:libegl-mesa = "${libdir}/libEGL.so.*"
+FILES:libegl-mesa = "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d"
 FILES:libgbm = "${libdir}/libgbm.so.*"
 FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
+FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
 FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${sysconfdir}/OpenCL/vendors/mesa.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
 FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
-FILES:libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
+FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
-- 
2.43.0



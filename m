X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH] mesa: Allow building Mesa's OpenCL through PACKAGECONFIG
Date: Wed, 16 Mar 2022 14:47:02 +0100
Message-Id: <20220316134702.2604952-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2a89b8e8f0..4ce69a78f8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -74,7 +74,6 @@ MESON_BUILDTYPE = "${@check_buildtype(d)}"
 
 EXTRA_OEMESON = " \
     -Dshared-glapi=enabled \
-    -Dgallium-opencl=disabled \
     -Dglx-read-only-text=true \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
 "
@@ -122,6 +121,9 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
+# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
+PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
+
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[freedreno] = ""
@@ -190,6 +192,8 @@ RDEPENDS:${PN}-dev = ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
+
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
@@ -198,6 +202,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
+             libopencl-mesa libopencl-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
              mesa-vdpau-drivers \
@@ -230,7 +235,8 @@ python __anonymous() {
               ("opengl", "libgl", "libgl1"),
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
-              ("gles", "libgles3",)):
+              ("gles", "libgles3",),
+              ("opencl", "libopencl",)):
         if not p[0] in pkgconfig:
             continue
         mlprefix = d.getVar("MLPREFIX")
@@ -290,6 +296,7 @@ FILES:libgbm = "${libdir}/libgbm.so.*"
 FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
+FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${sysconfdir}/OpenCL/vendors/mesa.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
-- 
2.35.1


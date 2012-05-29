Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SZHxK-0003w5-Aa
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 10:39:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 May 2012 01:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172198586"
Received: from yocto-build3.sh.intel.com ([10.239.48.5])
	by fmsmga002.fm.intel.com with ESMTP; 29 May 2012 01:27:47 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2012 16:30:33 +0800
Message-Id: <fb9427fa241a1f36e0bba8bf66bf7fb8604ef77a.1338280083.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1338280083.git.edwin.zhai@intel.com>
References: <cover.1338280083.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1338280083.git.edwin.zhai@intel.com>
References: <cover.1338280083.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] qemu: Add an option to remove host sdl/gl checking
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
X-List-Received-Date: Tue, 29 May 2012 08:39:06 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Add an PACKAGECONFIG in qemu to disable GL acceleration:
* By default configure try best to enable GL acceleration and fail when missing
  host dependency(libSDL and libGL).
* End user can also choose to turn off GL capability, thus remove the host
  dependence in building.

[YOCTO #2407] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../qemu/qemu-0.15.1/dummy-gl-config.patch         |   31 +++++
 .../qemu/qemu-0.15.1/glflags.patch                 |   40 ++++--
 .../qemu/qemu-0.15.1/opengl-disable-option.patch   |  137 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc                |   23 +---
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    4 +-
 5 files changed, 203 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/dummy-gl-config.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/opengl-disable-option.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/dummy-gl-config.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/dummy-gl-config.patch
new file mode 100644
index 0000000..8aa30ae
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/dummy-gl-config.patch
@@ -0,0 +1,31 @@
+Add a dummy option for GL acceleration to pass the configure when there is no
+GL acceleration patch. The parsing function will be filled by following
+opengl-disable-option.patch.
+
+Upstream-Status: Inappropriate [other] - depends on GL patch
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Index: qemu-0.15.1/configure
+===================================================================
+--- qemu-0.15.1.orig/configure	2012-05-14 21:23:34.000000000 +0800
++++ qemu-0.15.1/configure	2012-05-14 21:23:36.000000000 +0800
+@@ -179,6 +179,7 @@
+ smartcard_nss=""
+ usb_redir=""
+ opengl=""
++gl_accel="yes"
+ guest_agent="yes"
+ 
+ # parse CC options first
+@@ -739,6 +740,10 @@
+   ;;
+   --enable-opengl) opengl="yes"
+   ;;
++  --disable-gl-accel) gl_accel="no"
++  ;;
++  --enable-gl-accel) gl_accel="yes"
++  ;;
+   --*dir)
+   ;;
+   --disable-rbd) rbd="no"
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/glflags.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/glflags.patch
index 0ad5551..638d262 100644
--- a/meta/recipes-devtools/qemu/qemu-0.15.1/glflags.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/glflags.patch
@@ -1,15 +1,33 @@
+Considering relocation, qemu-nativesdk is independent of host library except
+libGL. Normal method like 'cat > $TMPC' doesn't work, so we check the library
+directly.
+
 Upstream-Status: Inappropriate [configuration]
 
-Index: qemu-0.14.0/Makefile.target
+Index: qemu-0.15.1/configure
 ===================================================================
---- qemu-0.14.0.orig/Makefile.target	2011-04-04 12:12:19.142871742 +0100
-+++ qemu-0.14.0/Makefile.target	2011-04-04 12:12:21.772871742 +0100
-@@ -362,7 +362,7 @@
- 
- monitor.o: hmp-commands.h qmp-commands.h
- 
--LIBS += -lGL -lGLU
-+LIBS += -lGL
- 
- $(obj-y) $(obj-$(TARGET_BASE_ARCH)-y): $(GENERATED_HEADERS)
+--- qemu-0.15.1.orig/configure	2012-05-25 18:26:05.000000000 +0800
++++ qemu-0.15.1/configure	2012-05-29 09:43:27.000000000 +0800
+@@ -2032,15 +2032,13 @@
+     exit 1;
+   fi
  
+-  gl_accel_libs="-lGL -lGLU"
+-  cat > $TMPC << EOF
+-#include <X11/Xlib.h>
+-#include <GL/gl.h>
+-#include <GL/glx.h>
+-#include <GL/glu.h>
+-int main(void) { GL_VERSION; return 0; }
+-EOF
+-  if compile_prog "" "-lGL -lGLU" ; then
++  gl_accel_libs="-lGL"
++  libgl='no'
++  test -e /usr/lib/libGL.so && libgl='yes'
++  test -e /usr/lib64/libGL.so && libgl='yes'
++  test -e /usr/lib/*-linux-gnu/libGL.so && libgl='yes'
++
++  if test "$libgl" = "yes" ; then
+     gl_accel=yes
+     libs_softmmu="$gl_accel_libs $libs_softmmu"
+   else
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/opengl-disable-option.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/opengl-disable-option.patch
new file mode 100644
index 0000000..8dc272a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/opengl-disable-option.patch
@@ -0,0 +1,137 @@
+Add an option gl-accel to disable GL acceleration:
+* When enabled, configure try best to enable GL acceleration and fail when
+  missing host dependency(libSDL and libGL), which is the default.
+* When disabled, end user choose to turn off GL capability, thus remove the
+  host dependence in building.
+
+Upstream-Status: Inappropriate [other] - depends on GL patch
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Index: qemu-0.15.1/Makefile.target
+===================================================================
+--- qemu-0.15.1.orig/Makefile.target	2012-05-29 11:20:04.000000000 +0800
++++ qemu-0.15.1/Makefile.target	2012-05-29 11:20:04.000000000 +0800
+@@ -80,13 +80,16 @@
+ endif
+ libobj-$(CONFIG_NEED_MMU) += mmu.o
+ ifndef CONFIG_LINUX_USER
++ifdef CONFIG_GL_ACCEL
+ libobj-$(TARGET_I386) += helper_opengl.o opengl_exec.o
+ libobj-$(TARGET_X86_64) += helper_opengl.o opengl_exec.o
+ else
+-ifdef CONFIG_SDL
+ libobj-$(TARGET_I386) += dummygl.o
+ libobj-$(TARGET_X86_64) += dummygl.o
+-endif
++endif #CONFIG_GL_ACCEL
++else
++libobj-$(TARGET_I386) += dummygl.o
++libobj-$(TARGET_X86_64) += dummygl.o
+ endif #CONFIG_LINUX_USER
+ libobj-$(TARGET_ARM) += dummygl.o
+ libobj-$(TARGET_MIPS) += dummygl.o
+@@ -262,8 +265,10 @@
+ obj-i386-$(CONFIG_SPICE) += qxl.o qxl-logger.o qxl-render.o
+ 
+ ifeq ($(TARGET_BASE_ARCH), i386)
++ifdef CONFIG_GL_ACCEL
+ QEMU_CFLAGS += -DTARGET_OPENGL_OK
+ endif
++endif
+ 
+ # shared objects
+ obj-ppc-y = ppc.o
+@@ -409,8 +414,6 @@
+ 
+ monitor.o: hmp-commands.h qmp-commands.h
+ 
+-LIBS += -lGL -lGLU
+-
+ $(obj-y) $(obj-$(TARGET_BASE_ARCH)-y): $(GENERATED_HEADERS)
+ 
+ obj-y += $(addprefix ../, $(common-obj-y))
+Index: qemu-0.15.1/configure
+===================================================================
+--- qemu-0.15.1.orig/configure	2012-05-29 11:20:03.000000000 +0800
++++ qemu-0.15.1/configure	2012-05-29 11:20:04.000000000 +0800
+@@ -2021,6 +2021,39 @@
+   fi
+ fi
+ 
++#####################################################
++# GL acceleration probe depending on gl, glu and sdl
++if test "$gl_accel" != "no" ; then
++  if test "$sdl" = "no" ; then
++    gl_accel=no
++    echo "libSDL and header no found to build opengl acceleration for qemu-native.
++    Ubuntu package names are: libsdl1.2-dev.
++    Fedora package names are: SDL-devel."
++    exit 1;
++  fi
++
++  gl_accel_libs="-lGL -lGLU"
++  cat > $TMPC << EOF
++#include <X11/Xlib.h>
++#include <GL/gl.h>
++#include <GL/glx.h>
++#include <GL/glu.h>
++int main(void) { GL_VERSION; return 0; }
++EOF
++  if compile_prog "" "-lGL -lGLU" ; then
++    gl_accel=yes
++    libs_softmmu="$gl_accel_libs $libs_softmmu"
++  else
++    feature_not_found "gl_accel"
++    gl_accel=no
++    gl_accel_libs=
++    echo "libGL.so and libGLU.so not found to build opengl acceleration for qemu-native.
++    Ubuntu package names are: libgl1-mesa-dev, libglu1-mesa-dev and libsdl1.2-dev.
++    Fedora package names are: mesa-libGL mesa-libGLU SDL-devel."
++    exit 1;
++  fi
++fi
++
+ #
+ # Check for xxxat() functions when we are building linux-user
+ # emulator.  This is done because older glibc versions don't
+@@ -2722,6 +2755,7 @@
+ echo "nss used          $smartcard_nss"
+ echo "usb net redir     $usb_redir"
+ echo "OpenGL support    $opengl"
++echo "GL acceleration support    $gl_accel"
+ echo "build guest agent $guest_agent"
+ 
+ if test $sdl_too_old = "yes"; then
+@@ -3025,6 +3059,10 @@
+   echo "CONFIG_OPENGL=y" >> $config_host_mak
+ fi
+ 
++if test "$gl_accel" = "yes" ; then
++  echo "CONFIG_GL_ACCEL=y" >> $config_host_mak
++fi
++
+ # XXX: suppress that
+ if [ "$bsd" = "yes" ] ; then
+   echo "CONFIG_BSD=y" >> $config_host_mak
+Index: qemu-0.15.1/qemu-char.c
+===================================================================
+--- qemu-0.15.1.orig/qemu-char.c	2012-05-29 11:20:03.000000000 +0800
++++ qemu-0.15.1/qemu-char.c	2012-05-29 11:20:04.000000000 +0800
+@@ -2387,7 +2387,6 @@
+     return d->outbuf_size;
+ }
+ 
+-#define TARGET_OPENGL_OK
+ #if defined(TARGET_OPENGL_OK)
+ static uint8_t buffer[32];
+ static int buffer_len;
+@@ -2447,7 +2446,7 @@
+     return chr;
+ }
+ #else
+-#define qemu_chr_open_opengl() 0
++#define qemu_chr_open_opengl NULL
+ #endif
+ 
+ QemuOpts *qemu_chr_parse_compat(const char *label, const char *filename)
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 93325c3..75ff962 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -19,26 +19,6 @@ EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --di
 
 inherit autotools
 
-# For our gl powered QEMU you need libGL and SDL headers
-do_configure_prepend_virtclass-native() {
-    libgl='no'
-    libsdl='no'
-
-    test -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so && libgl='yes'
-    test -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so && libgl='yes'
-    test -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so && libgl='yes'
-
-    test -e /usr/lib/pkgconfig/sdl.pc -o -e /usr/lib64/pkgconfig/sdl.pc -o -e /usr/include/SDL/SDL.h && libsdl='yes'
-
-
-    if [ "$libsdl" != 'yes' -o "$libgl" != 'yes' ]; then
-       echo "You need libGL.so and libGLU.so to exist in your library path and the development headers for SDL installed to build qemu-native.
-       Ubuntu package names are: libgl1-mesa-dev, libglu1-mesa-dev and libsdl1.2-dev.
-       Fedora package names are: mesa-libGL mesa-libGLU SDL-devel."
-       exit 1;
-    fi
-}
-
 do_configure() {
     # Handle distros such as CentOS 5 32-bit that do not have kvm support
     KVMOPTS="--disable-kvm"
@@ -57,6 +37,9 @@ do_install () {
 	install -m 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
 }
 
+PACKAGECONFIG ??= "gl"
+PACKAGECONFIG[gl] = "--enable-gl-accel,--disable-gl-accel,,"
+
 DEPENDS_virtclass-native = "zlib-native alsa-lib-native glib-2.0-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk glib-2.0-nativesdk \
                                ${@base_contains('DISTRO_FEATURES', 'x11', 'qemugl-nativesdk', '', d)}"
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index e90f339..f28ec4c 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r6"
+PR = "r7"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -19,6 +19,7 @@ SRC_URI = "\
     file://larger_default_ram_size.patch \
     file://arm-bgr.patch \
     file://a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch \
+    file://dummy-gl-config.patch \
     "
 
 # Only use the GL passthrough patches for native/nativesdk versions
@@ -31,6 +32,7 @@ QEMUGLPATCHES = "\
     file://qemugl-fix.patch \
     file://opengl-sdl-fix.patch \
     file://opengl-args-copy-fix.patch \
+    file://opengl-disable-option.patch \
     "
 
 SRC_URI_append_virtclass-native = "\
-- 
1.7.1




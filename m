Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UHzau-0000C1-BM
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 17:41:01 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Mar 2013 09:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,872,1355126400"; d="scan'208";a="281731378"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2013 09:24:00 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 18:23:56 +0200
Message-Id: <1363710237-31628-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363710237-31628-1-git-send-email-laurentiu.palcu@intel.com>
References: <1363710237-31628-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH v3 1/1] mesa: rename mesa-dri recipe to just mesa
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
X-List-Received-Date: Tue, 19 Mar 2013 16:41:01 -0000

Rename mesa-dri recipes to just mesa. Also, replace all references to
mesa-dri in all recipes/configs.

The reason for this renaming (quote from bugzilla):

"mesa-dri is a artefact of mesa-xlib existing, which doesn't anymore.
mesa-dri should be renamed to mesa."

[YOCTO #3385]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/conf/distro/include/default-providers.inc     |    6 ++--
 meta/conf/machine/include/ia32-base.inc            |    4 +--
 meta/conf/machine/include/qemu.inc                 |    8 ++---
 meta/conf/machine/qemux86-64.conf                  |    8 ++---
 meta/conf/machine/qemux86.conf                     |    8 ++---
 meta/recipes-graphics/mesa/libglu_9.0.0.bb         |    2 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |    5 +--
 meta/recipes-graphics/mesa/mesa-dri.inc            |   28 -----------------
 meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb       |    4 ---
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    8 -----
 meta/recipes-graphics/mesa/mesa-git.inc            |    1 -
 meta/recipes-graphics/mesa/mesa.inc                |   33 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.0.2.bb           |    4 +++
 meta/recipes-graphics/mesa/mesa_git.bb             |    7 +++++
 meta/recipes-graphics/wayland/weston_1.0.3.bb      |    6 ++--
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 16 files changed, 67 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_git.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa_9.0.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_git.bb

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ebf2a09..39ce7cc 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -5,9 +5,9 @@ PREFERRED_PROVIDER_virtual/db ?= "db"
 PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index 0798bf8..921c740 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -39,11 +39,11 @@ XSERVER_IA32_EXT = " \
            "
 
 XSERVER_IA32_I915 = "xf86-video-intel \
-           mesa-dri-driver-i915 \
+           mesa-driver-i915 \
            "
 
 XSERVER_IA32_I965 = "xf86-video-intel \
-           mesa-dri-driver-i965 \
+           mesa-driver-i965 \
            "
 
 XSERVER_IA32_VESA = "xf86-video-vesa"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 52215b3..29caec9 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,10 +1,10 @@
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 XSERVER ?= "xserver-xorg \
-            mesa-dri-driver-swrast \
+            mesa-driver-swrast \
             xf86-input-evdev \
             xf86-input-mouse \
             xf86-video-fbdev \
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 3852b89..23a7108 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -3,9 +3,9 @@
 #@DESCRIPTION: Machine configuration for running a common x86
 
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/tune-x86_64.inc
 
@@ -14,7 +14,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 XSERVER ?= "xserver-xorg \
-           mesa-dri-driver-swrast \
+           mesa-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index ee14bec..d13dc84 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -3,9 +3,9 @@
 #@DESCRIPTION: Machine configuration for running a common x86
 
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/tune-i586.inc
 
@@ -14,7 +14,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 XSERVER ?= "xserver-xorg \
-           mesa-dri-driver-swrast \
+           mesa-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
diff --git a/meta/recipes-graphics/mesa/libglu_9.0.0.bb b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
index 7980749..06d30f9 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b356456e7d44471d9 \
                     file://src/libtess/tess.c;endline=29;md5=6b79c570f644363b356456e7d44471d9"
 
-# Epoch as this used to be part of mesa-dri
+# Epoch as this used to be part of mesa
 PE = "2"
 PR = "0"
 
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index aa26aee..c37ad69 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -18,9 +18,6 @@ DEPENDS = "expat makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
-# for mesa-dri
-FILESEXTRAPATHS_prepend := "${THISDIR}/mesa:"
-
 inherit autotools pkgconfig pythonnative
 
 EXTRA_OECONF = "--disable-glu \
@@ -41,7 +38,7 @@ PACKAGECONFIG[wayland] = ",,wayland"
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
-# Remove the mesa-dri dependency on mesa-dri-dev, as mesa-dri is empty
+# Remove the mesa dependency on mesa-dev, as mesa is empty
 RDEPENDS_${PN}-dev = ""
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
deleted file mode 100644
index e43150b..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-DEPENDS += "libdrm expat udev"
-X11_DEPS += "dri2proto"
-
-DRIDRIVERS = "swrast"
-DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
-DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
-
-EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
-EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
-EXTRA_OECONF += "--enable-gbm"
-
-PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
-
-EGL_PLATFORMS  = "drm"
-EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'x11', ',x11', '', d)}"
-EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'wayland', ',wayland', '', d)}"
-PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
-
-python populate_packages_prepend() {
-    dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-
-    do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
-}
-
-PACKAGES_DYNAMIC += "^mesa-dri-driver-.*"
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-
diff --git a/meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb b/meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
deleted file mode 100644
index 26b56e4..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require mesa-common.inc
-require mesa-${PV}.inc
-require mesa-dri.inc
-PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
deleted file mode 100644
index 69a433e..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require mesa-common.inc
-require mesa-git.inc
-require mesa-dri.inc
-
-# this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
-DEFAULT_PREFERENCE = "-2"
-
-PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index 25093af..ee9a552 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -3,7 +3,6 @@ SRCREV = "1665af3066f3d58c42e9d5b13098f13615a7672c"
 PV = "9.1~git${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555d"
-FILESEXTRAPATHS_prepend := "${THISDIR}/mesa-git:"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://0002-cross-compile.patch \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
new file mode 100644
index 0000000..a692bb7
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -0,0 +1,33 @@
+DEPENDS += "libdrm expat udev"
+X11_DEPS += "dri2proto"
+
+DRIDRIVERS = "swrast"
+DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
+
+EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
+EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "--enable-gbm"
+
+PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
+
+EGL_PLATFORMS  = "drm"
+EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'x11', ',x11', '', d)}"
+EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'wayland', ',wayland', '', d)}"
+PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
+
+python populate_packages_prepend() {
+    dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
+    
+    pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
+    pkgs += do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-driver-%s', 'Mesa %s DRI driver', extra_depends='')
+    for pkg in pkgs:
+        d.setVar("RPROVIDES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
+        d.setVar("RCONFLICTS_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
+        d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
+}
+
+PACKAGES_DYNAMIC += "^mesa-driver-.*"
+
+FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
+
diff --git a/meta/recipes-graphics/mesa/mesa_9.0.2.bb b/meta/recipes-graphics/mesa/mesa_9.0.2.bb
new file mode 100644
index 0000000..1a1bf24
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa_9.0.2.bb
@@ -0,0 +1,4 @@
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa.inc
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
new file mode 100644
index 0000000..6a4bc38
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -0,0 +1,7 @@
+require mesa-common.inc
+require mesa-git.inc
+require mesa.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/wayland/weston_1.0.3.bb b/meta/recipes-graphics/wayland/weston_1.0.3.bb
index afe8235..f769312 100644
--- a/meta/recipes-graphics/wayland/weston_1.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_1.0.3.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "3136a7d2f654ea3e946d4217f7e25321248ad2921f1f4e2504dda58968
 inherit autotools pkgconfig
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
-DEPENDS += "wayland mesa-dri virtual/egl"
+DEPENDS += "wayland mesa virtual/egl"
 
 EXTRA_OECONF  = "--disable-android-compositor --enable-setuid-install"
 EXTRA_OECONF += "--disable-tablet-shell --disable-xwayland"
@@ -25,9 +25,9 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland',
                    ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
                   "
 # Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa-dri libpam"
+PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa libpam"
 # Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa-dri"
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
 # Weston on X11
 PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 5d5443c..795410b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -126,7 +126,7 @@ PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx', '',
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
 PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
                       --disable-dri --disable-dri2 --disable-glx,\
-                      xf86driproto dri2proto mesa-dri"
+                      xf86driproto dri2proto mesa"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
-- 
1.7.9.5




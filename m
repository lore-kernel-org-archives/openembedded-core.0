Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UDA5T-0000iR-V5
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 09:52:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2013 00:34:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,793,1355126400"; d="scan'208";a="271999046"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2013 00:35:55 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2013 10:35:52 +0200
Message-Id: <1362558952-4483-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1362558952-4483-1-git-send-email-laurentiu.palcu@intel.com>
References: <1362558952-4483-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/1] mesa: rename mesa-dri recipe to just mesa
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
X-List-Received-Date: Wed, 06 Mar 2013 08:52:45 -0000

Rename mesa-dri recipes to just mesa. Also, replace all references to
mesa-dri in all recipes/configs.

The reason for this renaming (quote from bugzilla):

"mesa-dri is a artefact of mesa-xlib existing, which doesn't anymore.
mesa-dri should be renamed to mesa."

[YOCTO #3385]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/conf/distro/include/default-providers.inc     |    6 +++---
 meta/conf/machine/include/ia32-base.inc            |    4 ++--
 meta/conf/machine/include/qemu.inc                 |    8 ++++----
 meta/conf/machine/qemux86-64.conf                  |    8 ++++----
 meta/conf/machine/qemux86.conf                     |    8 ++++----
 meta/recipes-graphics/mesa/libglu_9.0.0.bb         |    2 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |    5 +----
 meta/recipes-graphics/mesa/mesa-git.inc            |    1 -
 .../mesa/{mesa-dri.inc => mesa.inc}                |   11 ++++++++---
 .../mesa/{mesa-dri_9.0.2.bb => mesa_9.0.2.bb}      |    2 +-
 .../mesa/{mesa-dri_git.bb => mesa_git.bb}          |    5 ++---
 meta/recipes-graphics/wayland/weston_1.0.3.bb      |    6 +++---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 .../arch/i386/conf/machine/{{=machine}}.conf       |    2 +-
 .../arch/qemu/conf/machine/{{=machine}}.conf       |    8 ++++----
 15 files changed, 39 insertions(+), 39 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-dri.inc => mesa.inc} (65%)
 rename meta/recipes-graphics/mesa/{mesa-dri_9.0.2.bb => mesa_9.0.2.bb} (75%)
 rename meta/recipes-graphics/mesa/{mesa-dri_git.bb => mesa_git.bb} (28%)

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
index 1ff08fb..c37ad69 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -18,9 +18,6 @@ DEPENDS = "expat makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
-# for mesa-dri and mesa-xlib
-FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
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
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa.inc
similarity index 65%
rename from meta/recipes-graphics/mesa/mesa-dri.inc
rename to meta/recipes-graphics/mesa/mesa.inc
index e43150b..a692bb7 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,11 +18,16 @@ PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disa
 
 python populate_packages_prepend() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-
-    do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
+    
+    pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
+    pkgs += do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-driver-%s', 'Mesa %s DRI driver', extra_depends='')
+    for pkg in pkgs:
+        d.setVar("RPROVIDES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
+        d.setVar("RCONFLICTS_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
+        d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
 }
 
-PACKAGES_DYNAMIC += "^mesa-dri-driver-.*"
+PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb b/meta/recipes-graphics/mesa/mesa_9.0.2.bb
similarity index 75%
rename from meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_9.0.2.bb
index 26b56e4..1a1bf24 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.0.2.bb
@@ -1,4 +1,4 @@
 require mesa-common.inc
 require mesa-${PV}.inc
-require mesa-dri.inc
+require mesa.inc
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
similarity index 28%
rename from meta/recipes-graphics/mesa/mesa-dri_git.bb
rename to meta/recipes-graphics/mesa/mesa_git.bb
index 69a433e..6a4bc38 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -1,8 +1,7 @@
 require mesa-common.inc
 require mesa-git.inc
-require mesa-dri.inc
+require mesa.inc
 
-# this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
-DEFAULT_PREFERENCE = "-2"
+DEFAULT_PREFERENCE = "-1"
 
 PR = "${INC_PR}.0"
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
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf
index 86d6a53..304382d 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf
@@ -57,7 +57,7 @@ XSERVER ?= "${XSERVER_IA32_BASE} \
 
 {{ if xserver == "y" and xserver_choice == "xserver_emgd": }}
 PREFERRED_VERSION_xserver-xorg ?= "1.9.3"
-PREFERRED_VERSION_mesa-dri ?= "7.11"
+PREFERRED_VERSION_mesa ?= "7.11"
 PREFERRED_VERSION_emgd-driver-bin ?= "1.14"
 
 {{ if xserver == "y" and xserver_choice == "xserver_vesa" or xserver_choice == "xserver_emgd": }}
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
index de3b279..e618c61 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
@@ -15,9 +15,9 @@ PREFERRED_VERSION_{{=preferred_kernel}} ?= "{{=preferred_kernel_version}}%"
 
 {{ if qemuarch == "i386" or qemuarch == "x86_64": }}
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 {{ input type:"choicelist" name:"qemuarch" prio:"5" msg:"Which qemu architecture would you like to use?" default:"i386" }}
 {{ input type:"choice" val:"i386" msg:"i386    (32-bit)" }}
@@ -45,7 +45,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 # We bypass swrast but we need it to be present for X to load correctly
 XSERVER ?= "xserver-xorg \
-           mesa-dri-driver-swrast \
+           mesa-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
-- 
1.7.9.5




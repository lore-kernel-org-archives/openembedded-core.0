Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D97A171D34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:32 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256771"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:35 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:13 +0300
Message-Id: <bb7973b07b786045a9b48b801a1ec8701b48d85e.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 15/15] conf: Use xf86-input-libinput by default
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:33 -0000

Don't install legacy X input drivers for any machines by default,
RRECOMMEND xf86-input-libinput instead.

This is the setup suggested by upstream: install only libinput by
default, but let niche legacy drivers sort higher in configuration
so they get chosen if installed. So the order is:
 evdev < libinput < (synaptics|vmmouse|...)

This also removes vmmouse X driver from the qemu config. If a VMware
virtual mouse device really needs to be supported, we should enable
CONFIG_MOUSE_PS2_VMMOUSE in kernel instead: that is directly supported
by the libinput X driver.

Fixes [YOCTO #10195].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/conf/machine/include/qemu.inc                                    | 4 +---
 meta/conf/machine/include/x86-base.inc                                | 4 ----
 meta/conf/machine/qemux86-64.conf                                     | 3 ---
 meta/conf/machine/qemux86.conf                                        | 3 ---
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb  | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc                   | 2 +-
 scripts/lib/bsp/substrate/target/arch/arm/conf/machine/machine.conf   | 4 +---
 scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf  | 1 -
 .../lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf    | 1 -
 .../lib/bsp/substrate/target/arch/powerpc/conf/machine/machine.conf   | 1 -
 scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf  | 3 ---
 11 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 2bc4dc2..0e4103b 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -6,10 +6,8 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 XSERVER ?= "xserver-xorg \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
-            xf86-input-evdev \
-            xf86-input-mouse \
             xf86-video-fbdev \
-            xf86-input-keyboard"
+            "
 
 MACHINE_FEATURES = "alsa bluetooth usbgadget screen"
 
diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index 479e89e..40d5957 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -26,10 +26,6 @@ PREFERRED_VERSION_linux-yocto ??= "4.8%"
 # XSERVER subcomponents, used to build the XSERVER variable
 #
 XSERVER_X86_BASE = "xserver-xorg \
-           xf86-input-mouse \
-           xf86-input-keyboard \
-           xf86-input-evdev \
-           xf86-input-synaptics \
            "
 
 XSERVER_X86_EXT = " \
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index b191ddd..f2b2aeb 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -18,9 +18,6 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
 XSERVER = "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
-           xf86-input-vmmouse \
-           xf86-input-keyboard \
-           xf86-input-evdev \
            xf86-video-cirrus \
            xf86-video-fbdev \
            xf86-video-vmware \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 8555fd6..09555ad 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -17,9 +17,6 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
 XSERVER = "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
-           xf86-input-vmmouse \
-           xf86-input-keyboard \
-           xf86-input-evdev \
            xf86-video-cirrus \
            xf86-video-fbdev \
            xf86-video-vmware \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index 6b50028..97dcac5 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -11,7 +11,7 @@ inherit packagegroup distro_features_check
 # rdepends on XSERVER
 REQUIRED_DISTRO_FEATURES = "x11"
 
-XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
+XSERVER ?= "xserver-xorg xf86-video-fbdev"
 XSERVERCODECS ?= ""
 
 RDEPENDS_${PN} = "\
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 29503b1..269fa63 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -71,7 +71,7 @@ PACKAGES =+ "${PN}-sdl \
 SUMMARY_xf86-video-modesetting = "X.Org X server -- modesetting display driver"
 INSANE_SKIP_${MLPREFIX}xf86-video-modesetting = "xorg-driver-abi"
 
-XSERVER_RRECOMMENDS = "xkeyboard-config rgb xserver-xf86-config xkbcomp"
+XSERVER_RRECOMMENDS = "xkeyboard-config rgb xserver-xf86-config xkbcomp xf86-input-libinput"
 RRECOMMENDS_${PN} += "${XSERVER_RRECOMMENDS}"
 RRECOMMENDS_${PN}-xwayland += "${XSERVER_RRECOMMENDS}"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/machine.conf b/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/machine.conf
index 588367a..624750c 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/machine.conf
+++ b/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/machine.conf
@@ -8,10 +8,8 @@
 {{ if xserver == "y": }}
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 XSERVER ?= "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
            xf86-video-fbdev \
-           xf86-input-keyboard"
+           "
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules kernel-devicetree"
 
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf b/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
index b319d62..37da253 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
+++ b/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
@@ -27,7 +27,6 @@ PREFERRED_VERSION_{{=preferred_kernel}} ?= "{{=preferred_kernel_version}}%"
 {{ if xserver == "y": }}
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 XSERVER ?= "xserver-xorg \
-            xf86-input-evdev \
             xf86-video-fbdev"
 
 SERIAL_CONSOLE = "115200 ttyS0"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf b/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
index 3afc5e0..a8eea2c 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
@@ -27,7 +27,6 @@ PREFERRED_VERSION_{{=preferred_kernel}} ?= "{{=preferred_kernel_version}}%"
 {{ if xserver == "y": }}
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 XSERVER ?= "xserver-xorg \
-            xf86-input-evdev \
             xf86-video-fbdev"
 
 SERIAL_CONSOLE = "115200 ttyS0"
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/machine.conf b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/machine.conf
index 583c5e4..352b972 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/machine.conf
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/machine.conf
@@ -71,7 +71,6 @@ PREFERRED_VERSION_{{=preferred_kernel}} ?= "{{=preferred_kernel_version}}%"
 {{ if xserver == "y": }}
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 XSERVER ?= "xserver-xorg \
-           xf86-input-evdev \
            xf86-video-fbdev"
 
 PREFERRED_VERSION_u-boot ?= "v2016.01%"
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
index 67e1cbd..9188858 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
@@ -54,9 +54,6 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 XSERVER = "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
-           xf86-input-vmmouse \
-           xf86-input-keyboard \
-           xf86-input-evdev \
            xf86-video-vmware"
 
 {{ if qemuarch == "arm": }}
-- 
2.1.4



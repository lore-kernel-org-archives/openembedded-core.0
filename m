Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8224B71C73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:38:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Oct 2016 01:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="1059303106"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2016 01:38:03 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 9755D6A4006;
	Wed, 26 Oct 2016 01:37:28 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:38 +0300
Message-Id: <eef0cfd22ef6edf1da7f907e52645e5c144f4df2.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
References: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 15/16] conf: Use xf86-input-libinput by default
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
X-List-Received-Date: Wed, 26 Oct 2016 08:38:01 -0000

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
 meta/conf/machine/include/qemu.inc                                   | 4 +---
 meta/conf/machine/include/x86-base.inc                               | 4 ----
 meta/conf/machine/qemux86-64.conf                                    | 3 ---
 meta/conf/machine/qemux86.conf                                       | 3 ---
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc                  | 2 +-
 6 files changed, 3 insertions(+), 15 deletions(-)

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
-- 
2.1.4



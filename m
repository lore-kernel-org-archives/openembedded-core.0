Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 02B0071CC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:38:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 26 Oct 2016 01:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="183964807"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2016 01:38:05 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 0BE196A4006;
	Wed, 26 Oct 2016 01:37:29 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:39 +0300
Message-Id: <d5059221d8edd4c5069e7a428bdb1a1be2a66c59.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
References: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 16/16] xserver-xf86-config: Remove legacy drivers from xorg.conf
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
X-List-Received-Date: Wed, 26 Oct 2016 08:38:03 -0000

Trying to configure evdev and mouse leads to errors in X startup
because xf86-input-libinput is now the default. No configuration
should be needed: xf86-input-libinput should just work out-of-the-box.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xserver-xf86-config/qemuarm/xorg.conf          | 31 ----------------------
 .../xserver-xf86-config/qemumips/xorg.conf         | 31 ----------------------
 .../xserver-xf86-config/qemumips64/xorg.conf       | 31 ----------------------
 .../xserver-xf86-config/qemuppc/xorg.conf          | 31 ----------------------
 .../xserver-xf86-config/qemush4/xorg.conf          | 31 ----------------------
 .../xserver-xf86-config/qemux86-64/xorg.conf       | 31 ----------------------
 .../xserver-xf86-config/qemux86/xorg.conf          | 31 ----------------------
 7 files changed, 217 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
index 629ae21..f4cd139 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
@@ -2,34 +2,6 @@
 Section "Files"
 EndSection
 
-Section "InputDevice"
-    Identifier    "Generic Keyboard"
-    Driver        "evdev"
-    Option        "CoreKeyboard"
-    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
-    Option        "XkbRules"    "xorg"
-    Option        "XkbModel"    "evdev"
-    Option        "XkbLayout"    "us"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Configured Mouse"
-    Driver        "mouse"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/mice"
-    Option        "Protocol"        "ImPS/2"
-    Option        "ZAxisMapping"        "4 5"
-    Option        "Emulate3Buttons"    "true"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Qemu Tablet"
-    Driver        "evdev"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/touchscreen0"
-    Option        "USB"           "on"
-EndSection
-
 Section "Device"
     Identifier    "Graphics Controller"
     Driver        "fbdev"
@@ -62,8 +34,5 @@ EndSection
 Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
-    InputDevice    "Generic Keyboard"
-    # InputDevice    "Configured Mouse"
-    InputDevice    "QEMU Tablet"
     Option         "AllowEmptyInput" "no"
 EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
index e6c8b51..1d3c64f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
@@ -2,34 +2,6 @@
 Section "Files"
 EndSection
 
-Section "InputDevice"
-    Identifier    "Generic Keyboard"
-    Driver        "evdev"
-    Option        "CoreKeyboard"
-    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
-    Option        "XkbRules"    "xorg"
-    Option        "XkbModel"    "evdev"
-    Option        "XkbLayout"    "us"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Configured Mouse"
-    Driver        "mouse"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/mice"
-    Option        "Protocol"        "ImPS/2"
-    Option        "ZAxisMapping"        "4 5"
-    Option        "Emulate3Buttons"    "true"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Qemu Tablet"
-    Driver        "evdev"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/touchscreen0"
-    Option        "USB"           "on"
-EndSection
-
 Section "Device"
     Identifier    "Graphics Controller"
     Driver        "fbdev"
@@ -63,8 +35,5 @@ EndSection
 Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
-    InputDevice    "Generic Keyboard"
-    # InputDevice    "Configured Mouse"
-    InputDevice    "QEMU Tablet"
     Option         "AllowEmptyInput" "no"
 EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
index 629ae21..f4cd139 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
@@ -2,34 +2,6 @@
 Section "Files"
 EndSection
 
-Section "InputDevice"
-    Identifier    "Generic Keyboard"
-    Driver        "evdev"
-    Option        "CoreKeyboard"
-    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
-    Option        "XkbRules"    "xorg"
-    Option        "XkbModel"    "evdev"
-    Option        "XkbLayout"    "us"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Configured Mouse"
-    Driver        "mouse"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/mice"
-    Option        "Protocol"        "ImPS/2"
-    Option        "ZAxisMapping"        "4 5"
-    Option        "Emulate3Buttons"    "true"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Qemu Tablet"
-    Driver        "evdev"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/touchscreen0"
-    Option        "USB"           "on"
-EndSection
-
 Section "Device"
     Identifier    "Graphics Controller"
     Driver        "fbdev"
@@ -62,8 +34,5 @@ EndSection
 Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
-    InputDevice    "Generic Keyboard"
-    # InputDevice    "Configured Mouse"
-    InputDevice    "QEMU Tablet"
     Option         "AllowEmptyInput" "no"
 EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
index 629ae21..f4cd139 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
@@ -2,34 +2,6 @@
 Section "Files"
 EndSection
 
-Section "InputDevice"
-    Identifier    "Generic Keyboard"
-    Driver        "evdev"
-    Option        "CoreKeyboard"
-    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
-    Option        "XkbRules"    "xorg"
-    Option        "XkbModel"    "evdev"
-    Option        "XkbLayout"    "us"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Configured Mouse"
-    Driver        "mouse"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/mice"
-    Option        "Protocol"        "ImPS/2"
-    Option        "ZAxisMapping"        "4 5"
-    Option        "Emulate3Buttons"    "true"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Qemu Tablet"
-    Driver        "evdev"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/touchscreen0"
-    Option        "USB"           "on"
-EndSection
-
 Section "Device"
     Identifier    "Graphics Controller"
     Driver        "fbdev"
@@ -62,8 +34,5 @@ EndSection
 Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
-    InputDevice    "Generic Keyboard"
-    # InputDevice    "Configured Mouse"
-    InputDevice    "QEMU Tablet"
     Option         "AllowEmptyInput" "no"
 EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
index 629ae21..f4cd139 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
@@ -2,34 +2,6 @@
 Section "Files"
 EndSection
 
-Section "InputDevice"
-    Identifier    "Generic Keyboard"
-    Driver        "evdev"
-    Option        "CoreKeyboard"
-    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
-    Option        "XkbRules"    "xorg"
-    Option        "XkbModel"    "evdev"
-    Option        "XkbLayout"    "us"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Configured Mouse"
-    Driver        "mouse"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/mice"
-    Option        "Protocol"        "ImPS/2"
-    Option        "ZAxisMapping"        "4 5"
-    Option        "Emulate3Buttons"    "true"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Qemu Tablet"
-    Driver        "evdev"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/touchscreen0"
-    Option        "USB"           "on"
-EndSection
-
 Section "Device"
     Identifier    "Graphics Controller"
     Driver        "fbdev"
@@ -62,8 +34,5 @@ EndSection
 Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
-    InputDevice    "Generic Keyboard"
-    # InputDevice    "Configured Mouse"
-    InputDevice    "QEMU Tablet"
     Option         "AllowEmptyInput" "no"
 EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
index bbda9ea..c12d92c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
@@ -2,34 +2,6 @@
 Section "Files"
 EndSection
 
-Section "InputDevice"
-    Identifier    "Generic Keyboard"
-    Driver        "evdev"
-    Option        "CoreKeyboard"
-    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
-    Option        "XkbRules"    "xorg"
-    Option        "XkbModel"    "evdev"
-    Option        "XkbLayout"    "us"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Configured Mouse"
-    Driver        "vmmouse"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/mice"
-    Option        "Protocol"        "ImPS/2"
-    Option        "ZAxisMapping"        "4 5"
-    Option        "Emulate3Buttons"    "true"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Qemu Tablet"
-    Driver        "evdev"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/touchscreen0"
-    Option        "USB"           "on"
-EndSection
-
 Section "Monitor"
     Identifier    "Generic Monitor"
     Option        "DPMS"
@@ -57,8 +29,5 @@ EndSection
 Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
-    InputDevice    "Generic Keyboard"
-    # InputDevice    "Configured Mouse"
-    InputDevice    "QEMU Tablet"
     Option         "AllowEmptyInput" "no"
 EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
index bbda9ea..c12d92c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
@@ -2,34 +2,6 @@
 Section "Files"
 EndSection
 
-Section "InputDevice"
-    Identifier    "Generic Keyboard"
-    Driver        "evdev"
-    Option        "CoreKeyboard"
-    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
-    Option        "XkbRules"    "xorg"
-    Option        "XkbModel"    "evdev"
-    Option        "XkbLayout"    "us"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Configured Mouse"
-    Driver        "vmmouse"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/mice"
-    Option        "Protocol"        "ImPS/2"
-    Option        "ZAxisMapping"        "4 5"
-    Option        "Emulate3Buttons"    "true"
-EndSection
-
-Section "InputDevice"
-    Identifier    "Qemu Tablet"
-    Driver        "evdev"
-    Option        "CorePointer"
-    Option        "Device"        "/dev/input/touchscreen0"
-    Option        "USB"           "on"
-EndSection
-
 Section "Monitor"
     Identifier    "Generic Monitor"
     Option        "DPMS"
@@ -57,8 +29,5 @@ EndSection
 Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
-    InputDevice    "Generic Keyboard"
-    # InputDevice    "Configured Mouse"
-    InputDevice    "QEMU Tablet"
     Option         "AllowEmptyInput" "no"
 EndSection
-- 
2.1.4



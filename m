Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStgx-00033M-Ik
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:31:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 May 2012 10:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99043273"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.250])
	by AZSMGA002.ch.intel.com with ESMTP; 11 May 2012 10:21:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2012 10:21:46 -0700
Message-Id: <cbe76114918fe3d29b053847dc4038037646a600.1336756650.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336756650.git.sgw@linux.intel.com>
References: <cover.1336756650.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336756650.git.sgw@linux.intel.com>
References: <cover.1336756650.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 2/4] xserver-xf86-config: Add xorg.conf for arm, mips, ppc, sh qemu machines
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
X-List-Received-Date: Fri, 11 May 2012 17:31:48 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xserver-xf86-config/qemuarm/xorg.conf          |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemumips/xorg.conf         |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemumips64/xorg.conf       |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemuppc/xorg.conf          |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemush4/xorg.conf          |   69 ++++++++++++++++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |    2 +-
 6 files changed, 346 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
new file mode 100644
index 0000000..629ae21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
@@ -0,0 +1,69 @@
+
+Section "Files"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Generic Keyboard"
+    Driver        "evdev"
+    Option        "CoreKeyboard"
+    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
+    Option        "XkbRules"    "xorg"
+    Option        "XkbModel"    "evdev"
+    Option        "XkbLayout"    "us"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Configured Mouse"
+    Driver        "mouse"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/mice"
+    Option        "Protocol"        "ImPS/2"
+    Option        "ZAxisMapping"        "4 5"
+    Option        "Emulate3Buttons"    "true"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Qemu Tablet"
+    Driver        "evdev"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/touchscreen0"
+    Option        "USB"           "on"
+EndSection
+
+Section "Device"
+    Identifier    "Graphics Controller"
+    Driver        "fbdev"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
+    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
+    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
+    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
+    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
+    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
+    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
+    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
+    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
+    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Graphics Controller"
+    Monitor        "Generic Monitor"
+    SubSection "Display"
+        Modes     "640x480"
+    EndSubSection
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+    InputDevice    "Generic Keyboard"
+    # InputDevice    "Configured Mouse"
+    InputDevice    "QEMU Tablet"
+    Option         "AllowEmptyInput" "no"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
new file mode 100644
index 0000000..629ae21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
@@ -0,0 +1,69 @@
+
+Section "Files"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Generic Keyboard"
+    Driver        "evdev"
+    Option        "CoreKeyboard"
+    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
+    Option        "XkbRules"    "xorg"
+    Option        "XkbModel"    "evdev"
+    Option        "XkbLayout"    "us"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Configured Mouse"
+    Driver        "mouse"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/mice"
+    Option        "Protocol"        "ImPS/2"
+    Option        "ZAxisMapping"        "4 5"
+    Option        "Emulate3Buttons"    "true"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Qemu Tablet"
+    Driver        "evdev"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/touchscreen0"
+    Option        "USB"           "on"
+EndSection
+
+Section "Device"
+    Identifier    "Graphics Controller"
+    Driver        "fbdev"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
+    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
+    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
+    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
+    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
+    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
+    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
+    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
+    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
+    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Graphics Controller"
+    Monitor        "Generic Monitor"
+    SubSection "Display"
+        Modes     "640x480"
+    EndSubSection
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+    InputDevice    "Generic Keyboard"
+    # InputDevice    "Configured Mouse"
+    InputDevice    "QEMU Tablet"
+    Option         "AllowEmptyInput" "no"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
new file mode 100644
index 0000000..629ae21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
@@ -0,0 +1,69 @@
+
+Section "Files"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Generic Keyboard"
+    Driver        "evdev"
+    Option        "CoreKeyboard"
+    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
+    Option        "XkbRules"    "xorg"
+    Option        "XkbModel"    "evdev"
+    Option        "XkbLayout"    "us"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Configured Mouse"
+    Driver        "mouse"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/mice"
+    Option        "Protocol"        "ImPS/2"
+    Option        "ZAxisMapping"        "4 5"
+    Option        "Emulate3Buttons"    "true"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Qemu Tablet"
+    Driver        "evdev"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/touchscreen0"
+    Option        "USB"           "on"
+EndSection
+
+Section "Device"
+    Identifier    "Graphics Controller"
+    Driver        "fbdev"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
+    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
+    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
+    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
+    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
+    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
+    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
+    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
+    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
+    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Graphics Controller"
+    Monitor        "Generic Monitor"
+    SubSection "Display"
+        Modes     "640x480"
+    EndSubSection
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+    InputDevice    "Generic Keyboard"
+    # InputDevice    "Configured Mouse"
+    InputDevice    "QEMU Tablet"
+    Option         "AllowEmptyInput" "no"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
new file mode 100644
index 0000000..629ae21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
@@ -0,0 +1,69 @@
+
+Section "Files"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Generic Keyboard"
+    Driver        "evdev"
+    Option        "CoreKeyboard"
+    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
+    Option        "XkbRules"    "xorg"
+    Option        "XkbModel"    "evdev"
+    Option        "XkbLayout"    "us"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Configured Mouse"
+    Driver        "mouse"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/mice"
+    Option        "Protocol"        "ImPS/2"
+    Option        "ZAxisMapping"        "4 5"
+    Option        "Emulate3Buttons"    "true"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Qemu Tablet"
+    Driver        "evdev"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/touchscreen0"
+    Option        "USB"           "on"
+EndSection
+
+Section "Device"
+    Identifier    "Graphics Controller"
+    Driver        "fbdev"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
+    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
+    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
+    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
+    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
+    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
+    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
+    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
+    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
+    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Graphics Controller"
+    Monitor        "Generic Monitor"
+    SubSection "Display"
+        Modes     "640x480"
+    EndSubSection
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+    InputDevice    "Generic Keyboard"
+    # InputDevice    "Configured Mouse"
+    InputDevice    "QEMU Tablet"
+    Option         "AllowEmptyInput" "no"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
new file mode 100644
index 0000000..629ae21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
@@ -0,0 +1,69 @@
+
+Section "Files"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Generic Keyboard"
+    Driver        "evdev"
+    Option        "CoreKeyboard"
+    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
+    Option        "XkbRules"    "xorg"
+    Option        "XkbModel"    "evdev"
+    Option        "XkbLayout"    "us"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Configured Mouse"
+    Driver        "mouse"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/mice"
+    Option        "Protocol"        "ImPS/2"
+    Option        "ZAxisMapping"        "4 5"
+    Option        "Emulate3Buttons"    "true"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Qemu Tablet"
+    Driver        "evdev"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/touchscreen0"
+    Option        "USB"           "on"
+EndSection
+
+Section "Device"
+    Identifier    "Graphics Controller"
+    Driver        "fbdev"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
+    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
+    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
+    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
+    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
+    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
+    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
+    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
+    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
+    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Graphics Controller"
+    Monitor        "Generic Monitor"
+    SubSection "Display"
+        Modes     "640x480"
+    EndSubSection
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+    InputDevice    "Generic Keyboard"
+    # InputDevice    "Configured Mouse"
+    InputDevice    "QEMU Tablet"
+    Option         "AllowEmptyInput" "no"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 970b4bd..3c29f8b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.7.6




Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4563AC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 11:22:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6473.1741692168393352536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 04:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0268F152B
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 04:22:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DE613F673
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 04:22:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] xserver-xf86-config: remove obsolete configuration files
Date: Tue, 11 Mar 2025 11:22:41 +0000
Message-ID: <20250311112242.1750761-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311112242.1750761-1-ross.burton@arm.com>
References: <20250311112242.1750761-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 11:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212561

For reasons we have explicit xorg.conf files for a number of the qemu
machines, but not all of them. These mainly disabled screen blanking
(which is now down with a separate fragment) but also explictly set the
device driver to fbdev which meant they didn't use the modesettings
driver as they should (with the virtio framebuffer from qemu).

This is the root cause of why the xserver 21.1.16 upgrade doesn't work
on a number of machines: the /sys probing changed and the fbdev driver
now refuses to use the PCI framebuffer device as there are better
drivers, but we've explictly told xorg to use the wrong driver.

For more details, see https://gitlab.freedesktop.org/xorg/xserver/-/issue=
s/1798.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xserver-xf86-config/qemuarm/xorg.conf     | 42 -------------------
 .../xserver-xf86-config/qemuppc/xorg.conf     | 42 -------------------
 .../xserver-xf86-config/qemush4/xorg.conf     | 42 -------------------
 .../xserver-xf86-config/qemux86-64/xorg.conf  | 37 ----------------
 .../xserver-xf86-config/qemux86/xorg.conf     | 37 ----------------
 5 files changed, 200 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-confi=
g/qemuarm/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-confi=
g/qemuppc/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-confi=
g/qemush4/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-confi=
g/qemux86-64/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-confi=
g/qemux86/xorg.conf

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemua=
rm/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qem=
uarm/xorg.conf
deleted file mode 100644
index 3eb380a0a4e..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg=
.conf
+++ /dev/null
@@ -1,42 +0,0 @@
-
-Section "Files"
-EndSection
-
-Section "Device"
-    Identifier    "Graphics Controller"
-    Driver        "fbdev"
-EndSection
-
-Section "Monitor"
-    Identifier    "Generic Monitor"
-    Option        "DPMS"
-    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
-    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 =
624 -hsync +vsync
-    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
-    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525=
 -hsync -vsync
-    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
-    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520=
 -hsync -vsync
-    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
-    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500=
 -hsync -vsync
-    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
-    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509=
 -hsync -vsync
-EndSection
-
-Section "Screen"
-    Identifier    "Default Screen"
-    Device        "Graphics Controller"
-    Monitor        "Generic Monitor"
-    SubSection "Display"
-        Modes     "640x480"
-    EndSubSection
-EndSection
-
-Section "ServerLayout"
-    Identifier    "Default Layout"
-    Screen        "Default Screen"
-    Option         "AllowEmptyInput" "no"
-    Option        "BlankTime" "0"
-    Option        "StandbyTime" "0"
-    Option        "SuspendTime" "0"
-    Option        "OffTime" "0"
-EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemup=
pc/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qem=
uppc/xorg.conf
deleted file mode 100644
index 3eb380a0a4e..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg=
.conf
+++ /dev/null
@@ -1,42 +0,0 @@
-
-Section "Files"
-EndSection
-
-Section "Device"
-    Identifier    "Graphics Controller"
-    Driver        "fbdev"
-EndSection
-
-Section "Monitor"
-    Identifier    "Generic Monitor"
-    Option        "DPMS"
-    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
-    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 =
624 -hsync +vsync
-    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
-    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525=
 -hsync -vsync
-    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
-    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520=
 -hsync -vsync
-    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
-    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500=
 -hsync -vsync
-    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
-    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509=
 -hsync -vsync
-EndSection
-
-Section "Screen"
-    Identifier    "Default Screen"
-    Device        "Graphics Controller"
-    Monitor        "Generic Monitor"
-    SubSection "Display"
-        Modes     "640x480"
-    EndSubSection
-EndSection
-
-Section "ServerLayout"
-    Identifier    "Default Layout"
-    Screen        "Default Screen"
-    Option         "AllowEmptyInput" "no"
-    Option        "BlankTime" "0"
-    Option        "StandbyTime" "0"
-    Option        "SuspendTime" "0"
-    Option        "OffTime" "0"
-EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemus=
h4/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qem=
ush4/xorg.conf
deleted file mode 100644
index 3eb380a0a4e..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg=
.conf
+++ /dev/null
@@ -1,42 +0,0 @@
-
-Section "Files"
-EndSection
-
-Section "Device"
-    Identifier    "Graphics Controller"
-    Driver        "fbdev"
-EndSection
-
-Section "Monitor"
-    Identifier    "Generic Monitor"
-    Option        "DPMS"
-    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
-    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 =
624 -hsync +vsync
-    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
-    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525=
 -hsync -vsync
-    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
-    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520=
 -hsync -vsync
-    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
-    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500=
 -hsync -vsync
-    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
-    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509=
 -hsync -vsync
-EndSection
-
-Section "Screen"
-    Identifier    "Default Screen"
-    Device        "Graphics Controller"
-    Monitor        "Generic Monitor"
-    SubSection "Display"
-        Modes     "640x480"
-    EndSubSection
-EndSection
-
-Section "ServerLayout"
-    Identifier    "Default Layout"
-    Screen        "Default Screen"
-    Option         "AllowEmptyInput" "no"
-    Option        "BlankTime" "0"
-    Option        "StandbyTime" "0"
-    Option        "SuspendTime" "0"
-    Option        "OffTime" "0"
-EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux=
86-64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/=
qemux86-64/xorg.conf
deleted file mode 100644
index c01c3331c58..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/x=
org.conf
+++ /dev/null
@@ -1,37 +0,0 @@
-
-Section "Files"
-EndSection
-
-Section "Monitor"
-    Identifier    "Generic Monitor"
-    Option        "DPMS"
-    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
-    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 =
624 -hsync +vsync
-    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
-    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525=
 -hsync -vsync
-    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
-    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520=
 -hsync -vsync
-    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
-    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500=
 -hsync -vsync
-    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
-    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509=
 -hsync -vsync
-EndSection
-
-Section "Screen"
-    Identifier    "Default Screen"
-    Device        "Graphics Controller"
-    Monitor        "Generic Monitor"
-    SubSection "Display"
-        Modes     "640x480"
-    EndSubSection
-EndSection
-
-Section "ServerLayout"
-    Identifier    "Default Layout"
-    Screen        "Default Screen"
-    Option         "AllowEmptyInput" "no"
-    Option        "BlankTime" "0"
-    Option        "StandbyTime" "0"
-    Option        "SuspendTime" "0"
-    Option        "OffTime" "0"
-EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux=
86/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qem=
ux86/xorg.conf
deleted file mode 100644
index c01c3331c58..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg=
.conf
+++ /dev/null
@@ -1,37 +0,0 @@
-
-Section "Files"
-EndSection
-
-Section "Monitor"
-    Identifier    "Generic Monitor"
-    Option        "DPMS"
-    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
-    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 =
624 -hsync +vsync
-    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
-    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525=
 -hsync -vsync
-    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
-    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520=
 -hsync -vsync
-    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
-    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500=
 -hsync -vsync
-    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
-    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509=
 -hsync -vsync
-EndSection
-
-Section "Screen"
-    Identifier    "Default Screen"
-    Device        "Graphics Controller"
-    Monitor        "Generic Monitor"
-    SubSection "Display"
-        Modes     "640x480"
-    EndSubSection
-EndSection
-
-Section "ServerLayout"
-    Identifier    "Default Layout"
-    Screen        "Default Screen"
-    Option         "AllowEmptyInput" "no"
-    Option        "BlankTime" "0"
-    Option        "StandbyTime" "0"
-    Option        "SuspendTime" "0"
-    Option        "OffTime" "0"
-EndSection
--=20
2.43.0



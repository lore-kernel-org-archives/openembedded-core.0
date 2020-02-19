Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA42613C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:20 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z7so1924411wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=esbB5q/iVwft8+k1Pvk753zzkLt29w0CH/tuo5PuMwk=;
	b=OjGTk+H/hZ/wxoi907GqoMLeVRWGw9zVjynJWQYaAD962G4pGTrQezcXq8w8X4RRSv
	vkj87GDEr/JSHW1mbcMt/BA/KhdgbbFSm9qNXaptSHWRUCyQNzepS9ALaoLZ3Hx5X7v0
	ewVKjlcqJtjp0dg8VNuYFDSAY94ANogWq6GRD7jQr3vrMccr6cqc2bvm12r9YpVEaeyh
	nsINuQp3XbDGW26+N49jnwucEZ4V2xAahAikDdFvk822q3rCjQxND3+Xqu+g4VdZRdw8
	F2Ta8z+LRIawKL+qqrqUyvxJSWw1yKkWScmbHUNl1V5/mYGfj4/FFAav3uo02sqvsWSo
	naGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=esbB5q/iVwft8+k1Pvk753zzkLt29w0CH/tuo5PuMwk=;
	b=oEsJ+cYtG+nODnPb0rm3ZaB7ZI2HakROBgq5FnBdBNcwDSlrUNF/SnLq6xquTb0jv7
	h+mv7ovxo17gTqQ9IZhx0SquYWTF6aisw22CCr716rrggW5X2pexn90LBhQMxujEF9z/
	SOEDqVpQT1PjQt8rPN2Xln+b5U18xCuGImiu/BmMl7yGVXKfQnVIQ9ADqRvFb+wNczDA
	5jom/1ol4CGdWM3eGOFtJDR/qJz7mKEpWfZUiT2kf1WtH5ba8XtlY68qrKqSFTDStX2J
	d2n3og+DsUlmPGHxv/sCA8tGYxmBXAKDNX1XnhQTUSrLd4zr9xII/E6Rhf9V/AJ6Nnex
	S3Ig==
X-Gm-Message-State: APjAAAWvIf7n7o6R2RqScM7zVQYvI2QUtyF+qxkjF466lqAj0dl2tKUK
	2mWeZVyE7QmoJXwmmylowLSVFsca
X-Google-Smtp-Source: APXvYqzH0UVJ4szr73nIvjvhQ5stiu0RC+jBjZynPnECrNbzkoKAWoQ1iSF0J4tFjHm/BQNIuhYhnQ==
X-Received: by 2002:adf:8b59:: with SMTP id v25mr39106796wra.419.1582141701397;
	Wed, 19 Feb 2020 11:48:21 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:45 +0100
Message-Id: <20200219194752.7967-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/13] qemumips: use std vga instead of cirrus vga
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:21 -0000
Content-Transfer-Encoding: 8bit

This is what the upstream recommends nowadays:
https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/

I have verified that both X and weston continue to boot and look
right; however xorg.conf file needs to be removed as it is cirrus
specific and doesn't work and isn't needed with std vga.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-mips.inc   |  2 +-
 .../xserver-xf86-config/qemumips/xorg.conf    | 39 -------------------
 .../xserver-xf86-config/qemumips64/xorg.conf  | 39 -------------------
 3 files changed, 1 insertion(+), 79 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index d44b96c18c..f1f7c2ae20 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -7,4 +7,4 @@ QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_OPT_APPEND += "-device cirrus-vga"
+QB_OPT_APPEND += "-vga std"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
deleted file mode 100644
index 1d3c64f620..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
+++ /dev/null
@@ -1,39 +0,0 @@
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
-    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
-    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
-    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
-    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
-    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
-    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
-    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
-    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
-    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
-EndSection
-
-Section "Screen"
-    Identifier    "Default Screen"
-    Device        "Graphics Controller"
-    Monitor        "Generic Monitor"
-    DefaultDepth  16
-    SubSection "Display"
-        Modes     "640x480"
-    EndSubSection
-EndSection
-
-Section "ServerLayout"
-    Identifier    "Default Layout"
-    Screen        "Default Screen"
-    Option         "AllowEmptyInput" "no"
-EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
deleted file mode 100644
index 03b94dc3af..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
+++ /dev/null
@@ -1,39 +0,0 @@
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
-    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
-    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
-    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
-    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
-    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
-    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
-    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
-    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
-    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
-EndSection
-
-Section "Screen"
-    Identifier    "Default Screen"
-    Device        "Graphics Controller"
-    Monitor        "Generic Monitor"
-    DefaultDepth    16
-    SubSection "Display"
-        Modes     "640x480"
-    EndSubSection
-EndSection
-
-Section "ServerLayout"
-    Identifier    "Default Layout"
-    Screen        "Default Screen"
-    Option         "AllowEmptyInput" "no"
-EndSection
-- 
2.25.0



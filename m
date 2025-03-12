Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0E6C35FF3
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.4685.1741809196531776180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PYzw7b4Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2255003f4c6so4916255ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809196; x=1742413996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwCY3/Dt0bi3hQjfeUAJOjCoE/Ao8NdT0f7z//fPoAU=;
        b=PYzw7b4ZXt9J79UrASU8njDMbj6Jh/fIPqEhqN11UEAcEF5H4J0JDikzzv/psVLvOh
         hAqoCtts0uQi8mQN/5kWWxBI3pfHMArrM1O2XvHA6BUQ2jqDceM6/wvm+xdCxm5tOuZj
         G75mrRqte80n8bF0oMABA9EUoRHYPzg992IrbttNWkAbKojV9iF3KASKkq9UD1V+kGVq
         Rf1EGufmtGWMKwbKaKAuxhREADXNu/Vu9IFhTcIsIk/pnvX8GRnF64mAuBT6P0lFRai0
         iY4S3oJW3axzg+FWzxVyCOb2KahJCcSgA4yqfuIEPift2nA78ZgtU7sMnWK6tFRbNZLw
         LRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809196; x=1742413996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwCY3/Dt0bi3hQjfeUAJOjCoE/Ao8NdT0f7z//fPoAU=;
        b=J/UWBH/Ib+bF04Na8AGzvpoZw5imvn6Hebe94IP4Ja503Xg2D40VBcWJ16ZOoGmqA7
         Gz28gmn1fj3NgBEM4kjQW2QaK2F7nhuBJ6bhzuiVY8HdDzAPRtVKNAl+AukJ2bOyiwUs
         DxLQC7C9SuNexWjhUFB8OeeZvziIWiOZiKdLscmk0+EFcVl8dUuTtFwMxxiq+sFIiiww
         wfeqtRSPYfHtQIqWMqZheldsBK+RsGjsYSNshBCE27I/A6KzeTziihvM3W3MqJ+4DSM1
         S6V3vJ7BvEwpPs6wuVrAbUD64/NZ252JNr6CfBPm6Jv0XJPy7WjBUvDCqQ52Gx4lplNw
         0/mQ==
X-Gm-Message-State: AOJu0YwGDL/2abVcPH98OzXXAqOmd4ShYDVhUsyle4BHxBDS0vEQlDLx
	6CjdHZ5qImUzEnWSJTmqU5nroMD/CCNRJDGjcdZManjYoUDWZiE3Lok12Jxx848W32ZoNNIWAMM
	c
X-Gm-Gg: ASbGnct7+eYUehoeK7nrnZgXTl4gzYpAg8MME/LOdc5J5KdnQAwieYfbm0/9lfl3mEO
	38SSRDeC7cF/+gJNpncsKTWGwZpscG+K6LFTYiIH0RVH0XhWKzwVEIsZPUZtQId2cXL38lvJ5bW
	NOhduTYRLyZsg2vUqLmg9m3pte/zUQ0R+wVKSemrQE+ISPKaz7PvEU7zohsZ3wlbNnXHmGsLddE
	0vNd06iqYqz1qZxC/6Z3ToATzLAiprfX1dVGl99NipMKC4fUOCRfpfMdojGSah9l2BX7A3OE3yd
	6vMzAAAkQ8KO6B87Um3+bQVl/K2zN3l7ZiU=
X-Google-Smtp-Source: AGHT+IF9CCLF4xP0z2xKlLWzWWJwEWlxFxmo0deXeaWbKSQnwgLFDmQ7WruYU8bgE+FY5Azfby+yGA==
X-Received: by 2002:a05:6a21:4cc7:b0:1f3:36f7:c0d2 with SMTP id adf61e73a8af0-1f58cbf3befmr14041344637.41.1741809195637;
        Wed, 12 Mar 2025 12:53:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 24/25] xserver-xf86-config: remove obsolete configuration files
Date: Wed, 12 Mar 2025 12:52:32 -0700
Message-ID: <73f39fe8a5367ad905002df03e10fbf59b8f8921.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212691

From: Ross Burton <ross.burton@arm.com>

For reasons we have explicit xorg.conf files for a number of the qemu
machines, but not all of them. These mainly disabled screen blanking
(which is now down with a separate fragment) but also explictly set the
device driver to fbdev which meant they didn't use the modesettings
driver as they should (with the virtio framebuffer from qemu).

This is the root cause of why the xserver 21.1.16 upgrade doesn't work
on a number of machines: the /sys probing changed and the fbdev driver
now refuses to use the PCI framebuffer device as there are better
drivers, but we've explictly told xorg to use the wrong driver.

For more details, see https://gitlab.freedesktop.org/xorg/xserver/-/issues/1798.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c8039bf4c2d011e3d12c970ce45036b184902a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xf86-config/qemuarm/xorg.conf     | 42 -------------------
 .../xserver-xf86-config/qemuppc/xorg.conf     | 42 -------------------
 .../xserver-xf86-config/qemush4/xorg.conf     | 42 -------------------
 .../xserver-xf86-config/qemux86-64/xorg.conf  | 37 ----------------
 .../xserver-xf86-config/qemux86/xorg.conf     | 37 ----------------
 5 files changed, 200 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
deleted file mode 100644
index 3eb380a0a4..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
deleted file mode 100644
index 3eb380a0a4..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
deleted file mode 100644
index 3eb380a0a4..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
deleted file mode 100644
index c01c3331c5..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
deleted file mode 100644
index c01c3331c5..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
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
-- 
2.43.0



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7580C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:47 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.4578.1741809397986903171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eekLfVAz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff65d88103so474396a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809397; x=1742414197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwCY3/Dt0bi3hQjfeUAJOjCoE/Ao8NdT0f7z//fPoAU=;
        b=eekLfVAzzx0WEwDtpD2tpsCyg5p4qsyLTm8L9ru6/zY+szUvietzcdZIxMwrLMzAgM
         78PHFshiGpvnc1QFk2TQ6jCjxxfxtvb9sBng7nqYs4v0OyUp7Xi4QVN7XRQvFr6p9tqz
         oCdAR6edwurWiRukuz3uBosO9KKixg9oUnWd6lVY6f9EW5WO1gUqtr5ntmcjL4mSk6hV
         Xdv01iUtM764ltTt1oTPy98bot4KtS2rmHSmuAhjjZwn06wJ3eug+Tz6JKeG8m6SYEhw
         lRjkClID43uY1UvI7fM/l2ToqW++bcFCxzbzF5kyLFm6hA0uODMB/dbukOpi+7Cjfx6D
         YkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809397; x=1742414197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwCY3/Dt0bi3hQjfeUAJOjCoE/Ao8NdT0f7z//fPoAU=;
        b=iIciWqozAszxtyq1uv1JPjALR5SRe7KjNF4wraqBLULFaxiDscU4Q9xEcEVAyyVJIn
         kFkyux1v3rzB2rihOsRxotGYtPR3BGJz3F9UQD9xqJxpujuu9fvdGNWcJNlJeIvr0GdE
         5/AB2swRZyDOBPU2tTowC3T6AXJpKs5ozv9wc/x3ibtLOPkjhkKG6T9/RbhVAUOUywIx
         M8faQ1SYC8OZawLQMTe/oGXjG3trzepMgJ9dnWlYGtNzQ64yyXGimuHDu4AW9WFdzq8s
         kEfCbNhPUpVEDLv5ENjTr3pCAKEgoz+UWshdfPADSDusPH1TPqtRKtDJLaX6GhOx8XPk
         mFzg==
X-Gm-Message-State: AOJu0YywhcrG4XhODTj6mxxlBb4kDBz93tTDnBFhqTIN7v3RINfO5gOE
	SoGf3dKQMivT41FeaGQXrnLsmSNs/E0n5FljnfFVGC79PyxKhbrSjebmEvSdr2e3O5lflyrkHRt
	U
X-Gm-Gg: ASbGnctFz75Wa3YlDVISCjCRlnAbguKRIuSucFDlCTxe+IIGYipNvgiB8jQAYDPrMwj
	kJetXc0Rq/AA2AODKzYiJuTvYWEcQWze8z9V1p7Q16xKU4GBUhm/WCeXUpdDM1o4r/fdqMoNZgI
	lhu1yXWmcPNlatAPnX8RTcvCQEv3ynLnmNS+HQH9qOVcII8KIiDMM+3kkKX5kc492nvRRDswqvl
	p+zV5xpjX4qoRNMieoTt0vBDgxOmOyGAAx4urpKINKb2/M/VRIJU2Uqe60gNoNTnNnP0vUopBwO
	c32sw3ciQVhCdaC5LopKrCyO2Svv3gGJjjo=
X-Google-Smtp-Source: AGHT+IHRD14KbESPaHIGXqGVkN951Y/BdaEa0l46u9bfGgcIexako8v5XbuxedFcdxBQ6aJ/MXCusQ==
X-Received: by 2002:a05:6a21:48c:b0:1f5:8f34:bf82 with SMTP id adf61e73a8af0-1f58f34c20dmr14921861637.36.1741809394967;
        Wed, 12 Mar 2025 12:56:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/28] xserver-xf86-config: remove obsolete configuration files
Date: Wed, 12 Mar 2025 12:55:46 -0700
Message-ID: <ccbb0f5491e13d61015872fba93417b91c3213a2.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212720

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



Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.243.1615417535421375313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 15:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=rVsmrxdj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id 18so14476538qty.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 15:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khP1xzWqYesBU79IzaVVDzLf5XR4vK05ue/MuVvpvJk=;
        b=rVsmrxdj75en4XX6coudVKjHxNAoWANO4iumngCdFKKTtJsAcEG3ITM3tWoEsxMgVS
         po5V5YzRqQWCmujTwYxZUCdMwSpILm2XLxnj9AO/DLvEM/UHJIWvJ+1YlQXuPgJe2BGJ
         J82bGhxR3oli2tGSRKiDm7Y5D+PdZhaoT4sBTj0qj/AEfAzMez6kEYJ9xoSIf8IJIL9Q
         49kIqBKcBa9ECMRGMrbWYv4+Do3yyIGVoUQ1YURbfy92QyloxjLT+tPs3C3q6Z0UwlF8
         EJmX2U2yNAB4HVa7exF29eEvMnrOVZPiEzvyZKTzqbkkA3D3rLKhSBLB/q8pOZp0bgRg
         zmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khP1xzWqYesBU79IzaVVDzLf5XR4vK05ue/MuVvpvJk=;
        b=D+E6PBsO1H+vOfmXf8csKlrbg93TOLnViDYixVk/K2LgnDPOkRt2HPAt6eYAeJYFS9
         VDe+Wd4QN4BPhFePBbjkNLIuA8ZY/wFdQVWX1M4Xh57cHFZI6dmU1yTuwil88FEC9ohu
         ofJjA72+0q71PwRxET/PSZtP1rMwdz6HXZpkRcvc7lo7AKZIIibac7ECWg0VBlnPaYo3
         DWoZ/f4SflgG6d7/ZFSYAal5NfEzKRGonm1qdHY19JRhrl7i6WW2PClJ+gP5soEwMenN
         uC3wQv/XvS6rKcyd9rR6EBDssf0Gs8zb4AQK7oGWsWeBeg14tq8/yvKHj/tqApSCg4cj
         j2xA==
X-Gm-Message-State: AOAM530N6O0aF2GyNxEz8QU76DOxO7xDN9OIWabj89H7FhlvlNvdH7uV
	8Bx2Nz0reC3j32JqhpAAzNG41IEpq8ozjw==
X-Google-Smtp-Source: ABdhPJwgaKMTZTCNcG0BWqHvVxCRdEllgm+FS9ZP5zN9lTtLS4XADD3XFCTb5tvsAB1sWXDweHktQQ==
X-Received: by 2002:ac8:5c4b:: with SMTP id j11mr4991815qtj.256.1615417534312;
        Wed, 10 Mar 2021 15:05:34 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a62f:6d00:81d0:be77:cd9:faa8])
        by smtp.gmail.com with ESMTPSA id q2sm618242qkq.59.2021.03.10.15.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 15:05:34 -0800 (PST)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <jon.mason@arm.com>
Subject: [PATCH 1/3] runqemu: add QB_GRAPHICS
Date: Wed, 10 Mar 2021 18:05:31 -0500
Message-Id: <20210310230533.30268-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new runqemu field for VGA devices.  Currently, these are being set
in QB_OPT_APPEND, which can make them difficult to override if importing
the config file into another one.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Change-Id: I8cb9527954c5b06c083c42fe2466cb3338584b7d
---
 meta/classes/qemuboot.bbclass               | 4 ++++
 meta/conf/machine/include/qemuboot-mips.inc | 2 +-
 meta/conf/machine/qemuarm.conf              | 4 ++--
 meta/conf/machine/qemuarm64.conf            | 4 ++--
 scripts/runqemu                             | 2 +-
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 4b7532b3043d..8798ad80e68b 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -72,6 +72,9 @@
 #                      Can be used to automatically determine the image from the other variables
 #                      but define things link 'bootindex' when booting from EFI or 'readonly' when using squashfs
 #                      without the need to specify a dedicated qemu configuration
+#
+# QB_GRAPHICS: QEMU video card type (e.g. "-vga std")
+#
 # Usage:
 # IMAGE_CLASSES += "qemuboot"
 # See "runqemu help" for more info
@@ -86,6 +89,7 @@ QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
 QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0"
 QB_ROOTFS_EXTRA_OPT ?= ""
+QB_GRAPHICS ?= ""
 
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?= "/dev/sd"
diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 230f032c5303..4954f3068c9c 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -5,4 +5,4 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_OPT_APPEND += "-vga std"
+QB_GRAPHICS = "-vga std"
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 257cfa3e63ea..37dae8c86353 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -19,8 +19,8 @@ QB_CPU = "-cpu cortex-a15"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0 vmalloc=256"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_OPT_APPEND = "-device VGA,edid=on"
-QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
+QB_GRAPHICS = "-device VGA,edid=on"
+QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 2f61eb0aed5f..05fd1f749b0f 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -20,8 +20,8 @@ QB_CPU_KVM = "-cpu host -machine gic-version=3"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_OPT_APPEND = "-device VGA,edid=on"
-QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
+QB_GRAPHICS = "-device VGA,edid=on"
+QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
diff --git a/scripts/runqemu b/scripts/runqemu
index cf64ca149c53..4c8358e9de79 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1341,7 +1341,7 @@ class BaseConfig(object):
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
+        self.qemu_opt = "%s %s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('QB_GRAPHICS'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
-- 
2.20.1


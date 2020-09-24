Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.6238.1600910711260051859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 18:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BYeVoHAw;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id o20so813435pfp.11
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 18:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YxMeyfHnIQV1ro+Rlf+6QI32E1Mh9MR9nGVErFU0IHw=;
        b=BYeVoHAwCSz8669G/nNlE0OFvQB+tX+pWkH5VLLmpYlIUI7oN67Q0A07cToOpOMsQB
         xKVLNGEBTw8F+44bzccb2HdhsobYBK51cMhkxLMvaF6RgBbBOVMBe73hdJvCqcXJBPVp
         Dq6qBiSCM4NOIPRXVnqd1O4ckGD1MDs2zG6QXxyTFIePbGRWjqj98WwnkXHuKItcDMt0
         7s5UDsjUBvFG0FfWFahe6pHIQNtHBT8EObcyjzAmO1rcupuIklxkATBlWFpBOfH4lWrg
         8+ta+MmfLO+/AqNHVVMWy46O4Fw3i7JEi9yobm2ewMkjJFuuoJsRS+EsuU4qn2i8VtHi
         nrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YxMeyfHnIQV1ro+Rlf+6QI32E1Mh9MR9nGVErFU0IHw=;
        b=ZpoZpJqo3DqGWCzQuiwZ6/YFcjxA+QgT1EhqlI7Lq0HbmTWqVfbCJCYwnAHgJky9mw
         df+2A9yWWWHVQxKqgVJVAVcs8qoMTG6AIXJ8MSEYz3m6TZu2OGU4Xnow4pWrjQY662F3
         +GLq3MXDNKC9Cz07BWOaMRzQUUH7YE5jyQraiUshM6WMglgke1HzWw6nFeVzNTXXRha4
         UlfdrqNDz/aVVgwidda4acNe1yE+gvsRvVLGtDHvSPUC2A7oviztvpumU1lTNctHAUAP
         xAlFUkynMj+9PBClH1Ci8xK9fJwHRIqrPC4ndhfjHhSEGNwhdxNBmAXIO0GHq7uzVVtO
         mcfA==
X-Gm-Message-State: AOAM533NWI3gd+c/HapWYH939w1i4am8ZiCOuUdBMCgH/vDh1rUXR6XC
	QxlubAP2+pv+a/uMceR/A5IP+Eoi6JjJXQ==
X-Google-Smtp-Source: ABdhPJx1sFdXBg+Ydsxj6XInqS012AbD6sDEHvGB9jc0l6npcxKxac1nk+wbePcLIipXNpYJJBz30A==
X-Received: by 2002:a63:e057:: with SMTP id n23mr1866957pgj.87.1600910710317;
        Wed, 23 Sep 2020 18:25:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5470])
        by smtp.gmail.com with ESMTPSA id l21sm539273pjq.54.2020.09.23.18.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 18:25:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemuboot: Add QB_RNG variable
Date: Wed, 23 Sep 2020 18:25:06 -0700
Message-Id: <20200924012506.1007542-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RNG passthru has been enabled on all qemu machines but its being added
to each one of them, with this patch its turned into QB variables which
defaults to host passthru, yet it can be overridden if needed via
machine or config metadata if needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/qemuboot.bbclass                 | 4 ++++
 meta/conf/machine/include/qemuboot-mips.inc   | 2 --
 meta/conf/machine/include/qemuboot-x86.inc    | 2 --
 meta/conf/machine/include/riscv/qemuriscv.inc | 3 ---
 meta/conf/machine/qemuarm.conf                | 2 --
 meta/conf/machine/qemuarm64.conf              | 2 --
 meta/conf/machine/qemuarmv5.conf              | 2 --
 meta/conf/machine/qemuppc.conf                | 2 --
 scripts/runqemu                               | 2 +-
 9 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index d8f62ef6ea..824676216e 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -29,6 +29,9 @@
 # QB_AUDIO_OPT: qemu audio option, e.g., "-soundhw ac97,es1370", used
 #               when QB_AUDIO_DRV is set.
 #
+# QB_RNG: Pass-through for host random number generator, it can speedup boot
+#         in system mode, where system is experiencing entropy starvation
+#
 # QB_KERNEL_ROOT: kernel's root, e.g., /dev/vda
 #
 # QB_NETWORK_DEVICE: network device, e.g., "-device virtio-net-pci,netdev=net0,mac=@MAC@",
@@ -77,6 +80,7 @@ QB_MEM ?= "-m 256"
 QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
 QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
 QB_DEFAULT_FSTYPE ?= "ext4"
+QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 QB_OPT_APPEND ?= ""
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index e99bade2e3..230f032c53 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -3,8 +3,6 @@ IMAGE_CLASSES += "qemuboot"
 QB_MACHINE = "-machine malta"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
 QB_OPT_APPEND = "-usb -device usb-tablet"
-# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_OPT_APPEND += "-vga std"
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index ccc6dcd3bf..2a4760c717 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -10,6 +10,4 @@ QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
 QB_KERNEL_CMDLINE_APPEND = "oprofile.timer=1"
 QB_OPT_APPEND = "-usb -device usb-tablet"
-# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 759c8a196e..0e88c91aa6 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -33,6 +33,3 @@ QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
-# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND = " -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-device,rng=rng0"
-
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 3364dcf042..702b850cbb 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -21,8 +21,6 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_OPT_APPEND = "-device VGA,edid=on"
 QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
-# Add the virtio RNG
-QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index fdd464d708..2f61eb0aed 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -22,8 +22,6 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_OPT_APPEND = "-device VGA,edid=on"
 QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
-# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 48e83f13e1..7e8c9e1fa6 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -14,8 +14,6 @@ QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 QB_OPT_APPEND = "-usb -device usb-tablet"
-# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 PREFERRED_VERSION_linux-yocto ??= "5.8%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 9733b5e85b..a84594f335 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -17,6 +17,4 @@ QB_MACHINE = "-machine mac99"
 QB_CPU = "-cpu G4"
 QB_KERNEL_CMDLINE_APPEND = "console=tty console=ttyS0"
 QB_OPT_APPEND = "-usb -device usb-tablet"
-# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
diff --git a/scripts/runqemu b/scripts/runqemu
index e62d869c20..e5e66f3453 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1336,7 +1336,7 @@ class BaseConfig(object):
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-        self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
+        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
-- 
2.28.0


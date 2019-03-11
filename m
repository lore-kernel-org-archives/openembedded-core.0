Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 089E9605BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:12:31 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id a22so2891755pgg.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pDEtJmlwiiANVNOvm+sagEaiFFBn7+9WQPOnhuDkFMo=;
	b=f2X5+OM/OC4BjMvbQ3eplE6VR4kuE/ZFa3OaehRGBcikcWUcDlt4EUwMJejk/ZG2iR
	akGsi3612JpN1GWOjWy03Q6zmxzgfULQhJg1G5PnNDdf4hDxmmywYd4mfdurvMvb0KZx
	QEts8XQfTlT3aNvyRoB0Vdal85L+PCGkZmHUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pDEtJmlwiiANVNOvm+sagEaiFFBn7+9WQPOnhuDkFMo=;
	b=XNKTVh5+/bw94sr6Qonr/6a3NGw7g0dQen8uwGbOAJ8DyklujbamJSPGcafy1qmfYy
	J8WNBw6DZ0TJySD2Sf5tqoOQmb0p0P9Q89gIpR1VZ7SAhmrOuUZXqgzSBdQ40oj78eat
	w+U0IGb4Rofq+zr8ltHxbMY8/xrATbFrqHcstfXYRGpFu+E/Yeq9pk/s0DQpAFepvhwA
	PVcVBKPU5yDPgVGGPs70uRxnd1Kb917Xp5aJK1JEt9Zh+YyKD8IYGggSputUtl26BQFP
	vcdYH9tmAyDFr53zunnELXOQi0N7ljbiJrseEsx/hynaWRRvCTK71lqrImj+wGBbinH3
	Bc4g==
X-Gm-Message-State: APjAAAW83XFLrU8nLgyxYyfxj5V93qwDEHNA/uVQrrE0jBCvxYyhgqoJ
	Osma3WSR/ax7LolqUVa9EVzlUlGobc+4+w==
X-Google-Smtp-Source: APXvYqyVpsWTzgppGh6Mc8VFL2QFqHYs9+gpAWgQEICc0Wy3ImpgbeX4mGUzQcqAKiinlwluluk//Q==
X-Received: by 2002:a65:5286:: with SMTP id y6mr10940329pgp.310.1552273952427; 
	Sun, 10 Mar 2019 20:12:32 -0700 (PDT)
Received: from hex.int.rpsys.net ([12.27.65.221])
	by smtp.gmail.com with ESMTPSA id l2sm6166861pgj.64.2019.03.10.20.12.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 20:12:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2019 03:12:26 +0000
Message-Id: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] qemuarm: Swap for an arm7ve (A15) configuration
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
X-List-Received-Date: Mon, 11 Mar 2019 03:12:32 -0000
Content-Transfer-Encoding: 8bit

From: Jon Mason <jdmason@kudzu.us>

Add new QEMU BSP for a Arm Cortex-A15 system and use this as qemuarm,
moving the old armv5te Versatile PB based machine to qemuarmv5.

The new machine uses the QEMU virt machine type, which should be
faster to emulate and updates the qemuarm support to a modern
architecture.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/qemuarm.conf                | 34 +++++++++++++------
 meta/conf/machine/qemuarmv5.conf              | 23 +++++++++++++
 .../linux/linux-yocto-rt_4.19.bb              |  2 +-
 .../linux/linux-yocto-rt_5.0.bb               |  2 +-
 .../linux/linux-yocto-tiny_4.19.bb            |  2 +-
 .../linux/linux-yocto-tiny_5.0.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  2 +-
 8 files changed, 52 insertions(+), 17 deletions(-)
 create mode 100644 meta/conf/machine/qemuarmv5.conf

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index a5443126273..95550461899 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -1,21 +1,33 @@
 #@TYPE: Machine
-#@NAME: arm_versatile_926ejs
-#@DESCRIPTION: arm_versatile_926ejs
+#@NAME: generic Arm Cortex-A15 machine
+#@DESCRIPTION: Machine configuration for running a generic armv7
 
+require conf/machine/include/tune-cortexa15.inc
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-arm926ejs.inc
-#require conf/machine/include/tune-arm1136jf-s.inc
 
 KERNEL_IMAGETYPE = "zImage"
 
-SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
+SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-arm"
-QB_MACHINE = "-machine versatilepb"
-QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
-QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
-# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
+QB_MEM = "-m 512"
+QB_MACHINE = "-machine virt"
+QB_CPU = "-cpu cortex-a15"
+# Standard Serial console
+QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
+# For graphics to work we need to define the VGA device as well as the necessary USB devices
+QB_OPT_APPEND = "-show-cursor -device VGA,edid=on"
+QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
+# Add the virtio RNG
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-PREFERRED_VERSION_linux-yocto ??= "4.18%"
-QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
+# Virtio Networking support
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
+# Virtio block device
+QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+# Virtio serial console
+QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+
+KMACHINE_qemuarm = "qemuarma15"
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
new file mode 100644
index 00000000000..5f90accc242
--- /dev/null
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -0,0 +1,23 @@
+#@TYPE: Machine
+#@NAME: arm_versatile_926ejs
+#@DESCRIPTION: arm_versatile_926ejs
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-arm926ejs.inc
+#require conf/machine/include/tune-arm1136jf-s.inc
+
+KERNEL_IMAGETYPE = "zImage"
+
+SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
+
+# For runqemu
+QB_SYSTEM_NAME = "qemu-system-arm"
+QB_MACHINE = "-machine versatilepb"
+QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
+QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
+QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+PREFERRED_VERSION_linux-yocto ??= "4.18%"
+QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
+
+KMACHINE_qemuarmv5 = "qemuarm"
\ No newline at end of file
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 07dc5b77a14..36761b99437 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarma15|qemuarm64|qemuppc|qemumips)"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 2350973fef2..52c289903be 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index c6d1594a828..52dbabd7a47 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -24,7 +24,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarma15"
 
 # Functionality flags
 KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index e0a68014461..b6401199a41 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -24,7 +24,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
 
 # Functionality flags
 KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 8a4355ee833..3ef26a12baa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -37,7 +37,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarma15|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index f2c066a1503..ae6e80c0108 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -40,7 +40,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.20.1



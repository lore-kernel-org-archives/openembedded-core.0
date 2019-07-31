Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA6067F3A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 03:06:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6V36w6e004242
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 20:06:58 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 30 Jul 2019 20:06:58 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2019 11:06:56 +0800
Message-ID: <1564542416-199959-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] qemuboot-x86.inc: remove it and move content to corresponding conf
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
X-List-Received-Date: Wed, 31 Jul 2019 03:06:59 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Configrations:
MACHINE: qemux86-64
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

Reproduce steps:
bitbake lib32-core-image-minimal
runqemu qemux86-64 nographic lib32-core-image-minimal

Errors:
qemu cannot bootup since:
Booting from ROM...
This kernel requires an x86-64 CPU, but only detected an i686 CPU.
Unable to boot - please use a kernel appropriate for your CPU.
QEMU: Terminated

For lib32 image, override has x86, so the qemubin set to qemu-system-i386,
fix by move qemuboot parameters to corresponding conf, don't use the override

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-yocto-bsp/conf/machine/genericx86-64.conf         | 16 ++++++++++++++++
 meta-yocto-bsp/conf/machine/genericx86.conf            | 16 ++++++++++++++++
 .../conf/machine/include/genericx86-common.inc         |  1 -
 meta/conf/machine/include/qemuboot-x86.inc             | 18 ------------------
 meta/conf/machine/qemux86-64.conf                      | 17 ++++++++++++++++-
 meta/conf/machine/qemux86.conf                         | 17 ++++++++++++++++-
 6 files changed, 64 insertions(+), 21 deletions(-)
 delete mode 100644 meta/conf/machine/include/qemuboot-x86.inc

diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-yocto-bsp/conf/machine/genericx86-64.conf
index c489462..bf85af0 100644
--- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
@@ -7,3 +7,19 @@ require conf/machine/include/tune-core2.inc
 require conf/machine/include/genericx86-common.inc
 
 SERIAL_CONSOLES_CHECK = "ttyS0"
+
+# For runqemu
+IMAGE_CLASSES += "qemuboot"
+
+QB_SYSTEM_NAME = "qemu-system-x86_64"
+QB_CPU = "-cpu core2duo"
+QB_CPU_KVM = "-cpu core2duo"
+
+QB_AUDIO_DRV = "alsa"
+QB_AUDIO_OPT = "-soundhw ac97,es1370"
+QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
+QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
+QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+
+UVESA_MODE ?= "640x480-32"
diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto-bsp/conf/machine/genericx86.conf
index 9929d27..d8a573e 100644
--- a/meta-yocto-bsp/conf/machine/genericx86.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86.conf
@@ -7,3 +7,19 @@ require conf/machine/include/tune-core2.inc
 require conf/machine/include/genericx86-common.inc
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "gma500-gfx-check"
+
+# For runqemu
+IMAGE_CLASSES += "qemuboot"
+
+QB_SYSTEM_NAME = "qemu-system-i386"
+QB_CPU = "-cpu core2duo"
+QB_CPU_KVM = "-cpu core2duo"
+
+QB_AUDIO_DRV = "alsa"
+QB_AUDIO_OPT = "-soundhw ac97,es1370"
+QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
+QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
+QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+
+UVESA_MODE ?= "640x480-32"
diff --git a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
index f83ce5c..75db054 100644
--- a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
+++ b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
@@ -1,5 +1,4 @@
 include conf/machine/include/x86-base.inc
-require conf/machine/include/qemuboot-x86.inc
 MACHINE_FEATURES += "wifi efi pcbios"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
deleted file mode 100644
index 82ce46d..0000000
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-# For runqemu
-IMAGE_CLASSES += "qemuboot"
-QB_SYSTEM_NAME_x86 = "qemu-system-i386"
-QB_CPU_x86 = "-cpu core2duo"
-QB_CPU_KVM_x86 = "-cpu core2duo"
-
-QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
-QB_CPU_x86-64 = "-cpu core2duo"
-QB_CPU_KVM_x86-64 = "-cpu core2duo"
-
-QB_AUDIO_DRV = "alsa"
-QB_AUDIO_OPT = "-soundhw ac97,es1370"
-QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
-QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
-# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-
-UVESA_MODE ?= "640x480-32"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 383e3bd..c39f72d 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -10,7 +10,6 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-64"
 require conf/machine/include/tune-core2.inc
-require conf/machine/include/qemuboot-x86.inc
 
 UBOOT_MACHINE ?= "qemu-x86_64_defconfig"
 
@@ -39,3 +38,19 @@ module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+
+# For runqemu
+IMAGE_CLASSES += "qemuboot"
+
+QB_SYSTEM_NAME = "qemu-system-x86_64"
+QB_CPU = "-cpu core2duo"
+QB_CPU_KVM = "-cpu core2duo"
+
+QB_AUDIO_DRV = "alsa"
+QB_AUDIO_OPT = "-soundhw ac97,es1370"
+QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
+QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
+QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+
+UVESA_MODE ?= "640x480-32"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 272ad1e..cce87b6 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -10,7 +10,6 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-32"
 require conf/machine/include/tune-corei7.inc
-require conf/machine/include/qemuboot-x86.inc
 
 UBOOT_MACHINE ?= "qemu-x86_defconfig"
 
@@ -39,3 +38,19 @@ module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+
+# For runqemu
+IMAGE_CLASSES += "qemuboot"
+
+QB_SYSTEM_NAME = "qemu-system-i386"
+QB_CPU = "-cpu core2duo"
+QB_CPU_KVM = "-cpu core2duo"
+
+QB_AUDIO_DRV = "alsa"
+QB_AUDIO_OPT = "-soundhw ac97,es1370"
+QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
+QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
+QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+
+UVESA_MODE ?= "640x480-32"
-- 
2.7.4



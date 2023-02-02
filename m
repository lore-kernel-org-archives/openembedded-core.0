Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B62C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 08:02:34 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.9864.1675324949016124109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 00:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [10.2.9.245])
	by gateway (Coremail) with SMTP id _____8BxrOoSbttjJjcMAA--.24720S3;
	Thu, 02 Feb 2023 16:02:26 +0800 (CST)
Received: from code-server.gen (unknown [10.2.9.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxmb0NbttjxTknAA--.11392S3;
	Thu, 02 Feb 2023 16:02:25 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: chenjiping@loongson.cn,
	zhuqizheng@loongson.cn,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v1 1/5] base: add support for loongarch64
Date: Thu,  2 Feb 2023 08:02:15 +0000
Message-Id: <20230202080219.3465767-2-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
References: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxmb0NbttjxTknAA--.11392S3
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQAKCGPaVm8S5wAAs2
X-Coremail-Antispam: 1Uk129KBjvJXoWfJF18Cw4fuw48WF4xXFWkWFg_yoWDtF4rpF
	yfZF18GF4xXr93Ca9rZ345Wr4UGwn2g3Wa9FySgr10ka4q9r1DXw1xKryqv3WDXw4DtFW0
	q3s5J3y29F4UX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
	0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
	44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
	Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 08:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176677

Signed-off-by: Xiaotian Wu <wuxiaotian@loongson.cn>
---
 meta/classes-recipe/siteinfo.bbclass          |  4 +++
 meta/conf/machine-sdk/loongarch64.conf        |  2 ++
 .../include/loongarch/arch-loongarch.inc      |  7 ++++
 .../include/loongarch/qemuloongarch.inc       | 35 +++++++++++++++++++
 .../include/loongarch/tune-loongarch.inc      | 13 +++++++
 meta/conf/machine/qemuloongarch64.conf        | 11 ++++++
 meta/conf/templates/default/local.conf.sample |  1 +
 meta/lib/oe/elf.py                            |  2 ++
 meta/recipes-devtools/meson/meson_1.0.0.bb    |  2 ++
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 meta/site/loongarch64-linux                   | 11 ++++++
 scripts/lib/wic/canned-wks/qemuloongarch.wks  |  3 ++
 scripts/runqemu                               |  4 ++-
 13 files changed, 95 insertions(+), 2 deletions(-)
 create mode 100644 meta/conf/machine-sdk/loongarch64.conf
 create mode 100644 meta/conf/machine/include/loongarch/arch-loongarch.inc
 create mode 100644 meta/conf/machine/include/loongarch/qemuloongarch.inc
 create mode 100644 meta/conf/machine/include/loongarch/tune-loongarch.inc
 create mode 100644 meta/conf/machine/qemuloongarch64.conf
 create mode 100644 meta/site/loongarch64-linux
 create mode 100644 scripts/lib/wic/canned-wks/qemuloongarch.wks

diff --git a/meta/classes-recipe/siteinfo.bbclass b/meta/classes-recipe/siteinfo.bbclass
index d31c9b2571..05253ae90d 100644
--- a/meta/classes-recipe/siteinfo.bbclass
+++ b/meta/classes-recipe/siteinfo.bbclass
@@ -39,6 +39,8 @@ def siteinfo_data_for_machine(arch, os, d):
         "i686": "endian-little bit-32 ix86-common",
         "ia64": "endian-little bit-64",
         "lm32": "endian-big bit-32",
+        "loongarch32": "endian-little bit-32 loongarch",
+        "loongarch64": "endian-little bit-64 loongarch",
         "m68k": "endian-big bit-32",
         "microblaze": "endian-big bit-32 microblaze-common",
         "microblazeel": "endian-little bit-32 microblaze-common",
@@ -97,6 +99,8 @@ def siteinfo_data_for_machine(arch, os, d):
         "arm-linux-musleabi": "arm-linux",
         "armeb-linux-gnueabi": "armeb-linux",
         "armeb-linux-musleabi": "armeb-linux",
+        "loongarch32-linux": "loongarch32-linux",
+        "loongarch64-linux": "loongarch64-linux",
         "microblazeel-linux" : "microblaze-linux",
         "microblazeel-linux-musl" : "microblaze-linux",
         "mips-linux-musl": "mips-linux",
diff --git a/meta/conf/machine-sdk/loongarch64.conf b/meta/conf/machine-sdk/loongarch64.conf
new file mode 100644
index 0000000000..40bf0039ea
--- /dev/null
+++ b/meta/conf/machine-sdk/loongarch64.conf
@@ -0,0 +1,2 @@
+SDK_ARCH = "loongarch64"
+ABIEXTENSION:class-nativesdk = ""
diff --git a/meta/conf/machine/include/loongarch/arch-loongarch.inc b/meta/conf/machine/include/loongarch/arch-loongarch.inc
new file mode 100644
index 0000000000..4b44614035
--- /dev/null
+++ b/meta/conf/machine/include/loongarch/arch-loongarch.inc
@@ -0,0 +1,7 @@
+# LoongArch Architecture definition
+
+DEFAULTTUNE ?= "loongarch64"
+
+TUNE_ARCH = "${TUNE_ARCH:tune-${DEFAULTTUNE}}"
+TUNE_PKGARCH = "${TUNE_PKGARCH:tune-${DEFAULTTUNE}}"
+TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'loongarch64', ' -march=la464 -mabi=lp64d', ' ', d)}"
diff --git a/meta/conf/machine/include/loongarch/qemuloongarch.inc b/meta/conf/machine/include/loongarch/qemuloongarch.inc
new file mode 100644
index 0000000000..77245ff85d
--- /dev/null
+++ b/meta/conf/machine/include/loongarch/qemuloongarch.inc
@@ -0,0 +1,35 @@
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/loongarch/tune-loongarch.inc
+
+MACHINE_FEATURES = "screen keyboard ext2 ext3 serial"
+
+KERNEL_IMAGETYPE = "vmlinuz"
+KERNEL_IMAGETYPES += "vmlinuz"
+KEEPUIMAGE = "no"
+
+SERIAL_CONSOLES ?= "115200;ttyS0 115200;hvc0"
+
+IMAGE_FSTYPES += "ext4 wic.qcow2"
+
+WKS_FILE ?= "qemuloongarch.wks"
+
+MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+
+#EXTRA_IMAGEDEPENDS += "opensbi"
+
+UBOOT_ENTRYPOINT_loongarch32 = "0x80400000"
+UBOOT_ENTRYPOINT_loongarch64 = "0x80200000"
+
+# qemuboot options
+QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
+QB_MACHINE = "-machine virt"
+QB_DEFAULT_BIOS = "fw_jump.elf"
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
+QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
+QB_OPT_APPEND = " -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-device,rng=rng0"
diff --git a/meta/conf/machine/include/loongarch/tune-loongarch.inc b/meta/conf/machine/include/loongarch/tune-loongarch.inc
new file mode 100644
index 0000000000..f02ddda474
--- /dev/null
+++ b/meta/conf/machine/include/loongarch/tune-loongarch.inc
@@ -0,0 +1,13 @@
+require conf/machine/include/loongarch/arch-loongarch.inc
+
+TUNEVALID[loongarch64] = "Enable 64-bit LoongArch optimizations"
+
+TUNEVALID[littleendian] = "Little endian mode"
+
+AVAILTUNES += "loongarch64"
+
+# Default
+TUNE_FEATURES:tune-loongarch64 = "loongarch64"
+TUNE_ARCH:tune-loongarch64 = "loongarch64"
+TUNE_PKGARCH:tune-loongarch64 = "loongarch64"
+PACKAGE_EXTRA_ARCHS:tune-loongarch64 = "loongarch64"
diff --git a/meta/conf/machine/qemuloongarch64.conf b/meta/conf/machine/qemuloongarch64.conf
new file mode 100644
index 0000000000..675d525afd
--- /dev/null
+++ b/meta/conf/machine/qemuloongarch64.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: generic loongarch64 machine
+#@DESCRIPTION: Machine configuration for running a generic loongarch64
+
+require conf/machine/include/loongarch/qemuloongarch.inc
+
+XVISOR_PLAT = "loongarch/virt64"
+
+EXTRA_IMAGEDEPENDS += "u-boot"
+UBOOT_MACHINE = "qemu-loongarch64_smode_defconfig"
+UBOOT_ELF = "u-boot"
diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/templates/default/local.conf.sample
index be43d1aafd..c4a4373ea8 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -21,6 +21,7 @@
 #
 #MACHINE ?= "qemuarm"
 #MACHINE ?= "qemuarm64"
+#MACHINE ?= "qemuloongarch64"
 #MACHINE ?= "qemumips"
 #MACHINE ?= "qemumips64"
 #MACHINE ?= "qemuppc"
diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index fb07995b3e..eab2349a4f 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -21,6 +21,7 @@ def machine_dict(d):
                         "x86_64":     (62,     0,    0,          True,          64),
                         "epiphany":   (4643,   0,    0,          True,          32),
                         "lm32":       (138,    0,    0,          False,         32),
+                        "loongarch64":(258,    0,    0,          True,          64),
                         "mips":       ( 8,     0,    0,          False,         32),
                         "mipsel":     ( 8,     0,    0,          True,          32),
                         "microblaze":  (189,   0,    0,          False,         32),
@@ -45,6 +46,7 @@ def machine_dict(d):
                         "ia64":       (50,     0,    0,          True,          64),
                         "alpha":      (36902,  0,    0,          True,          64),
                         "hppa":       (15,     3,    0,          False,         32),
+                        "loongarch64":(258,    0,    0,          True,          64),
                         "m68k":       ( 4,     0,    0,          False,         32),
                         "mips":       ( 8,     0,    0,          False,         32),
                         "mipsel":     ( 8,     0,    0,          True,          32),
diff --git a/meta/recipes-devtools/meson/meson_1.0.0.bb b/meta/recipes-devtools/meson/meson_1.0.0.bb
index a7740cc6dd..578dfb9d64 100644
--- a/meta/recipes-devtools/meson/meson_1.0.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.0.0.bb
@@ -66,6 +66,8 @@ def generate_native_link_template(d):
         loader = 'ld-linux-aarch64.so.1'
     elif 'ppc64le' in build_arch:
         loader = 'ld64.so.2'
+    elif 'loongarch64' in build_arch:
+        loader = 'ld-linux-loongarch-lp64d.so.1'
 
     if loader:
         val += ['-Wl,--dynamic-linker=@{OECORE_NATIVE_SYSROOT}${base_libdir_native}/' + loader]
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 80f6edd2b9..92828e8f2d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -86,7 +86,7 @@ do_install_ptest() {
 }
 
 # QEMU_TARGETS is overridable variable
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc ppc64 ppc64le riscv32 riscv64 sh4 x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 loongarch64 mips mipsel mips64 mips64el ppc ppc64 ppc64le riscv32 riscv64 sh4 x86_64"
 
 EXTRA_OECONF = " \
     --prefix=${prefix} \
diff --git a/meta/site/loongarch64-linux b/meta/site/loongarch64-linux
new file mode 100644
index 0000000000..38bc5f044d
--- /dev/null
+++ b/meta/site/loongarch64-linux
@@ -0,0 +1,11 @@
+# general
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
diff --git a/scripts/lib/wic/canned-wks/qemuloongarch.wks b/scripts/lib/wic/canned-wks/qemuloongarch.wks
new file mode 100644
index 0000000000..8465c7a8c0
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/qemuloongarch.wks
@@ -0,0 +1,3 @@
+# short-description: Create qcow2 image for LoongArch QEMU machines
+
+part / --source rootfs --fstype=ext4 --label root --align 4096 --size 5G
diff --git a/scripts/runqemu b/scripts/runqemu
index 5907390573..def11ea911 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1313,7 +1313,7 @@ class BaseConfig(object):
         """attempt to determine the appropriate qemu-system binary"""
         mach = self.get('MACHINE')
         if not mach:
-            search = '.*(qemux86-64|qemux86|qemuarm64|qemuarm|qemumips64|qemumips64el|qemumipsel|qemumips|qemuppc).*'
+            search = '.*(qemux86-64|qemux86|qemuarm64|qemuarm|qemuloongarch64|qemumips64|qemumips64el|qemumipsel|qemumips|qemuppc).*'
             if self.rootfs:
                 match = re.match(search, self.rootfs)
                 if match:
@@ -1336,6 +1336,8 @@ class BaseConfig(object):
             qbsys = 'x86_64'
         elif mach == 'qemuppc':
             qbsys = 'ppc'
+        elif mach == 'qemuloongarch64':
+            qbsys = 'loongarch64'
         elif mach == 'qemumips':
             qbsys = 'mips'
         elif mach == 'qemumips64':
-- 
2.39.1



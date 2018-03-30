Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 79443744DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 00:41:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2018 17:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,378,1517904000"; d="scan'208";a="43389693"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 29 Mar 2018 17:41:22 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2018 17:41:08 -0700
Message-Id: <20180330004108.33832-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH v2] default-distrovars: set default KERNEL_IMAGETYPE(S)
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
X-List-Received-Date: Fri, 30 Mar 2018 00:41:21 -0000

With the change from assuming kernels will be named "vmlinuz"
everywhere, to instead using KERNEL_IMAGETYPE, we require that
KERNEL_IMAGETYPE is set to something. Instead of setting the default in
multiple individual files, set it in default-distrovars.inc.

x86(-64) arches get bzImage as the default. Others get zImage as per
meta/conf/documentation.conf.

Also set KERNEL_IMAGETYPES, as we will eventually be switching away from
KERNEL_IMAGETYPE.

Thanks to Andre McCurdy <armccurdy@gmail.com> for the arch defaults
part.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
v2: bzImage for x86, zImage for others.
 meta/classes/grub-efi-cfg.bbclass               | 1 -
 meta/classes/live-vm-common.bbclass             | 2 --
 meta/classes/syslinux.bbclass                   | 1 -
 meta/classes/systemd-boot-cfg.bbclass           | 2 --
 meta/conf/distro/include/default-distrovars.inc | 6 ++++++
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/grub-efi-cfg.bbclass b/meta/classes/grub-efi-cfg.bbclass
index d2226af97a7..5eeee6c2e3f 100644
--- a/meta/classes/grub-efi-cfg.bbclass
+++ b/meta/classes/grub-efi-cfg.bbclass
@@ -22,7 +22,6 @@ GRUB_CFG_LIVE = "${S}/grub_live.cfg"
 GRUB_TIMEOUT ?= "10"
 #FIXME: build this from the machine config
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
-KERNEL_IMAGETYPE ??= "bzImage"
 
 EFIDIR = "/EFI/BOOT"
 GRUB_ROOT ?= "${ROOT}"
diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-common.bbclass
index 714d6d4788c..68105d9b84f 100644
--- a/meta/classes/live-vm-common.bbclass
+++ b/meta/classes/live-vm-common.bbclass
@@ -32,8 +32,6 @@ PCBIOS_CLASS = "${@['','syslinux'][d.getVar('PCBIOS') == '1']}"
 inherit ${EFI_CLASS}
 inherit ${PCBIOS_CLASS}
 
-KERNEL_IMAGETYPE ??= "bzImage"
-
 populate_kernel() {
 	dest=$1
 	install -d $dest
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 959aed4fb8f..031dacbf7d3 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -21,7 +21,6 @@ do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot"
 
 ISOLINUXDIR ?= "/isolinux"
-KERNEL_IMAGETYPE ??= "bzImage"
 SYSLINUXDIR = "/"
 # The kernel has an internal default console, which you can override with
 # a console=...some_tty...
diff --git a/meta/classes/systemd-boot-cfg.bbclass b/meta/classes/systemd-boot-cfg.bbclass
index 107758548c6..021c9f93315 100644
--- a/meta/classes/systemd-boot-cfg.bbclass
+++ b/meta/classes/systemd-boot-cfg.bbclass
@@ -1,5 +1,3 @@
-KERNEL_IMAGETYPE ??= "bzImage"
-
 SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
 SYSTEMD_BOOT_ENTRIES ?= ""
 SYSTEMD_BOOT_TIMEOUT ?= "10"
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 76d09af7266..9620ad48ded 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -47,3 +47,9 @@ BB_STRICT_CHECKSUM = "1"
 
 GTK2DISTROFEATURES = "directfb x11"
 GTK3DISTROFEATURES = "x11 wayland"
+
+ARCH_DEFAULT_KERNELIMAGETYPE = "zImage"
+ARCH_DEFAULT_KERNELIMAGETYPE_x86 = "bzImage"
+ARCH_DEFAULT_KERNELIMAGETYPE_x86-64 = "bzImage"
+KERNEL_IMAGETYPE ??= "${ARCH_DEFAULT_KERNELIMAGETYPE}"
+KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
-- 
2.14.3



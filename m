Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EA80565D5F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 06:36:04 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2014 23:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,810,1400050800"; d="scan'208";a="465481733"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2014 23:35:44 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 09:35:38 +0300
Message-Id: <1d9570364f7f466c4e389ddf99708339164f1885.1407306890.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407306890.git.cristian.iorga@intel.com>
References: <cover.1407306890.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1407306890.git.cristian.iorga@intel.com>
References: <cover.1407306890.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] qemu: upgrade to 2.1
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
X-List-Received-Date: Wed, 06 Aug 2014 06:36:11 -0000

QEMU 2.1 comes with fixes and improvements.
See http://wiki.qemu.org/ChangeLog/2.1 for details.
- Add gnutls as a build dependency, because this can be a
runtime dependency for VNC support.
- pcie_better_hotplug_support.patch removed,
integrated upstream.
- Qemu-Arm-versatilepb-Add-memory-size-checking.patch updated
to 2.1 source code.
- no-strip.patch removed, no longer necessary due to code changes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...-Arm-versatilepb-Add-memory-size-checking.patch |  2 +-
 .../qemu/files/pcie_better_hotplug_support.patch   | 74 ----------------------
 meta/recipes-devtools/qemu/qemu.inc                |  3 +-
 meta/recipes-devtools/qemu/qemu/no-strip.patch     | 15 -----
 .../qemu/{qemu_2.0.0.bb => qemu_2.1.0.bb}          |  7 +-
 5 files changed, 4 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/no-strip.patch
 rename meta/recipes-devtools/qemu/{qemu_2.0.0.bb => qemu_2.1.0.bb} (81%)

diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
index 3834aed..7f1c5a9 100644
--- a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
+++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
@@ -32,7 +32,7 @@ index b48d84c..ad2cd5a 100644
 +                ((unsigned int)ram_size / (1 << 20)));
 +        exit(1);
 +    }
-     memory_region_init_ram(ram, NULL, "versatile.ram", args->ram_size);
+     memory_region_init_ram(ram, NULL, "versatile.ram", machine->ram_size);
      vmstate_register_ram_global(ram);
      /* ??? RAM should repeat to fill physical memory space.  */
 -- 
diff --git a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch b/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
deleted file mode 100644
index c7035b2..0000000
--- a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-The current code is broken: it does surprise removal which crashes guests.
-
-Reimplemented the steps:
- - Hotplug triggers both 'present detect change' and
-   'attention button pressed'.
-
- - Hotunplug starts by triggering 'attention button pressed',
-   then waits for the OS to power off the device and only
-   then detaches it.
-
-Fixes CVE-2014-3471.
-
-Originated-by: Marcel Apfelbaum <address@hidden>
-Updated-by: Daniel BORNAZ <daniel.bornaz@enea.com>
-
---- a/hw/pci/pcie.c	2014-04-17 15:44:44.000000000 +0200
-+++ b/hw/pci/pcie.c	2014-07-15 13:03:16.905070562 +0200
-@@ -258,7 +258,8 @@ void pcie_cap_slot_hotplug_cb(HotplugHan
- 
-     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
-                                PCI_EXP_SLTSTA_PDS);
--    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
-+    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev),
-+                        PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);
- }
- 
- void pcie_cap_slot_hot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
-@@ -268,10 +269,7 @@ void pcie_cap_slot_hot_unplug_cb(Hotplug
- 
-     pcie_cap_slot_hotplug_common(PCI_DEVICE(hotplug_dev), dev, &exp_cap, errp);
- 
--    object_unparent(OBJECT(dev));
--    pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
--                                 PCI_EXP_SLTSTA_PDS);
--    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
-+    pcie_cap_slot_push_attention_button(PCI_DEVICE(hotplug_dev));
- }
- 
- /* pci express slot for pci express root/downstream port
-@@ -352,6 +350,11 @@ void pcie_cap_slot_reset(PCIDevice *dev)
-     hotplug_event_update_event_status(dev);
- }
- 
-+static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaque)
-+{
-+    object_unparent(OBJECT(dev));
-+}
-+
- void pcie_cap_slot_write_config(PCIDevice *dev,
-                                 uint32_t addr, uint32_t val, int len)
- {
-@@ -376,6 +379,22 @@ void pcie_cap_slot_write_config(PCIDevic
-                         sltsta);
-     }
- 
-+    /*
-+     * If the slot is polulated, power indicator is off and power
-+     * controller is off, it is safe to detach the devices.
-+     */
-+    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
-+        ((val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF)) {
-+            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
-+            pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-+                                pcie_unplug_device, NULL);
-+
-+            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
-+                                         PCI_EXP_SLTSTA_PDS);
-+            pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
-+                                       PCI_EXP_SLTSTA_PDC);
-+    }
-+
-     hotplug_event_notify(dev);
- 
-     /* 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 84330ae..0cdeeb4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Fast open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "glib-2.0 zlib alsa-lib pixman dtc libsdl \
+DEPENDS = "glib-2.0 zlib gnutls alsa-lib pixman dtc libsdl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
@@ -17,7 +17,6 @@ QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
 SRC_URI = "\
     file://powerpc_rom.bin \
-    file://no-strip.patch \
     file://larger_default_ram_size.patch \
     file://disable-grabs.patch \
     file://exclude-some-arm-EABI-obsolete-syscalls.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/no-strip.patch b/meta/recipes-devtools/qemu/qemu/no-strip.patch
deleted file mode 100644
index d6a4377..0000000
--- a/meta/recipes-devtools/qemu/qemu/no-strip.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: qemu-0.14.0/Makefile
-===================================================================
---- qemu-0.14.0.orig/Makefile
-+++ qemu-0.14.0/Makefile
-@@ -235,7 +235,7 @@ install-sysconfig:
- install: all $(if $(BUILD_DOCS),install-doc) install-sysconfig
- 	$(INSTALL_DIR) "$(DESTDIR)$(bindir)"
- ifneq ($(TOOLS),)
--	$(INSTALL_PROG) $(STRIP_OPT) $(TOOLS) "$(DESTDIR)$(bindir)"
-+	$(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
- endif
- ifneq ($(BLOBS),)
- 	$(INSTALL_DIR) "$(DESTDIR)$(datadir)"
diff --git a/meta/recipes-devtools/qemu/qemu_2.0.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
similarity index 81%
rename from meta/recipes-devtools/qemu/qemu_2.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.1.0.bb
index 9a530a6..abf8dfc 100644
--- a/meta/recipes-devtools/qemu/qemu_2.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
@@ -5,14 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 
 SRC_URI += "file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
-            file://pcie_better_hotplug_support.patch \
             "
 
-
-
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "2790f44fd76da5de5024b4aafeb594c2"
-SRC_URI[sha256sum] = "60cc1aa0cad39cec891f970bed60ca8a484f071adad4943123599ac223543a3b"
+SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
+SRC_URI[sha256sum] = "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
1.9.1



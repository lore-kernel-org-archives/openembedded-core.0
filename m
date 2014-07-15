Return-Path: <Daniel.Bornaz@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 42D6F60144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:31:09 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 15 Jul 2014 15:31:05 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4483)	id 7FCCB288F30;
	Tue, 15 Jul 2014 15:31:05 +0200 (CEST)
From: Daniel BORNAZ <daniel.bornaz@enea.com>
To: <yocto@yoctoproject.org>, <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 15:30:59 +0200
Message-ID: <1405431059-47938-1-git-send-email-daniel.bornaz@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: daniel.bornaz@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/1] Qemu security patch: CVE-2014-3471
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
X-List-Received-Date: Tue, 15 Jul 2014 13:31:16 -0000
Content-Type: text/plain

Qemu PCIe bus support is vulnerable to a use-after-free flaw. It could
occur via guest, when it tries to hotplug/hotunplug devices on the
guest.

A user able to add & delete Virtio block devices on a guest could use
this flaw to crash the Qemu instance resulting in DoS.

Originated-by: Marcel Apfelbaum <address@hidden>
Signed-off-by: Daniel BORNAZ <daniel.bornaz@enea.com>

[LXCR-3365]
---
 .../qemu/files/pcie_better_hotplug_support.patch   | 74 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.0.0.bb           |  6 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch

diff --git a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch b/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
new file mode 100644
index 0000000..c7035b2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
@@ -0,0 +1,74 @@
+The current code is broken: it does surprise removal which crashes guests.
+
+Reimplemented the steps:
+ - Hotplug triggers both 'present detect change' and
+   'attention button pressed'.
+
+ - Hotunplug starts by triggering 'attention button pressed',
+   then waits for the OS to power off the device and only
+   then detaches it.
+
+Fixes CVE-2014-3471.
+
+Originated-by: Marcel Apfelbaum <address@hidden>
+Updated-by: Daniel BORNAZ <daniel.bornaz@enea.com>
+
+--- a/hw/pci/pcie.c	2014-04-17 15:44:44.000000000 +0200
++++ b/hw/pci/pcie.c	2014-07-15 13:03:16.905070562 +0200
+@@ -258,7 +258,8 @@ void pcie_cap_slot_hotplug_cb(HotplugHan
+ 
+     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
+                                PCI_EXP_SLTSTA_PDS);
+-    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
++    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev),
++                        PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);
+ }
+ 
+ void pcie_cap_slot_hot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
+@@ -268,10 +269,7 @@ void pcie_cap_slot_hot_unplug_cb(Hotplug
+ 
+     pcie_cap_slot_hotplug_common(PCI_DEVICE(hotplug_dev), dev, &exp_cap, errp);
+ 
+-    object_unparent(OBJECT(dev));
+-    pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
+-                                 PCI_EXP_SLTSTA_PDS);
+-    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
++    pcie_cap_slot_push_attention_button(PCI_DEVICE(hotplug_dev));
+ }
+ 
+ /* pci express slot for pci express root/downstream port
+@@ -352,6 +350,11 @@ void pcie_cap_slot_reset(PCIDevice *dev)
+     hotplug_event_update_event_status(dev);
+ }
+ 
++static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaque)
++{
++    object_unparent(OBJECT(dev));
++}
++
+ void pcie_cap_slot_write_config(PCIDevice *dev,
+                                 uint32_t addr, uint32_t val, int len)
+ {
+@@ -376,6 +379,22 @@ void pcie_cap_slot_write_config(PCIDevic
+                         sltsta);
+     }
+ 
++    /*
++     * If the slot is polulated, power indicator is off and power
++     * controller is off, it is safe to detach the devices.
++     */
++    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
++        ((val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF)) {
++            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
++            pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
++                                pcie_unplug_device, NULL);
++
++            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
++                                         PCI_EXP_SLTSTA_PDS);
++            pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
++                                       PCI_EXP_SLTSTA_PDC);
++    }
++
+     hotplug_event_notify(dev);
+ 
+     /* 
diff --git a/meta/recipes-devtools/qemu/qemu_2.0.0.bb b/meta/recipes-devtools/qemu/qemu_2.0.0.bb
index b8ce624..9a530a6 100644
--- a/meta/recipes-devtools/qemu/qemu_2.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.0.0.bb
@@ -4,7 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
 SRC_URI += "file://qemu-enlarge-env-entry-size.patch \
-            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch"
+            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
+            file://pcie_better_hotplug_support.patch \
+            "
+
+
 
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "2790f44fd76da5de5024b4aafeb594c2"
-- 
1.9.1



Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84C2A71ACD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:57:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAT9vYFH002392
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 01:57:35 -0800 (PST)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 29 Nov 2016 01:57:33 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2016 17:56:47 +0800
Message-ID: <1480413407-22659-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] qemu: Fix pci-assign
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
X-List-Received-Date: Tue, 29 Nov 2016 09:57:34 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Fix iommu pci device assignment failure.

"qemu-system-x86_64: -device pci-assign,host=02:00.0: No IOMMU found.
Unable to assign device "(null)""

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch | 71 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch b/meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
new file mode 100644
index 0000000..03472dd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
@@ -0,0 +1,71 @@
+From 6baa545df93253fced4fc0d52b14b98447e00473 Mon Sep 17 00:00:00 2001
+From: Peter Xu <peterx@redhat.com>
+Date: Mon, 28 Nov 2016 15:02:44 +0800
+Subject: [PATCH] pci-assign: sync MSI/MSI-X cap and table with PCIDevice
+
+Since commit e1d4fb2d ("kvm-irqchip: x86: add msi route notify fn"),
+kvm_irqchip_add_msi_route() starts to use pci_get_msi_message() to fetch
+MSI info. This requires that we setup MSI related fields in PCIDevice.
+For most devices, that won't be a problem, as long as we are using
+general interfaces like msi_init()/msix_init().
+
+However, for pci-assign devices, MSI/MSI-X is treated differently - PCI
+assign devices are maintaining its own MSI table and cap information in
+AssignedDevice struct. however that's not synced up with PCIDevice's
+fields. That will leads to pci_get_msi_message() failed to find correct
+MSI capability, even with an NULL msix_table.
+
+A quick fix is to sync up the two places: both the capability bits and
+table address for MSI/MSI-X.
+
+Upstream-Status: Backport [https://lists.gnu.org/archive/html/qemu-devel/2016-11/msg04649.html]
+
+Reported-by: Changlimin <address@hidden>
+Tested-by: Changlimin <address@hidden>
+Cc: address@hidden
+Fixes: e1d4fb2d ("kvm-irqchip: x86: add msi route notify fn")
+Signed-off-by: Peter Xu <address@hidden>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ hw/i386/kvm/pci-assign.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
+index 8238fbc..87dcbdd 100644
+--- a/hw/i386/kvm/pci-assign.c
++++ b/hw/i386/kvm/pci-assign.c
+@@ -1251,6 +1251,7 @@ static int assigned_device_pci_cap_init(PCIDevice *pci_dev, Error **errp)
+             error_propagate(errp, local_err);
+             return -ENOTSUP;
+         }
++        dev->dev.cap_present |= QEMU_PCI_CAP_MSI;
+         dev->cap.available |= ASSIGNED_DEVICE_CAP_MSI;
+         /* Only 32-bit/no-mask currently supported */
+         ret = pci_add_capability2(pci_dev, PCI_CAP_ID_MSI, pos, 10,
+@@ -1285,6 +1286,7 @@ static int assigned_device_pci_cap_init(PCIDevice *pci_dev, Error **errp)
+             error_propagate(errp, local_err);
+             return -ENOTSUP;
+         }
++        dev->dev.cap_present |= QEMU_PCI_CAP_MSIX;
+         dev->cap.available |= ASSIGNED_DEVICE_CAP_MSIX;
+         ret = pci_add_capability2(pci_dev, PCI_CAP_ID_MSIX, pos, 12,
+                                   &local_err);
+@@ -1648,6 +1650,7 @@ static void assigned_dev_register_msix_mmio(AssignedDevice *dev, Error **errp)
+         dev->msix_table = NULL;
+         return;
+     }
++    dev->dev.msix_table = (uint8_t *)dev->msix_table;
+ 
+     assigned_dev_msix_reset(dev);
+ 
+@@ -1665,6 +1668,7 @@ static void assigned_dev_unregister_msix_mmio(AssignedDevice *dev)
+         error_report("error unmapping msix_table! %s", strerror(errno));
+     }
+     dev->msix_table = NULL;
++    dev->dev.msix_table = NULL;
+ }
+ 
+ static const VMStateDescription vmstate_assigned_device = {
+-- 
+2.8.3
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.7.0.bb b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
index cef181d..9da5134 100644
--- a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://0002-fix-CVE-2016-7423.patch \
             file://0003-fix-CVE-2016-7908.patch \
             file://0004-fix-CVE-2016-7909.patch \
+            file://0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch \
 "
 
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-- 
2.8.3



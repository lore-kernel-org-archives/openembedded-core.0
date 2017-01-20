Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F0CF371A76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 22:13:05 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jan 2017 14:13:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,260,1477983600"; d="scan'208";a="56414862"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2017 14:13:05 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 16:15:57 -0600
Message-Id: <1484950557-27915-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCHv3] qemu: Upgrade to 2.7.1
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
X-List-Received-Date: Fri, 20 Jan 2017 22:13:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor upgrade contains fixes from 2.7.0.

Removed patches (already in upstream):

- 0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
- 0001-virtio-zero-vq-inuse-in-virtio_reset.patch
- 0002-fix-CVE-2016-7423.patch

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  2 -
 ...sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch | 71 ----------------------
 ...0001-virtio-zero-vq-inuse-in-virtio_reset.patch | 57 -----------------
 .../qemu/qemu/0002-fix-CVE-2016-7423.patch         | 45 --------------
 .../qemu/{qemu_2.7.0.bb => qemu_2.7.1.bb}          | 10 ++-
 5 files changed, 4 insertions(+), 181 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
 rename meta/recipes-devtools/qemu/{qemu_2.7.0.bb => qemu_2.7.1.bb} (66%)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b46e7f7..ac5fcac 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,8 +9,6 @@ require qemu-targets.inc
 inherit autotools ptest
 BBCLASSEXTEND = "native nativesdk"
 
-PR = "r1"
-
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch b/meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
deleted file mode 100644
index 03472dd..0000000
--- a/meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 6baa545df93253fced4fc0d52b14b98447e00473 Mon Sep 17 00:00:00 2001
-From: Peter Xu <peterx@redhat.com>
-Date: Mon, 28 Nov 2016 15:02:44 +0800
-Subject: [PATCH] pci-assign: sync MSI/MSI-X cap and table with PCIDevice
-
-Since commit e1d4fb2d ("kvm-irqchip: x86: add msi route notify fn"),
-kvm_irqchip_add_msi_route() starts to use pci_get_msi_message() to fetch
-MSI info. This requires that we setup MSI related fields in PCIDevice.
-For most devices, that won't be a problem, as long as we are using
-general interfaces like msi_init()/msix_init().
-
-However, for pci-assign devices, MSI/MSI-X is treated differently - PCI
-assign devices are maintaining its own MSI table and cap information in
-AssignedDevice struct. however that's not synced up with PCIDevice's
-fields. That will leads to pci_get_msi_message() failed to find correct
-MSI capability, even with an NULL msix_table.
-
-A quick fix is to sync up the two places: both the capability bits and
-table address for MSI/MSI-X.
-
-Upstream-Status: Backport [https://lists.gnu.org/archive/html/qemu-devel/2016-11/msg04649.html]
-
-Reported-by: Changlimin <address@hidden>
-Tested-by: Changlimin <address@hidden>
-Cc: address@hidden
-Fixes: e1d4fb2d ("kvm-irqchip: x86: add msi route notify fn")
-Signed-off-by: Peter Xu <address@hidden>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- hw/i386/kvm/pci-assign.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
-index 8238fbc..87dcbdd 100644
---- a/hw/i386/kvm/pci-assign.c
-+++ b/hw/i386/kvm/pci-assign.c
-@@ -1251,6 +1251,7 @@ static int assigned_device_pci_cap_init(PCIDevice *pci_dev, Error **errp)
-             error_propagate(errp, local_err);
-             return -ENOTSUP;
-         }
-+        dev->dev.cap_present |= QEMU_PCI_CAP_MSI;
-         dev->cap.available |= ASSIGNED_DEVICE_CAP_MSI;
-         /* Only 32-bit/no-mask currently supported */
-         ret = pci_add_capability2(pci_dev, PCI_CAP_ID_MSI, pos, 10,
-@@ -1285,6 +1286,7 @@ static int assigned_device_pci_cap_init(PCIDevice *pci_dev, Error **errp)
-             error_propagate(errp, local_err);
-             return -ENOTSUP;
-         }
-+        dev->dev.cap_present |= QEMU_PCI_CAP_MSIX;
-         dev->cap.available |= ASSIGNED_DEVICE_CAP_MSIX;
-         ret = pci_add_capability2(pci_dev, PCI_CAP_ID_MSIX, pos, 12,
-                                   &local_err);
-@@ -1648,6 +1650,7 @@ static void assigned_dev_register_msix_mmio(AssignedDevice *dev, Error **errp)
-         dev->msix_table = NULL;
-         return;
-     }
-+    dev->dev.msix_table = (uint8_t *)dev->msix_table;
- 
-     assigned_dev_msix_reset(dev);
- 
-@@ -1665,6 +1668,7 @@ static void assigned_dev_unregister_msix_mmio(AssignedDevice *dev)
-         error_report("error unmapping msix_table! %s", strerror(errno));
-     }
-     dev->msix_table = NULL;
-+    dev->dev.msix_table = NULL;
- }
- 
- static const VMStateDescription vmstate_assigned_device = {
--- 
-2.8.3
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch b/meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch
deleted file mode 100644
index 86955d0..0000000
--- a/meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Upstream-Status: Backport
-
-Supplementary fix of CVE-2016-5403 which is backported from:
-
-http://git.qemu.org/?p=qemu.git;a=commit;h=4b7f91e
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 4b7f91ed0270a371e1933efa21ba600b6da23ab9 Mon Sep 17 00:00:00 2001
-From: Stefan Hajnoczi <stefanha@redhat.com>
-Date: Wed, 7 Sep 2016 11:51:25 -0400
-Subject: [PATCH] virtio: zero vq->inuse in virtio_reset()
-
-vq->inuse must be zeroed upon device reset like most other virtqueue
-fields.
-
-In theory, virtio_reset() just needs assert(vq->inuse == 0) since
-devices must clean up in-flight requests during reset (requests cannot
-not be leaked!).
-
-In practice, it is difficult to achieve vq->inuse == 0 across reset
-because balloon, blk, 9p, etc implement various different strategies for
-cleaning up requests.  Most devices call g_free(elem) directly without
-telling virtio.c that the VirtQueueElement is cleaned up.  Therefore
-vq->inuse is not decremented during reset.
-
-This patch zeroes vq->inuse and trusts that devices are not leaking
-VirtQueueElements across reset.
-
-I will send a follow-up series that refactors request life-cycle across
-all devices and converts vq->inuse = 0 into assert(vq->inuse == 0) but
-this more invasive approach is not appropriate for stable trees.
-
-Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
-Cc: qemu-stable <qemu-stable@nongnu.org>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
-Reviewed-by: Ladi Prosek <lprosek@redhat.com>
----
- hw/virtio/virtio.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
-index 74c085c..e8a13a5 100644
---- a/hw/virtio/virtio.c
-+++ b/hw/virtio/virtio.c
-@@ -822,6 +822,7 @@ void virtio_reset(void *opaque)
-         vdev->vq[i].signalled_used_valid = false;
-         vdev->vq[i].notification = true;
-         vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
-+        vdev->vq[i].inuse = 0;
-     }
- }
- 
--- 
-2.9.3
-
diff --git a/meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch b/meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
deleted file mode 100644
index fdf58a3..0000000
--- a/meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Backport
-
-Backport patch to fix CVE-2016-7423 from:
-
-http://git.qemu.org/?p=qemu.git;a=commit;h=670e56d3ed
-
-CVE: CVE-2016-7423
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 670e56d3ed2918b3861d9216f2c0540d9e9ae0d5 Mon Sep 17 00:00:00 2001
-From: Li Qiang <liqiang6-s@360.cn>
-Date: Mon, 12 Sep 2016 18:14:11 +0530
-Subject: [PATCH] scsi: mptsas: use g_new0 to allocate MPTSASRequest object
-
-When processing IO request in mptsas, it uses g_new to allocate
-a 'req' object. If an error occurs before 'req->sreq' is
-allocated, It could lead to an OOB write in mptsas_free_request
-function. Use g_new0 to avoid it.
-
-Reported-by: Li Qiang <liqiang6-s@360.cn>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-Id: <1473684251-17476-1-git-send-email-ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
----
- hw/scsi/mptsas.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
-index 0e0a22f..eaae1bb 100644
---- a/hw/scsi/mptsas.c
-+++ b/hw/scsi/mptsas.c
-@@ -304,7 +304,7 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
-         goto bad;
-     }
- 
--    req = g_new(MPTSASRequest, 1);
-+    req = g_new0(MPTSASRequest, 1);
-     QTAILQ_INSERT_TAIL(&s->pending, req, next);
-     req->scsi_io = *scsi_io;
-     req->dev = s;
--- 
-2.9.3
-
diff --git a/meta/recipes-devtools/qemu/qemu_2.7.0.bb b/meta/recipes-devtools/qemu/qemu_2.7.1.bb
similarity index 66%
rename from meta/recipes-devtools/qemu/qemu_2.7.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.7.1.bb
index 0d680a7..8180c5f 100644
--- a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.7.1.bb
@@ -9,16 +9,14 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://no-valgrind.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
-            file://0001-virtio-zero-vq-inuse-in-virtio_reset.patch \
-            file://0002-fix-CVE-2016-7423.patch \
             file://0003-fix-CVE-2016-7908.patch \
             file://0004-fix-CVE-2016-7909.patch \
-            file://0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch \
 "
 
-SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "08d4d06d1cb598efecd796137f4844ab"
-SRC_URI[sha256sum] = "326e739506ba690daf69fc17bd3913a6c313d9928d743bd8eddb82f403f81e53"
+SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
+
+SRC_URI[md5sum] = "a315bc51ed443a08d2cf1416d76b9ab4"
+SRC_URI[sha256sum] = "68636788eb69bcb0b44ba220b32b50495d6bd5712a934c282217831c4822958f"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.1.4



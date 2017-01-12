Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B5D9960721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 16:16:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 12 Jan 2017 08:16:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,219,1477983600"; d="scan'208";a="1082227615"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by orsmga001.jf.intel.com with ESMTP; 12 Jan 2017 08:16:56 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 10:19:46 -0600
Message-Id: <1484237986-31888-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCHv2] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Thu, 12 Jan 2017 16:17:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rebased patches:

- exclude-some-arm-EABI-obsolete-syscalls.patc

Removed patches (already in upstream):

- 0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
- 0002-fix-CVE-2016-7423.patch
- 0003-fix-CVE-2016-7908.patch
- 0004-fix-CVE-2016-7909.patch
- Qemu-Arm-versatilepb-Add-memory-size-checking.patch
- 0001-target-mips-add-24KEc-CPU-definition.patch

Changelog,

http://wiki.qemu.org/ChangeLog/2.8

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/conf/auto.conf                                |  6 ++
 meta/recipes-devtools/qemu/qemu.inc                |  3 -
 ...sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch | 71 ----------------------
 ...0001-target-mips-add-24KEc-CPU-definition.patch | 54 ----------------
 ...0001-virtio-zero-vq-inuse-in-virtio_reset.patch | 57 -----------------
 .../qemu/qemu/0002-fix-CVE-2016-7423.patch         | 45 --------------
 .../qemu/qemu/0003-fix-CVE-2016-7908.patch         | 62 -------------------
 .../qemu/qemu/0004-fix-CVE-2016-7909.patch         | 42 -------------
 ...-Arm-versatilepb-Add-memory-size-checking.patch | 46 --------------
 .../exclude-some-arm-EABI-obsolete-syscalls.patch  | 28 ++++-----
 .../qemu/{qemu_2.7.0.bb => qemu_2.8.0.bb}          | 10 +--
 11 files changed, 21 insertions(+), 403 deletions(-)
 create mode 100644 meta/conf/auto.conf
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
 rename meta/recipes-devtools/qemu/{qemu_2.7.0.bb => qemu_2.8.0.bb} (58%)

diff --git a/meta/conf/auto.conf b/meta/conf/auto.conf
new file mode 100644
index 0000000..492ac82
--- /dev/null
+++ b/meta/conf/auto.conf
@@ -0,0 +1,6 @@
+SSTATE_MIRRORS = "file://.* http://yctb01.zpn.intel.com/data/sstates/PATH \n"
+PREMIRRORS_prepend = "\
+     git://.*/.* http://yctb01.zpn.intel.com/data/sources/ \n \
+     ftp://.*/.* http://yctb01.zpn.intel.com/data/sources/ \n \
+     http://.*/.* http://yctb01.zpn.intel.com/data/sources/ \n \
+     https://.*/.* http://yctb01.zpn.intel.com/data/sources/ \n"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b46e7f7..e3af5c2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,8 +9,6 @@ require qemu-targets.inc
 inherit autotools ptest
 BBCLASSEXTEND = "native nativesdk"
 
-PR = "r1"
-
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
@@ -21,7 +19,6 @@ SRC_URI = "\
     file://wacom.patch \
     file://add-ptest-in-makefile.patch \
     file://run-ptest \
-    file://0001-target-mips-add-24KEc-CPU-definition.patch \
     "
 
 SRC_URI_append_class-native = "\
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
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch b/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch
deleted file mode 100644
index c4dbee7..0000000
--- a/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 926bc194f918d46bd93557b15da8153b6a94a1d5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
-Date: Mon, 25 Jul 2016 23:58:22 +0100
-Subject: [PATCH] target-mips: add 24KEc CPU definition
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Define a new CPU definition supporting 24KEc cores, similar to
-the existing 24Kc, but with added support for DSP instructions
-and MIPS16e (and without FPU).
-
-Signed-off-by: André Draszik <git@andred.net>
----
-Upstream-Status: Submitted [http://lists.nongnu.org/archive/html/qemu-devel/2016-07/msg05778.html]
- target-mips/translate_init.c | 22 ++++++++++++++++++++++
- 1 file changed, 22 insertions(+)
-
-diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
-index 39ed5c4..6ae23e4 100644
---- a/target-mips/translate_init.c
-+++ b/target-mips/translate_init.c
-@@ -256,6 +256,28 @@ static const mips_def_t mips_defs[] =
-         .mmu_type = MMU_TYPE_R4000,
-     },
-     {
-+        .name = "24KEc",
-+        .CP0_PRid = 0x00019600,
-+        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
-+                       (MMU_TYPE_R4000 << CP0C0_MT),
-+        .CP0_Config1 = MIPS_CONFIG1 | (15 << CP0C1_MMU) |
-+                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
-+                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
-+                       (1 << CP0C1_CA),
-+        .CP0_Config2 = MIPS_CONFIG2,
-+        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_DSPP) | (0 << CP0C3_VInt),
-+        .CP0_LLAddr_rw_bitmask = 0,
-+        .CP0_LLAddr_shift = 4,
-+        .SYNCI_Step = 32,
-+        .CCRes = 2,
-+        /* we have a DSP, but no FPU */
-+        .CP0_Status_rw_bitmask = 0x1378FF1F,
-+        .SEGBITS = 32,
-+        .PABITS = 32,
-+        .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP,
-+        .mmu_type = MMU_TYPE_R4000,
-+    },
-+    {
-         .name = "24Kf",
-         .CP0_PRid = 0x00019300,
-         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
--- 
-2.8.1
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
diff --git a/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch b/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
deleted file mode 100644
index 05cc3d9..0000000
--- a/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Backport
-
-Backport patch to fix CVE-2016-7908 from:
-
-http://git.qemu.org/?p=qemu.git;a=commit;h=070c4b92b8c
-
-CVE: CVE-2016-7908
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 070c4b92b8cd5390889716677a0b92444d6e087a Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 22 Sep 2016 16:02:37 +0530
-Subject: [PATCH] net: mcf: limit buffer descriptor count
-
-ColdFire Fast Ethernet Controller uses buffer descriptors to manage
-data flow to/fro receive & transmit queues. While transmitting
-packets, it could continue to read buffer descriptors if a buffer
-descriptor has length of zero and has crafted values in bd.flags.
-Set upper limit to number of buffer descriptors.
-
-Reported-by: Li Qiang <liqiang6-s@360.cn>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
----
- hw/net/mcf_fec.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
-index 0ee8ad9..d31fea1 100644
---- a/hw/net/mcf_fec.c
-+++ b/hw/net/mcf_fec.c
-@@ -23,6 +23,7 @@ do { printf("mcf_fec: " fmt , ## __VA_ARGS__); } while (0)
- #define DPRINTF(fmt, ...) do {} while(0)
- #endif
- 
-+#define FEC_MAX_DESC 1024
- #define FEC_MAX_FRAME_SIZE 2032
- 
- typedef struct {
-@@ -149,7 +150,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)
-     uint32_t addr;
-     mcf_fec_bd bd;
-     int frame_size;
--    int len;
-+    int len, descnt = 0;
-     uint8_t frame[FEC_MAX_FRAME_SIZE];
-     uint8_t *ptr;
- 
-@@ -157,7 +158,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)
-     ptr = frame;
-     frame_size = 0;
-     addr = s->tx_descriptor;
--    while (1) {
-+    while (descnt++ < FEC_MAX_DESC) {
-         mcf_fec_read_bd(&bd, addr);
-         DPRINTF("tx_bd %x flags %04x len %d data %08x\n",
-                 addr, bd.flags, bd.length, bd.data);
--- 
-2.9.3
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch b/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
deleted file mode 100644
index e71bbf6..0000000
--- a/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Backport [http://git.qemu.org/?p=qemu.git;a=commit;h=34e29ce]
-CVE: CVE-2016-7909
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 34e29ce754c02bb6b3bdd244fbb85033460feaff Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Fri, 30 Sep 2016 00:27:33 +0530
-Subject: [PATCH] net: pcnet: check rx/tx descriptor ring length
-
-The AMD PC-Net II emulator has set of control and status(CSR)
-registers. Of these, CSR76 and CSR78 hold receive and transmit
-descriptor ring length respectively. This ring length could range
-from 1 to 65535. Setting ring length to zero leads to an infinite
-loop in pcnet_rdra_addr() or pcnet_transmit(). Add check to avoid it.
-
-Reported-by: Li Qiang <liqiang6-s@360.cn>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
----
- hw/net/pcnet.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
-index 198a01f..3078de8 100644
---- a/hw/net/pcnet.c
-+++ b/hw/net/pcnet.c
-@@ -1429,8 +1429,11 @@ static void pcnet_csr_writew(PCNetState *s, uint32_t rap, uint32_t new_value)
-     case 47: /* POLLINT */
-     case 72:
-     case 74:
-+        break;
-     case 76: /* RCVRL */
-     case 78: /* XMTRL */
-+        val = (val > 0) ? val : 512;
-+        break;
-     case 112:
-        if (CSR_STOP(s) || CSR_SPND(s))
-            break;
--- 
-2.10.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
deleted file mode 100644
index 1a6cf51..0000000
--- a/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 896fa02c24347e6e9259812cfda187b1d6ca6199 Mon Sep 17 00:00:00 2001
-From: Jiang Lu <lu.jiang@windriver.com>
-Date: Wed, 13 Nov 2013 10:38:08 +0800
-Subject: [PATCH] Qemu:Arm:versatilepb: Add memory size checking
-
-The machine can not work with memory over 256M, so add a checking
-at startup. If the memory size exceed 256M, just stop emulation then
-throw out warning about memory limitation.
-
-Upstream-Status: Pending
-
-Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
-
-Updated it on 2014-01-15 for rebasing
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Update it when upgrade qemu to 2.2.0
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
----
- hw/arm/versatilepb.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
-index 6c69f4e..9278d90 100644
---- a/hw/arm/versatilepb.c
-+++ b/hw/arm/versatilepb.c
-@@ -204,6 +204,13 @@ static void versatile_init(MachineState *machine, int board_id)
-         exit(1);
-     }
-
-+    if (machine->ram_size > (256 << 20)) {
-+        fprintf(stderr,
-+                "qemu: Too much memory for this machine: %d MB, maximum 256 MB\n",
-+                ((unsigned int)ram_size / (1 << 20)));
-+        exit(1);
-+    }
-+
-     cpuobj = object_new(object_class_get_name(cpu_oc));
-
-     /* By default ARM1176 CPUs have EL3 enabled.  This board does not
--- 
-2.1.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
index 171bda7..60253bd 100644
--- a/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
+++ b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
@@ -1,4 +1,7 @@
-[PATCH] exclude some arm EABI obsolete syscalls
+From 51910343594b3f655a205a096e092ecdacc253da Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Mon, 23 Jun 2014 14:28:30 +0800
+Subject: [PATCH 02/11] [PATCH] exclude some arm EABI obsolete syscalls
 
 Upstream-Status: Pending
 
@@ -26,15 +29,16 @@ or kernel header:
 	/usr/include/asm/unistd.h
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
 ---
- qemu-seccomp.c | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
+ qemu-seccomp.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/qemu-seccomp.c b/qemu-seccomp.c
-index caa926e..5a78502 100644
+index df75d9c..0e577f8 100644
 --- a/qemu-seccomp.c
 +++ b/qemu-seccomp.c
-@@ -25,15 +25,21 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+@@ -35,15 +35,21 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
      { SCMP_SYS(timer_settime), 255 },
      { SCMP_SYS(timer_gettime), 254 },
      { SCMP_SYS(futex), 253 },
@@ -58,7 +62,7 @@ index caa926e..5a78502 100644
      { SCMP_SYS(mprotect), 246 },
      { SCMP_SYS(execve), 245 },
      { SCMP_SYS(open), 245 },
-@@ -48,13 +54,11 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+@@ -58,7 +64,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
      { SCMP_SYS(bind), 245 },
      { SCMP_SYS(listen), 245 },
      { SCMP_SYS(semget), 245 },
@@ -66,13 +70,7 @@ index caa926e..5a78502 100644
      { SCMP_SYS(gettimeofday), 245 },
      { SCMP_SYS(readlink), 245 },
      { SCMP_SYS(access), 245 },
-     { SCMP_SYS(prctl), 245 },
-     { SCMP_SYS(signalfd), 245 },
--    { SCMP_SYS(getrlimit), 245 },
-     { SCMP_SYS(set_tid_address), 245 },
-     { SCMP_SYS(statfs), 245 },
-     { SCMP_SYS(unlink), 245 },
-@@ -93,7 +97,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+@@ -104,7 +109,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
      { SCMP_SYS(times), 245 },
      { SCMP_SYS(exit), 245 },
      { SCMP_SYS(clock_gettime), 245 },
@@ -80,7 +78,7 @@ index caa926e..5a78502 100644
      { SCMP_SYS(restart_syscall), 245 },
      { SCMP_SYS(pwrite64), 245 },
      { SCMP_SYS(nanosleep), 245 },
-@@ -182,7 +185,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+@@ -194,7 +198,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
      { SCMP_SYS(lstat64), 241 },
      { SCMP_SYS(sendfile64), 241 },
      { SCMP_SYS(ugetrlimit), 241 },
@@ -89,5 +87,5 @@ index caa926e..5a78502 100644
      { SCMP_SYS(rt_sigqueueinfo), 241 },
      { SCMP_SYS(rt_tgsigqueueinfo), 241 },
 -- 
-1.9.1
+2.1.4
 
diff --git a/meta/recipes-devtools/qemu/qemu_2.7.0.bb b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
similarity index 58%
rename from meta/recipes-devtools/qemu/qemu_2.7.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.8.0.bb
index 0d680a7..efb1fb0 100644
--- a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
@@ -5,20 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
-            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://no-valgrind.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
-            file://0001-virtio-zero-vq-inuse-in-virtio_reset.patch \
-            file://0002-fix-CVE-2016-7423.patch \
-            file://0003-fix-CVE-2016-7908.patch \
-            file://0004-fix-CVE-2016-7909.patch \
-            file://0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch \
 "
 
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "08d4d06d1cb598efecd796137f4844ab"
-SRC_URI[sha256sum] = "326e739506ba690daf69fc17bd3913a6c313d9928d743bd8eddb82f403f81e53"
+SRC_URI[md5sum] = "17940dce063b6ce450a12e719a6c9c43"
+SRC_URI[sha256sum] = "dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.1.4



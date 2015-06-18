Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B364873306
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 09:10:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5I9A5oC001911
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 02:10:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 18 Jun 2015 02:10:05 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jun 2015 17:02:42 +0800
Message-ID: <4a03c1eebc4f1a3a7747e43c35542754c048c1d2.1434618027.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1434618027.git.kai.kang@windriver.com>
References: <cover.1434618027.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] qemu: backport patches to fix CVE issues
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
X-List-Received-Date: Thu, 18 Jun 2015 09:10:06 -0000
Content-Type: text/plain

Backport patches to fix CVE-2015-4103, CVE-2015-4104, CVE-2015-4105 and
CVE-2015-4106. These patches are from debian, but they are originally
from:

http://git.qemu.org/?p=qemu.git;a=shortlog;h=c25bbf1

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...f-modified-PCI-CFG-contents-CVE-2015-4103.patch | 140 +++++++++++
 ...o-control-MSI-mask-register-CVE-2015-4104.patch | 194 +++++++++++++++
 ...-MSI-X-limit-error-messages-CVE-2015-4105.patch |  90 +++++++
 ...s-through-of-enable-bit-mod-CVE-2015-4106.patch |  76 ++++++
 ...date-PM-capability-emu_mask-CVE-2015-4106.patch |  86 +++++++
 ...rectly-handle-PM-status-bit-CVE-2015-4106.patch |  38 +++
 ...ulation-of-throughable-mask-CVE-2015-4106.patch | 265 +++++++++++++++++++++
 ...e-capability-bits-read-only-CVE-2015-4106.patch |  38 +++
 ...-in-PCI-config-space-fields-CVE-2015-4106.patch |  94 ++++++++
 ...ig-space-field-descriptions-CVE-2015-4106.patch |  77 ++++++
 ...e-fields-should-be-readonly-CVE-2015-4106.patch | 137 +++++++++++
 meta/recipes-devtools/qemu/qemu_2.3.0.bb           |  13 +-
 12 files changed, 1247 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/01-xen-properly-gate-host-writes-of-modified-PCI-CFG-contents-CVE-2015-4103.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/02-xen-dont-allow-guest-to-control-MSI-mask-register-CVE-2015-4104.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/03-xen-MSI-X-limit-error-messages-CVE-2015-4105.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/04-xen-MSI-dont-open-code-pass-through-of-enable-bit-mod-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/05-xen-pt-consolidate-PM-capability-emu_mask-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/06-xen-pt-correctly-handle-PM-status-bit-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/07-xen-pt-split-out-calculation-of-throughable-mask-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/08-xen-pt-mark-all-PCIe-capability-bits-read-only-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/09-xen-pt-mark-reserved-bits-in-PCI-config-space-fields-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/10-xen-pt-add-a-few-PCI-config-space-field-descriptions-CVE-2015-4106.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch

diff --git a/meta/recipes-devtools/qemu/qemu/01-xen-properly-gate-host-writes-of-modified-PCI-CFG-contents-CVE-2015-4103.patch b/meta/recipes-devtools/qemu/qemu/01-xen-properly-gate-host-writes-of-modified-PCI-CFG-contents-CVE-2015-4103.patch
new file mode 100644
index 0000000..42a4960
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/01-xen-properly-gate-host-writes-of-modified-PCI-CFG-contents-CVE-2015-4103.patch
@@ -0,0 +1,140 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 5c83b2f5b4b956e91dd6e5711f14df7ab800aefb Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:00 +0000
+Subject: xen: properly gate host writes of modified PCI CFG contents
+Bug-Debian: http://bugs.debian.org/787547
+
+The old logic didn't work as intended when an access spanned multiple
+fields (for example a 32-bit access to the location of the MSI Message
+Data field with the high 16 bits not being covered by any known field).
+Remove it and derive which fields not to write to from the accessed
+fields' emulation masks: When they're all ones, there's no point in
+doing any host write.
+
+This fixes a secondary issue at once: We obviously shouldn't make any
+host write attempt when already the host read failed.
+
+This is XSA-128.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Reviewed-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+---
+ hw/xen/xen_pt.c             | 25 +++++++++++++++++++++----
+ hw/xen/xen_pt.h             |  2 --
+ hw/xen/xen_pt_config_init.c |  4 ----
+ 3 files changed, 21 insertions(+), 10 deletions(-)
+
+diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
+index d095c08..8923582 100644
+--- a/hw/xen/xen_pt.c
++++ b/hw/xen/xen_pt.c
+@@ -234,7 +234,7 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
+     int index = 0;
+     XenPTRegGroup *reg_grp_entry = NULL;
+     int rc = 0;
+-    uint32_t read_val = 0;
++    uint32_t read_val = 0, wb_mask;
+     int emul_len = 0;
+     XenPTReg *reg_entry = NULL;
+     uint32_t find_addr = addr;
+@@ -271,6 +271,9 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
+     if (rc < 0) {
+         XEN_PT_ERR(d, "pci_read_block failed. return value: %d.\n", rc);
+         memset(&read_val, 0xff, len);
++        wb_mask = 0;
++    } else {
++        wb_mask = 0xFFFFFFFF >> ((4 - len) << 3);
+     }
+ 
+     /* pass directly to the real device for passthrough type register group */
+@@ -298,6 +301,11 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
+ 
+             valid_mask <<= (find_addr - real_offset) << 3;
+             ptr_val = (uint8_t *)&val + (real_offset & 3);
++            if (reg->emu_mask == (0xFFFFFFFF >> ((4 - reg->size) << 3))) {
++                wb_mask &= ~((reg->emu_mask
++                              >> ((find_addr - real_offset) << 3))
++                             << ((len - emul_len) << 3));
++            }
+ 
+             /* do emulation based on register size */
+             switch (reg->size) {
+@@ -350,10 +358,19 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
+     memory_region_transaction_commit();
+ 
+ out:
+-    if (!(reg && reg->no_wb)) {
++    for (index = 0; wb_mask; index += len) {
+         /* unknown regs are passed through */
+-        rc = xen_host_pci_set_block(&s->real_device, addr,
+-                                    (uint8_t *)&val, len);
++        while (!(wb_mask & 0xff)) {
++            index++;
++            wb_mask >>= 8;
++        }
++        len = 0;
++        do {
++            len++;
++            wb_mask >>= 8;
++        } while (wb_mask & 0xff);
++        rc = xen_host_pci_set_block(&s->real_device, addr + index,
++                                    (uint8_t *)&val + index, len);
+ 
+         if (rc < 0) {
+             XEN_PT_ERR(d, "pci_write_block failed. return value: %d.\n", rc);
+diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
+index 942dc60..52ceb85 100644
+--- a/hw/xen/xen_pt.h
++++ b/hw/xen/xen_pt.h
+@@ -105,8 +105,6 @@ struct XenPTRegInfo {
+     uint32_t ro_mask;
+     /* reg emulate field mask (ON:emu, OFF:passthrough) */
+     uint32_t emu_mask;
+-    /* no write back allowed */
+-    uint32_t no_wb;
+     xen_pt_conf_reg_init init;
+     /* read/write function pointer
+      * for double_word/word/byte size */
+diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
+index 95a51db..dae0519 100644
+--- a/hw/xen/xen_pt_config_init.c
++++ b/hw/xen/xen_pt_config_init.c
+@@ -1279,7 +1279,6 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
+         .init_val   = 0x00000000,
+         .ro_mask    = 0x00000003,
+         .emu_mask   = 0xFFFFFFFF,
+-        .no_wb      = 1,
+         .init       = xen_pt_common_reg_init,
+         .u.dw.read  = xen_pt_long_reg_read,
+         .u.dw.write = xen_pt_msgaddr32_reg_write,
+@@ -1291,7 +1290,6 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
+         .init_val   = 0x00000000,
+         .ro_mask    = 0x00000000,
+         .emu_mask   = 0xFFFFFFFF,
+-        .no_wb      = 1,
+         .init       = xen_pt_msgaddr64_reg_init,
+         .u.dw.read  = xen_pt_long_reg_read,
+         .u.dw.write = xen_pt_msgaddr64_reg_write,
+@@ -1303,7 +1301,6 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
+         .init_val   = 0x0000,
+         .ro_mask    = 0x0000,
+         .emu_mask   = 0xFFFF,
+-        .no_wb      = 1,
+         .init       = xen_pt_msgdata_reg_init,
+         .u.w.read   = xen_pt_word_reg_read,
+         .u.w.write  = xen_pt_msgdata_reg_write,
+@@ -1315,7 +1312,6 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
+         .init_val   = 0x0000,
+         .ro_mask    = 0x0000,
+         .emu_mask   = 0xFFFF,
+-        .no_wb      = 1,
+         .init       = xen_pt_msgdata_reg_init,
+         .u.w.read   = xen_pt_word_reg_read,
+         .u.w.write  = xen_pt_msgdata_reg_write,
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/02-xen-dont-allow-guest-to-control-MSI-mask-register-CVE-2015-4104.patch b/meta/recipes-devtools/qemu/qemu/02-xen-dont-allow-guest-to-control-MSI-mask-register-CVE-2015-4104.patch
new file mode 100644
index 0000000..252bf02
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/02-xen-dont-allow-guest-to-control-MSI-mask-register-CVE-2015-4104.patch
@@ -0,0 +1,194 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 7611dae8a69f0f1775ba1a9a942961c2aa10d88e Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:00 +0000
+Subject: xen: don't allow guest to control MSI mask register
+Bug-Debian: http://bugs.debian.org/787547
+
+It's being used by the hypervisor. For now simply mimic a device not
+capable of masking, and fully emulate any accesses a guest may issue
+nevertheless as simple reads/writes without side effects.
+
+This is XSA-129.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Reviewed-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+---
+ hw/pci/msi.c                |  4 --
+ hw/xen/xen_pt_config_init.c | 98 ++++++++++++++++++++++++++++++++++++++++-----
+ include/hw/pci/pci_regs.h   |  2 +
+ 3 files changed, 90 insertions(+), 14 deletions(-)
+
+diff --git a/hw/pci/msi.c b/hw/pci/msi.c
+index c111dba..f9c0484 100644
+--- a/hw/pci/msi.c
++++ b/hw/pci/msi.c
+@@ -21,10 +21,6 @@
+ #include "hw/pci/msi.h"
+ #include "qemu/range.h"
+ 
+-/* Eventually those constants should go to Linux pci_regs.h */
+-#define PCI_MSI_PENDING_32      0x10
+-#define PCI_MSI_PENDING_64      0x14
+-
+ /* PCI_MSI_ADDRESS_LO */
+ #define PCI_MSI_ADDRESS_LO_MASK         (~0x3)
+ 
+diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
+index dae0519..68b8f22 100644
+--- a/hw/xen/xen_pt_config_init.c
++++ b/hw/xen/xen_pt_config_init.c
+@@ -1016,13 +1016,9 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] = {
+  */
+ 
+ /* Helper */
+-static bool xen_pt_msgdata_check_type(uint32_t offset, uint16_t flags)
+-{
+-    /* check the offset whether matches the type or not */
+-    bool is_32 = (offset == PCI_MSI_DATA_32) && !(flags & PCI_MSI_FLAGS_64BIT);
+-    bool is_64 = (offset == PCI_MSI_DATA_64) &&  (flags & PCI_MSI_FLAGS_64BIT);
+-    return is_32 || is_64;
+-}
++#define xen_pt_msi_check_type(offset, flags, what) \
++        ((offset) == ((flags) & PCI_MSI_FLAGS_64BIT ? \
++                      PCI_MSI_##what##_64 : PCI_MSI_##what##_32))
+ 
+ /* Message Control register */
+ static int xen_pt_msgctrl_reg_init(XenPCIPassthroughState *s,
+@@ -1134,7 +1130,45 @@ static int xen_pt_msgdata_reg_init(XenPCIPassthroughState *s,
+     uint32_t offset = reg->offset;
+ 
+     /* check the offset whether matches the type or not */
+-    if (xen_pt_msgdata_check_type(offset, flags)) {
++    if (xen_pt_msi_check_type(offset, flags, DATA)) {
++        *data = reg->init_val;
++    } else {
++        *data = XEN_PT_INVALID_REG;
++    }
++    return 0;
++}
++
++/* this function will be called twice (for 32 bit and 64 bit type) */
++/* initialize Mask register */
++static int xen_pt_mask_reg_init(XenPCIPassthroughState *s,
++                                XenPTRegInfo *reg, uint32_t real_offset,
++                                uint32_t *data)
++{
++    uint32_t flags = s->msi->flags;
++
++    /* check the offset whether matches the type or not */
++    if (!(flags & PCI_MSI_FLAGS_MASKBIT)) {
++        *data = XEN_PT_INVALID_REG;
++    } else if (xen_pt_msi_check_type(reg->offset, flags, MASK)) {
++        *data = reg->init_val;
++    } else {
++        *data = XEN_PT_INVALID_REG;
++    }
++    return 0;
++}
++
++/* this function will be called twice (for 32 bit and 64 bit type) */
++/* initialize Pending register */
++static int xen_pt_pending_reg_init(XenPCIPassthroughState *s,
++                                   XenPTRegInfo *reg, uint32_t real_offset,
++                                   uint32_t *data)
++{
++    uint32_t flags = s->msi->flags;
++
++    /* check the offset whether matches the type or not */
++    if (!(flags & PCI_MSI_FLAGS_MASKBIT)) {
++        *data = XEN_PT_INVALID_REG;
++    } else if (xen_pt_msi_check_type(reg->offset, flags, PENDING)) {
+         *data = reg->init_val;
+     } else {
+         *data = XEN_PT_INVALID_REG;
+@@ -1222,7 +1256,7 @@ static int xen_pt_msgdata_reg_write(XenPCIPassthroughState *s,
+     uint32_t offset = reg->offset;
+ 
+     /* check the offset whether matches the type or not */
+-    if (!xen_pt_msgdata_check_type(offset, msi->flags)) {
++    if (!xen_pt_msi_check_type(offset, msi->flags, DATA)) {
+         /* exit I/O emulator */
+         XEN_PT_ERR(&s->dev, "the offset does not match the 32/64 bit type!\n");
+         return -1;
+@@ -1267,7 +1301,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
+         .size       = 2,
+         .init_val   = 0x0000,
+         .ro_mask    = 0xFF8E,
+-        .emu_mask   = 0x007F,
++        .emu_mask   = 0x017F,
+         .init       = xen_pt_msgctrl_reg_init,
+         .u.w.read   = xen_pt_word_reg_read,
+         .u.w.write  = xen_pt_msgctrl_reg_write,
+@@ -1316,6 +1350,50 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
+         .u.w.read   = xen_pt_word_reg_read,
+         .u.w.write  = xen_pt_msgdata_reg_write,
+     },
++    /* Mask reg (if PCI_MSI_FLAGS_MASKBIT set, for 32-bit devices) */
++    {
++        .offset     = PCI_MSI_MASK_32,
++        .size       = 4,
++        .init_val   = 0x00000000,
++        .ro_mask    = 0xFFFFFFFF,
++        .emu_mask   = 0xFFFFFFFF,
++        .init       = xen_pt_mask_reg_init,
++        .u.dw.read  = xen_pt_long_reg_read,
++        .u.dw.write = xen_pt_long_reg_write,
++    },
++    /* Mask reg (if PCI_MSI_FLAGS_MASKBIT set, for 64-bit devices) */
++    {
++        .offset     = PCI_MSI_MASK_64,
++        .size       = 4,
++        .init_val   = 0x00000000,
++        .ro_mask    = 0xFFFFFFFF,
++        .emu_mask   = 0xFFFFFFFF,
++        .init       = xen_pt_mask_reg_init,
++        .u.dw.read  = xen_pt_long_reg_read,
++        .u.dw.write = xen_pt_long_reg_write,
++    },
++    /* Pending reg (if PCI_MSI_FLAGS_MASKBIT set, for 32-bit devices) */
++    {
++        .offset     = PCI_MSI_MASK_32 + 4,
++        .size       = 4,
++        .init_val   = 0x00000000,
++        .ro_mask    = 0xFFFFFFFF,
++        .emu_mask   = 0x00000000,
++        .init       = xen_pt_pending_reg_init,
++        .u.dw.read  = xen_pt_long_reg_read,
++        .u.dw.write = xen_pt_long_reg_write,
++    },
++    /* Pending reg (if PCI_MSI_FLAGS_MASKBIT set, for 64-bit devices) */
++    {
++        .offset     = PCI_MSI_MASK_64 + 4,
++        .size       = 4,
++        .init_val   = 0x00000000,
++        .ro_mask    = 0xFFFFFFFF,
++        .emu_mask   = 0x00000000,
++        .init       = xen_pt_pending_reg_init,
++        .u.dw.read  = xen_pt_long_reg_read,
++        .u.dw.write = xen_pt_long_reg_write,
++    },
+     {
+         .size = 0,
+     },
+diff --git a/include/hw/pci/pci_regs.h b/include/hw/pci/pci_regs.h
+index 56a404b..57e8c80 100644
+--- a/include/hw/pci/pci_regs.h
++++ b/include/hw/pci/pci_regs.h
+@@ -298,8 +298,10 @@
+ #define PCI_MSI_ADDRESS_HI	8	/* Upper 32 bits (if PCI_MSI_FLAGS_64BIT set) */
+ #define PCI_MSI_DATA_32		8	/* 16 bits of data for 32-bit devices */
+ #define PCI_MSI_MASK_32		12	/* Mask bits register for 32-bit devices */
++#define PCI_MSI_PENDING_32	16	/* Pending bits register for 32-bit devices */
+ #define PCI_MSI_DATA_64		12	/* 16 bits of data for 64-bit devices */
+ #define PCI_MSI_MASK_64		16	/* Mask bits register for 64-bit devices */
++#define PCI_MSI_PENDING_64	20	/* Pending bits register for 32-bit devices */
+ 
+ /* MSI-X registers */
+ #define PCI_MSIX_FLAGS		2
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/03-xen-MSI-X-limit-error-messages-CVE-2015-4105.patch b/meta/recipes-devtools/qemu/qemu/03-xen-MSI-X-limit-error-messages-CVE-2015-4105.patch
new file mode 100644
index 0000000..8bb2230
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/03-xen-MSI-X-limit-error-messages-CVE-2015-4105.patch
@@ -0,0 +1,90 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From b38ec5ee7a581776bbce0bdaecb397632c3c4791 Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:00 +0000
+Subject: xen/MSI-X: limit error messages
+Bug-Debian: http://bugs.debian.org/787547
+
+Limit error messages resulting from bad guest behavior to avoid allowing
+the guest to cause the control domain's disk to fill.
+
+The first message in pci_msix_write() can simply be deleted, as this
+is indeed bad guest behavior, but such out of bounds writes don't
+really need to be logged.
+
+The second one is more problematic, as there guest behavior may only
+appear to be wrong: For one, the old logic didn't take the mask-all bit
+into account. And then this shouldn't depend on host device state (i.e.
+the host may have masked the entry without the guest having done so).
+Plus these writes shouldn't be dropped even when an entry is unmasked.
+Instead, if they can't be made take effect right away, they should take
+effect on the next unmasking or enabling operation - the specification
+explicitly describes such caching behavior. Until we can validly drop
+the message (implementing such caching/latching behavior), issue the
+message just once per MSI-X table entry.
+
+Note that the log message in pci_msix_read() similar to the one being
+removed here is not an issue: "addr" being of unsigned type, and the
+maximum size of the MSI-X table being 32k, entry_nr simply can't be
+negative and hence the conditonal guarding issuing of the message will
+never be true.
+
+This is XSA-130.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Reviewed-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+---
+ hw/xen/xen_pt.h     |  1 +
+ hw/xen/xen_pt_msi.c | 12 +++++++-----
+ 2 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
+index 52ceb85..8c9b6c2 100644
+--- a/hw/xen/xen_pt.h
++++ b/hw/xen/xen_pt.h
+@@ -175,6 +175,7 @@ typedef struct XenPTMSIXEntry {
+     uint32_t data;
+     uint32_t vector_ctrl;
+     bool updated; /* indicate whether MSI ADDR or DATA is updated */
++    bool warned;  /* avoid issuing (bogus) warning more than once */
+ } XenPTMSIXEntry;
+ typedef struct XenPTMSIX {
+     uint32_t ctrl_offset;
+diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
+index 9ed9321..68db623 100644
+--- a/hw/xen/xen_pt_msi.c
++++ b/hw/xen/xen_pt_msi.c
+@@ -434,11 +434,10 @@ static void pci_msix_write(void *opaque, hwaddr addr,
+     XenPCIPassthroughState *s = opaque;
+     XenPTMSIX *msix = s->msix;
+     XenPTMSIXEntry *entry;
+-    int entry_nr, offset;
++    unsigned int entry_nr, offset;
+ 
+     entry_nr = addr / PCI_MSIX_ENTRY_SIZE;
+-    if (entry_nr < 0 || entry_nr >= msix->total_entries) {
+-        XEN_PT_ERR(&s->dev, "asked MSI-X entry '%i' invalid!\n", entry_nr);
++    if (entry_nr >= msix->total_entries) {
+         return;
+     }
+     entry = &msix->msix_entry[entry_nr];
+@@ -460,8 +459,11 @@ static void pci_msix_write(void *opaque, hwaddr addr,
+             + PCI_MSIX_ENTRY_VECTOR_CTRL;
+ 
+         if (msix->enabled && !(*vec_ctrl & PCI_MSIX_ENTRY_CTRL_MASKBIT)) {
+-            XEN_PT_ERR(&s->dev, "Can't update msix entry %d since MSI-X is"
+-                       " already enabled.\n", entry_nr);
++            if (!entry->warned) {
++                entry->warned = true;
++                XEN_PT_ERR(&s->dev, "Can't update msix entry %d since MSI-X is"
++                           " already enabled.\n", entry_nr);
++            }
+             return;
+         }
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/04-xen-MSI-dont-open-code-pass-through-of-enable-bit-mod-CVE-2015-4106.patch b/meta/recipes-devtools/qemu/qemu/04-xen-MSI-dont-open-code-pass-through-of-enable-bit-mod-CVE-2015-4106.patch
new file mode 100644
index 0000000..87fb7f6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/04-xen-MSI-dont-open-code-pass-through-of-enable-bit-mod-CVE-2015-4106.patch
@@ -0,0 +1,76 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From d1d35cf4ffb6a60a356193397919e83306d0bb74 Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:01 +0000
+Subject: xen/MSI: don't open-code pass-through of enable bit modifications
+Bug-Debian: http://bugs.debian.org/787547
+
+Without this the actual XSA-131 fix would cause the enable bit to not
+get set anymore (due to the write back getting suppressed there based
+on the OR of emu_mask, ro_mask, and res_mask).
+
+Note that the fiddling with the enable bit shouldn't really be done by
+qemu, but making this work right (via libxc and the hypervisor) will
+require more extensive changes, which can be postponed until after the
+security issue got addressed.
+
+This is a preparatory patch for XSA-131.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+---
+ hw/xen/xen_pt_config_init.c | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
+index 68b8f22..436d0fd 100644
+--- a/hw/xen/xen_pt_config_init.c
++++ b/hw/xen/xen_pt_config_init.c
+@@ -1053,7 +1053,6 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthroughState *s,
+     XenPTMSI *msi = s->msi;
+     uint16_t writable_mask = 0;
+     uint16_t throughable_mask = 0;
+-    uint16_t raw_val;
+ 
+     /* Currently no support for multi-vector */
+     if (*val & PCI_MSI_FLAGS_QSIZE) {
+@@ -1066,12 +1065,11 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthroughState *s,
+     msi->flags |= cfg_entry->data & ~PCI_MSI_FLAGS_ENABLE;
+ 
+     /* create value for writing to I/O device register */
+-    raw_val = *val;
+     throughable_mask = ~reg->emu_mask & valid_mask;
+     *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
+ 
+     /* update MSI */
+-    if (raw_val & PCI_MSI_FLAGS_ENABLE) {
++    if (*val & PCI_MSI_FLAGS_ENABLE) {
+         /* setup MSI pirq for the first time */
+         if (!msi->initialized) {
+             /* Init physical one */
+@@ -1099,10 +1097,6 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthroughState *s,
+         xen_pt_msi_disable(s);
+     }
+ 
+-    /* pass through MSI_ENABLE bit */
+-    *val &= ~PCI_MSI_FLAGS_ENABLE;
+-    *val |= raw_val & PCI_MSI_FLAGS_ENABLE;
+-
+     return 0;
+ }
+ 
+@@ -1301,7 +1295,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
+         .size       = 2,
+         .init_val   = 0x0000,
+         .ro_mask    = 0xFF8E,
+-        .emu_mask   = 0x017F,
++        .emu_mask   = 0x017E,
+         .init       = xen_pt_msgctrl_reg_init,
+         .u.w.read   = xen_pt_word_reg_read,
+         .u.w.write  = xen_pt_msgctrl_reg_write,
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/05-xen-pt-consolidate-PM-capability-emu_mask-CVE-2015-4106.patch b/meta/recipes-devtools/qemu/qemu/05-xen-pt-consolidate-PM-capability-emu_mask-CVE-2015-4106.patch
new file mode 100644
index 0000000..e9e4fcc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/05-xen-pt-consolidate-PM-capability-emu_mask-CVE-2015-4106.patch
@@ -0,0 +1,86 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From d61bb2482dc0c7426f451f23ba7e2748ae2cc06d Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:01 +0000
+Subject: xen/pt: consolidate PM capability emu_mask
+Bug-Debian: http://bugs.debian.org/787547
+
+There's no point in xen_pt_pmcsr_reg_{read,write}() each ORing
+PCI_PM_CTRL_STATE_MASK and PCI_PM_CTRL_NO_SOFT_RESET into a local
+emu_mask variable - we can have the same effect by setting the field
+descriptor's emu_mask member suitably right away. Note that
+xen_pt_pmcsr_reg_write() is being retained in order to allow later
+patches to be less intrusive.
+
+This is a preparatory patch for XSA-131.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+Acked-by: Ian Campbell <ian.campbell@citrix.com>
+---
+ hw/xen/xen_pt_config_init.c | 25 ++++---------------------
+ 1 file changed, 4 insertions(+), 21 deletions(-)
+
+diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
+index 436d0fd..516236a 100644
+--- a/hw/xen/xen_pt_config_init.c
++++ b/hw/xen/xen_pt_config_init.c
+@@ -933,38 +933,21 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
+  * Power Management Capability
+  */
+ 
+-/* read Power Management Control/Status register */
+-static int xen_pt_pmcsr_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
+-                                 uint16_t *value, uint16_t valid_mask)
+-{
+-    XenPTRegInfo *reg = cfg_entry->reg;
+-    uint16_t valid_emu_mask = reg->emu_mask;
+-
+-    valid_emu_mask |= PCI_PM_CTRL_STATE_MASK | PCI_PM_CTRL_NO_SOFT_RESET;
+-
+-    valid_emu_mask = valid_emu_mask & valid_mask;
+-    *value = XEN_PT_MERGE_VALUE(*value, cfg_entry->data, ~valid_emu_mask);
+-
+-    return 0;
+-}
+ /* write Power Management Control/Status register */
+ static int xen_pt_pmcsr_reg_write(XenPCIPassthroughState *s,
+                                   XenPTReg *cfg_entry, uint16_t *val,
+                                   uint16_t dev_value, uint16_t valid_mask)
+ {
+     XenPTRegInfo *reg = cfg_entry->reg;
+-    uint16_t emu_mask = reg->emu_mask;
+     uint16_t writable_mask = 0;
+     uint16_t throughable_mask = 0;
+ 
+-    emu_mask |= PCI_PM_CTRL_STATE_MASK | PCI_PM_CTRL_NO_SOFT_RESET;
+-
+     /* modify emulate register */
+-    writable_mask = emu_mask & ~reg->ro_mask & valid_mask;
++    writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+     cfg_entry->data = XEN_PT_MERGE_VALUE(*val, cfg_entry->data, writable_mask);
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~emu_mask & valid_mask;
++    throughable_mask = ~reg->emu_mask & valid_mask;
+     *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
+ 
+     return 0;
+@@ -1000,9 +983,9 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] = {
+         .size       = 2,
+         .init_val   = 0x0008,
+         .ro_mask    = 0xE1FC,
+-        .emu_mask   = 0x8100,
++        .emu_mask   = 0x810B,
+         .init       = xen_pt_common_reg_init,
+-        .u.w.read   = xen_pt_pmcsr_reg_read,
++        .u.w.read   = xen_pt_word_reg_read,
+         .u.w.write  = xen_pt_pmcsr_reg_write,
+     },
+     {
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/06-xen-pt-correctly-handle-PM-status-bit-CVE-2015-4106.patch b/meta/recipes-devtools/qemu/qemu/06-xen-pt-correctly-handle-PM-status-bit-CVE-2015-4106.patch
new file mode 100644
index 0000000..37758cd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/06-xen-pt-correctly-handle-PM-status-bit-CVE-2015-4106.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From c4ff1e68c621928abc680266cad0a451686c403b Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:01 +0000
+Subject: xen/pt: correctly handle PM status bit
+Bug-Debian: http://bugs.debian.org/787547
+
+xen_pt_pmcsr_reg_write() needs an adjustment to deal with the RW1C
+nature of the not passed through bit 15 (PCI_PM_CTRL_PME_STATUS).
+
+This is a preparatory patch for XSA-131.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Reviewed-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+---
+ hw/xen/xen_pt_config_init.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
+index 516236a..027ac32 100644
+--- a/hw/xen/xen_pt_config_init.c
++++ b/hw/xen/xen_pt_config_init.c
+@@ -948,7 +948,8 @@ static int xen_pt_pmcsr_reg_write(XenPCIPassthroughState *s,
+ 
+     /* create value for writing to I/O device register */
+     throughable_mask = ~reg->emu_mask & valid_mask;
+-    *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
++    *val = XEN_PT_MERGE_VALUE(*val, dev_value & ~PCI_PM_CTRL_PME_STATUS,
++                              throughable_mask);
+ 
+     return 0;
+ }
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/07-xen-pt-split-out-calculation-of-throughable-mask-CVE-2015-4106.patch b/meta/recipes-devtools/qemu/qemu/07-xen-pt-split-out-calculation-of-throughable-mask-CVE-2015-4106.patch
new file mode 100644
index 0000000..28b7592
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/07-xen-pt-split-out-calculation-of-throughable-mask-CVE-2015-4106.patch
@@ -0,0 +1,265 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 0e7ef22136955169a0fd03c4e41af95662352733 Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:01 +0000
+Subject: xen/pt: split out calculation of throughable mask in
+ PCI config space handling
+Bug-Debian: http://bugs.debian.org/787547
+
+This is just to avoid having to adjust that calculation later in
+multiple places.
+
+Note that including ->ro_mask in get_throughable_mask()'s calculation
+is only an apparent (i.e. benign) behavioral change: For r/o fields it
+doesn't matter > whether they get passed through - either the same flag
+is also set in emu_mask (then there's no change at all) or the field is
+r/o in hardware (and hence a write won't change it anyway).
+
+This is a preparatory patch for XSA-131.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
+---
+ hw/xen/xen_pt_config_init.c | 51 ++++++++++++++++++---------------------------
+ 1 file changed, 20 insertions(+), 31 deletions(-)
+
+diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
+index 027ac32..3833b9e 100644
+--- a/hw/xen/xen_pt_config_init.c
++++ b/hw/xen/xen_pt_config_init.c
+@@ -95,6 +95,14 @@ XenPTReg *xen_pt_find_reg(XenPTRegGroup *reg_grp, uint32_t address)
+     return NULL;
+ }
+ 
++static uint32_t get_throughable_mask(const XenPCIPassthroughState *s,
++                                     const XenPTRegInfo *reg,
++                                     uint32_t valid_mask)
++{
++    uint32_t throughable_mask = ~(reg->emu_mask | reg->ro_mask);
++
++    return throughable_mask & valid_mask;
++}
+ 
+ /****************
+  * general register functions
+@@ -157,14 +165,13 @@ static int xen_pt_byte_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
+ {
+     XenPTRegInfo *reg = cfg_entry->reg;
+     uint8_t writable_mask = 0;
+-    uint8_t throughable_mask = 0;
++    uint8_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+ 
+     /* modify emulate register */
+     writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+     cfg_entry->data = XEN_PT_MERGE_VALUE(*val, cfg_entry->data, writable_mask);
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~reg->emu_mask & valid_mask;
+     *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
+ 
+     return 0;
+@@ -175,14 +182,13 @@ static int xen_pt_word_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
+ {
+     XenPTRegInfo *reg = cfg_entry->reg;
+     uint16_t writable_mask = 0;
+-    uint16_t throughable_mask = 0;
++    uint16_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+ 
+     /* modify emulate register */
+     writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+     cfg_entry->data = XEN_PT_MERGE_VALUE(*val, cfg_entry->data, writable_mask);
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~reg->emu_mask & valid_mask;
+     *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
+ 
+     return 0;
+@@ -193,14 +199,13 @@ static int xen_pt_long_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
+ {
+     XenPTRegInfo *reg = cfg_entry->reg;
+     uint32_t writable_mask = 0;
+-    uint32_t throughable_mask = 0;
++    uint32_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+ 
+     /* modify emulate register */
+     writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+     cfg_entry->data = XEN_PT_MERGE_VALUE(*val, cfg_entry->data, writable_mask);
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~reg->emu_mask & valid_mask;
+     *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
+ 
+     return 0;
+@@ -292,15 +297,13 @@ static int xen_pt_cmd_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
+ {
+     XenPTRegInfo *reg = cfg_entry->reg;
+     uint16_t writable_mask = 0;
+-    uint16_t throughable_mask = 0;
++    uint16_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+ 
+     /* modify emulate register */
+     writable_mask = ~reg->ro_mask & valid_mask;
+     cfg_entry->data = XEN_PT_MERGE_VALUE(*val, cfg_entry->data, writable_mask);
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~reg->emu_mask & valid_mask;
+-
+     if (*val & PCI_COMMAND_INTX_DISABLE) {
+         throughable_mask |= PCI_COMMAND_INTX_DISABLE;
+     } else {
+@@ -454,7 +457,6 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
+     PCIDevice *d = &s->dev;
+     const PCIIORegion *r;
+     uint32_t writable_mask = 0;
+-    uint32_t throughable_mask = 0;
+     uint32_t bar_emu_mask = 0;
+     uint32_t bar_ro_mask = 0;
+     uint32_t r_size = 0;
+@@ -511,8 +513,7 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
+     }
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~bar_emu_mask & valid_mask;
+-    *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
++    *val = XEN_PT_MERGE_VALUE(*val, dev_value, 0);
+ 
+     return 0;
+ }
+@@ -526,9 +527,8 @@ static int xen_pt_exp_rom_bar_reg_write(XenPCIPassthroughState *s,
+     XenPTRegion *base = NULL;
+     PCIDevice *d = (PCIDevice *)&s->dev;
+     uint32_t writable_mask = 0;
+-    uint32_t throughable_mask = 0;
++    uint32_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+     pcibus_t r_size = 0;
+-    uint32_t bar_emu_mask = 0;
+     uint32_t bar_ro_mask = 0;
+ 
+     r_size = d->io_regions[PCI_ROM_SLOT].size;
+@@ -537,7 +537,6 @@ static int xen_pt_exp_rom_bar_reg_write(XenPCIPassthroughState *s,
+     r_size = xen_pt_get_emul_size(base->bar_flag, r_size);
+ 
+     /* set emulate mask and read-only mask */
+-    bar_emu_mask = reg->emu_mask;
+     bar_ro_mask = (reg->ro_mask | (r_size - 1)) & ~PCI_ROM_ADDRESS_ENABLE;
+ 
+     /* modify emulate register */
+@@ -545,7 +544,6 @@ static int xen_pt_exp_rom_bar_reg_write(XenPCIPassthroughState *s,
+     cfg_entry->data = XEN_PT_MERGE_VALUE(*val, cfg_entry->data, writable_mask);
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~bar_emu_mask & valid_mask;
+     *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
+ 
+     return 0;
+@@ -940,14 +938,13 @@ static int xen_pt_pmcsr_reg_write(XenPCIPassthroughState *s,
+ {
+     XenPTRegInfo *reg = cfg_entry->reg;
+     uint16_t writable_mask = 0;
+-    uint16_t throughable_mask = 0;
++    uint16_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+ 
+     /* modify emulate register */
+     writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+     cfg_entry->data = XEN_PT_MERGE_VALUE(*val, cfg_entry->data, writable_mask);
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~reg->emu_mask & valid_mask;
+     *val = XEN_PT_MERGE_VALUE(*val, dev_value & ~PCI_PM_CTRL_PME_STATUS,
+                               throughable_mask);
+ 
+@@ -1036,7 +1033,7 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthroughState *s,
+     XenPTRegInfo *reg = cfg_entry->reg;
+     XenPTMSI *msi = s->msi;
+     uint16_t writable_mask = 0;
+-    uint16_t throughable_mask = 0;
++    uint16_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+ 
+     /* Currently no support for multi-vector */
+     if (*val & PCI_MSI_FLAGS_QSIZE) {
+@@ -1049,7 +1046,6 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthroughState *s,
+     msi->flags |= cfg_entry->data & ~PCI_MSI_FLAGS_ENABLE;
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~reg->emu_mask & valid_mask;
+     *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
+ 
+     /* update MSI */
+@@ -1161,7 +1157,6 @@ static int xen_pt_msgaddr32_reg_write(XenPCIPassthroughState *s,
+ {
+     XenPTRegInfo *reg = cfg_entry->reg;
+     uint32_t writable_mask = 0;
+-    uint32_t throughable_mask = 0;
+     uint32_t old_addr = cfg_entry->data;
+ 
+     /* modify emulate register */
+@@ -1170,8 +1165,7 @@ static int xen_pt_msgaddr32_reg_write(XenPCIPassthroughState *s,
+     s->msi->addr_lo = cfg_entry->data;
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~reg->emu_mask & valid_mask;
+-    *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
++    *val = XEN_PT_MERGE_VALUE(*val, dev_value, 0);
+ 
+     /* update MSI */
+     if (cfg_entry->data != old_addr) {
+@@ -1189,7 +1183,6 @@ static int xen_pt_msgaddr64_reg_write(XenPCIPassthroughState *s,
+ {
+     XenPTRegInfo *reg = cfg_entry->reg;
+     uint32_t writable_mask = 0;
+-    uint32_t throughable_mask = 0;
+     uint32_t old_addr = cfg_entry->data;
+ 
+     /* check whether the type is 64 bit or not */
+@@ -1206,8 +1199,7 @@ static int xen_pt_msgaddr64_reg_write(XenPCIPassthroughState *s,
+     s->msi->addr_hi = cfg_entry->data;
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~reg->emu_mask & valid_mask;
+-    *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
++    *val = XEN_PT_MERGE_VALUE(*val, dev_value, 0);
+ 
+     /* update MSI */
+     if (cfg_entry->data != old_addr) {
+@@ -1229,7 +1221,6 @@ static int xen_pt_msgdata_reg_write(XenPCIPassthroughState *s,
+     XenPTRegInfo *reg = cfg_entry->reg;
+     XenPTMSI *msi = s->msi;
+     uint16_t writable_mask = 0;
+-    uint16_t throughable_mask = 0;
+     uint16_t old_data = cfg_entry->data;
+     uint32_t offset = reg->offset;
+ 
+@@ -1247,8 +1238,7 @@ static int xen_pt_msgdata_reg_write(XenPCIPassthroughState *s,
+     msi->data = cfg_entry->data;
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~reg->emu_mask & valid_mask;
+-    *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
++    *val = XEN_PT_MERGE_VALUE(*val, dev_value, 0);
+ 
+     /* update MSI */
+     if (cfg_entry->data != old_data) {
+@@ -1410,7 +1400,7 @@ static int xen_pt_msixctrl_reg_write(XenPCIPassthroughState *s,
+ {
+     XenPTRegInfo *reg = cfg_entry->reg;
+     uint16_t writable_mask = 0;
+-    uint16_t throughable_mask = 0;
++    uint16_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+     int debug_msix_enabled_old;
+ 
+     /* modify emulate register */
+@@ -1418,7 +1408,6 @@ static int xen_pt_msixctrl_reg_write(XenPCIPassthroughState *s,
+     cfg_entry->data = XEN_PT_MERGE_VALUE(*val, cfg_entry->data, writable_mask);
+ 
+     /* create value for writing to I/O device register */
+-    throughable_mask = ~reg->emu_mask & valid_mask;
+     *val = XEN_PT_MERGE_VALUE(*val, dev_value, throughable_mask);
+ 
+     /* update MSI-X */
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/08-xen-pt-mark-all-PCIe-capability-bits-read-only-CVE-2015-4106.patch b/meta/recipes-devtools/qemu/qemu/08-xen-pt-mark-all-PCIe-capability-bits-read-only-CVE-2015-4106.patch
new file mode 100644
index 0000000..4236a12
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/08-xen-pt-mark-all-PCIe-capability-bits-read-only-CVE-2015-4106.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 45ebe3916ab16f859ed930e92fbd52d84d5dcdaf Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:01 +0000
+Subject: xen/pt: mark all PCIe capability bits read-only
+Bug-Debian: http://bugs.debian.org/787547
+
+xen_pt_emu_reg_pcie[]'s PCI_EXP_DEVCAP needs to cover all bits as read-
+only to avoid unintended write-back (just a precaution, the field ought
+to be read-only in hardware).
+
+This is a preparatory patch for XSA-131.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Reviewed-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+---
+ hw/xen/xen_pt_config_init.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
+index 3833b9e..9f6c00e 100644
+--- a/hw/xen/xen_pt_config_init.c
++++ b/hw/xen/xen_pt_config_init.c
+@@ -871,7 +871,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
+         .offset     = PCI_EXP_DEVCAP,
+         .size       = 4,
+         .init_val   = 0x00000000,
+-        .ro_mask    = 0x1FFCFFFF,
++        .ro_mask    = 0xFFFFFFFF,
+         .emu_mask   = 0x10000000,
+         .init       = xen_pt_common_reg_init,
+         .u.dw.read  = xen_pt_long_reg_read,
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/09-xen-pt-mark-reserved-bits-in-PCI-config-space-fields-CVE-2015-4106.patch b/meta/recipes-devtools/qemu/qemu/09-xen-pt-mark-reserved-bits-in-PCI-config-space-fields-CVE-2015-4106.patch
new file mode 100644
index 0000000..99b8ba4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/09-xen-pt-mark-reserved-bits-in-PCI-config-space-fields-CVE-2015-4106.patch
@@ -0,0 +1,94 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 0ad3393ad032f76e88b4dbd04d36ad84dff75dd6 Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:01 +0000
+Subject: xen/pt: mark reserved bits in PCI config space fields
+Bug-Debian: http://bugs.debian.org/787547
+
+The adjustments are solely to make the subsequent patches work right
+(and hence make the patch set consistent), namely if permissive mode
+(introduced by the last patch) gets used (as both reserved registers
+and reserved fields must be similarly protected from guest access in
+default mode, but the guest should be allowed access to them in
+permissive mode).
+
+This is a preparatory patch for XSA-131.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+---
+ hw/xen/xen_pt.h             |  2 ++
+ hw/xen/xen_pt_config_init.c | 14 +++++++++-----
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
+index 8c9b6c2..f9795eb 100644
+--- a/hw/xen/xen_pt.h
++++ b/hw/xen/xen_pt.h
+@@ -101,6 +101,8 @@ struct XenPTRegInfo {
+     uint32_t offset;
+     uint32_t size;
+     uint32_t init_val;
++    /* reg reserved field mask (ON:reserved, OFF:defined) */
++    uint32_t res_mask;
+     /* reg read only field mask (ON:RO/ROS, OFF:other) */
+     uint32_t ro_mask;
+     /* reg emulate field mask (ON:emu, OFF:passthrough) */
+diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
+index 9f6c00e..efd8bac 100644
+--- a/hw/xen/xen_pt_config_init.c
++++ b/hw/xen/xen_pt_config_init.c
+@@ -578,7 +578,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
+         .offset     = PCI_COMMAND,
+         .size       = 2,
+         .init_val   = 0x0000,
+-        .ro_mask    = 0xF880,
++        .res_mask   = 0xF880,
+         .emu_mask   = 0x0743,
+         .init       = xen_pt_common_reg_init,
+         .u.w.read   = xen_pt_word_reg_read,
+@@ -603,7 +603,8 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
+         .offset     = PCI_STATUS,
+         .size       = 2,
+         .init_val   = 0x0000,
+-        .ro_mask    = 0x06FF,
++        .res_mask   = 0x0007,
++        .ro_mask    = 0x06F8,
+         .emu_mask   = 0x0010,
+         .init       = xen_pt_status_reg_init,
+         .u.w.read   = xen_pt_word_reg_read,
+@@ -980,7 +981,8 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] = {
+         .offset     = PCI_PM_CTRL,
+         .size       = 2,
+         .init_val   = 0x0008,
+-        .ro_mask    = 0xE1FC,
++        .res_mask   = 0x00F0,
++        .ro_mask    = 0xE10C,
+         .emu_mask   = 0x810B,
+         .init       = xen_pt_common_reg_init,
+         .u.w.read   = xen_pt_word_reg_read,
+@@ -1268,7 +1270,8 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
+         .offset     = PCI_MSI_FLAGS,
+         .size       = 2,
+         .init_val   = 0x0000,
+-        .ro_mask    = 0xFF8E,
++        .res_mask   = 0xFE00,
++        .ro_mask    = 0x018E,
+         .emu_mask   = 0x017E,
+         .init       = xen_pt_msgctrl_reg_init,
+         .u.w.read   = xen_pt_word_reg_read,
+@@ -1446,7 +1449,8 @@ static XenPTRegInfo xen_pt_emu_reg_msix[] = {
+         .offset     = PCI_MSI_FLAGS,
+         .size       = 2,
+         .init_val   = 0x0000,
+-        .ro_mask    = 0x3FFF,
++        .res_mask   = 0x3800,
++        .ro_mask    = 0x07FF,
+         .emu_mask   = 0x0000,
+         .init       = xen_pt_msixctrl_reg_init,
+         .u.w.read   = xen_pt_word_reg_read,
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/10-xen-pt-add-a-few-PCI-config-space-field-descriptions-CVE-2015-4106.patch b/meta/recipes-devtools/qemu/qemu/10-xen-pt-add-a-few-PCI-config-space-field-descriptions-CVE-2015-4106.patch
new file mode 100644
index 0000000..f30b40a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/10-xen-pt-add-a-few-PCI-config-space-field-descriptions-CVE-2015-4106.patch
@@ -0,0 +1,77 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From a88a3f887181605f4487a22bdfb7d87ffafde5d9 Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:01 +0000
+Subject: xen/pt: add a few PCI config space field descriptions
+Bug-Debian: http://bugs.debian.org/787547
+
+Since the next patch will turn all not explicitly described fields
+read-only by default, those fields that have guest writable bits need
+to be given explicit descriptors.
+
+This is a preparatory patch for XSA-131.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+---
+ hw/xen/xen_pt_config_init.c | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+
+diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
+index efd8bac..19f926b 100644
+--- a/hw/xen/xen_pt_config_init.c
++++ b/hw/xen/xen_pt_config_init.c
+@@ -754,6 +754,15 @@ static XenPTRegInfo xen_pt_emu_reg_vpd[] = {
+         .u.b.write  = xen_pt_byte_reg_write,
+     },
+     {
++        .offset     = PCI_VPD_ADDR,
++        .size       = 2,
++        .ro_mask    = 0x0003,
++        .emu_mask   = 0x0003,
++        .init       = xen_pt_common_reg_init,
++        .u.w.read   = xen_pt_word_reg_read,
++        .u.w.write  = xen_pt_word_reg_write,
++    },
++    {
+         .size = 0,
+     },
+ };
+@@ -889,6 +898,16 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
+         .u.w.read   = xen_pt_word_reg_read,
+         .u.w.write  = xen_pt_word_reg_write,
+     },
++    /* Device Status reg */
++    {
++        .offset     = PCI_EXP_DEVSTA,
++        .size       = 2,
++        .res_mask   = 0xFFC0,
++        .ro_mask    = 0x0030,
++        .init       = xen_pt_common_reg_init,
++        .u.w.read   = xen_pt_word_reg_read,
++        .u.w.write  = xen_pt_word_reg_write,
++    },
+     /* Link Control reg */
+     {
+         .offset     = PCI_EXP_LNKCTL,
+@@ -900,6 +919,15 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
+         .u.w.read   = xen_pt_word_reg_read,
+         .u.w.write  = xen_pt_word_reg_write,
+     },
++    /* Link Status reg */
++    {
++        .offset     = PCI_EXP_LNKSTA,
++        .size       = 2,
++        .ro_mask    = 0x3FFF,
++        .init       = xen_pt_common_reg_init,
++        .u.w.read   = xen_pt_word_reg_read,
++        .u.w.write  = xen_pt_word_reg_write,
++    },
+     /* Device Control 2 reg */
+     {
+         .offset     = 0x28,
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch b/meta/recipes-devtools/qemu/qemu/11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch
new file mode 100644
index 0000000..5bfcf5e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch
@@ -0,0 +1,137 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From c25bbf1545a53ac051f9e51d4140e397660c10ae Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 2 Jun 2015 15:07:01 +0000
+Subject: xen/pt: unknown PCI config space fields should be read-only
+Bug-Debian: http://bugs.debian.org/787547
+
+... by default. Add a per-device "permissive" mode similar to pciback's
+to allow restoring previous behavior (and hence break security again,
+i.e. should be used only for trusted guests).
+
+This is part of XSA-131.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>)
+---
+ hw/xen/xen_pt.c             | 32 +++++++++++++++++++++++++++++---
+ hw/xen/xen_pt.h             |  2 ++
+ hw/xen/xen_pt_config_init.c |  4 ++++
+ 3 files changed, 35 insertions(+), 3 deletions(-)
+
+diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
+index 8923582..9afcda8 100644
+--- a/hw/xen/xen_pt.c
++++ b/hw/xen/xen_pt.c
+@@ -239,6 +239,7 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
+     XenPTReg *reg_entry = NULL;
+     uint32_t find_addr = addr;
+     XenPTRegInfo *reg = NULL;
++    bool wp_flag = false;
+ 
+     if (xen_pt_pci_config_access_check(d, addr, len)) {
+         return;
+@@ -278,6 +279,10 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
+ 
+     /* pass directly to the real device for passthrough type register group */
+     if (reg_grp_entry == NULL) {
++        if (!s->permissive) {
++            wb_mask = 0;
++            wp_flag = true;
++        }
+         goto out;
+     }
+ 
+@@ -298,12 +303,15 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
+             uint32_t real_offset = reg_grp_entry->base_offset + reg->offset;
+             uint32_t valid_mask = 0xFFFFFFFF >> ((4 - emul_len) << 3);
+             uint8_t *ptr_val = NULL;
++            uint32_t wp_mask = reg->emu_mask | reg->ro_mask;
+ 
+             valid_mask <<= (find_addr - real_offset) << 3;
+             ptr_val = (uint8_t *)&val + (real_offset & 3);
+-            if (reg->emu_mask == (0xFFFFFFFF >> ((4 - reg->size) << 3))) {
+-                wb_mask &= ~((reg->emu_mask
+-                              >> ((find_addr - real_offset) << 3))
++            if (!s->permissive) {
++                wp_mask |= reg->res_mask;
++            }
++            if (wp_mask == (0xFFFFFFFF >> ((4 - reg->size) << 3))) {
++                wb_mask &= ~((wp_mask >> ((find_addr - real_offset) << 3))
+                              << ((len - emul_len) << 3));
+             }
+ 
+@@ -347,6 +355,16 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
+         } else {
+             /* nothing to do with passthrough type register,
+              * continue to find next byte */
++            if (!s->permissive) {
++                wb_mask &= ~(0xff << ((len - emul_len) << 3));
++                /* Unused BARs will make it here, but we don't want to issue
++                 * warnings for writes to them (bogus writes get dealt with
++                 * above).
++                 */
++                if (index < 0) {
++                    wp_flag = true;
++                }
++            }
+             emul_len--;
+             find_addr++;
+         }
+@@ -358,6 +376,13 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
+     memory_region_transaction_commit();
+ 
+ out:
++    if (wp_flag && !s->permissive_warned) {
++        s->permissive_warned = true;
++        xen_pt_log(d, "Write-back to unknown field 0x%02x (partially) inhibited (0x%0*x)\n",
++                   addr, len * 2, wb_mask);
++        xen_pt_log(d, "If the device doesn't work, try enabling permissive mode\n");
++        xen_pt_log(d, "(unsafe) and if it helps report the problem to xen-devel\n");
++    }
+     for (index = 0; wb_mask; index += len) {
+         /* unknown regs are passed through */
+         while (!(wb_mask & 0xff)) {
+@@ -824,6 +849,7 @@ static void xen_pt_unregister_device(PCIDevice *d)
+ 
+ static Property xen_pci_passthrough_properties[] = {
+     DEFINE_PROP_PCI_HOST_DEVADDR("hostaddr", XenPCIPassthroughState, hostaddr),
++    DEFINE_PROP_BOOL("permissive", XenPCIPassthroughState, permissive, false),
+     DEFINE_PROP_END_OF_LIST(),
+ };
+ 
+diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
+index f9795eb..4bba559 100644
+--- a/hw/xen/xen_pt.h
++++ b/hw/xen/xen_pt.h
+@@ -197,6 +197,8 @@ struct XenPCIPassthroughState {
+ 
+     PCIHostDeviceAddress hostaddr;
+     bool is_virtfn;
++    bool permissive;
++    bool permissive_warned;
+     XenHostPCIDevice real_device;
+     XenPTRegion bases[PCI_NUM_REGIONS]; /* Access regions */
+     QLIST_HEAD(, XenPTRegGroup) reg_grps;
+diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
+index 19f926b..f3cf069 100644
+--- a/hw/xen/xen_pt_config_init.c
++++ b/hw/xen/xen_pt_config_init.c
+@@ -101,6 +101,10 @@ static uint32_t get_throughable_mask(const XenPCIPassthroughState *s,
+ {
+     uint32_t throughable_mask = ~(reg->emu_mask | reg->ro_mask);
+ 
++    if (!s->permissive) {
++        throughable_mask &= ~reg->res_mask;
++    }
++
+     return throughable_mask & valid_mask;
+ }
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.3.0.bb b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
index 4782941..ec1b101 100644
--- a/meta/recipes-devtools/qemu/qemu_2.3.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
@@ -7,7 +7,18 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://qemu-CVE-2015-3456.patch \
-            "
+            file://01-xen-properly-gate-host-writes-of-modified-PCI-CFG-contents-CVE-2015-4103.patch \
+            file://02-xen-dont-allow-guest-to-control-MSI-mask-register-CVE-2015-4104.patch \
+            file://03-xen-MSI-X-limit-error-messages-CVE-2015-4105.patch \
+            file://04-xen-MSI-dont-open-code-pass-through-of-enable-bit-mod-CVE-2015-4106.patch \
+            file://05-xen-pt-consolidate-PM-capability-emu_mask-CVE-2015-4106.patch \
+            file://06-xen-pt-correctly-handle-PM-status-bit-CVE-2015-4106.patch \
+            file://07-xen-pt-split-out-calculation-of-throughable-mask-CVE-2015-4106.patch \
+            file://08-xen-pt-mark-all-PCIe-capability-bits-read-only-CVE-2015-4106.patch \
+            file://09-xen-pt-mark-reserved-bits-in-PCI-config-space-fields-CVE-2015-4106.patch \
+            file://10-xen-pt-add-a-few-PCI-config-space-field-descriptions-CVE-2015-4106.patch \
+            file://11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch \
+           "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "2fab3ea4460de9b57192e5b8b311f221"
 SRC_URI[sha256sum] = "b6bab7f763d5be73e7cb5ee7d4c8365b7a8df2972c52fa5ded18893bd8281588"
-- 
1.9.1



Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53CDC7619A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 09:52:02 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.9972.1679305913936281159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 02:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=OLjslDCT;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679305918; x=1710841918;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E0lVkPPldHRHcsBm0Ab6Mmx1qrNHzEq6ooFMadtGIbE=;
  b=OLjslDCTLk0r1BpegxXzjn8ofQ16sxQV0xathcBJrKtmqHlPdytkJk9i
   CXGAyubtxdHkjOhA0rhOCHJEAMqanGshmLUMZGNKMtTZkPMRg5yhn1eC8
   ersaYLv1arMYf5ovMrhRzf6mCzAtoO8Rmxpt9Jonj21n9vW46+GH5AiEV
   Fya+S+S3A3wFYBKtPvfRAqnIMK4wxp6GUBpk6+et9bErfFJorKSdfhRP6
   SgliLybRXphiGMyQFg5y1lfCidBRnba4ssieVLtrSBY7MAIE7oFvI+JU+
   L+gAhPHqkEbL4MuqPd+OWiTe8ij8Zvfi098OKm4SJnc5uBZ83PkH8BIHn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="337336629"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="337336629"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 02:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="804847196"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="804847196"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 02:51:29 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][patch 1/3] qemu: fix multple CVEs
Date: Mon, 20 Mar 2023 17:51:17 +0800
Message-Id: <20230320095119.2655965-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 09:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178807

From: Chee Yang Lee <chee.yang.lee@intel.com>

import patches from ubuntu to fix
 CVE-2020-15469
 CVE-2020-15859
 CVE-2020-17380
 CVE-2020-35504
 CVE-2020-35505
 CVE-2021-3409
 CVE-2022-26354
https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches?h=ubuntu/focal-security

Combine patches for both CVE-2020-25085 and CVE-2021-3409 also fix CVE-2020-17380.
so mark CVE-2020-17380 fixed by CVE-2021-3409 patches. CVE-2020-17380 patch backported since
oecore rev 6b4c58a31ec11e557d40c31f2532985dd53e61eb.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  17 +++
 .../qemu/qemu/CVE-2020-15469-1.patch          |  48 ++++++++
 .../qemu/qemu/CVE-2020-15469-2.patch          |  69 ++++++++++++
 .../qemu/qemu/CVE-2020-15469-3.patch          |  49 +++++++++
 .../qemu/qemu/CVE-2020-15469-4.patch          |  53 +++++++++
 .../qemu/qemu/CVE-2020-15469-5.patch          |  53 +++++++++
 .../qemu/qemu/CVE-2020-15469-6.patch          |  61 +++++++++++
 .../qemu/qemu/CVE-2020-15469-7.patch          |  50 +++++++++
 .../qemu/qemu/CVE-2020-15469-8.patch          |  44 ++++++++
 .../qemu/qemu/CVE-2020-15859.patch            |  39 +++++++
 .../qemu/qemu/CVE-2020-35504.patch            |  51 +++++++++
 .../qemu/qemu/CVE-2020-35505.patch            |  42 +++++++
 .../qemu/qemu/CVE-2021-3409-1.patch           |  85 +++++++++++++++
 .../qemu/qemu/CVE-2021-3409-2.patch           | 103 ++++++++++++++++++
 .../qemu/qemu/CVE-2021-3409-3.patch           |  71 ++++++++++++
 .../qemu/qemu/CVE-2021-3409-4.patch           |  52 +++++++++
 .../qemu/qemu/CVE-2021-3409-5.patch           |  93 ++++++++++++++++
 .../qemu/qemu/CVE-2022-26354.patch            |  57 ++++++++++
 18 files changed, 1037 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-6.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-7.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-8.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15859.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35504.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409-3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409-4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409-5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-26354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 36d0b9320f..ddbe85c9d0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -116,6 +116,23 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2021-20196.patch \
 	   file://CVE-2021-3507.patch \
 	   file://CVE-2021-3929.patch \
+           file://CVE-2020-15859.patch \
+           file://CVE-2020-15469-1.patch \
+           file://CVE-2020-15469-2.patch \
+           file://CVE-2020-15469-3.patch \
+           file://CVE-2020-15469-4.patch \
+           file://CVE-2020-15469-5.patch \
+           file://CVE-2020-15469-6.patch \
+           file://CVE-2020-15469-7.patch \
+           file://CVE-2020-15469-8.patch \
+           file://CVE-2020-35504.patch \
+           file://CVE-2020-35505.patch \
+           file://CVE-2022-26354.patch \
+           file://CVE-2021-3409-1.patch \
+           file://CVE-2021-3409-2.patch \
+           file://CVE-2021-3409-3.patch \
+           file://CVE-2021-3409-4.patch \
+           file://CVE-2021-3409-5.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-1.patch
new file mode 100644
index 0000000000..7728079637
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-1.patch
@@ -0,0 +1,48 @@
+From 520f26fc6d17b71a43eaf620e834b3bdf316f3d3 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 11 Aug 2020 17:11:25 +0530
+Subject: [PATCH] hw/pci-host: add pci-intack write method
+
+Add pci-intack mmio write method to avoid NULL pointer dereference
+issue.
+
+Reported-by: Lei Sun <slei.casper@gmail.com>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20200811114133.672647-2-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+CVE: CVE-2020-15469
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-15469-1.patch?h=ubuntu/focal-security]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/pci-host/prep.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/hw/pci-host/prep.c
++++ b/hw/pci-host/prep.c
+@@ -26,6 +26,7 @@
+ #include "qemu/osdep.h"
+ #include "qemu-common.h"
+ #include "qemu/units.h"
++#include "qemu/log.h"
+ #include "qapi/error.h"
+ #include "hw/pci/pci.h"
+ #include "hw/pci/pci_bus.h"
+@@ -119,8 +120,15 @@ static uint64_t raven_intack_read(void *
+     return pic_read_irq(isa_pic);
+ }
+ 
++static void raven_intack_write(void *opaque, hwaddr addr,
++                                        uint64_t data, unsigned size)
++{
++    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
++}
++
+ static const MemoryRegionOps raven_intack_ops = {
+     .read = raven_intack_read,
++    .write = raven_intack_write,
+     .valid = {
+         .max_access_size = 1,
+     },
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-2.patch
new file mode 100644
index 0000000000..695cde6923
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-2.patch
@@ -0,0 +1,69 @@
+From 4f2a5202a05fc1612954804a2482f07bff105ea2 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 11 Aug 2020 17:11:26 +0530
+Subject: [PATCH] pci-host: designware: add pcie-msi read method
+
+Add pcie-msi mmio read method to avoid NULL pointer dereference
+issue.
+
+Reported-by: Lei Sun <slei.casper@gmail.com>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20200811114133.672647-3-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+CVE: CVE-2020-15469
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-15469-2.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/pci-host/designware.c | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
+index f9fb97a..bde3a34 100644
+--- a/hw/pci-host/designware.c
++++ b/hw/pci-host/designware.c
+@@ -21,6 +21,7 @@
+ #include "qemu/osdep.h"
+ #include "qapi/error.h"
+ #include "qemu/module.h"
++#include "qemu/log.h"
+ #include "hw/pci/msi.h"
+ #include "hw/pci/pci_bridge.h"
+ #include "hw/pci/pci_host.h"
+@@ -63,6 +64,23 @@ designware_pcie_root_to_host(DesignwarePCIERoot *root)
+     return DESIGNWARE_PCIE_HOST(bus->parent);
+ }
+ 
++static uint64_t designware_pcie_root_msi_read(void *opaque, hwaddr addr,
++                                              unsigned size)
++{
++    /*
++     * Attempts to read from the MSI address are undefined in
++     * the PCI specifications. For this hardware, the datasheet
++     * specifies that a read from the magic address is simply not
++     * intercepted by the MSI controller, and will go out to the
++     * AHB/AXI bus like any other PCI-device-initiated DMA read.
++     * This is not trivial to implement in QEMU, so since
++     * well-behaved guests won't ever ask a PCI device to DMA from
++     * this address we just log the missing functionality.
++     */
++    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
++    return 0;
++}
++
+ static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
+                                            uint64_t val, unsigned len)
+ {
+@@ -77,6 +95,7 @@ static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
+ }
+ 
+ static const MemoryRegionOps designware_pci_host_msi_ops = {
++    .read = designware_pcie_root_msi_read,
+     .write = designware_pcie_root_msi_write,
+     .endianness = DEVICE_LITTLE_ENDIAN,
+     .valid = {
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-3.patch
new file mode 100644
index 0000000000..1b80a343e7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-3.patch
@@ -0,0 +1,49 @@
+From 24202d2b561c3b4c48bd28383c8c34b4ac66c2bf Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 11 Aug 2020 17:11:27 +0530
+Subject: [PATCH] vfio: add quirk device write method
+
+Add vfio quirk device mmio write method to avoid NULL pointer
+dereference issue.
+
+Reported-by: Lei Sun <slei.casper@gmail.com>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Acked-by: Alex Williamson <alex.williamson@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20200811114133.672647-4-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+CVE: CVE-2020-15469
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-15469-3.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/vfio/pci-quirks.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/hw/vfio/pci-quirks.c
++++ b/hw/vfio/pci-quirks.c
+@@ -13,6 +13,7 @@
+ #include "qemu/osdep.h"
+ #include "exec/memop.h"
+ #include "qemu/units.h"
++#include "qemu/log.h"
+ #include "qemu/error-report.h"
+ #include "qemu/main-loop.h"
+ #include "qemu/module.h"
+@@ -278,8 +279,15 @@ static uint64_t vfio_ati_3c3_quirk_read(
+     return data;
+ }
+ 
++static void vfio_ati_3c3_quirk_write(void *opaque, hwaddr addr,
++                                        uint64_t data, unsigned size)
++{
++    qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid access\n", __func__);
++}
++
+ static const MemoryRegionOps vfio_ati_3c3_quirk = {
+     .read = vfio_ati_3c3_quirk_read,
++    .write = vfio_ati_3c3_quirk_write,
+     .endianness = DEVICE_LITTLE_ENDIAN,
+ };
+ 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-4.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-4.patch
new file mode 100644
index 0000000000..394e2ae063
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-4.patch
@@ -0,0 +1,53 @@
+From f867cebaedbc9c43189f102e4cdfdff05e88df7f Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 11 Aug 2020 17:11:28 +0530
+Subject: [PATCH] prep: add ppc-parity write method
+
+Add ppc-parity mmio write method to avoid NULL pointer dereference
+issue.
+
+Reported-by: Lei Sun <slei.casper@gmail.com>
+Acked-by: David Gibson <david@gibson.dropbear.id.au>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Message-Id: <20200811114133.672647-5-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+CVE: CVE-2020-15469
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-15469-4.patch?h=ubuntu/focal-security]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/ppc/prep_systemio.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
+index 4e48ef2..b2bd783 100644
+--- a/hw/ppc/prep_systemio.c
++++ b/hw/ppc/prep_systemio.c
+@@ -23,6 +23,7 @@
+  */
+ 
+ #include "qemu/osdep.h"
++#include "qemu/log.h"
+ #include "hw/irq.h"
+ #include "hw/isa/isa.h"
+ #include "hw/qdev-properties.h"
+@@ -235,8 +236,15 @@ static uint64_t ppc_parity_error_readl(void *opaque, hwaddr addr,
+     return val;
+ }
+ 
++static void ppc_parity_error_writel(void *opaque, hwaddr addr,
++                                    uint64_t data, unsigned size)
++{
++    qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid access\n", __func__);
++}
++
+ static const MemoryRegionOps ppc_parity_error_ops = {
+     .read = ppc_parity_error_readl,
++    .write = ppc_parity_error_writel,
+     .valid = {
+         .min_access_size = 4,
+         .max_access_size = 4,
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-5.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-5.patch
new file mode 100644
index 0000000000..ddad554c18
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-5.patch
@@ -0,0 +1,53 @@
+From b5bf601f364e1a14ca4c3276f88dfec024acf613 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 11 Aug 2020 17:11:29 +0530
+Subject: [PATCH] nvram: add nrf51_soc flash read method
+
+Add nrf51_soc mmio read method to avoid NULL pointer dereference
+issue.
+
+Reported-by: Lei Sun <slei.casper@gmail.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Message-Id: <20200811114133.672647-6-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+CVE: CVE-2020-15469
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-15469-5.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/nvram/nrf51_nvm.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
+index f2283c1..7b3460d 100644
+--- a/hw/nvram/nrf51_nvm.c
++++ b/hw/nvram/nrf51_nvm.c
+@@ -273,6 +273,15 @@ static const MemoryRegionOps io_ops = {
+         .endianness = DEVICE_LITTLE_ENDIAN,
+ };
+ 
++static uint64_t flash_read(void *opaque, hwaddr offset, unsigned size)
++{
++    /*
++     * This is a rom_device MemoryRegion which is always in
++     * romd_mode (we never put it in MMIO mode), so reads always
++     * go directly to RAM and never come here.
++     */
++    g_assert_not_reached();
++}
+ 
+ static void flash_write(void *opaque, hwaddr offset, uint64_t value,
+         unsigned int size)
+@@ -300,6 +309,7 @@ static void flash_write(void *opaque, hwaddr offset, uint64_t value,
+ 
+ 
+ static const MemoryRegionOps flash_ops = {
++    .read = flash_read,
+     .write = flash_write,
+     .valid.min_access_size = 4,
+     .valid.max_access_size = 4,
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-6.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-6.patch
new file mode 100644
index 0000000000..8fe67659df
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-6.patch
@@ -0,0 +1,61 @@
+Backport of:
+
+From 921604e175b8ec06c39503310e7b3ec1e3eafe9e Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 11 Aug 2020 17:11:30 +0530
+Subject: [PATCH] spapr_pci: add spapr msi read method
+
+Add spapr msi mmio read method to avoid NULL pointer dereference
+issue.
+
+Reported-by: Lei Sun <slei.casper@gmail.com>
+Acked-by: David Gibson <david@gibson.dropbear.id.au>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20200811114133.672647-7-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+CVE: CVE-2020-15469
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-15469-6.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/ppc/spapr_pci.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+--- a/hw/ppc/spapr_pci.c
++++ b/hw/ppc/spapr_pci.c
+@@ -52,6 +52,7 @@
+ #include "sysemu/kvm.h"
+ #include "sysemu/hostmem.h"
+ #include "sysemu/numa.h"
++#include "qemu/log.h"
+ 
+ /* Copied from the kernel arch/powerpc/platforms/pseries/msi.c */
+ #define RTAS_QUERY_FN           0
+@@ -738,6 +739,12 @@ static PCIINTxRoute spapr_route_intx_pin
+     return route;
+ }
+ 
++static uint64_t spapr_msi_read(void *opaque, hwaddr addr, unsigned size)
++{
++    qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid access\n", __func__);
++    return 0;
++}
++
+ /*
+  * MSI/MSIX memory region implementation.
+  * The handler handles both MSI and MSIX.
+@@ -755,8 +762,11 @@ static void spapr_msi_write(void *opaque
+ }
+ 
+ static const MemoryRegionOps spapr_msi_ops = {
+-    /* There is no .read as the read result is undefined by PCI spec */
+-    .read = NULL,
++    /*
++     * .read result is undefined by PCI spec.
++     * define .read method to avoid assert failure in memory_region_init_io
++     */
++    .read = spapr_msi_read,
+     .write = spapr_msi_write,
+     .endianness = DEVICE_LITTLE_ENDIAN
+ };
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-7.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-7.patch
new file mode 100644
index 0000000000..e1de6e0bd3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-7.patch
@@ -0,0 +1,50 @@
+From 2c9fb3b784000c1df32231e1c2464bb2e3fc4620 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 11 Aug 2020 17:11:31 +0530
+Subject: [PATCH] tz-ppc: add dummy read/write methods
+
+Add tz-ppc-dummy mmio read/write methods to avoid assert failure
+during initialisation.
+
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Message-Id: <20200811114133.672647-8-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+CVE: CVE-2020-15469
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-15469-7.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/misc/tz-ppc.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/hw/misc/tz-ppc.c b/hw/misc/tz-ppc.c
+index 6431257..36495c6 100644
+--- a/hw/misc/tz-ppc.c
++++ b/hw/misc/tz-ppc.c
+@@ -196,7 +196,21 @@ static bool tz_ppc_dummy_accepts(void *opaque, hwaddr addr,
+     g_assert_not_reached();
+ }
+ 
++static uint64_t tz_ppc_dummy_read(void *opaque, hwaddr addr, unsigned size)
++{
++    g_assert_not_reached();
++}
++
++static void tz_ppc_dummy_write(void *opaque, hwaddr addr,
++                                        uint64_t data, unsigned size)
++{
++    g_assert_not_reached();
++}
++
+ static const MemoryRegionOps tz_ppc_dummy_ops = {
++    /* define r/w methods to avoid assert failure in memory_region_init_io */
++    .read = tz_ppc_dummy_read,
++    .write = tz_ppc_dummy_write,
+     .valid.accepts = tz_ppc_dummy_accepts,
+ };
+ 
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-8.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-8.patch
new file mode 100644
index 0000000000..11876e4e15
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15469-8.patch
@@ -0,0 +1,44 @@
+From 735754aaa15a6ed46db51fd731e88331c446ea54 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 11 Aug 2020 17:11:32 +0530
+Subject: [PATCH] imx7-ccm: add digprog mmio write method
+
+Add digprog mmio write method to avoid assert failure during
+initialisation.
+
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20200811114133.672647-9-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+CVE: CVE-2020-15469
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-15469-8.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/misc/imx7_ccm.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
+index 02fc1ae..075159e 100644
+--- a/hw/misc/imx7_ccm.c
++++ b/hw/misc/imx7_ccm.c
+@@ -131,8 +131,16 @@ static const struct MemoryRegionOps imx7_set_clr_tog_ops = {
+     },
+ };
+ 
++static void imx7_digprog_write(void *opaque, hwaddr addr,
++                                        uint64_t data, unsigned size)
++{
++    qemu_log_mask(LOG_GUEST_ERROR,
++                  "Guest write to read-only ANALOG_DIGPROG register\n");
++}
++
+ static const struct MemoryRegionOps imx7_digprog_ops = {
+     .read = imx7_set_clr_tog_read,
++    .write = imx7_digprog_write,
+     .endianness = DEVICE_NATIVE_ENDIAN,
+     .impl = {
+         .min_access_size = 4,
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15859.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15859.patch
new file mode 100644
index 0000000000..80cc12ad1c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15859.patch
@@ -0,0 +1,39 @@
+From 22dc8663d9fc7baa22100544c600b6285a63c7a3 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 22 Jul 2020 16:57:46 +0800
+Subject: [PATCH] net: forbid the reentrant RX
+
+The memory API allows DMA into NIC's MMIO area. This means the NIC's
+RX routine must be reentrant. Instead of auditing all the NIC, we can
+simply detect the reentrancy and return early. The queue->delivering
+is set and cleared by qemu_net_queue_deliver() for other queue helpers
+to know whether the delivering in on going (NIC's receive is being
+called). We can check it and return early in qemu_net_queue_flush() to
+forbid reentrant RX.
+
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+CVE: CVE-2020-15859
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/ubuntu/CVE-2020-15859.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ net/queue.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/net/queue.c b/net/queue.c
+index 0164727..19e32c8 100644
+--- a/net/queue.c
++++ b/net/queue.c
+@@ -250,6 +250,9 @@ void qemu_net_queue_purge(NetQueue *queue, NetClientState *from)
+ 
+ bool qemu_net_queue_flush(NetQueue *queue)
+ {
++    if (queue->delivering)
++        return false;
++
+     while (!QTAILQ_EMPTY(&queue->packets)) {
+         NetPacket *packet;
+         int ret;
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35504.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35504.patch
new file mode 100644
index 0000000000..48d4accce8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-35504.patch
@@ -0,0 +1,51 @@
+Backport of:
+
+From 0db895361b8a82e1114372ff9f4857abea605701 Mon Sep 17 00:00:00 2001
+From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Date: Wed, 7 Apr 2021 20:57:50 +0100
+Subject: [PATCH] esp: always check current_req is not NULL before use in DMA
+ callbacks
+
+After issuing a SCSI command the SCSI layer can call the SCSIBusInfo .cancel
+callback which resets both current_req and current_dev to NULL. If any data
+is left in the transfer buffer (async_len != 0) then the next TI (Transfer
+Information) command will attempt to reference the NULL pointer causing a
+segfault.
+
+Buglink: https://bugs.launchpad.net/qemu/+bug/1910723
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
+Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20210407195801.685-2-mark.cave-ayland@ilande.co.uk>
+
+CVE: CVE-2020-35504
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-35504.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/scsi/esp.c | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+--- a/hw/scsi/esp.c
++++ b/hw/scsi/esp.c
+@@ -362,6 +362,11 @@ static void do_dma_pdma_cb(ESPState *s)
+         do_cmd(s, s->cmdbuf);
+         return;
+     }
++
++    if (!s->current_req) {
++        return;
++    }
++
+     s->dma_left -= len;
+     s->async_buf += len;
+     s->async_len -= len;
+@@ -415,6 +420,9 @@ static void esp_do_dma(ESPState *s)
+         do_cmd(s, s->cmdbuf);
+         return;
+     }
++    if (!s->current_req) {
++        return;
++    }
+     if (s->async_len == 0) {
+         /* Defer until data is available.  */
+         return;
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch
new file mode 100644
index 0000000000..a725595ceb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch
@@ -0,0 +1,42 @@
+Backport of:
+
+From 99545751734035b76bd372c4e7215bb337428d89 Mon Sep 17 00:00:00 2001
+From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Date: Wed, 7 Apr 2021 20:57:55 +0100
+Subject: [PATCH] esp: ensure cmdfifo is not empty and current_dev is non-NULL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+When about to execute a SCSI command, ensure that cmdfifo is not empty and
+current_dev is non-NULL. This can happen if the guest tries to execute a TI
+(Transfer Information) command without issuing one of the select commands
+first.
+
+Buglink: https://bugs.launchpad.net/qemu/+bug/1910723
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
+Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Reviewed-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20210407195801.685-7-mark.cave-ayland@ilande.co.uk>
+
+CVE: CVE-2020-35504
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-35505.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/scsi/esp.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+--- a/hw/scsi/esp.c
++++ b/hw/scsi/esp.c
+@@ -193,6 +193,10 @@ static void do_busid_cmd(ESPState *s, ui
+ 
+     trace_esp_do_busid_cmd(busid);
+     lun = busid & 7;
++
++    if (!s->current_dev) {
++        return;
++    }
+     current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, lun);
+     s->current_req = scsi_req_new(current_lun, 0, lun, buf, s);
+     datalen = scsi_req_enqueue(s->current_req);
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-1.patch
new file mode 100644
index 0000000000..16c989bb5a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-1.patch
@@ -0,0 +1,85 @@
+From b263d8f928001b5cfa2a993ea43b7a5b3a1811e8 Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:35 +0800
+Subject: [PATCH] hw/sd: sdhci: Don't transfer any data when command time out
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+At the end of sdhci_send_command(), it starts a data transfer if the
+command register indicates data is associated. But the data transfer
+should only be initiated when the command execution has succeeded.
+
+With this fix, the following reproducer:
+
+outl 0xcf8 0x80001810
+outl 0xcfc 0xe1068000
+outl 0xcf8 0x80001804
+outw 0xcfc 0x7
+write 0xe106802c 0x1 0x0f
+write 0xe1068004 0xc 0x2801d10101fffffbff28a384
+write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f60514233241505f
+write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d000254c80d000255a80d000256880d0002576
+write 0xe1068003 0x1 0xfe
+
+cannot be reproduced with the following QEMU command line:
+
+$ qemu-system-x86_64 -nographic -M pc-q35-5.0 \
+      -device sdhci-pci,sd-spec-version=3 \
+      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
+      -device sd-card,drive=mydrive \
+      -monitor none -serial none -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-UniversitÃ¤t Bochum)
+Reported-by: Sergej Schumilo (Ruhr-UniversitÃ¤t Bochum)
+Reported-by: Simon WÃ¶rner (Ruhr-UniversitÃ¤t Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
+Acked-by: Alistair Francis <alistair.francis@wdc.com>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Tested-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-2-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+
+CVE: CVE-2021-3409 CVE-2020-17380
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2021-3409-1.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/sd/sdhci.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -316,6 +316,7 @@ static void sdhci_send_command(SDHCIStat
+     SDRequest request;
+     uint8_t response[16];
+     int rlen;
++    bool timeout = false;
+ 
+     s->errintsts = 0;
+     s->acmd12errsts = 0;
+@@ -339,6 +340,7 @@ static void sdhci_send_command(SDHCIStat
+             trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
+                                    s->rspreg[1], s->rspreg[0]);
+         } else {
++            timeout = true;
+             trace_sdhci_error("timeout waiting for command response");
+             if (s->errintstsen & SDHC_EISEN_CMDTIMEOUT) {
+                 s->errintsts |= SDHC_EIS_CMDTIMEOUT;
+@@ -359,7 +361,7 @@ static void sdhci_send_command(SDHCIStat
+ 
+     sdhci_update_irq(s);
+ 
+-    if (s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
++    if (!timeout && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
+         s->data_count = 0;
+         sdhci_data_transfer(s);
+     }
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-2.patch
new file mode 100644
index 0000000000..9f8b89a732
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-2.patch
@@ -0,0 +1,103 @@
+From 8be45cc947832b3c02144c9d52921f499f2d77fe Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:36 +0800
+Subject: [PATCH] hw/sd: sdhci: Don't write to SDHC_SYSAD register when
+ transfer is in progress
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Per "SD Host Controller Standard Specification Version 7.00"
+chapter 2.2.1 SDMA System Address Register:
+
+This register can be accessed only if no transaction is executing
+(i.e., after a transaction has stopped).
+
+With this fix, the following reproducer:
+
+outl 0xcf8 0x80001010
+outl 0xcfc 0xfbefff00
+outl 0xcf8 0x80001001
+outl 0xcfc 0x06000000
+write 0xfbefff2c 0x1 0x05
+write 0xfbefff0f 0x1 0x37
+write 0xfbefff0a 0x1 0x01
+write 0xfbefff0f 0x1 0x29
+write 0xfbefff0f 0x1 0x02
+write 0xfbefff0f 0x1 0x03
+write 0xfbefff04 0x1 0x01
+write 0xfbefff05 0x1 0x01
+write 0xfbefff07 0x1 0x02
+write 0xfbefff0c 0x1 0x33
+write 0xfbefff0e 0x1 0x20
+write 0xfbefff0f 0x1 0x00
+write 0xfbefff2a 0x1 0x01
+write 0xfbefff0c 0x1 0x00
+write 0xfbefff03 0x1 0x00
+write 0xfbefff05 0x1 0x00
+write 0xfbefff2a 0x1 0x02
+write 0xfbefff0c 0x1 0x32
+write 0xfbefff01 0x1 0x01
+write 0xfbefff02 0x1 0x01
+write 0xfbefff03 0x1 0x01
+
+cannot be reproduced with the following QEMU command line:
+
+$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
+       -nodefaults -device sdhci-pci,sd-spec-version=3 \
+       -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
+       -device sd-card,drive=mydrive -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-UniversitÃ¤t Bochum)
+Reported-by: Sergej Schumilo (Ruhr-UniversitÃ¤t Bochum)
+Reported-by: Simon WÃ¶rner (Ruhr-UniversitÃ¤t Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-3-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+
+CVE: CVE-2021-3409 CVE-2020-17380
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2021-3409-2.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/sd/sdhci.c | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -1117,15 +1117,17 @@ sdhci_write(void *opaque, hwaddr offset,
+ 
+     switch (offset & ~0x3) {
+     case SDHC_SYSAD:
+-        s->sdmasysad = (s->sdmasysad & mask) | value;
+-        MASKED_WRITE(s->sdmasysad, mask, value);
+-        /* Writing to last byte of sdmasysad might trigger transfer */
+-        if (!(mask & 0xFF000000) && TRANSFERRING_DATA(s->prnsts) && s->blkcnt &&
+-                s->blksize && SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
+-            if (s->trnmod & SDHC_TRNS_MULTI) {
+-                sdhci_sdma_transfer_multi_blocks(s);
+-            } else {
+-                sdhci_sdma_transfer_single_block(s);
++        if (!TRANSFERRING_DATA(s->prnsts)) {
++            s->sdmasysad = (s->sdmasysad & mask) | value;
++            MASKED_WRITE(s->sdmasysad, mask, value);
++            /* Writing to last byte of sdmasysad might trigger transfer */
++            if (!(mask & 0xFF000000) && s->blkcnt && s->blksize &&
++                SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
++                if (s->trnmod & SDHC_TRNS_MULTI) {
++                    sdhci_sdma_transfer_multi_blocks(s);
++                } else {
++                    sdhci_sdma_transfer_single_block(s);
++                }
+             }
+         }
+         break;
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-3.patch
new file mode 100644
index 0000000000..f226c1ecd0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-3.patch
@@ -0,0 +1,71 @@
+Backport of:
+
+From bc6f28995ff88f5d82c38afcfd65406f0ae375aa Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:37 +0800
+Subject: [PATCH] hw/sd: sdhci: Correctly set the controller status for ADMA
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+When an ADMA transfer is started, the codes forget to set the
+controller status to indicate a transfer is in progress.
+
+With this fix, the following 2 reproducers:
+
+https://paste.debian.net/plain/1185136
+https://paste.debian.net/plain/1185141
+
+cannot be reproduced with the following QEMU command line:
+
+$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
+      -nodefaults -device sdhci-pci,sd-spec-version=3 \
+      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
+      -device sd-card,drive=mydrive -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-UniversitÃ¤t Bochum)
+Reported-by: Sergej Schumilo (Ruhr-UniversitÃ¤t Bochum)
+Reported-by: Simon WÃ¶rner (Ruhr-UniversitÃ¤t Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-4-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+
+CVE: CVE-2021-3409 CVE-2020-17380
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2021-3409-3.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/sd/sdhci.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -776,8 +776,9 @@ static void sdhci_do_adma(SDHCIState *s)
+ 
+         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
+         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
+-
++            s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
+             if (s->trnmod & SDHC_TRNS_READ) {
++                s->prnsts |= SDHC_DOING_READ;
+                 while (length) {
+                     if (s->data_count == 0) {
+                         for (n = 0; n < block_size; n++) {
+@@ -807,6 +808,7 @@ static void sdhci_do_adma(SDHCIState *s)
+                     }
+                 }
+             } else {
++                s->prnsts |= SDHC_DOING_WRITE;
+                 while (length) {
+                     begin = s->data_count;
+                     if ((length + begin) < block_size) {
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-4.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-4.patch
new file mode 100644
index 0000000000..0a4f2719b4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-4.patch
@@ -0,0 +1,52 @@
+Backport of:
+
+From 5cd7aa3451b76bb19c0f6adc2b931f091e5d7fcd Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:38 +0800
+Subject: [PATCH] hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE
+ register is writable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+The codes to limit the maximum block size is only necessary when
+SDHC_BLKSIZE register is writable.
+
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-5-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+
+CVE: CVE-2021-3409 CVE-2020-17380
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2021-3409-4.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/sd/sdhci.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -1137,15 +1137,15 @@ sdhci_write(void *opaque, hwaddr offset,
+         if (!TRANSFERRING_DATA(s->prnsts)) {
+             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
+             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
+-        }
+ 
+-        /* Limit block size to the maximum buffer size */
+-        if (extract32(s->blksize, 0, 12) > s->buf_maxsz) {
+-            qemu_log_mask(LOG_GUEST_ERROR, "%s: Size 0x%x is larger than " \
+-                          "the maximum buffer 0x%x", __func__, s->blksize,
+-                          s->buf_maxsz);
++            /* Limit block size to the maximum buffer size */
++            if (extract32(s->blksize, 0, 12) > s->buf_maxsz) {
++                qemu_log_mask(LOG_GUEST_ERROR, "%s: Size 0x%x is larger than "
++                              "the maximum buffer 0x%x\n", __func__, s->blksize,
++                              s->buf_maxsz);
+ 
+-            s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
++                s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
++            }
+         }
+ 
+         break;
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-5.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-5.patch
new file mode 100644
index 0000000000..c09bb7b72f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409-5.patch
@@ -0,0 +1,93 @@
+From cffb446e8fd19a14e1634c7a3a8b07be3f01d5c9 Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:39 +0800
+Subject: [PATCH] hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[] when
+ a different block size is programmed
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+If the block size is programmed to a different value from the
+previous one, reset the data pointer of s->fifo_buffer[] so that
+s->fifo_buffer[] can be filled in using the new block size in
+the next transfer.
+
+With this fix, the following reproducer:
+
+outl 0xcf8 0x80001010
+outl 0xcfc 0xe0000000
+outl 0xcf8 0x80001001
+outl 0xcfc 0x06000000
+write 0xe000002c 0x1 0x05
+write 0xe0000005 0x1 0x02
+write 0xe0000007 0x1 0x01
+write 0xe0000028 0x1 0x10
+write 0x0 0x1 0x23
+write 0x2 0x1 0x08
+write 0xe000000c 0x1 0x01
+write 0xe000000e 0x1 0x20
+write 0xe000000f 0x1 0x00
+write 0xe000000c 0x1 0x32
+write 0xe0000004 0x2 0x0200
+write 0xe0000028 0x1 0x00
+write 0xe0000003 0x1 0x40
+
+cannot be reproduced with the following QEMU command line:
+
+$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
+      -nodefaults -device sdhci-pci,sd-spec-version=3 \
+      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
+      -device sd-card,drive=mydrive -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-UniversitÃ¤t Bochum)
+Reported-by: Sergej Schumilo (Ruhr-UniversitÃ¤t Bochum)
+Reported-by: Simon WÃ¶rner (Ruhr-UniversitÃ¤t Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-6-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+
+CVE: CVE-2021-3409 CVE-2020-17380
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2021-3409-5.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/sd/sdhci.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -1135,6 +1135,8 @@ sdhci_write(void *opaque, hwaddr offset,
+         break;
+     case SDHC_BLKSIZE:
+         if (!TRANSFERRING_DATA(s->prnsts)) {
++            uint16_t blksize = s->blksize;
++
+             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
+             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
+ 
+@@ -1146,6 +1148,16 @@ sdhci_write(void *opaque, hwaddr offset,
+ 
+                 s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
+             }
++
++            /*
++             * If the block size is programmed to a different value from
++             * the previous one, reset the data pointer of s->fifo_buffer[]
++             * so that s->fifo_buffer[] can be filled in using the new block
++             * size in the next transfer.
++             */
++            if (blksize != s->blksize) {
++                s->data_count = 0;
++            }
+         }
+ 
+         break;
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-26354.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-26354.patch
new file mode 100644
index 0000000000..329817878f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-26354.patch
@@ -0,0 +1,57 @@
+Backport of:
+
+From 8d1b247f3748ac4078524130c6d7ae42b6140aaf Mon Sep 17 00:00:00 2001
+From: Stefano Garzarella <sgarzare@redhat.com>
+Date: Mon, 28 Feb 2022 10:50:58 +0100
+Subject: [PATCH] vhost-vsock: detach the virqueue element in case of error
+
+In vhost_vsock_common_send_transport_reset(), if an element popped from
+the virtqueue is invalid, we should call virtqueue_detach_element() to
+detach it from the virtqueue before freeing its memory.
+
+Fixes: fc0b9b0e1c ("vhost-vsock: add virtio sockets device")
+Fixes: CVE-2022-26354
+Cc: qemu-stable@nongnu.org
+Reported-by: VictorV <vv474172261@gmail.com>
+Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
+Message-Id: <20220228095058.27899-1-sgarzare@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+CVE: CVE-2022-26354
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2022-26354.patch?h=ubuntu/focal-security ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/virtio/vhost-vsock-common.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+--- a/hw/virtio/vhost-vsock.c
++++ b/hw/virtio/vhost-vsock.c
+@@ -221,19 +221,23 @@ static void vhost_vsock_send_transport_r
+     if (elem->out_num) {
+         error_report("invalid vhost-vsock event virtqueue element with "
+                      "out buffers");
+-        goto out;
++        goto err;
+     }
+ 
+     if (iov_from_buf(elem->in_sg, elem->in_num, 0,
+                      &event, sizeof(event)) != sizeof(event)) {
+         error_report("vhost-vsock event virtqueue element is too short");
+-        goto out;
++        goto err;
+     }
+ 
+     virtqueue_push(vq, elem, sizeof(event));
+     virtio_notify(VIRTIO_DEVICE(vsock), vq);
+ 
+-out:
++    g_free(elem);
++    return;
++
++err:
++    virtqueue_detach_element(vq, elem, 0);
+     g_free(elem);
+ }
+ 
-- 
2.37.3



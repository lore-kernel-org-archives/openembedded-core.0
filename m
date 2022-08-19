Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 03/26] qemu: fix CVE-2021-3929
Date: Thu, 18 Aug 2022 16:42:25 -1000
Message-Id: <3be3101ab1be2be58b6f27a28ca8e1ade3aff853.1660876844.git.steve@sakoman.com>
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport patch to fix CVE-2021-3929.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3929.patch             | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dd30313fdd..53bad5c453 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2022-35414.patch \
            file://CVE-2021-3507_1.patch \
            file://CVE-2021-3507_2.patch \
+           file://CVE-2021-3929.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
new file mode 100644
index 0000000000..7555e5bc40
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
@@ -0,0 +1,70 @@
+From 12daeafc9868c1ebe482d580494f9e6d3d5c260f Mon Sep 17 00:00:00 2001
+From: Klaus Jensen <k.jensen@samsung.com>
+Date: Fri, 17 Dec 2021 10:44:01 +0100
+Subject: [PATCH] hw/nvme: fix CVE-2021-3929
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This fixes CVE-2021-3929 "locally" by denying DMA to the iomem of the
+device itself. This still allows DMA to MMIO regions of other devices
+(e.g. doing P2P DMA to the controller memory buffer of another NVMe
+device).
+
+Fixes: CVE-2021-3929
+Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
+Reviewed-by: Keith Busch <kbusch@kernel.org>
+Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
+
+Upstream-Status: Backport [736b01642d85be832385063f278fe7cd4ffb5221]
+CVE: CVE-2021-3929
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/nvme/ctrl.c | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
+index 5f573c417..eda52c6ac 100644
+--- a/hw/nvme/ctrl.c
++++ b/hw/nvme/ctrl.c
+@@ -357,6 +357,24 @@ static inline void *nvme_addr_to_pmr(NvmeCtrl *n, hwaddr addr)
+     return memory_region_get_ram_ptr(&n->pmr.dev->mr) + (addr - n->pmr.cba);
+ }
+ 
++static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
++{
++    hwaddr hi, lo;
++
++    /*
++     * The purpose of this check is to guard against invalid "local" access to
++     * the iomem (i.e. controller registers). Thus, we check against the range
++     * covered by the 'bar0' MemoryRegion since that is currently composed of
++     * two subregions (the NVMe "MBAR" and the MSI-X table/pba). Note, however,
++     * that if the device model is ever changed to allow the CMB to be located
++     * in BAR0 as well, then this must be changed.
++     */
++    lo = n->bar0.addr;
++    hi = lo + int128_get64(n->bar0.size);
++
++    return addr >= lo && addr < hi;
++}
++
+ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+ {
+     hwaddr hi = addr + size - 1;
+@@ -614,6 +632,10 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
+ 
+     trace_pci_nvme_map_addr(addr, len);
+ 
++    if (nvme_addr_is_iomem(n, addr)) {
++        return NVME_DATA_TRAS_ERROR;
++    }
++
+     if (nvme_addr_is_cmb(n, addr)) {
+         cmb = true;
+     } else if (nvme_addr_is_pmr(n, addr)) {
+-- 
+2.33.0
+
-- 
2.25.1


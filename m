Return-Path: <gauragup@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96555C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 19:51:53 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web11.36949.1680205907341235300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 12:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=nCa1NsKh;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: gauragup@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=13429; q=dns/txt;
  s=iport; t=1680205907; x=1681415507;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fQAaw9xOWVDxjTDw+tyj6syy+4tcuQXlDpKlE/HVd10=;
  b=nCa1NsKh+5IGpwiFlqCz/VPlzRkftdAy5YCPa+InMf4yvJmhNc1zk45U
   3XPz0KzclhcgGwrF8r/xl+rfacVp+76+T/gNHzssApXTGlQcsEz8FGpBv
   owGMFCAhcp6nH5YIcDRCYXebKa5SE46yI9slo5laSQTSxePskyxwosrvJ
   o=;
X-IronPort-AV: E=Sophos;i="5.98,305,1673913600"; 
   d="scan'208";a="89904788"
Received: from alln-core-12.cisco.com ([173.36.13.134])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 Mar 2023 19:51:46 +0000
Received: from sjc-ads-2530.cisco.com (sjc-ads-2530.cisco.com [171.70.63.218])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTP id 32UJpkAB015473;
	Thu, 30 Mar 2023 19:51:46 GMT
From: Gaurav Gupta <gauragup@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: gauragup@cisco.com
Subject: [dunfell][PATCH] Fix qemu build error with dunfell release "yocto-3.1.24"
Date: Thu, 30 Mar 2023 12:51:43 -0700
Message-Id: <20230330195143.64886-1-gauragup@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.63.218, sjc-ads-2530.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 19:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179354

The patch for CVE-2021-3929 applied on dunfell returns a value for a
void function. This results in the following compiler warning/error:

hw/block/nvme.c:77:6: error: void function
'nvme_addr_read' should not return a value [-Wreturn-type]

return NVME_DATA_TRAS_ERROR;
^      ~~~~~~~~~~~~~~~~~~~~

In newer versions of qemu, the functions is changed to have a return
value, but that is not present in the version of qemu used in “dunfell”.

Backport some of the patches to correct this.

Signed-off-by: Gaurav Gupta <gauragup@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |   2 +
 .../recipes-devtools/qemu/qemu/CVE-2021-3929.patch |  33 ++---
 .../qemu/hw-block-nvme-handle-dma-errors.patch     | 146 +++++++++++++++++++++
 .../hw-block-nvme-refactor-nvme_addr_read.patch    |  55 ++++++++
 4 files changed, 221 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_addr_read.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0649727..4100436 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -115,6 +115,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3638.patch \
            file://CVE-2021-20196.patch \
            file://CVE-2021-3507.patch \
+           file://hw-block-nvme-refactor-nvme_addr_read.patch \
+           file://hw-block-nvme-handle-dma-errors.patch \
            file://CVE-2021-3929.patch \
            file://CVE-2022-4144.patch \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
index 3df2f88..a1862f1 100644
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
@@ -1,7 +1,8 @@
-From 736b01642d85be832385063f278fe7cd4ffb5221 Mon Sep 17 00:00:00 2001
-From: Klaus Jensen <k.jensen@samsung.com>
-Date: Fri, 17 Dec 2021 10:44:01 +0100
-Subject: [PATCH] hw/nvme: fix CVE-2021-3929
+From 2c682b5975b41495f98cc34b8243042c446eec44 Mon Sep 17 00:00:00 2001
+From: Gaurav Gupta <gauragup@cisco.com>
+Date: Wed, 29 Mar 2023 14:36:16 -0700
+Subject: [PATCH] hw/nvme: fix CVE-2021-3929 MIME-Version: 1.0 Content-Type:
+ text/plain; charset=UTF-8 Content-Transfer-Encoding: 8bit
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -17,21 +18,23 @@ Reviewed-by: Keith Busch <kbusch@kernel.org>
 Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
 Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
 
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/736b01642d85be832385]
+Upstream-Status: Backport
+[https://gitlab.com/qemu-project/qemu/-/commit/736b01642d85be832385]
 CVE: CVE-2021-3929
 Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+Signed-off-by: Gaurav Gupta <gauragup@cisco.com>
 ---
  hw/block/nvme.c | 23 +++++++++++++++++++++++
  hw/block/nvme.h |  1 +
  2 files changed, 24 insertions(+)
 
 diff --git a/hw/block/nvme.c b/hw/block/nvme.c
-index 12d82542..e7d0750c 100644
+index bda446d..ae9b19f 100644
 --- a/hw/block/nvme.c
 +++ b/hw/block/nvme.c
-@@ -52,8 +52,31 @@
- 
- static void nvme_process_sq(void *opaque);
+@@ -60,8 +60,31 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
+     return addr >= low && addr < hi;
+ }
  
 +static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
 +{
@@ -51,18 +54,18 @@ index 12d82542..e7d0750c 100644
 +    return addr >= lo && addr < hi;
 +}
 +
- static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
  {
 +
 +    if (nvme_addr_is_iomem(n, addr)) {
-+    	return NVME_DATA_TRAS_ERROR;
++	return NVME_DATA_TRAS_ERROR;
 +    }
 +
-     if (n->cmbsz && addr >= n->ctrl_mem.addr &&
-                 addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size))) {
+     if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
          memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
+         return 0;
 diff --git a/hw/block/nvme.h b/hw/block/nvme.h
-index 557194ee..5a2b119c 100644
+index 557194e..5a2b119 100644
 --- a/hw/block/nvme.h
 +++ b/hw/block/nvme.h
 @@ -59,6 +59,7 @@ typedef struct NvmeNamespace {
@@ -74,5 +77,5 @@ index 557194ee..5a2b119c 100644
      MemoryRegion ctrl_mem;
      NvmeBar      bar;
 -- 
-2.30.2
+1.8.3.1
 
diff --git a/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.patch b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.patch
new file mode 100644
index 0000000..0fdae83
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.patch
@@ -0,0 +1,146 @@
+From ea2a7c7676d8eb9d1458eaa4b717df46782dcb3a Mon Sep 17 00:00:00 2001
+From: Gaurav Gupta <gauragup@cisco.com>
+Date: Wed, 29 Mar 2023 14:07:17 -0700
+Subject: [PATCH 2/2] hw/block/nvme: handle dma errors
+
+Handling DMA errors gracefully is required for the device to pass the
+block/011 test ("disable PCI device while doing I/O") in the blktests
+suite.
+
+With this patch the device sets the Controller Fatal Status bit in the
+CSTS register when failing to read from a submission queue or writing to
+a completion queue; expecting the host to reset the controller.
+
+If DMA errors occur at any other point in the execution of the command
+(say, while mapping the PRPs), the command is aborted with a Data
+Transfer Error status code.
+
+Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
+Signed-off-by: Gaurav Gupta <gauragup@cisco.com>
+---
+ hw/block/nvme.c       | 41 +++++++++++++++++++++++++++++++----------
+ hw/block/trace-events |  3 +++
+ 2 files changed, 34 insertions(+), 10 deletions(-)
+
+diff --git a/hw/block/nvme.c b/hw/block/nvme.c
+index e6f24a6..bda446d 100644
+--- a/hw/block/nvme.c
++++ b/hw/block/nvme.c
+@@ -60,14 +60,14 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
+     return addr >= low && addr < hi;
+ }
+ 
+-static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
++static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+ {
+     if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
+         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
+-        return;
++        return 0;
+     }
+ 
+-    pci_dma_read(&n->parent_obj, addr, buf, size);
++    return pci_dma_read(&n->parent_obj, addr, buf, size);
+ }
+ 
+ static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
+@@ -152,6 +152,7 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
+     hwaddr trans_len = n->page_size - (prp1 % n->page_size);
+     trans_len = MIN(len, trans_len);
+     int num_prps = (len >> n->page_bits) + 1;
++    int ret;
+ 
+     if (unlikely(!prp1)) {
+         trace_nvme_err_invalid_prp();
+@@ -178,7 +179,11 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
+ 
+             nents = (len + n->page_size - 1) >> n->page_bits;
+             prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
+-            nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
++            ret = nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
++            if (ret) {
++                trace_pci_nvme_err_addr_read(prp2);
++                return NVME_DATA_TRAS_ERROR;
++            }
+             while (len != 0) {
+                 uint64_t prp_ent = le64_to_cpu(prp_list[i]);
+ 
+@@ -191,8 +196,12 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
+                     i = 0;
+                     nents = (len + n->page_size - 1) >> n->page_bits;
+                     prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
+-                    nvme_addr_read(n, prp_ent, (void *)prp_list,
+-                        prp_trans);
++                    ret = nvme_addr_read(n, prp_ent, (void *)prp_list,
++                                         prp_trans);
++                    if (ret) {
++                        trace_pci_nvme_err_addr_read(prp_ent);
++                        return NVME_DATA_TRAS_ERROR;
++                    }
+                     prp_ent = le64_to_cpu(prp_list[i]);
+                 }
+ 
+@@ -286,6 +295,7 @@ static void nvme_post_cqes(void *opaque)
+     NvmeCQueue *cq = opaque;
+     NvmeCtrl *n = cq->ctrl;
+     NvmeRequest *req, *next;
++    int ret;
+ 
+     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
+         NvmeSQueue *sq;
+@@ -295,15 +305,21 @@ static void nvme_post_cqes(void *opaque)
+             break;
+         }
+ 
+-        QTAILQ_REMOVE(&cq->req_list, req, entry);
+         sq = req->sq;
+         req->cqe.status = cpu_to_le16((req->status << 1) | cq->phase);
+         req->cqe.sq_id = cpu_to_le16(sq->sqid);
+         req->cqe.sq_head = cpu_to_le16(sq->head);
+         addr = cq->dma_addr + cq->tail * n->cqe_size;
++        ret = pci_dma_write(&n->parent_obj, addr, (void *)&req->cqe,
++                            sizeof(req->cqe));
++        if (ret) {
++            trace_pci_nvme_err_addr_write(addr);
++            trace_pci_nvme_err_cfs();
++            n->bar.csts = NVME_CSTS_FAILED;
++            break;
++        }
++        QTAILQ_REMOVE(&cq->req_list, req, entry);
+         nvme_inc_cq_tail(cq);
+-        pci_dma_write(&n->parent_obj, addr, (void *)&req->cqe,
+-            sizeof(req->cqe));
+         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
+     }
+     if (cq->tail != cq->head) {
+@@ -888,7 +904,12 @@ static void nvme_process_sq(void *opaque)
+ 
+     while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&sq->req_list))) {
+         addr = sq->dma_addr + sq->head * n->sqe_size;
+-        nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd));
++        if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
++            trace_pci_nvme_err_addr_read(addr);
++            trace_pci_nvme_err_cfs();
++            n->bar.csts = NVME_CSTS_FAILED;
++            break;
++        }
+         nvme_inc_sq_head(sq);
+ 
+         req = QTAILQ_FIRST(&sq->req_list);
+diff --git a/hw/block/trace-events b/hw/block/trace-events
+index c03e80c..4e4ad4e 100644
+--- a/hw/block/trace-events
++++ b/hw/block/trace-events
+@@ -60,6 +60,9 @@ nvme_mmio_shutdown_set(void) "shutdown bit set"
+ nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
+ 
+ # nvme traces for error conditions
++pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
++pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
++pci_nvme_err_cfs(void) "controller fatal status"
+ nvme_err_invalid_dma(void) "PRP/SGL is too small for transfer size"
+ nvme_err_invalid_prplist_ent(uint64_t prplist) "PRP list entry is null or not page aligned: 0x%"PRIx64""
+ nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0x%"PRIx64""
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_addr_read.patch b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_addr_read.patch
new file mode 100644
index 0000000..66ada52
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_addr_read.patch
@@ -0,0 +1,55 @@
+From 55428706d5b0b8889b8e009eac77137bb556a4f0 Mon Sep 17 00:00:00 2001
+From: Klaus Jensen <k.jensen@samsung.com>
+Date: Tue, 9 Jun 2020 21:03:17 +0200
+Subject: [PATCH 1/2] hw/block/nvme: refactor nvme_addr_read
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Pull the controller memory buffer check to its own function. The check
+will be used on its own in later patches.
+
+Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
+Reviewed-by: Keith Busch <kbusch@kernel.org>
+Message-Id: <20200609190333.59390-7-its@irrelevant.dk>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+---
+ hw/block/nvme.c | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/hw/block/nvme.c b/hw/block/nvme.c
+index 12d8254..e6f24a6 100644
+--- a/hw/block/nvme.c
++++ b/hw/block/nvme.c
+@@ -52,14 +52,22 @@
+ 
+ static void nvme_process_sq(void *opaque);
+ 
++static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
++{
++    hwaddr low = n->ctrl_mem.addr;
++    hwaddr hi  = n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size);
++
++    return addr >= low && addr < hi;
++}
++
+ static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+ {
+-    if (n->cmbsz && addr >= n->ctrl_mem.addr &&
+-                addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size))) {
++    if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
+         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
+-    } else {
+-        pci_dma_read(&n->parent_obj, addr, buf, size);
++        return;
+     }
++
++    pci_dma_read(&n->parent_obj, addr, buf, size);
+ }
+ 
+ static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
+-- 
+1.8.3.1
+
-- 
1.8.3.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D643CC7619A
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:34:07 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.10546.1681572839585782582
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ZL6DD9b2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id fw22-20020a17090b129600b00247255b2f40so7560835pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572839; x=1684164839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=io8cvooHasUyz/PTqTOxbTIWabUYeoiW/UAQnRyUzRw=;
        b=ZL6DD9b2YlX1aZInyV0802Sxo/0DFWhZSKQvpw+fLegJIj5s0zbASH4T32H3iKSARB
         sGz/I6a2atu110OW8qzUTjzKGc48mgrAouxNu3KTZCm5tq7ogP7h1Vkei6nwaF30EW3j
         xmJIAjUJd1qq2Geo8cgex/EjX8UZQN554UjoCWkpv53wVA5MD/iXNMroLuq3s0KtYIIO
         7T3rzTVojm2I/rnSNmuDLeuoM9Rxf5UdepOsYq9HDTrUtWiyZKbP7QoT4s71XhEPaHvP
         AmCCk8pn7PUD9Kvj23mR1S73H/Afak+OjQnVoPlVUpH7m7MTWqYxB4bSH0KoY95iYMlf
         7EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572839; x=1684164839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=io8cvooHasUyz/PTqTOxbTIWabUYeoiW/UAQnRyUzRw=;
        b=WR7PPDJEhsE5qt09clL8TjvCf377j/nTb6ehpXqsiq8kZkd1I/3SaPZikGU6nsqFU6
         tS5Bs9rHU3znoXxiYtC7Qibcw8StEYiVyLgD/flttKBtIYxq1Yl8U6vORCf2IxXWK+/p
         TEYBuxbadjJZ7TH/wVm5quomOPiQTHP9YckqYDHazLwakA8jqcLw1gVcKOiwF0bjwg6Q
         bLzodRQPGp/x2OHr5f9ir9vjxTw8KET2sT7dnEY9fe0n8KzR5jk0vNxpGK+I9SabvDy7
         dRASQFlfH5GkJIMNRdO8eeX4PhGiCXsUQDfVSGqpThy5lnik1rwLaJIZWeP7R1Crya5+
         jEOg==
X-Gm-Message-State: AAQBX9f/cCoC4RRED5Tnuk3FuzDqODKKYzORh7TSPALW5uXvqOR4CJms
	ViRgZnK3Y6JcOqPkWgxmlNkz6GRovGDFZ3nU3yI=
X-Google-Smtp-Source: AKy350Zfr8Kcxbjc0WzA1o6U92cp+vrAoU0HR+2iXTRMWCVHuHuPEEqKiqo451g8vUlUI3O22n0VfA==
X-Received: by 2002:a17:90b:4a0d:b0:246:5968:43f0 with SMTP id kk13-20020a17090b4a0d00b00246596843f0mr9094171pjb.10.1681572838426;
        Sat, 15 Apr 2023 08:33:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id cs19-20020a17090af51300b002367325203fsm6313969pjb.50.2023.04.15.08.33.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:33:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/4] qemu: fix build error introduced by CVE-2021-3929 fix
Date: Sat, 15 Apr 2023 05:33:37 -1000
Message-Id: <4ad98f0b27615ad59ae61110657cf69004c61ef4.1681572706.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681572706.git.steve@sakoman.com>
References: <cover.1681572706.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180020

From: Gaurav Gupta <gauragup@cisco.com>

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
Signed-off-by: Gaurav Gupta <gauragup@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2021-3929.patch             |  33 ++--
 .../hw-block-nvme-handle-dma-errors.patch     | 146 ++++++++++++++++++
 ...w-block-nvme-refactor-nvme_addr_read.patch |  55 +++++++
 4 files changed, 221 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_addr_read.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5466303c94..3b1bd3b656 100644
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
            file://CVE-2020-15859.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
index 3df2f8886a..a1862f1226 100644
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
index 0000000000..0fdae8351a
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
index 0000000000..66ada52efb
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
2.34.1



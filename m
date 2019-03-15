Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6267C6F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 08:01:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2F814Lm002764
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 01:01:40 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 15 Mar 2019 01:01:35 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Mar 2019 04:01:19 -0400
Message-ID: <20190315080119.49804-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190315080119.49804-1-kai.kang@windriver.com>
References: <20190315080119.49804-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] qemu: backport patches to fix cves
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
X-List-Received-Date: Fri, 15 Mar 2019 08:01:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

CVE: CVE-2018-16872
CVE: CVE-2018-20124
CVE: CVE-2018-20125
CVE: CVE-2018-20126
CVE: CVE-2018-20191
CVE: CVE-2018-20216

Patches 0015-fix-CVE-2018-20124.patch and 0017-fix-CVE-2018-20126.patch
are rebased on current source code. Others are not modified.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   6 +
 .../qemu/qemu/0014-fix-CVE-2018-16872.patch   |  85 +++++++++++++
 .../qemu/qemu/0015-fix-CVE-2018-20124.patch   |  60 ++++++++++
 .../qemu/qemu/0016-fix-CVE-2018-20125.patch   |  54 +++++++++
 .../qemu/qemu/0017-fix-CVE-2018-20126.patch   | 113 ++++++++++++++++++
 .../qemu/qemu/0018-fix-CVE-2018-20191.patch   |  47 ++++++++
 .../qemu/qemu/0019-fix-CVE-2018-20216.patch   |  85 +++++++++++++
 7 files changed, 450 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 985289f542..2babfe4c6f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -23,6 +23,12 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
            file://0001-Add-a-missing-X11-include.patch \
            file://0001-egl-headless-add-egl_create_context.patch \
+           file://0014-fix-CVE-2018-16872.patch \
+           file://0015-fix-CVE-2018-20124.patch \
+           file://0016-fix-CVE-2018-20125.patch \
+           file://0017-fix-CVE-2018-20126.patch \
+           file://0018-fix-CVE-2018-20191.patch \
+           file://0019-fix-CVE-2018-20216.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch b/meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch
new file mode 100644
index 0000000000..412aa16046
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch
@@ -0,0 +1,85 @@
+CVE: CVE-2018-16872
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=bab9df35]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From bab9df35ce73d1c8e19a37e2737717ea1c984dc1 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 13 Dec 2018 13:25:11 +0100
+Subject: [PATCH] usb-mtp: use O_NOFOLLOW and O_CLOEXEC.
+
+Open files and directories with O_NOFOLLOW to avoid symlinks attacks.
+While being at it also add O_CLOEXEC.
+
+usb-mtp only handles regular files and directories and ignores
+everything else, so users should not see a difference.
+
+Because qemu ignores symlinks, carrying out a successful symlink attack
+requires swapping an existing file or directory below rootdir for a
+symlink and winning the race against the inotify notification to qemu.
+
+Fixes: CVE-2018-16872
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: Bandan Das <bsd@redhat.com>
+Reported-by: Michael Hanselmann <public@hansmi.ch>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Michael Hanselmann <public@hansmi.ch>
+Message-id: 20181213122511.13853-1-kraxel@redhat.com
+---
+ hw/usb/dev-mtp.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
+index 100b7171f4..36c43b8c20 100644
+--- a/hw/usb/dev-mtp.c
++++ b/hw/usb/dev-mtp.c
+@@ -653,13 +653,18 @@ static void usb_mtp_object_readdir(MTPState *s, MTPObject *o)
+ {
+     struct dirent *entry;
+     DIR *dir;
++    int fd;
+ 
+     if (o->have_children) {
+         return;
+     }
+     o->have_children = true;
+ 
+-    dir = opendir(o->path);
++    fd = open(o->path, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW);
++    if (fd < 0) {
++        return;
++    }
++    dir = fdopendir(fd);
+     if (!dir) {
+         return;
+     }
+@@ -1007,7 +1012,7 @@ static MTPData *usb_mtp_get_object(MTPState *s, MTPControl *c,
+ 
+     trace_usb_mtp_op_get_object(s->dev.addr, o->handle, o->path);
+ 
+-    d->fd = open(o->path, O_RDONLY);
++    d->fd = open(o->path, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
+     if (d->fd == -1) {
+         usb_mtp_data_free(d);
+         return NULL;
+@@ -1031,7 +1036,7 @@ static MTPData *usb_mtp_get_partial_object(MTPState *s, MTPControl *c,
+                                         c->argv[1], c->argv[2]);
+ 
+     d = usb_mtp_data_alloc(c);
+-    d->fd = open(o->path, O_RDONLY);
++    d->fd = open(o->path, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
+     if (d->fd == -1) {
+         usb_mtp_data_free(d);
+         return NULL;
+@@ -1658,7 +1663,7 @@ static void usb_mtp_write_data(MTPState *s)
+                                  0, 0, 0, 0);
+             goto done;
+         }
+-        d->fd = open(path, O_CREAT | O_WRONLY, mask);
++        d->fd = open(path, O_CREAT | O_WRONLY | O_CLOEXEC | O_NOFOLLOW, mask);
+         if (d->fd == -1) {
+             usb_mtp_queue_result(s, RES_STORE_FULL, d->trans,
+                                  0, 0, 0, 0);
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch b/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
new file mode 100644
index 0000000000..ad846958a7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
@@ -0,0 +1,60 @@
+CVE: CVE-2018-20124
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=0e68373]
+
+Backport patch to fix CVE-2018-20124. Update context and stay with current
+function comp_handler() which has been replaced with complete_work() in latest
+git repo.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 0e68373cc2b3a063ce067bc0cc3edaf370752890 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 13 Dec 2018 01:00:34 +0530
+Subject: [PATCH] rdma: check num_sge does not exceed MAX_SGE
+
+rdma back-end has scatter/gather array ibv_sge[MAX_SGE=4] set
+to have 4 elements. A guest could send a 'PvrdmaSqWqe' ring element
+with 'num_sge' set to > MAX_SGE, which may lead to OOB access issue.
+Add check to avoid it.
+
+Reported-by: Saar Amar <saaramar5@gmail.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+---
+ hw/rdma/rdma_backend.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
+index d7a4bbd9..7f8028f8 100644
+--- a/hw/rdma/rdma_backend.c
++++ b/hw/rdma/rdma_backend.c
+@@ -311,9 +311,9 @@ void rdma_backend_post_send(RdmaBackendDev *backend_dev,
+     }
+ 
+     pr_dbg("num_sge=%d\n", num_sge);
+-    if (!num_sge) {
+-        pr_dbg("num_sge=0\n");
+-        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
++    if (!num_sge || num_sge > MAX_SGE) {
++        pr_dbg("invalid num_sge=%d\n", num_sge);
++        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE, ctx);
+         return;
+     }
+ 
+@@ -390,9 +390,9 @@ void rdma_backend_post_recv(RdmaBackendDev *backend_dev,
+     }
+ 
+     pr_dbg("num_sge=%d\n", num_sge);
+-    if (!num_sge) {
+-        pr_dbg("num_sge=0\n");
+-        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
++    if (!num_sge || num_sge > MAX_SGE) {
++        pr_dbg("invalid num_sge=%d\n", num_sge);
++        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE, ctx);
+         return;
+     }
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch b/meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch
new file mode 100644
index 0000000000..56559c8388
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch
@@ -0,0 +1,54 @@
+CVE: CVE-2018-20125
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=2c858ce]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 2c858ce5da8ae6689c75182b73bc455a291cad41 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 13 Dec 2018 01:00:36 +0530
+Subject: [PATCH] pvrdma: check number of pages when creating rings
+
+When creating CQ/QP rings, an object can have up to
+PVRDMA_MAX_FAST_REG_PAGES 8 pages. Check 'npages' parameter
+to avoid excessive memory allocation or a null dereference.
+
+Reported-by: Li Qiang <liq3ea@163.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+---
+ hw/rdma/vmw/pvrdma_cmd.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
+index 3b94545761..f236ac4795 100644
+--- a/hw/rdma/vmw/pvrdma_cmd.c
++++ b/hw/rdma/vmw/pvrdma_cmd.c
+@@ -259,6 +259,11 @@ static int create_cq_ring(PCIDevice *pci_dev , PvrdmaRing **ring,
+     int rc = -EINVAL;
+     char ring_name[MAX_RING_NAME_SZ];
+ 
++    if (!nchunks || nchunks > PVRDMA_MAX_FAST_REG_PAGES) {
++        pr_dbg("invalid nchunks: %d\n", nchunks);
++        return rc;
++    }
++
+     pr_dbg("pdir_dma=0x%llx\n", (long long unsigned int)pdir_dma);
+     dir = rdma_pci_dma_map(pci_dev, pdir_dma, TARGET_PAGE_SIZE);
+     if (!dir) {
+@@ -372,6 +377,12 @@ static int create_qp_rings(PCIDevice *pci_dev, uint64_t pdir_dma,
+     char ring_name[MAX_RING_NAME_SZ];
+     uint32_t wqe_sz;
+ 
++    if (!spages || spages > PVRDMA_MAX_FAST_REG_PAGES
++        || !rpages || rpages > PVRDMA_MAX_FAST_REG_PAGES) {
++        pr_dbg("invalid pages: %d, %d\n", spages, rpages);
++        return rc;
++    }
++
+     pr_dbg("pdir_dma=0x%llx\n", (long long unsigned int)pdir_dma);
+     dir = rdma_pci_dma_map(pci_dev, pdir_dma, TARGET_PAGE_SIZE);
+     if (!dir) {
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch b/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
new file mode 100644
index 0000000000..8329f2cfd0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
@@ -0,0 +1,113 @@
+CVE: CVE-2018-20126
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=509f57c]
+
+Backport and rebase patch to fix CVE-2018-20126.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 509f57c98e7536905bb4902363d0cba66ce7e089 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 13 Dec 2018 01:00:37 +0530
+Subject: [PATCH] pvrdma: release ring object in case of an error
+
+create_cq and create_qp routines allocate ring object, but it's
+not released in case of an error, leading to memory leakage.
+
+Reported-by: Li Qiang <liq3ea@163.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+---
+ hw/rdma/vmw/pvrdma_cmd.c | 41 ++++++++++++++++++++++++++++++-----------
+ 1 file changed, 30 insertions(+), 11 deletions(-)
+
+diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
+index 4faeb21..9b6796f 100644
+--- a/hw/rdma/vmw/pvrdma_cmd.c
++++ b/hw/rdma/vmw/pvrdma_cmd.c
+@@ -310,6 +310,14 @@ out:
+     return rc;
+ }
+ 
++static void destroy_cq_ring(PvrdmaRing *ring)
++{
++    pvrdma_ring_free(ring);
++    /* ring_state was in slot 1, not 0 so need to jump back */
++    rdma_pci_dma_unmap(ring->dev, --ring->ring_state, TARGET_PAGE_SIZE);
++    g_free(ring);
++}
++
+ static int create_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
+                      union pvrdma_cmd_resp *rsp)
+ {
+@@ -333,6 +341,10 @@ static int create_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
+ 
+     resp->hdr.err = rdma_rm_alloc_cq(&dev->rdma_dev_res, &dev->backend_dev,
+                                      cmd->cqe, &resp->cq_handle, ring);
++    if (resp->hdr.err) {
++        destroy_cq_ring(ring);
++    }
++
+     resp->cqe = cmd->cqe;
+ 
+ out:
+@@ -356,10 +368,7 @@ static int destroy_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
+     }
+ 
+     ring = (PvrdmaRing *)cq->opaque;
+-    pvrdma_ring_free(ring);
+-    /* ring_state was in slot 1, not 0 so need to jump back */
+-    rdma_pci_dma_unmap(PCI_DEVICE(dev), --ring->ring_state, TARGET_PAGE_SIZE);
+-    g_free(ring);
++    destroy_cq_ring(ring);
+ 
+     rdma_rm_dealloc_cq(&dev->rdma_dev_res, cmd->cq_handle);
+ 
+@@ -451,6 +460,17 @@ out:
+     return rc;
+ }
+ 
++static void destroy_qp_rings(PvrdmaRing *ring)
++{
++    pr_dbg("sring=%p\n", &ring[0]);
++    pvrdma_ring_free(&ring[0]);
++    pr_dbg("rring=%p\n", &ring[1]);
++    pvrdma_ring_free(&ring[1]);
++
++    rdma_pci_dma_unmap(ring->dev, ring->ring_state, TARGET_PAGE_SIZE);
++    g_free(ring);
++}
++
+ static int create_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
+                      union pvrdma_cmd_resp *rsp)
+ {
+@@ -482,6 +502,11 @@ static int create_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
+                                      cmd->max_recv_wr, cmd->max_recv_sge,
+                                      cmd->recv_cq_handle, rings, &resp->qpn);
+ 
++    if (resp->hdr.err) {
++        destroy_qp_rings(rings);
++        return resp->hdr.err;
++    }
++
+     resp->max_send_wr = cmd->max_send_wr;
+     resp->max_recv_wr = cmd->max_recv_wr;
+     resp->max_send_sge = cmd->max_send_sge;
+@@ -555,13 +580,7 @@ static int destroy_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
+     rdma_rm_dealloc_qp(&dev->rdma_dev_res, cmd->qp_handle);
+ 
+     ring = (PvrdmaRing *)qp->opaque;
+-    pr_dbg("sring=%p\n", &ring[0]);
+-    pvrdma_ring_free(&ring[0]);
+-    pr_dbg("rring=%p\n", &ring[1]);
+-    pvrdma_ring_free(&ring[1]);
+-
+-    rdma_pci_dma_unmap(PCI_DEVICE(dev), ring->ring_state, TARGET_PAGE_SIZE);
+-    g_free(ring);
++    destroy_qp_rings(ring);
+ 
+     return 0;
+ }
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch b/meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch
new file mode 100644
index 0000000000..8f8ff0567a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch
@@ -0,0 +1,47 @@
+CVE: CVE-2018-20191
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=2aa8645]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 2aa86456fb938a11f2b7bd57c8643c213218681c Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 13 Dec 2018 01:00:35 +0530
+Subject: [PATCH] pvrdma: add uar_read routine
+
+Define skeleton 'uar_read' routine. Avoid NULL dereference.
+
+Reported-by: Li Qiang <liq3ea@163.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+---
+ hw/rdma/vmw/pvrdma_main.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
+index 64de16fb52..838ad8a949 100644
+--- a/hw/rdma/vmw/pvrdma_main.c
++++ b/hw/rdma/vmw/pvrdma_main.c
+@@ -448,6 +448,11 @@ static const MemoryRegionOps regs_ops = {
+     },
+ };
+ 
++static uint64_t uar_read(void *opaque, hwaddr addr, unsigned size)
++{
++    return 0xffffffff;
++}
++
+ static void uar_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+ {
+     PVRDMADev *dev = opaque;
+@@ -489,6 +494,7 @@ static void uar_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+ }
+ 
+ static const MemoryRegionOps uar_ops = {
++    .read = uar_read,
+     .write = uar_write,
+     .endianness = DEVICE_LITTLE_ENDIAN,
+     .impl = {
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch b/meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch
new file mode 100644
index 0000000000..c02bad3bb9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch
@@ -0,0 +1,85 @@
+CVE: CVE-2018-20216
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=f1e2e38]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From f1e2e38ee0136b7710a2caa347049818afd57a1b Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 13 Dec 2018 01:00:39 +0530
+Subject: [PATCH] pvrdma: check return value from pvrdma_idx_ring_has_ routines
+
+pvrdma_idx_ring_has_[data/space] routines also return invalid
+index PVRDMA_INVALID_IDX[=-1], if ring has no data/space. Check
+return value from these routines to avoid plausible infinite loops.
+
+Reported-by: Li Qiang <liq3ea@163.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+---
+ hw/rdma/vmw/pvrdma_dev_ring.c | 29 +++++++++++------------------
+ 1 file changed, 11 insertions(+), 18 deletions(-)
+
+diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
+index 01247fc041..e8e5b502f6 100644
+--- a/hw/rdma/vmw/pvrdma_dev_ring.c
++++ b/hw/rdma/vmw/pvrdma_dev_ring.c
+@@ -73,23 +73,16 @@ out:
+ 
+ void *pvrdma_ring_next_elem_read(PvrdmaRing *ring)
+ {
++    int e;
+     unsigned int idx = 0, offset;
+ 
+-    /*
+-    pr_dbg("%s: t=%d, h=%d\n", ring->name, ring->ring_state->prod_tail,
+-           ring->ring_state->cons_head);
+-    */
+-
+-    if (!pvrdma_idx_ring_has_data(ring->ring_state, ring->max_elems, &idx)) {
++    e = pvrdma_idx_ring_has_data(ring->ring_state, ring->max_elems, &idx);
++    if (e <= 0) {
+         pr_dbg("No more data in ring\n");
+         return NULL;
+     }
+ 
+     offset = idx * ring->elem_sz;
+-    /*
+-    pr_dbg("idx=%d\n", idx);
+-    pr_dbg("offset=%d\n", offset);
+-    */
+     return ring->pages[offset / TARGET_PAGE_SIZE] + (offset % TARGET_PAGE_SIZE);
+ }
+ 
+@@ -105,20 +98,20 @@ void pvrdma_ring_read_inc(PvrdmaRing *ring)
+ 
+ void *pvrdma_ring_next_elem_write(PvrdmaRing *ring)
+ {
+-    unsigned int idx, offset, tail;
++    int idx;
++    unsigned int offset, tail;
+ 
+-    /*
+-    pr_dbg("%s: t=%d, h=%d\n", ring->name, ring->ring_state->prod_tail,
+-           ring->ring_state->cons_head);
+-    */
+-
+-    if (!pvrdma_idx_ring_has_space(ring->ring_state, ring->max_elems, &tail)) {
++    idx = pvrdma_idx_ring_has_space(ring->ring_state, ring->max_elems, &tail);
++    if (idx <= 0) {
+         pr_dbg("CQ is full\n");
+         return NULL;
+     }
+ 
+     idx = pvrdma_idx(&ring->ring_state->prod_tail, ring->max_elems);
+-    /* TODO: tail == idx */
++    if (idx < 0 || tail != idx) {
++        pr_dbg("invalid idx\n");
++        return NULL;
++    }
+ 
+     offset = idx * ring->elem_sz;
+     return ring->pages[offset / TARGET_PAGE_SIZE] + (offset % TARGET_PAGE_SIZE);
+-- 
+2.20.1
+
-- 
2.20.0



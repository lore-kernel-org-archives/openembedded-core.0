Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 215D87C66B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 08:01:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2F814Lk002764
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 01:01:35 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 15 Mar 2019 01:01:22 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Mar 2019 04:01:18 -0400
Message-ID: <20190315080119.49804-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH 0/1] Backport patches to fix qemu cves
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
X-List-Received-Date: Fri, 15 Mar 2019 08:01:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (1):
  qemu: backport patches to fix cves

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


Following are the differences of 0015-fix-CVE-2018-20124.patch and
0017-fix-CVE-2018-20126.patch compare to the original patches:

diff --git a/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch b/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
index 48b2aa6560..ad846958a7 100644
--- a/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
+++ b/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
@@ -26,32 +26,32 @@ Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
-index ae1e4dcb29..bd4710d16f 100644
+index d7a4bbd9..7f8028f8 100644
 --- a/hw/rdma/rdma_backend.c
 +++ b/hw/rdma/rdma_backend.c
-@@ -476,9 +476,9 @@ void rdma_backend_post_send(RdmaBackendDev *backend_dev,
+@@ -311,9 +311,9 @@ void rdma_backend_post_send(RdmaBackendDev *backend_dev,
      }
  
      pr_dbg("num_sge=%d\n", num_sge);
 -    if (!num_sge) {
 -        pr_dbg("num_sge=0\n");
--        complete_work(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
+-        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
 +    if (!num_sge || num_sge > MAX_SGE) {
 +        pr_dbg("invalid num_sge=%d\n", num_sge);
-+        complete_work(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE, ctx);
++        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE, ctx);
          return;
      }
  
-@@ -603,9 +603,9 @@ void rdma_backend_post_recv(RdmaBackendDev *backend_dev,
+@@ -390,9 +390,9 @@ void rdma_backend_post_recv(RdmaBackendDev *backend_dev,
      }
  
      pr_dbg("num_sge=%d\n", num_sge);
 -    if (!num_sge) {
 -        pr_dbg("num_sge=0\n");
--        complete_work(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
+-        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
 +    if (!num_sge || num_sge > MAX_SGE) {
 +        pr_dbg("invalid num_sge=%d\n", num_sge);
-+        complete_work(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE, ctx);
++        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE, ctx);
          return;
      }
  
diff --git a/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch b/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
index 054ae8513a..8329f2cfd0 100644
--- a/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
+++ b/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
@@ -18,14 +18,14 @@ Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
 Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
 Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 ---
- hw/rdma/vmw/pvrdma_cmd.c | 37 ++++++++++++++++++++++++++-----------
- 1 file changed, 26 insertions(+), 11 deletions(-)
+ hw/rdma/vmw/pvrdma_cmd.c | 41 ++++++++++++++++++++++++++++++-----------
+ 1 file changed, 30 insertions(+), 11 deletions(-)
 
 diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
-index f236ac4795..89920887bf 100644
+index 4faeb21..9b6796f 100644
 --- a/hw/rdma/vmw/pvrdma_cmd.c
 +++ b/hw/rdma/vmw/pvrdma_cmd.c
-@@ -313,6 +313,14 @@ out:
+@@ -310,6 +310,14 @@ out:
      return rc;
  }
  
@@ -40,17 +40,17 @@ index f236ac4795..89920887bf 100644
  static int create_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
                       union pvrdma_cmd_resp *rsp)
  {
-@@ -335,6 +343,10 @@ static int create_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
+@@ -333,6 +341,10 @@ static int create_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
  
-     rc = rdma_rm_alloc_cq(&dev->rdma_dev_res, &dev->backend_dev, cmd->cqe,
-                           &resp->cq_handle, ring);
-+    if (rc) {
+     resp->hdr.err = rdma_rm_alloc_cq(&dev->rdma_dev_res, &dev->backend_dev,
+                                      cmd->cqe, &resp->cq_handle, ring);
++    if (resp->hdr.err) {
 +        destroy_cq_ring(ring);
 +    }
 +
      resp->cqe = cmd->cqe;
  
-     return rc;
+ out:
 @@ -356,10 +368,7 @@ static int destroy_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
      }
  
@@ -63,7 +63,7 @@ index f236ac4795..89920887bf 100644
  
      rdma_rm_dealloc_cq(&dev->rdma_dev_res, cmd->cq_handle);
  
-@@ -457,6 +466,17 @@ out:
+@@ -451,6 +460,17 @@ out:
      return rc;
  }
  
@@ -81,15 +81,19 @@ index f236ac4795..89920887bf 100644
  static int create_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
                       union pvrdma_cmd_resp *rsp)
  {
-@@ -486,6 +506,7 @@ static int create_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
-                           cmd->max_recv_sge, cmd->recv_cq_handle, rings,
-                           &resp->qpn);
-     if (rc) {
-+        destroy_qp_rings(rings);
-         return rc;
-     }
+@@ -482,6 +502,11 @@ static int create_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
+                                      cmd->max_recv_wr, cmd->max_recv_sge,
+                                      cmd->recv_cq_handle, rings, &resp->qpn);
  
-@@ -558,13 +579,7 @@ static int destroy_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
++    if (resp->hdr.err) {
++        destroy_qp_rings(rings);
++        return resp->hdr.err;
++    }
++
+     resp->max_send_wr = cmd->max_send_wr;
+     resp->max_recv_wr = cmd->max_recv_wr;
+     resp->max_send_sge = cmd->max_send_sge;
+@@ -555,13 +580,7 @@ static int destroy_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
      rdma_rm_dealloc_qp(&dev->rdma_dev_res, cmd->qp_handle);
  
      ring = (PvrdmaRing *)qp->opaque;


-- 
2.20.0



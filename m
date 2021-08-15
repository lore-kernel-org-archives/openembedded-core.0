Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.12642.1629043015755868597
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276780163"
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="276780163"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="461820010"
Received: from fwang8-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.132.228])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 3/7] qemu: fix CVE-2021-3607
Date: Sun, 15 Aug 2021 23:56:42 +0800
Message-Id: <764bca67650da9df439527796879dda767c8c008.1629041998.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629041998.git.anuj.mittal@intel.com>
References: <cover.1629041998.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3607.patch             | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3cef5a2d7e..0849196650 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -67,6 +67,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3527-1.patch \
            file://CVE-2021-3527-2.patch \
            file://CVE-2021-3582.patch \
+           file://CVE-2021-3607.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch
new file mode 100644
index 0000000000..0547c74484
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch
@@ -0,0 +1,43 @@
+From 32e5703cfea07c91e6e84bcb0313f633bb146534 Mon Sep 17 00:00:00 2001
+From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+Date: Wed, 30 Jun 2021 14:46:34 +0300
+Subject: [PATCH] pvrdma: Ensure correct input on ring init (CVE-2021-3607)
+
+Check the guest passed a non zero page count
+for pvrdma device ring buffers.
+
+Fixes: CVE-2021-3607
+Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
+Message-Id: <20210630114634.2168872-1-marcel@redhat.com>
+Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+
+CVE: CVE-2021-3607
+Upstream-Status: Backport [32e5703cfea07c91e6e84bcb0313f633bb146534]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/rdma/vmw/pvrdma_main.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
+index 84ae8024fc..7c0c3551a8 100644
+--- a/hw/rdma/vmw/pvrdma_main.c
++++ b/hw/rdma/vmw/pvrdma_main.c
+@@ -92,6 +92,11 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
+     uint64_t *dir, *tbl;
+     int rc = 0;
+ 
++    if (!num_pages) {
++        rdma_error_report("Ring pages count must be strictly positive");
++        return -EINVAL;
++    }
++
+     dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
+     if (!dir) {
+         rdma_error_report("Failed to map to page directory (ring %s)", name);
+-- 
+2.25.1
+
-- 
2.31.1


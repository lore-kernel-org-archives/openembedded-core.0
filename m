Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.12642.1629043015755868597
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276780165"
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="276780165"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="461820012"
Received: from fwang8-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.132.228])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 4/7] qemu: fix CVE-2021-3608
Date: Sun, 15 Aug 2021 23:56:43 +0800
Message-Id: <5e05ee8ff363eac84edec568039b86bcd716c6ce.1629041998.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629041998.git.anuj.mittal@intel.com>
References: <cover.1629041998.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3608.patch             | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0849196650..c3eecea9d4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -68,6 +68,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3527-2.patch \
            file://CVE-2021-3582.patch \
            file://CVE-2021-3607.patch \
+           file://CVE-2021-3608.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch
new file mode 100644
index 0000000000..22d68b025d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch
@@ -0,0 +1,43 @@
+From 66ae37d8cc313f89272e711174a846a229bcdbd3 Mon Sep 17 00:00:00 2001
+From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+Date: Wed, 30 Jun 2021 14:52:46 +0300
+Subject: [PATCH] pvrdma: Fix the ring init error flow (CVE-2021-3608)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Do not unmap uninitialized dma addresses.
+
+Fixes: CVE-2021-3608
+Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
+Message-Id: <20210630115246.2178219-1-marcel@redhat.com>
+Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+
+CVE: CVE-2021-3608
+Upstream-Status: Backport [66ae37d8cc313f89272e711174a846a229bcdbd3]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
+index 074ac59b84..42130667a7 100644
+--- a/hw/rdma/vmw/pvrdma_dev_ring.c
++++ b/hw/rdma/vmw/pvrdma_dev_ring.c
+@@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
+     qatomic_set(&ring->ring_state->cons_head, 0);
+     */
+     ring->npages = npages;
+-    ring->pages = g_malloc(npages * sizeof(void *));
++    ring->pages = g_malloc0(npages * sizeof(void *));
+ 
+     for (i = 0; i < npages; i++) {
+         if (!tbl[i]) {
+-- 
+2.25.1
+
-- 
2.31.1


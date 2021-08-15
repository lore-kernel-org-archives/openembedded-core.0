Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.12642.1629043015755868597
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276780157"
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="276780157"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="461820007"
Received: from fwang8-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.132.228])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 2/7] qemu: fix CVE-2021-3582
Date: Sun, 15 Aug 2021 23:56:41 +0800
Message-Id: <fb2634922db91e5b877dd10021dafec7b5c6e565.1629041998.git.anuj.mittal@intel.com>
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
 .../qemu/qemu/CVE-2021-3582.patch             | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a22721004e..3cef5a2d7e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -66,6 +66,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0007-vhost-user-gpu-fix-OOB-write-in-virgl_cmd_get_capset.patch \
            file://CVE-2021-3527-1.patch \
            file://CVE-2021-3527-2.patch \
+           file://CVE-2021-3582.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch
new file mode 100644
index 0000000000..7a88e29384
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch
@@ -0,0 +1,47 @@
+From 284f191b4abad213aed04cb0458e1600fd18d7c4 Mon Sep 17 00:00:00 2001
+From: Marcel Apfelbaum <marcel@redhat.com>
+Date: Wed, 16 Jun 2021 14:06:00 +0300
+Subject: [PATCH] hw/rdma: Fix possible mremap overflow in the pvrdma device
+ (CVE-2021-3582)
+
+Ensure mremap boundaries not trusting the guest kernel to
+pass the correct buffer length.
+
+Fixes: CVE-2021-3582
+Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
+Message-Id: <20210616110600.20889-1-marcel.apfelbaum@gmail.com>
+Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+
+CVE: CVE-2021-3582
+Upstream-Status: Backport [284f191b4abad213aed04cb0458e1600fd18d7c4]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/rdma/vmw/pvrdma_cmd.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
+index f59879e257..da7ddfa548 100644
+--- a/hw/rdma/vmw/pvrdma_cmd.c
++++ b/hw/rdma/vmw/pvrdma_cmd.c
+@@ -38,6 +38,13 @@ static void *pvrdma_map_to_pdir(PCIDevice *pdev, uint64_t pdir_dma,
+         return NULL;
+     }
+ 
++    length = ROUND_UP(length, TARGET_PAGE_SIZE);
++    if (nchunks * TARGET_PAGE_SIZE != length) {
++        rdma_error_report("Invalid nchunks/length (%u, %lu)", nchunks,
++                          (unsigned long)length);
++        return NULL;
++    }
++
+     dir = rdma_pci_dma_map(pdev, pdir_dma, TARGET_PAGE_SIZE);
+     if (!dir) {
+         rdma_error_report("Failed to map to page directory");
+-- 
+2.25.1
+
-- 
2.31.1


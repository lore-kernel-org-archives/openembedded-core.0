Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.2986.1628651336224640459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 20:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17B38t7E025703
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 20:08:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17B38tr3012246
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 20:08:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 20:08:55 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 20:08:55 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 4/5] qemu: fix CVE-2021-3607
Date: Tue, 10 Aug 2021 23:08:47 -0400
Message-ID: <20210811030848.11076-4-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811030848.11076-1-sakib.sajal@windriver.com>
References: <20210811030848.11076-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3607.patch             | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c64bbe66f2..69fba5dd79 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -67,6 +67,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3544_6.patch \
            file://CVE-2021-3544_7.patch \
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
2.32.0


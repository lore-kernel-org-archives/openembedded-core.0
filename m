Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.3000.1628651336048905467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 20:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17B38tPQ025702
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 20:08:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17B38tr2012246
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 20:08:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 20:08:54 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 20:08:54 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 3/5] qemu: fix CVE-2021-3582
Date: Tue, 10 Aug 2021 23:08:46 -0400
Message-ID: <20210811030848.11076-3-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811030848.11076-1-sakib.sajal@windriver.com>
References: <20210811030848.11076-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3582.patch             | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0a0893d6ae..c64bbe66f2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -66,6 +66,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3544_5.patch \
            file://CVE-2021-3544_6.patch \
            file://CVE-2021-3544_7.patch \
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
2.32.0


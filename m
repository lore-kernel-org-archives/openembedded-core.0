Return-Path: <nirpradh@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B22C197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 05:20:41 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web10.5864.1700198431599229062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 21:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=fohTkGK5;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: nirpradh@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4140; q=dns/txt; s=iport;
  t=1700198431; x=1701408031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=riUTjamurHHcHWAdqg2Qr7XBdcxcMNYfJlDx9E8trcc=;
  b=fohTkGK5zyBmfIRGpyb/zN0pxO0dopxAHD6yYc2CP06c3oI8SOGLLuBJ
   8V+cOTYG1PC2g2NSjN/egrauq2XFS4kcv4NfHMMZGShwRZmPM8sSjzQ+F
   15QPgg2mFXcMXIDTt2Cuv+gdAigdSh5v4wF0EKIolTTvInLUaBcPApws+
   k=;
X-CSE-ConnectionGUID: /mzdjeT4S1WuGSt4n7KLIQ==
X-CSE-MsgGUID: XOhYXFpLRf6DG6JiOs4u3g==
X-IronPort-AV: E=Sophos;i="6.04,206,1695686400"; 
   d="scan'208";a="140508527"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 05:20:30 +0000
Received: from sjc-ads-3546.cisco.com (sjc-ads-3546.cisco.com [171.68.249.244])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 3AH5KUBr010943
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 17 Nov 2023 05:20:30 GMT
Received: by sjc-ads-3546.cisco.com (Postfix, from userid 1806890)
	id 29F50CC1261; Thu, 16 Nov 2023 21:20:30 -0800 (PST)
From: Niranjan Pradhan <nirpradh@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Niranjan Pradhan <nirpradh@cisco.com>
Subject: [OE-core][mickledore][PATCH] qemu 7.2.0: Fix CVE-2023-1544
Date: Thu, 16 Nov 2023 21:20:27 -0800
Message-Id: <20231117052027.2189481-1-nirpradh@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.249.244, sjc-ads-3546.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 05:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190831

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2023-1544
Type: Security Fix
CVE: CVE-2023-1544
Score: 6.3
Patch: https://gitlab.com/qemu-project/qemu/-/commit/85fc35afa93c

Signed-off-by: Niranjan Pradhan <nirpradh@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-1544.patch             | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 80b5d966e4..2488edd6e6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -44,6 +44,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-3180.patch \
 	   file://CVE-2023-42467.patch \
 	   file://0001-target-i386-fix-avx2-instructions-vzeroall-and-vperm.patch \
+	   file://CVE-2023-1544.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch
new file mode 100644
index 0000000000..b4781e1c18
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch
@@ -0,0 +1,70 @@
+From e7d6e37675e422cfab2fe8c6bd411d2097228760 Mon Sep 17 00:00:00 2001
+From: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Date: Wed, 1 Mar 2023 16:29:26 +0200
+Subject: [PATCH] hw/pvrdma: Protect against buggy or malicious guest driver
+
+Guest driver allocates and initialize page tables to be used as a ring
+of descriptors for CQ and async events.
+The page table that represents the ring, along with the number of pages
+in the page table is passed to the device.
+Currently our device supports only one page table for a ring.
+
+Let's make sure that the number of page table entries the driver
+reports, do not exceeds the one page table size.
+
+CVE: CVE-2023-1544
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/85fc35afa93c]
+
+Reported-by: Soul Chen <soulchen8650@gmail.com>
+Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Fixes: CVE-2023-1544
+Message-ID: <20230301142926.18686-1-yuval.shaia.ml@gmail.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+(cherry picked from commit 85fc35afa93c7320d1641d344d0c5dfbe341d087)
+Signed-off-by: Niranjan Pradhan <nirpradh@cisco.com>
+---
+ hw/rdma/vmw/pvrdma_main.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
+index 4fc6712025..55b338046e 100644
+--- a/hw/rdma/vmw/pvrdma_main.c
++++ b/hw/rdma/vmw/pvrdma_main.c
+@@ -91,19 +91,33 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
+                          dma_addr_t dir_addr, uint32_t num_pages)
+ {
+     uint64_t *dir, *tbl;
+-    int rc = 0;
++    int max_pages, rc = 0;
+ 
+     if (!num_pages) {
+         rdma_error_report("Ring pages count must be strictly positive");
+         return -EINVAL;
+     }
+ 
++    /*
++     * Make sure we can satisfy the requested number of pages in a single
++     * TARGET_PAGE_SIZE sized page table (taking into account that first entry
++     * is reserved for ring-state)
++     */
++    max_pages = TARGET_PAGE_SIZE / sizeof(dma_addr_t) - 1;
++    if (num_pages > max_pages) {
++        rdma_error_report("Maximum pages on a single directory must not exceed %d\n",
++                          max_pages);
++        return -EINVAL;
++    }
++
+     dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
+     if (!dir) {
+         rdma_error_report("Failed to map to page directory (ring %s)", name);
+         rc = -ENOMEM;
+         goto out;
+     }
++
++    /* We support only one page table for a ring */
+     tbl = rdma_pci_dma_map(pci_dev, dir[0], TARGET_PAGE_SIZE);
+     if (!tbl) {
+         rdma_error_report("Failed to map to page table (ring %s)", name);
+-- 
+2.35.6
+
-- 
2.35.6



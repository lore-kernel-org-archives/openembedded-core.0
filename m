Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B358EC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 05:29:33 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.1872.1675834168685339261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 21:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KUpLoAyz;
 spf=pass (domain: mvista.com, ip: 209.85.215.174, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f174.google.com with SMTP id x31so2974545pgl.6
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 21:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQg2UN77h7n0+BOg11WMwNdm62CXKM0rOXSI1kLwD+g=;
        b=KUpLoAyzMq5NuiDzSLp4QzSHZHtvtNzS1HJIGNLp+PB0eOXGsVfETgH4uPUI3t4Ve9
         AmGfny4T3gXbMt4Wzr2XCQ17jpzR5L1LIlQiiSEw5ug08VkdaTs5JK3DVKI/zusnWFas
         nHCqgVLGirojWMMJfyCi9fGXXGwaqwc3c+Haw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQg2UN77h7n0+BOg11WMwNdm62CXKM0rOXSI1kLwD+g=;
        b=DCJseqkrZHrm7FyA7eAwNKg1lUVMliQuAp/lVQsTS3y0251xHa1q57Ikil9a7XyOxt
         tSVDEGaJvvKB/0QmWCSKeVMSgpz9hhbiY8DZhZL0W6Uf7g5ORA7y0G4ncj+2rV6EXq/C
         wiPqSSejepRW+zNv3KP84UY6F9Ep/nGaHP71Q7HYKjB0kFfNTHj7aOf2nLH5BmqAk2Hs
         q7O81/oLhQJWlQS2ZgkLMA7tpDZZepEvJ8YAtGdBuXsAwEvnddGctg8XsNkVDyvUuvUV
         0y+OY0L9UL/5dXsWlgqbawXkaicMYixB5HcvRxyPVf5cAab5MwlGYwN6nB4376uheeWV
         iuGg==
X-Gm-Message-State: AO0yUKXqXMIlHsGr8PwonHIeV51wleN43xKyTErxBVKoic/PwQo5K9lq
	+zIgMwG6pTA5pHIqAK++pNz6ebQ1kWXpP5Xn
X-Google-Smtp-Source: AK7set+AFPSe5UmMaWGsxO6YEuwJ+exs465pZAIEWaDQf8XMZye7t774iswJUlfVQulJGiFnyM1rrA==
X-Received: by 2002:aa7:99db:0:b0:594:2944:595e with SMTP id v27-20020aa799db000000b005942944595emr994212pfi.9.1675834167524;
        Tue, 07 Feb 2023 21:29:27 -0800 (PST)
Received: from localhost.localdomain ([115.96.160.146])
        by smtp.gmail.com with ESMTPSA id a77-20020a621a50000000b0058e12658485sm10428665pfa.94.2023.02.07.21.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:29:26 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] qemu: fix CVE-2021-3929 nvme DMA reentrancy issue leads to use-after-free
Date: Wed,  8 Feb 2023 10:59:20 +0530
Message-Id: <20230208052920.965654-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 05:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176836

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3929.patch             | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fff2c87780..05a10ecb57 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -115,6 +115,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2021-3638.patch \
 	   file://CVE-2021-20196.patch \
 	   file://CVE-2021-3507.patch \
+	   file://CVE-2021-3929.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
new file mode 100644
index 0000000000..3df2f8886a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
@@ -0,0 +1,78 @@
+From 736b01642d85be832385063f278fe7cd4ffb5221 Mon Sep 17 00:00:00 2001
+From: Klaus Jensen <k.jensen@samsung.com>
+Date: Fri, 17 Dec 2021 10:44:01 +0100
+Subject: [PATCH] hw/nvme: fix CVE-2021-3929
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This fixes CVE-2021-3929 "locally" by denying DMA to the iomem of the
+device itself. This still allows DMA to MMIO regions of other devices
+(e.g. doing P2P DMA to the controller memory buffer of another NVMe
+device).
+
+Fixes: CVE-2021-3929
+Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
+Reviewed-by: Keith Busch <kbusch@kernel.org>
+Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/736b01642d85be832385]
+CVE: CVE-2021-3929
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ hw/block/nvme.c | 23 +++++++++++++++++++++++
+ hw/block/nvme.h |  1 +
+ 2 files changed, 24 insertions(+)
+
+diff --git a/hw/block/nvme.c b/hw/block/nvme.c
+index 12d82542..e7d0750c 100644
+--- a/hw/block/nvme.c
++++ b/hw/block/nvme.c
+@@ -52,8 +52,31 @@
+ 
+ static void nvme_process_sq(void *opaque);
+ 
++static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
++{
++    hwaddr hi, lo;
++
++    /*
++     * The purpose of this check is to guard against invalid "local" access to
++     * the iomem (i.e. controller registers). Thus, we check against the range
++     * covered by the 'bar0' MemoryRegion since that is currently composed of
++     * two subregions (the NVMe "MBAR" and the MSI-X table/pba). Note, however,
++     * that if the device model is ever changed to allow the CMB to be located
++     * in BAR0 as well, then this must be changed.
++     */
++    lo = n->bar0.addr;
++    hi = lo + int128_get64(n->bar0.size);
++
++    return addr >= lo && addr < hi;
++}
++
+ static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+ {
++
++    if (nvme_addr_is_iomem(n, addr)) {
++    	return NVME_DATA_TRAS_ERROR;
++    }
++
+     if (n->cmbsz && addr >= n->ctrl_mem.addr &&
+                 addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size))) {
+         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
+diff --git a/hw/block/nvme.h b/hw/block/nvme.h
+index 557194ee..5a2b119c 100644
+--- a/hw/block/nvme.h
++++ b/hw/block/nvme.h
+@@ -59,6 +59,7 @@ typedef struct NvmeNamespace {
+ 
+ typedef struct NvmeCtrl {
+     PCIDevice    parent_obj;
++    MemoryRegion bar0;
+     MemoryRegion iomem;
+     MemoryRegion ctrl_mem;
+     NvmeBar      bar;
+-- 
+2.30.2
+
-- 
2.30.2



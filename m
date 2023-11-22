Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452B4C61D85
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:34 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.10879.1700620284934449378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y1LTUnx7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6c4eb5fda3cso6332010b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620283; x=1701225083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDiFvORmONOD8fWDavdTYhD1gSYE6d98pqm2IwZryJ0=;
        b=y1LTUnx74Cp8ooZP9aiTp0ijemYTbajfRVJb4rBafFPppyFOXt7ckQ7R+p+CoI9wRO
         gIp2q9EoF/aW8mcwDdNIxowAmy/XPKkvvSfqJcqIqoDIHMq1/5zX9oDaNr7XaejY3eMb
         EtPDZ0ATx27m3l8i1aUl5wb/AdmKxgLUqTQ6JsjHxzdsoCpYmYR4wo7rVMP8BItyleby
         qpJhOq9CmhQM9oYCIHU+n8NLXPoX122yVbVYqKhnSTDk7n0MZY1WRIxUvPStS+jbi3im
         WSyTzZ/396SHx10zHX3Xm/RYvmkkoTNGGkeR/hQwP7L4binuinlLXnmSKITMNDeXJL4X
         QU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620283; x=1701225083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDiFvORmONOD8fWDavdTYhD1gSYE6d98pqm2IwZryJ0=;
        b=vpCY9O6O2FTMxjjhDB2dL/q+2EXUD15fyAMLIa249VLf4dzWhdZDpP1M/jEYLCXaRF
         wL/MayV1wWlXy0c879h8LWvkk4XtFN4B+vBUbrSEXswBFodEAZx+SPeEncfuZnwODbaR
         pAPlhmLuUzBntCNE/01R5jM1xLq6v2G5ThUyuCdamHxz9hShWWsDTYnQSNbqomV4TzLV
         BiG6uMxJMUnEitquJ66ZnjI/NfW+t3QkXEhNWQwTOed5GYsMMhX6ySUGwBqRv3jm8Fxv
         4MC+PaEogw+vTWqsguCBj/vMxg3VI9I2FH+Yx1d2KEyIgOkOSfMrhuFqyt74UJEALmSu
         YgMg==
X-Gm-Message-State: AOJu0YzPr7xghf63lBj8JgzOE1ow1nQBdfn8dSdqiDUjAI6uDasO5Wii
	7I4hu3DbEsO2pzdjBGqmiYtcJYayyaaOwrfQe8pi4w==
X-Google-Smtp-Source: AGHT+IHhhfIVzgSHvuR+gOKgLwk5v6oPsEsuQPl4Q+GelrarnLPBb3dEjUGpWoQZ+KxyxBguNpLV6w==
X-Received: by 2002:a05:6a20:3954:b0:186:9a3f:f2c4 with SMTP id r20-20020a056a20395400b001869a3ff2c4mr950451pzg.47.1700620283483;
        Tue, 21 Nov 2023 18:31:23 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/16] qemu 6.2.0: Fix CVE-2023-1544
Date: Tue, 21 Nov 2023 16:31:00 -1000
Message-Id: <d019fcc99c542d49be6e1615a5c75f88f8ff5a52.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191002

From: Niranjan Pradhan <nirpradh@cisco.com>

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2023-1544
Type: Security Fix
CVE: CVE-2023-1544
Score: 6.3
Patch: https://gitlab.com/qemu-project/qemu/-/commit/85fc35afa93c

Signed-off-by: Niranjan Pradhan <nirpradh@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-1544.patch             | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 83bd5d7e67..c8e4e2e6f3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -101,6 +101,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-3354.patch \
 	   file://CVE-2023-3180.patch \
 	   file://CVE-2021-3638.patch \
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
2.34.1



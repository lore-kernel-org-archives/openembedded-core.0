Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.2669.1629829116470382409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 11:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NgF2VJvr;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id mq3so14776805pjb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c9pgF7ewDmtMdGVs+0JH/mESNkl4Ry75+1NYXupuMRA=;
        b=NgF2VJvrr1XGPKkcdUKP+yM9Yhot6hKTHegKkU9VadGtUkPcJsOYrfM7hkhZb/JC4B
         Bt5CQlbHI7HbafUfDFv93/qP8Emqs+r+Rw93ghOryJaVk4IixBWDfJ8i0rPmjZ9tEVyq
         xYt2BGs6q4vx//b3y3wiXzo2VPQuEgL+zXoXY0HNfgKszU2fq2VH/Xzs5rq6kIwVx2Pa
         sxLQlSj0KrcCNPbFoE81sCr8hGpbKCBuBa0Q3pEzoUnLS8jxAhcxBaShIH2MbvLdrsWi
         eHKuKTNSNfxC1Q3mlb4XpJEc3Q5T5pwG3qTXeuaZsJL3c69fbc0xy6SU3oEMSObybMuo
         T6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c9pgF7ewDmtMdGVs+0JH/mESNkl4Ry75+1NYXupuMRA=;
        b=XYc4WdfHzHXyjGDL6faW+eXDWfeqkyDQbHelAPn/egESrsKA4GZ1M4Qgs2UH1KfHyY
         9U6GNPVsojLL5ULgXd0qh1psGudLHAmDvBdwE00U7uCCiWkjXasmL22gN6lYVc0lOyyX
         9DY+CqSc2BZTImD4sxkguGOzfxwgBMh84hqvlBvfR/qmKnAsovcT9icFmbUfkOrxuHBJ
         Ik8gteJkaY3T3SdtQeSg+Zx46Z1f0SPq2iufbfFRSVJ078CwBm4GZfpDrnivkRI50i4b
         +e/xLFfYWKWWajWEsmHrV0KdheqINlXZbyEsH/oWRBkix3AXNFjC7Chu37vqvT1mQSwA
         rLLQ==
X-Gm-Message-State: AOAM533wXueYVQPXCJoQiqXrdGmLGqjYId+pVo0zibIp+AA+JZ+CKLs2
	0H1yaizNttmu2I6Km/5buGam41RKbO4=
X-Google-Smtp-Source: ABdhPJxO0o5BfH0K5qjO/fynsCQOxUYaTAijM4y2OQAFZTZbn4W1fnj1nZzRGFF5YluLdBPj7UauWA==
X-Received: by 2002:a17:902:8c83:b029:129:17e5:a1cc with SMTP id t3-20020a1709028c83b029012917e5a1ccmr34145986plo.49.1629829115925;
        Tue, 24 Aug 2021 11:18:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:35b6:3d86:f2de:f7d2])
        by smtp.gmail.com with ESMTPSA id g26sm23416734pgb.45.2021.08.24.11.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 11:18:35 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sakib Sajal <sakib.sajal@windriver.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 3/4] qemu: fix CVE-2021-3607
Date: Tue, 24 Aug 2021 11:18:30 -0700
Message-Id: <20210824181831.1045731-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824181831.1045731-1-akuster808@gmail.com>
References: <20210824181831.1045731-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: http://git.yoctoproject.org/cgit/poky.git
MR: 112749
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?h=hardknott&id=460485d774480cd89cadf3b068f5197f44d86f25
ChangeID: 4e40dee2e6ce0b5b4de971f2c2b336929e7f22c3
Description:

(From OE-Core rev: 764bca67650da9df439527796879dda767c8c008)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 460485d774480cd89cadf3b068f5197f44d86f25)
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3607.patch             | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 854a907216..6066418a7b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -82,6 +82,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
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
2.25.1


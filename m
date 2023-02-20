Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7ED1C678DB
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:42 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.28058.1676931634468030927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xLCWv6nV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id b14-20020a17090a8c8e00b002349579949aso2732454pjo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bI5hPArnzxHVsTj1xQKLFyc2jY1DoUDDxwbexLAODDI=;
        b=xLCWv6nVaIdV0jWQZ7xodaX18siIJxXZ8ZBPkZrDlsgNI0XfEGXDLeSklGEWoTz/L5
         gVJV9dFu7QziuWqP15yZjd1NGDyzqoMVida2vOSyM/v2InxSVZaMkDOHC90p2bk/O39S
         5kr6gA7VK8UAfTX+s9Vrm1VVfjTkWO3pfGs8hZfYNB/GgT8QAIWSKKnBiQtWNvm3N6Ox
         nGQmKdbRaR4dntUthvYtaE0yjC/HtfT+26B1HU9Crrt06knsdSCt8KcdGyhqItWKlVlZ
         YUbhCwDNyz89IkRYNm+BQindgSgZZDR8RkwLs8elBFHbvgrhEnuSgYWnoz20poQVBFfH
         8S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bI5hPArnzxHVsTj1xQKLFyc2jY1DoUDDxwbexLAODDI=;
        b=3DaEV8sbPX4ounKtCgHIQlxm8BeuANRsPoJFbieHgJs4lQ7khkQV7lJQpXbM28wca/
         PmNH0y6UWnPveqrX0dlzgB317Y3ac2oSiXcsPSNn7zoW1QXrBg6nwMk9nI5Kl78T+XUZ
         e7U+evYzGY0RMvweiDAiESDxWCvulj/tPV8jFvWp6z76dFisSvJFhruIo6xF3pPIbt0y
         i8S7APeddSpIewESFwkccF9iv0m5ipTG+5tlMF6ZhtSeoV671pLAHYhgXLBlSAzfhHR8
         VE9V5fEFal7CQi1foHaNB07oiZkiribkDNRhLXpJ++HcXw4sdGCQB1l+oImI6SSv/O4N
         issA==
X-Gm-Message-State: AO0yUKV0Oct5ByBgMaguAoduJjG6X+86fog315eWzmmHJC3Q3RvmCAtU
	pJyrR5BxcApIP1nB8hVHpsg/K/fECaCS8WFQUCo=
X-Google-Smtp-Source: AK7set94p0JxaSojnGXiPzrZdC/8m/xeY9mwnUj7Ux/T2cyyu57Gc7i3oGlsSl0TGQcVmYAnttBjzQ==
X-Received: by 2002:a17:902:ecd0:b0:195:e9d4:5380 with SMTP id a16-20020a170902ecd000b00195e9d45380mr3837101plh.56.1676931633176;
        Mon, 20 Feb 2023 14:20:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/16] qemu: fix CVE-2021-3929 nvme DMA reentrancy issue leads to use-after-free
Date: Mon, 20 Feb 2023 12:20:09 -1000
Message-Id: <18056190f72eef9a44397cd87d79022dd2a9d4e3.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177462

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3929.patch             | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e9fcb239b4..36d0b9320f 100644
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
2.34.1



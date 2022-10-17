Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640D1C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:08:56 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.640.1666048135657173706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=hSuK9l9j;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id i6so12126795pli.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRQb9HgCxwEgQebdBw3bkNTUYeu67UsGrQ7IB0hzytQ=;
        b=hSuK9l9joAugEb7TnGobhOJUKBg09wTliW8KdSgh+X4AXkm9yBJS36hCZUXaLIG0jV
         Wkxa24rD3SPSmFnr+ieIw3H3B2awV593Yuo5uFC6MYKwjOr4UYV7aeoCg0xBM0+mhrLQ
         MUTorvG3m+NqpscgmWO4KBU4gtrzcN+H+7EZf/jV9m3mazIFW7WFs2hTpalESXCFsBTU
         ZLM7Fgpkf+gaeHmxbGiUIeDK9A+HQ6lU6WYALI9Q6FH6gHZIUki7I9jQIQ3ScGzWx3TD
         aNyWI3w6feuNhzphyxZYlV9iOX9BEWcLhgkV5SpDmL8brXFewvS7KC8pvyaGRgYeSl3C
         ckbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRQb9HgCxwEgQebdBw3bkNTUYeu67UsGrQ7IB0hzytQ=;
        b=VLu1X1WrRhhYWbC00Ukw0N1QARJNyqGl+9SrE0Vy8+d46wLiJHIi3rcCGzUXcEqBH1
         pxtsF/1S3bTUniqpNK2/7ROBmfUDLRuZzxp3Drfp9E5XFPxLMDJ/US+4Q7wefduMPUuz
         aHkjPzsIFzYBvn31TaaDXSoSv7c3bDP0iYg/YMV6VSUgu5eVeyUvHdf0nhAdjKHHwhVl
         aF5gcA8h3B8qCsZlJr2zoWzBV6mjB/dMLa+vAyeUAj7Dj83XfV/dier8+l6dZnN1McKs
         q5UCp7YEcYNYE+T0Rs8QTU66nkUpOFq0h1W9PDyMp5ryp6jaCQhPiqctuB+pqSyJV4Um
         aR5w==
X-Gm-Message-State: ACrzQf0dMYoExB269eGsBnanxXEGoSQoLeJ/MN3W9XENXrcUBc76cKnQ
	qqwMjCzfnPieAOIuqRYiBgs7WLRq8s85LFCQ
X-Google-Smtp-Source: AMsMyM4PtdFO6x1U716NHa56beDHb7Em20ce7MG/vKy6GVvGV0kNVMTehRi1IVDroiuGDl4vkvs7/Q==
X-Received: by 2002:a17:90b:1c11:b0:20d:459b:ef0e with SMTP id oc17-20020a17090b1c1100b0020d459bef0emr35825760pjb.129.1666048134588;
        Mon, 17 Oct 2022 16:08:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.08.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:08:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/13] qemu: fix CVE-2022-2962
Date: Mon, 17 Oct 2022 13:08:21 -1000
Message-Id: <8ad129d079ea53ca66a91ec9fe36bb95f2648112.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666047986.git.steve@sakoman.com>
References: <cover.1666047986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171923

From: Ross Burton <ross.burton@arm.com>

Backport the fix for CVE-2022-2962.

(From OE-Core rev: 943d28a3395455fd475cb6c84247d106adf5fca3)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ddc4258012e0d3fa946c319b601b0e73db7ac5e6)
Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>

Signed-off-by: virendra thakur <thakur.virendra1810@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...ulip-Restrict-DMA-engine-to-memories.patch | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-engine-to-memories.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cb5f9358da..76ae603ee4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -70,6 +70,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0022_let_ld_pointer_pci_dma_function_propagate_MemTxResult.patch \
            file://CVE-2021-3611_1.patch \
            file://CVE-2021-3611_2.patch \
+           file://0001-net-tulip-Restrict-DMA-engine-to-memories.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-engine-to-memories.patch b/meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-engine-to-memories.patch
new file mode 100644
index 0000000000..6c85a77ba7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-engine-to-memories.patch
@@ -0,0 +1,64 @@
+CVE: CVE-2022-2962
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 5c5c50b0a73d78ffe18336c9996fef5eae9bbbb0 Mon Sep 17 00:00:00 2001
+From: Zheyu Ma <zheyuma97@gmail.com>
+Date: Sun, 21 Aug 2022 20:43:43 +0800
+Subject: [PATCH] net: tulip: Restrict DMA engine to memories
+
+The DMA engine is started by I/O access and then itself accesses the
+I/O registers, triggering a reentrancy bug.
+
+The following log can reveal it:
+==5637==ERROR: AddressSanitizer: stack-overflow
+    #0 0x5595435f6078 in tulip_xmit_list_update qemu/hw/net/tulip.c:673
+    #1 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
+    #2 0x559544637f86 in memory_region_write_accessor qemu/softmmu/memory.c:492:5
+    #3 0x5595446379fa in access_with_adjusted_size qemu/softmmu/memory.c:554:18
+    #4 0x5595446372fa in memory_region_dispatch_write qemu/softmmu/memory.c
+    #5 0x55954468b74c in flatview_write_continue qemu/softmmu/physmem.c:2825:23
+    #6 0x559544683662 in flatview_write qemu/softmmu/physmem.c:2867:12
+    #7 0x5595446833f3 in address_space_write qemu/softmmu/physmem.c:2963:18
+    #8 0x5595435fb082 in dma_memory_rw_relaxed qemu/include/sysemu/dma.h:87:12
+    #9 0x5595435fb082 in dma_memory_rw qemu/include/sysemu/dma.h:130:12
+    #10 0x5595435fb082 in dma_memory_write qemu/include/sysemu/dma.h:171:12
+    #11 0x5595435fb082 in stl_le_dma qemu/include/sysemu/dma.h:272:1
+    #12 0x5595435fb082 in stl_le_pci_dma qemu/include/hw/pci/pci.h:910:1
+    #13 0x5595435fb082 in tulip_desc_write qemu/hw/net/tulip.c:101:9
+    #14 0x5595435f7e3d in tulip_xmit_list_update qemu/hw/net/tulip.c:706:9
+    #15 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
+
+Fix this bug by restricting the DMA engine to memories regions.
+
+Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+---
+ hw/net/tulip.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/net/tulip.c b/hw/net/tulip.c
+index 097e905bec..b9e42c322a 100644
+--- a/hw/net/tulip.c
++++ b/hw/net/tulip.c
+@@ -70,7 +70,7 @@ static const VMStateDescription vmstate_pci_tulip = {
+ static void tulip_desc_read(TULIPState *s, hwaddr p,
+         struct tulip_descriptor *desc)
+ {
+-    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
++    const MemTxAttrs attrs = { .memory = true };
+ 
+     if (s->csr[0] & CSR0_DBO) {
+         ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
+@@ -88,7 +88,7 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
+ static void tulip_desc_write(TULIPState *s, hwaddr p,
+         struct tulip_descriptor *desc)
+ {
+-    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
++    const MemTxAttrs attrs = { .memory = true };
+ 
+     if (s->csr[0] & CSR0_DBO) {
+         stl_be_pci_dma(&s->dev, p, desc->status, attrs);
+-- 
+2.34.1
+
-- 
2.25.1



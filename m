Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07F7C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 15:06:55 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.5654.1665155208655501278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 08:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nad8OkcA;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id fw14so4656206pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 08:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TKsic+4fIKCbVQgapGTYvncOme8SSADRv9au0M27kw=;
        b=Nad8OkcAi8AXPLXCNtMHHGAh0O96O1dvcNYeKbEpOicdPCrNcg5CMLw0gP0l1NhNC8
         fCTitLilqU1M7sJBdbTDf2BiGWxwuo323KXw6h6AMy6p+QBAryKXolC8E9s2ztvqx70J
         gGtdWhh0p/lypLel697ax7VfUkyt3Bb+jmVNAqbDhG5wak8WCBXA1cehsO2j24Pche1b
         8xBVb3Bxu2VfRItQBwb/Mk+mW0GrhqKVGUeQJK/TyKd/+NyQYEB1QdXobOFrAYEJaxjq
         7zA98RO3bO1a1p70XhOf956bmiqpIMMycDGHCCxWIO7WC2+fr9qGKw0pQcVQUfF18jM2
         A4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TKsic+4fIKCbVQgapGTYvncOme8SSADRv9au0M27kw=;
        b=apTCNtTeB6kpIGvzy+bDfybaF0lheKkrhe0kYuwJfOlY6JStWD7EnjPE121fZsaiFt
         QAVlFQgcKgNRkCsfBA35yjFBQabIkA0lbNWJ2c8U9Q6Vl9z5obJbZkHubAZSvvYuFyH8
         KOFCPNoC2oRZhZzHZqycYqhfC1iNctYCjhNp4TBFWT15Ab7RFa2uplUsWh6jEykaLdxh
         8EsFNgMG69R33j/wQZLXez7b7x6ES9nvIiQ0VcCBTnmc4GLnZjAqTRs1e6se/UqmRLll
         CZp0Z9vP3+yT5YQUG8D3m2q4UOafdRBIY2CXSvoXyQdGSiNme2mMN94rl/Nk6sA+H4bU
         snmQ==
X-Gm-Message-State: ACrzQf0ur2khie7P9+ON7lYvfvO4DY43RYYaludJNKc/zcQml4xaSbby
	eJQ08H7MvHUn34gG6jKHZ693it9tMcqYzJrrFlk+UQ==
X-Google-Smtp-Source: 
 AMsMyM4+VvGOdSM2H3xNI1r4WvhJPeErt9hCbEfnHH28Z32Yhhp4R939T5w/Mp7mNSz1PpnhTnYTyw==
X-Received: by 2002:a17:902:c652:b0:180:556e:1b58 with SMTP id
 s18-20020a170902c65200b00180556e1b58mr1743446pls.35.1665155207554;
        Fri, 07 Oct 2022 08:06:47 -0700 (PDT)
Received: from localhost.localdomain ([171.48.35.94])
        by smtp.gmail.com with ESMTPSA id
 u10-20020a170902714a00b0017f92d7fe2csm1598775plm.288.2022.10.07.08.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:06:46 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	bhabu.bindu@kpit.com,
	virendrak@kpit.com,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-Core][kirkstone][PATCH 3/3] qemu: fix CVE-2022-2962
Date: Fri,  7 Oct 2022 20:36:39 +0530
Message-Id: <20221007150639.5117-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 15:06:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171528

From: Ross Burton <ross.burton@arm.com>

Backport the fix for CVE-2022-2962.

(From OE-Core rev: 943d28a3395455fd475cb6c84247d106adf5fca3)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ddc4258012e0d3fa946c319b601b0e73db7ac5e6)
Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>

Signed-off-by: virendra thakur <thakur.virendra1810@gmail.com>
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
2.17.1



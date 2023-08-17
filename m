Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F128C2FC14
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:06 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.178854.1692240599359443900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=4Orse8CI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bee82fad0fso14247155ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240598; x=1692845398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWQXAls2H+iH8KEeC5kwK3FS4PI5FAiA/R5EcLhVbtw=;
        b=4Orse8CIef+ta+3hOh4yj3miGe6qzfFwQXjPq+stBNlC296mAq9cJk9nDl6l+jaghH
         hRVhbcUnjVMlNTCuLbDx1Fyf8RVwCDQCEB+MhCoYKFSfPxM4fPkK6v+UsOEsBpTInzqo
         jfgLXfWisvvGaIAqRzh2eUdvy09kC3R6ir8Sn0Qe0rIq2uAPhgE0/NOw8uFQr+tK6SYx
         Al2q5mcuY21P0Uzl9660oblfF6Y0sUCxvZ+cclVmdJMp1jEvae7DrYMw19d5DeJ070rv
         l8qeIrqrYItiGqgQ7fa7YaCrRD+YIVppdm3X8qFRaipmBCrmwfxDSuYNbWJDLnlkTtgr
         a7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240598; x=1692845398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWQXAls2H+iH8KEeC5kwK3FS4PI5FAiA/R5EcLhVbtw=;
        b=E4k6mm3Z0uLaAb1NkSZMfTJXHp27sfZAXzEASLn2W7BHoVuNoOqaJKV5jqJeSWOc4S
         aZi0SAEZ1jlm3pnAV50Ewiie4s8yWoe+Tol3Rf7LhL5/wS9t3mMy+LGbwBjnAX6uZoJu
         hrtcYAVmxM2hKUc3gf7Va0NGSzr82fNFB7iWBx8QOKdpF7Bk6hwVhC1IO5lVsNPHastE
         3Kj1KlMpoFqg2dg9vDri4O7De3n49u08kS3py1ligxlN5uVdMFXmf/RWub/pSoJf2guG
         XxbPPpzJE4P9PnTUSLZ0AJMoF8DsvNL41wdKukAWk46QVpBtp2Bh8pPQZfx23H3wvvxB
         wdlQ==
X-Gm-Message-State: AOJu0YyhDm1TxjIrJWGs+j+micztQI9GIya7MQja/mrPP/XitK6Wwg1P
	nCAGF+z93GmPBrLftduoFRT4fozCBpdd47kmuRY=
X-Google-Smtp-Source: AGHT+IER3QC2khDG2VF9bZXsSgvoIHunF9HQE809aMCz0rlIkqjG1TgTgRM128NC/NGvAr/8LTdSjQ==
X-Received: by 2002:a17:902:e841:b0:1bb:7b0a:374 with SMTP id t1-20020a170902e84100b001bb7b0a0374mr4432967plg.4.1692240598380;
        Wed, 16 Aug 2023 19:49:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.49.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:49:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/16] qemu: fix CVE-2020-14394
Date: Wed, 16 Aug 2023 16:49:34 -1000
Message-Id: <057f4f77ac2e83f99c916dceb4cbbcc8de448ad4.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186267

From: Yogita Urade <yogita.urade@windriver.com>

QEMU: infinite loop in xhci_ring_chain_length() in hw/usb/hcd-xhci.c

Reference:
https://gitlab.com/qemu-project/qemu/-/issues/646

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-14394.patch            | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14394.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 96a1cc93a5..8182342f92 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -97,6 +97,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2023-3301.patch \
            file://CVE-2023-3255.patch \
            file://CVE-2023-2861.patch \
+	   file://CVE-2020-14394.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-14394.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-14394.patch
new file mode 100644
index 0000000000..aff91a7355
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-14394.patch
@@ -0,0 +1,79 @@
+From effaf5a240e03020f4ae953e10b764622c3e87cc Mon Sep 17 00:00:00 2001
+From: Thomas Huth <thuth@redhat.com>
+Date: Tue, 8 Aug 2023 10:44:51 +0000
+Subject: [PATCH] hw/usb/hcd-xhci: Fix unbounded loop in
+ xhci_ring_chain_length() (CVE-2020-14394)
+
+The loop condition in xhci_ring_chain_length() is under control of
+the guest, and additionally the code does not check for failed DMA
+transfers (e.g. if reaching the end of the RAM), so the loop there
+could run for a very long time or even forever. Fix it by checking
+the return value of dma_memory_read() and by introducing a maximum
+loop length.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/646
+Message-Id: <20220804131300.96368-1-thuth@redhat.com>
+Reviewed-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Acked-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+CVE: CVE-2020-14394
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/effaf5a240e03020f4ae953e10b764622c3e87cc]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/usb/hcd-xhci.c | 23 +++++++++++++++++++----
+ 1 file changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
+index 14bdb8967..c63a36dcc 100644
+--- a/hw/usb/hcd-xhci.c
++++ b/hw/usb/hcd-xhci.c
+@@ -21,6 +21,7 @@
+
+ #include "qemu/osdep.h"
+ #include "qemu/timer.h"
++#include "qemu/log.h"
+ #include "qemu/module.h"
+ #include "qemu/queue.h"
+ #include "migration/vmstate.h"
+@@ -725,10 +726,14 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
+     bool control_td_set = 0;
+     uint32_t link_cnt = 0;
+
+-    while (1) {
++    do {
+         TRBType type;
+-        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
+-                        MEMTXATTRS_UNSPECIFIED);
++	if (dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
++                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
++            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
++                          __func__);
++            return -1;
++	}
+         le64_to_cpus(&trb.parameter);
+         le32_to_cpus(&trb.status);
+         le32_to_cpus(&trb.control);
+@@ -762,7 +767,17 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
+         if (!control_td_set && !(trb.control & TRB_TR_CH)) {
+             return length;
+         }
+-    }
++
++	/*
++	 * According to the xHCI spec, Transfer Ring segments should have
++	 * a maximum size of 64 kB (see chapter "6 Data Structures")
++	 */
++    } while (length < TRB_LINK_LIMIT * 65536 / TRB_SIZE);
++
++    qemu_log_mask(LOG_GUEST_ERROR, "%s: exceeded maximum tranfer ring size!\n",
++                          __func__);
++
++    return -1;
+ }
+
+ static void xhci_er_reset(XHCIState *xhci, int v)
+--
+2.35.5
-- 
2.34.1



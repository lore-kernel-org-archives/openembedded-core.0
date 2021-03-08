Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.35928.1615211172979986113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 05:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C3RMj790;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: flowergom@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so4061873pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W0jHNrdLB0J2KWKG3iz1oDunYIWB/8Ij3yXky+xeeL8=;
        b=C3RMj790i+3YvRTU4H5W0AquJg68rHMR6HrnLuxCyy58a/YstCjtcVfHpy90fGNHTW
         6ihgRVNtvjWIzTuNwtgTXTKy1+MGygvhYfSpTDieBeUThU19StB+XFoqmhT1lb7OUL4e
         ln5f8XokAU1+XMgx1O8U36PLHZNM98Ae+r31Snxhec/6JES8NyajgBDGgp+9AT+K1tLl
         SXkdTuM8fdKzcDgS5tVWXycab0buPlpd7z8t4J0VLMgFbczAD3buBwwFnFQzCWcjNzN+
         W22iv9d86TeL8ih1KcgEEhccc+V020dzb28BdFOFqHihaghnCG7rf1Pjwt/hRdO1DYGz
         t+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W0jHNrdLB0J2KWKG3iz1oDunYIWB/8Ij3yXky+xeeL8=;
        b=sWWrDQbLlGFq4SPs6EOCKmEowFqDhdBhdqtiTMEZ8DqebkRL9SYTYFg3WuDp5/BHMr
         fiRnphOvnORmW411oYbTKPEjmy9AQlPQcKkZM3b+OPQj0j7q3XqUKeck60lIbZs2t0cP
         UmtRSDLNeFNn+O8jgERXDZj0HiwL9jKgZiLshf5+zEyV/UzITL2iMuuZ4m58HBq0pynq
         QD5SLIU9W9oErzU9BtpA4YW7Sz6ZUYFKr9xhEtrAsA/60Y6RqMOnJmLT8tjk7yjcC1AX
         rouUyu1wI1yZ0WBUlNm0Xe3AMO0/2p3ky3GoXAhuUudEUEp1/C9xsxCKYu3cPMaK7DQj
         C/DQ==
X-Gm-Message-State: AOAM532X0t6phYovctfr73TCbVvxtPaULNKgI+GZAb3M1wPB0Wk24Sq6
	Dqtgrodd4byNpXRpZ+g8JGxQxbkta3uuXw==
X-Google-Smtp-Source: ABdhPJwrLPLxwjadOQEFRCAj01TuXz3/9KvECR9ycb4PU2u5G/fT0xp/E7+8ne7HtysQmvAvVDFdpQ==
X-Received: by 2002:a17:90b:388d:: with SMTP id mu13mr10256920pjb.34.1615211172106;
        Mon, 08 Mar 2021 05:46:12 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id w25sm10431513pfn.106.2021.03.08.05.46.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 05:46:11 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH 2/2] qemu: fix CVE-2021-20203
Date: Mon,  8 Mar 2021 22:45:53 +0900
Message-Id: <20210308134553.1250-2-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210308134553.1250-1-flowergom@gmail.com>
References: <20210308134553.1250-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

net: vmxnet3: validate configuration values during activate

Upstream-Status: Acepted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07935.html]
CVE: CVE-2021-20203
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20203.patch            | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a1a418374f..5e8d3e09ff 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -53,6 +53,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2019-20175.patch \
 	   file://CVE-2020-24352.patch \
 	   file://CVE-2020-25723.patch \
+	   file://CVE-2021-20203.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch
new file mode 100644
index 0000000000..31440af0bd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch
@@ -0,0 +1,74 @@
+From: Prasad J Pandit <pjp@fedoraproject.org>
+
+While activating device in vmxnet3_acticate_device(), it does not
+validate guest supplied configuration values against predefined
+minimum - maximum limits. This may lead to integer overflow or
+OOB access issues. Add checks to avoid it.
+
+Fixes: CVE-2021-20203
+Buglink: https://bugs.launchpad.net/qemu/+bug/1913873
+Reported-by: Gaoning Pan <pgn@zju.edu.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+
+Upstream-Status: Acepted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07935.html]
+CVE: CVE-2021-20203
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ hw/net/vmxnet3.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
+index eff299f629..4a910ca971 100644
+--- a/hw/net/vmxnet3.c
++++ b/hw/net/vmxnet3.c
+@@ -1420,6 +1420,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
+     vmxnet3_setup_rx_filtering(s);
+     /* Cache fields from shared memory */
+     s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
++    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
+     VMW_CFPRN("MTU is %u", s->mtu);
+ 
+     s->max_rx_frags =
+@@ -1473,6 +1474,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
+         /* Read rings memory locations for TX queues */
+         pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.txRingBasePA);
+         size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.txRingSize);
++        if (size > VMXNET3_TX_RING_MAX_SIZE) {
++            size = VMXNET3_TX_RING_MAX_SIZE;
++        }
+ 
+         vmxnet3_ring_init(d, &s->txq_descr[i].tx_ring, pa, size,
+                           sizeof(struct Vmxnet3_TxDesc), false);
+@@ -1483,6 +1487,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
+         /* TXC ring */
+         pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.compRingBasePA);
+         size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.compRingSize);
++        if (size > VMXNET3_TC_RING_MAX_SIZE) {
++            size = VMXNET3_TC_RING_MAX_SIZE;
++        }
+         vmxnet3_ring_init(d, &s->txq_descr[i].comp_ring, pa, size,
+                           sizeof(struct Vmxnet3_TxCompDesc), true);
+         VMXNET3_RING_DUMP(VMW_CFPRN, "TXC", i, &s->txq_descr[i].comp_ring);
+@@ -1524,6 +1531,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
+             /* RX rings */
+             pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.rxRingBasePA[j]);
+             size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.rxRingSize[j]);
++            if (size > VMXNET3_RX_RING_MAX_SIZE) {
++                size = VMXNET3_RX_RING_MAX_SIZE;
++            }
+             vmxnet3_ring_init(d, &s->rxq_descr[i].rx_ring[j], pa, size,
+                               sizeof(struct Vmxnet3_RxDesc), false);
+             VMW_CFPRN("RX queue %d:%d: Base: %" PRIx64 ", Size: %d",
+@@ -1533,6 +1543,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
+         /* RXC ring */
+         pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.compRingBasePA);
+         size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.compRingSize);
++        if (size > VMXNET3_RC_RING_MAX_SIZE) {
++            size = VMXNET3_RC_RING_MAX_SIZE;
++        }
+         vmxnet3_ring_init(d, &s->rxq_descr[i].comp_ring, pa, size,
+                           sizeof(struct Vmxnet3_RxCompDesc), true);
+         VMW_CFPRN("RXC queue %d: Base: %" PRIx64 ", Size: %d", i, pa, size);
+-- 
+2.29.2
+
-- 
2.24.3 (Apple Git-128)


Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.35963.1615213092773222116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lmQYgHGx;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id s16so4920935plr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 06:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oa5iMphYazGwMAWsknArGbGpjg8rxvyxu6dhs1BY0Mw=;
        b=lmQYgHGxa3saCdelCR9BfkPQIZSnGGAGVWLuWTzE5huZZd2UpWeXp7+hG2qlbxOmEl
         94u12j03yNNGCZoiGilCbPjd3up2dkKYdYBSTG1YhnPZ5ZwoXByW10G4SnxOUMOEPjXs
         IryQ+IZZfuJS+8OQe8KyJdm1KxtietIbchHtPJ38tZRq3kc6l38s+VOUx/ZeTE0thF4m
         hxVlPVlqopb4vfkJar6zI5wnaJVTatzEuhPSRcQRA74z3JSa2n2n855iGaWpanHyLY7U
         V2RDGTKRQM61+1te0aRZRZOnJk6eP8tqiVtqMOZjy2DJCUG9ae1s1qQH+xhesMGv4RZe
         8NvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oa5iMphYazGwMAWsknArGbGpjg8rxvyxu6dhs1BY0Mw=;
        b=gTkEIzlBLyNeDJ1EKqffzyC7rgOsXOwND46uCirT+M8Mb1IEmELbYVFAKLV2YeuOBs
         i77LWYuj8cTfAiS8JNtvbMjl5w27ndvsOHK/8jrUXrm4CVwJhczoGtldx8WA2+y+BNRu
         qpcckbsVki/i/FbzF+3LGvO4QF3u1LueSu9qAKQG2DeGRJ7X/aiMXKN1kJoh5Xr9sSlj
         cA8xRNS7l3Nb/GmppVc50e6HXAmwhFl53SHnHPANk4w/4wfAZq5AOL4akwdUPfaiZrou
         TleRhG8XM9xlgVpsIWxFM59+/XcqwV0GIsIkB+srjsmRBm0Qa0ba8LlDzwqMoxCWNvoQ
         n1jg==
X-Gm-Message-State: AOAM531iyG9uU1k8zTjhPmpZmup28+pDo3ACiREYH8HKIsADXipemCSL
	aEMYIP/lXMKwMQwUk0tWSuy35GH4ne5cVw==
X-Google-Smtp-Source: ABdhPJzlXucE5ajtZa/Cq5vS/5xYCeuchYqJRhP2S2MOAXoXqLfJ0NGwfk90azwheWGxP+mKa8kcvA==
X-Received: by 2002:a17:902:f54e:b029:e6:3d74:eb3 with SMTP id h14-20020a170902f54eb02900e63d740eb3mr1470155plf.14.1615213091556;
        Mon, 08 Mar 2021 06:18:11 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id z2sm10764598pfc.8.2021.03.08.06.18.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 06:18:10 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [gatesgarth][PATCH] qemu: fix CVE-2021-20203
Date: Mon,  8 Mar 2021 23:18:03 +0900
Message-Id: <20210308141803.1632-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
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
index 97f110cde5..482ca3d6e5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-28916.patch \
 	   file://CVE-2020-35517.patch \
 	   file://CVE-2020-29443.patch \
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


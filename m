Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web08.2524.1615661404534891055
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HpbqcDF3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id r24so5142884otp.12
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mZs90ZZs0uztGB8kBmLynm849LS+y6Fn0WBUCvWzipU=;
        b=HpbqcDF3d+nqrEp/vVNmbgzwWY1yQvJzFTkUqxy5/dubF6sPtWfBM7NuSw+tEDvlWF
         GDXzVaW304/e5A8KxY5WH/1gK3B04qfC4L2yLAHaAimzG2RATxcXaEYTw1hz6PeCzuPg
         7X6H2EqW94d6XcBqYNv6Am1HIxpEF0rkIVrWWD/zLw0KnEYxmm92Ntaa1wwVTjo6gTVw
         +YVz7921RS9CZ4DgpTSNElActjvQiMWh+yo9tncZnegLgx904NK6YsLJswN2KxD51FH1
         aMniXf6WUmah/MCoGzhbKFJkIKvwRjPGG83T5kOiWoLMqYgvJ8aP1Pl2CqITp0lkwY6V
         pMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZs90ZZs0uztGB8kBmLynm849LS+y6Fn0WBUCvWzipU=;
        b=Uw+6odZCCjchG9zDIwv3qIhOZpcX2dfKezVzGM2pjiFixhO4EtRMCFIJR34Mw8BPtK
         w93SzgF7Y6uUdd4mMRZvhdMThGlw+CFdsT6Mu2luKNEsvcjvcVy2jQrtEGGoxQgfVEoV
         4vm1QcW71YZCs6K9sgusnO5GYiDufA1+SG0LJ3ykb2f7XFzXyuIck2uEFd1ybWEKgEK5
         qDGzejBlRjS4oEY7JUbAxNEzom48CQgBPXNzqiZJ6REW3dcXrbRgJJjwuGANySCPGF+o
         w4WZGSHbQZ9dSTuCnMbIXLaSBtGU3uEniT+3veIU2tLMLDibb3G9nWgdNvb6U49s8cu+
         jVjA==
X-Gm-Message-State: AOAM532RCgIkyNrrMLFLLfm+TMP2ornUaLwWUAylstZoAHcjir5CoV+M
	bPVYLkDk74YjcSGgAQhGZ9vtXymy4etzuGsE
X-Google-Smtp-Source: ABdhPJzcsibexcHv6qg8plKuQxX1E2cyGPl3BoEzA51/r0ujSoqVq0Fg9LJPmjapPNhH9EcH6IkYKA==
X-Received: by 2002:a05:6830:16d3:: with SMTP id l19mr5148997otr.79.1615661403385;
        Sat, 13 Mar 2021 10:50:03 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.49.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:50:02 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/38] qemu: fix CVE-2021-20203
Date: Sat, 13 Mar 2021 08:48:51 -1000
Message-Id: <c65a671d7af64a19bebd45b1c4d02fdf124a1c5a.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <flowergom@gmail.com>

net: vmxnet3: validate configuration values during activate

Upstream-Status: Acepted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07935.html]
CVE: CVE-2021-20203
Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


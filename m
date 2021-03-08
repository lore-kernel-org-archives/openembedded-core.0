Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web09.37221.1615216281591673430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 07:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O+ILL0qZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: flowergom@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id v12so9452330ott.10
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IhI5ukMD8eMfNUASCzbQGySo3VllGM0Ansj3/izWqXY=;
        b=O+ILL0qZBWOJtVD07nm+VHWx6xSTHor2NlSQpJMW6HRGhA//iz/YqIZErrgHUS2m3/
         ew43x/jtuqoFQ1lIDlMVih/U0gS1te9Gm92K50bTHe7IQzoOPEH+mLI8E6L8YWbNQKzk
         wabRDERdvN5iphi2O9IJauoRFuCFw21X03aG9yhenAQKBTFGtIvmEU52m3EeRX7nLKDR
         bJTQj4V5N35H4N+StQKYmpNxxPnz3vA29cAVw0H5Se2dUDIhp7AKfVWMGQt7jXnRxCpe
         7ejZ9hQTjAXohXgtgoJnPik96VpjCoMh205jDssA2z8Rc4v7lDRjyI84Bi19NzADjc+U
         4vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IhI5ukMD8eMfNUASCzbQGySo3VllGM0Ansj3/izWqXY=;
        b=LUQbhRHGuPTXElniz8xbHhTg9I/LxdzzNid64Ub7qCcKJ99ojWO40AxwjGNBJkzL5r
         npiAxJgn3efby9jee7w1raof2a40zZa8ILVyohFBDzdRn/SvRZzcw6RuHj/hw6/SvxIz
         zi1d19QWwoes9f79UCi7gnhF+84kEDQAAtCsfFp4v8sdDn1bFcXC86G6mVmNo9kYwBcw
         mpQIkhowP7nVW2zNUtu/QcJAhOeUpCxL6/ivFEujHoAqdQ/5MBArln+VBvP7bpm2BVRa
         XIiAc1g/DADvH5/jQGCo57kbWNKgB8vWcxYS5wMVSQuhoqkIfdjlgr7HttJKGnAnwBJl
         nSRQ==
X-Gm-Message-State: AOAM533+krZ3DNyU5PDdfjE9KuqIcI/+/SQz13OvQ3FUbzo1zxQu/ole
	gQP1ITrPLSXmnxlwC9rOt73sLYBXAT9d4A==
X-Google-Smtp-Source: ABdhPJxRuVQeSDfAiG/LltyIc+3lBvO+NaZfz184BGIMCb83TYtGgD5pod7a5VhjAGN1VBg64AQyrQ==
X-Received: by 2002:a9d:bd6:: with SMTP id 80mr20974753oth.98.1615216280475;
        Mon, 08 Mar 2021 07:11:20 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id j35sm2575506ota.54.2021.03.08.07.11.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 07:11:19 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH] qemu: fix CVE-2021-20203
Date: Tue,  9 Mar 2021 00:11:08 +0900
Message-Id: <20210308151108.2082-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

net: vmxnet3: validate configuration values during activate

Upstream-Status: Acepted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07935.html]
CVE: CVE-2021-20203
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20203.patch            | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a6dc941624..a625809597 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://mmap2.patch \
            file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
+	   file://CVE-2021-20203.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch
new file mode 100644
index 0000000000..269c6f1294
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch
@@ -0,0 +1,73 @@
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
-- 
2.24.3 (Apple Git-128)


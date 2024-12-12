Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507F9E77182
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:11 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.20314.1734012488463102058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dgV8es1X;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216401de828so5835425ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012488; x=1734617288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkeZu1pnsopA7AvMUF6NVOe8rzGv7UbpLRnkQtqCWFg=;
        b=dgV8es1XqkeY+aAb09WpZqaCQz1wy9BtRzhHFCGjMCL53ef8oWpMt7IweiJZ3cz7Jd
         5xFuN8w1O3MuNxYSdb4fvNwYtbn1P0XYSUpjgLJb5sEpikw8llI7Qn1gtd7390HpGq2D
         vToANdij3YV48CfVEKTlNpkMpx+1gCLJ05bzVOAc/b0fJt9aLEiHDKDnA69BC0Jry3PH
         oTZ+Sse5nvtzrNcRqwWJuZzaTJbNtP2fwYuXtNPz4sI9vbhPDwyUPSs9Dau86EJmEtLL
         E3d1JH7oTP4QeAD/xbc+hFCUU+V0nv7x69W6paLOILQTyKiRJ2B2WO+chZzMo6Nsoqfz
         lALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012488; x=1734617288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkeZu1pnsopA7AvMUF6NVOe8rzGv7UbpLRnkQtqCWFg=;
        b=kA285fAo/rn97T/EqiiOcL6Dht7CJxnbIjS8Dhuco1i0hicLIxT5JgkCve/bABad+z
         F56wrr/OgIBnld7TzEMrnhBilu5lojTVE0oXQHcDs5G6awA9eizsIVeD0iEPWUP2B6Ys
         UJ94wmjIyQ7WZ1CwwWaLhSr9LAWNKYG+F7LEBKKciXgRgwP/C9CpLXc2RfoQbeaBH7gH
         iCFxG7V3XDLcIkb9KaaoECTB3RauOzZzyDmvkHIMqwBYzCQzCUkpYXU0r52NHsUv+gcY
         /8IetcZN+ierQzjZzR9LXEk7szA4HFjEhrYo+vKG1o5NC0Yh2d2lFyk9QMW9idTixDoS
         J+fg==
X-Gm-Message-State: AOJu0YxwuxP/CruWqgIYfV5LLVemQCj/HpeOAOi5Iv6ROGJ1wOLuPCY7
	gcgHQ/E3S84GGg+WGNZxN1xr7LQrDj7cuNyMRThmW9kcI/NVSVbopbOLRMoW4VVOwVH3iz0nT0z
	B
X-Gm-Gg: ASbGncsiw7CK1RrSYRbpDhLkh8UE2GHxU9i6qM8TWCVLVwIIJAHmWS0QirMt/Ytytko
	rd1Ovk5pAuiSOOTwc3AmgeotIBORWWgDDJlMkWP2JVigeu1e2n+58AM7rKOW7tPdp1H5/Qi62L5
	W/BHYjAUKEazik4X8W3E3SOdasnPLF23avQjtVuwBtcyJxlKn05zOoNfHTI3IzSA6xO42YIIHJ5
	wyoaZWQB3xLmUnl7PCS+nCOuLSO1OYTXoDOpxLPAV+paw==
X-Google-Smtp-Source: AGHT+IHhatBU7eAomKCGvldi9LQwYNbZ9lwSIcH89sBwzIxWZz2jidbJVWDWOyaQWKPsmZXiwaUeUA==
X-Received: by 2002:a17:903:987:b0:216:311e:b1ce with SMTP id d9443c01a7336-21778509e8fmr126678015ad.32.1734012487632;
        Thu, 12 Dec 2024 06:08:07 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 02/12] qemu: patch CVE-2024-6505
Date: Thu, 12 Dec 2024 06:07:48 -0800
Message-Id: <ded62bdb5ce9da62aaaa53ac20203bd87a7b1197.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208636

From: Peter Marko <peter.marko@siemens.com>

Backport patch [3] as linked from [1] via [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-6505
[2] https://bugzilla.redhat.com/show_bug.cgi?id=2295760
[3] https://gitlab.com/qemu-project/qemu/-/commit/f1595ceb

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-6505.patch             | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2786eedd42..73e1861b00 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://CVE-2024-6505.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch
new file mode 100644
index 0000000000..67382a2a8e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch
@@ -0,0 +1,40 @@
+From f1595ceb9aad36a6c1da95bcb77ab9509b38822d Mon Sep 17 00:00:00 2001
+From: Akihiko Odaki <akihiko.odaki@daynix.com>
+Date: Mon, 1 Jul 2024 20:58:04 +0900
+Subject: [PATCH] virtio-net: Ensure queue index fits with RSS
+
+Ensure the queue index points to a valid queue when software RSS
+enabled. The new calculation matches with the behavior of Linux's TAP
+device with the RSS eBPF program.
+
+Fixes: 4474e37a5b3a ("virtio-net: implement RX RSS processing")
+Reported-by: Zhibin Hu <huzhibin5@huawei.com>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+CVE: CVE-2024-6505
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/f1595ceb9aad36a6c1da95bcb77ab9509b38822d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ hw/net/virtio-net.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
+index 8f30972708..5635620a31 100644
+--- a/hw/net/virtio-net.c
++++ b/hw/net/virtio-net.c
+@@ -1949,7 +1949,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
+     if (!no_rss && n->rss_data.enabled && n->rss_data.enabled_software_rss) {
+         int index = virtio_net_process_rss(nc, buf, size);
+         if (index >= 0) {
+-            NetClientState *nc2 = qemu_get_subqueue(n->nic, index);
++            NetClientState *nc2 =
++                qemu_get_subqueue(n->nic, index % n->curr_queue_pairs);
+             return virtio_net_receive_rcu(nc2, buf, size, true);
+         }
+     }
+-- 
+2.30.2
+
-- 
2.34.1



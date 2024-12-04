Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D8CE77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:55 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.21206.1733334894000401887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vV8h8VBO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so57359a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334893; x=1733939693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8+L2IA34KDxtKm3m9EgGHnGWzjdXNl8DXPr4N3V2ok=;
        b=vV8h8VBOS4huFBEd3RwNH3JD3WHQkTL65lZUCsfNebna+FT1FQ7rBOMccp4JhPaTfI
         7U0NP8X/WNK+nfe1MUJO1aTXKi7Ex4wdWhWNvSetHvPW9GezKaG22SHe6y1PT/BCIQTR
         7YRz0/PXxVdVADSU0nqy3e07C3pzzkuApcS/XMKCNe0WCD7Tr5YbK/lDc6d9J903eQ1h
         s9GX7QwF199B3rOtUH9WX9as60CCMgVbPkGS9Baa6lk/YmuCwi9fR4ceosNrRheyhk1f
         rYh+RhO+0mSi6Xhs/JqPnA9MtdsFUFAhzY6eHSUl8a1Sa8bswKlEL9927TrupFIl2q/X
         gf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334893; x=1733939693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8+L2IA34KDxtKm3m9EgGHnGWzjdXNl8DXPr4N3V2ok=;
        b=OW9gAgi9EcKg6n/9U5XnCFkwXkmReKKuLuIuVPLBMFPG+7mIgUgtrL+65fHSq5KJfE
         a7udWhJsZvfcNGCGzqhCugmc+ePt6jNlYEjHy1aoF9EXOU+6/GxSG2Q86XxzoJmyHbFE
         4YLdGy19uvhzquvbZtJ4G5UYwKghcsXVWcxz7/S3i5o9cTn2xBIax1nz/7Jj/qo2y0+F
         pxx1YRI4rc5YEf+EnDES6JTJQFl6+vOfspEyq/zLajC8pQsJaRJe3VwfV3eMuv+6LQWW
         n4wuDHyPEUdtDw5NCPJCOXOKvFE3AEuNXbHr9kwlhmA5g/+74+FO6r4vuhLYPSULttHJ
         5jPQ==
X-Gm-Message-State: AOJu0YwOIlvER78bbAOzXQUa5kw4KEYcu3thjWmseFsygkcQxbZGYPYi
	HCk85Rn3izuZ0LS+Gx2uokz8ODN3w9QvIVvl5XkBHrupO3TVX7jqtye9hhNkunZ4RKjuMmSzmuX
	V
X-Gm-Gg: ASbGncstl8q2tz7dr3qBluw8Fk3V3A3LOuuj+jlPqLTSU8rZeB8cAr2/AzrxiVU/bS6
	Jnh71VFIfWHt8MqFniVuL0zwBugVXEyGNuYqMF1i4+6+e7BlJQPZiyIo/mEEs8kCBTHMKtHYxrB
	QUjH8o5zEJMIrSOoAwJb1cDOQ3g4nXzD8pqLIwMmYpLW9O4sCJ1LQjLhA6NGpCwdcbjol94qO6p
	F3HhldfZb/1+qKxZVflWOxSxo2qj1u6JzuV+Fo=
X-Google-Smtp-Source: AGHT+IGKhO5NHAk75gIEQUKWF4zsIP18yE/VUFnO46rjSGwH71X2JkJE416RSms2v+esoBxzfYlKIQ==
X-Received: by 2002:a05:6a20:43a7:b0:1e0:c56f:7db4 with SMTP id adf61e73a8af0-1e1653a270dmr11355595637.2.1733334893186;
        Wed, 04 Dec 2024 09:54:53 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/38] qemu: patch CVE-2024-6505
Date: Wed,  4 Dec 2024 09:53:49 -0800
Message-Id: <7e725e126689cc44055e27a05efafb7b52e89192.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208305

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
index cc78d7db06..a43785c79d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -120,6 +120,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-4467-0005.patch \
            file://CVE-2023-3019-0001.patch \
            file://CVE-2023-3019-0002.patch \
+           file://CVE-2024-6505.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch
new file mode 100644
index 0000000000..f9ee36f8ed
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
+@@ -1752,7 +1752,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
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



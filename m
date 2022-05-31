Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61197C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 22:08:21 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.64.1654034899354920454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 15:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24VM8CXg012183
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 15:08:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 31 May 2022 15:08:14 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 31 May 2022 15:08:14 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/4] qemu: fix CVE-2022-26353
Date: Tue, 31 May 2022 18:08:06 -0400
Message-ID: <20220531220807.8032-3-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220531220807.8032-1-sakib.sajal@windriver.com>
References: <20220531220807.8032-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 22:08:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166341

Backport fix to resolve CVE-2022-26353:
   abe300d9d8 virtio-net: fix map leaking on error during receive

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2022-26353.patch            | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-26353.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5605ece5bb..898377d11b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -80,6 +80,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3750_1.patch \
            file://CVE-2021-3750_2.patch \
            file://CVE-2021-3750_3.patch \
+           file://CVE-2022-26353.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-26353.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-26353.patch
new file mode 100644
index 0000000000..e76444b9fe
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-26353.patch
@@ -0,0 +1,44 @@
+From 2263354a272db3e520687af31675684c9c705456 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Tue, 8 Mar 2022 10:42:51 +0800
+Subject: [PATCH] virtio-net: fix map leaking on error during receive
+
+Commit bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
+tries to fix the use after free of the sg by caching the virtqueue
+elements in an array and unmap them at once after receiving the
+packets, But it forgot to unmap the cached elements on error which
+will lead to leaking of mapping and other unexpected results.
+
+Fixing this by detaching the cached elements on error. This addresses
+CVE-2022-26353.
+
+Reported-by: Victor Tom <vv474172261@gmail.com>
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2022-26353
+Fixes: bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+CVE: CVE-2022-26353
+Upstream-Status: Backport [abe300d9d894f7138e1af7c8e9c88c04bfe98b37]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/virtio-net.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
+index df1d30e2c..a351d16b5 100644
+--- a/hw/net/virtio-net.c
++++ b/hw/net/virtio-net.c
+@@ -1795,6 +1795,7 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
+ 
+ err:
+     for (j = 0; j < i; j++) {
++        virtqueue_detach_element(q->rx_vq, elems[j], lens[j]);
+         g_free(elems[j]);
+     }
+ 
+-- 
+2.33.0
+
-- 
2.33.0



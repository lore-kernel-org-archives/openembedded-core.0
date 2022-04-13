Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63879C4167E
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.2608.1649824711120872277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 21:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23D4cTX4012049
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 21:38:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 23D4cNtI028541
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 21:38:29 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Apr 2022 21:38:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 21:38:27 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 12 Apr 2022 21:38:27 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 2/2] qemu: fix CVE-2022-26354
Date: Wed, 13 Apr 2022 00:38:15 -0400
Message-ID: <20220413043815.17771-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220413043815.17771-1-sakib.sajal@windriver.com>
References: <20220413043815.17771-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164299

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2022-26354.patch            | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-26354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index aa372810ce..934e5ee932 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -77,6 +77,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-20196_2.patch \
            file://CVE-2021-4145_1.patch \
            file://CVE-2021-4145_2.patch \
+           file://CVE-2022-26354.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-26354.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-26354.patch
new file mode 100644
index 0000000000..ae8c490177
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-26354.patch
@@ -0,0 +1,59 @@
+From 1c53fa2c574ebacf8bb20c73e35ae4b96dcf0476 Mon Sep 17 00:00:00 2001
+From: Stefano Garzarella <sgarzare@redhat.com>
+Date: Mon, 28 Feb 2022 10:50:58 +0100
+Subject: [PATCH 3/3] vhost-vsock: detach the virqueue element in case of error
+
+In vhost_vsock_common_send_transport_reset(), if an element popped from
+the virtqueue is invalid, we should call virtqueue_detach_element() to
+detach it from the virtqueue before freeing its memory.
+
+Fixes: fc0b9b0e1c ("vhost-vsock: add virtio sockets device")
+Fixes: CVE-2022-26354
+Cc: qemu-stable@nongnu.org
+Reported-by: VictorV <vv474172261@gmail.com>
+Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
+Message-Id: <20220228095058.27899-1-sgarzare@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+Upstream-Status: Backport [8d1b247f3748ac4078524130c6d7ae42b6140aaf]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/virtio/vhost-vsock-common.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
+index 5b2ebf349..45ea58c3a 100644
+--- a/hw/virtio/vhost-vsock-common.c
++++ b/hw/virtio/vhost-vsock-common.c
+@@ -129,19 +129,23 @@ static void vhost_vsock_common_send_transport_reset(VHostVSockCommon *vvc)
+     if (elem->out_num) {
+         error_report("invalid vhost-vsock event virtqueue element with "
+                      "out buffers");
+-        goto out;
++        goto err;
+     }
+ 
+     if (iov_from_buf(elem->in_sg, elem->in_num, 0,
+                      &event, sizeof(event)) != sizeof(event)) {
+         error_report("vhost-vsock event virtqueue element is too short");
+-        goto out;
++        goto err;
+     }
+ 
+     virtqueue_push(vq, elem, sizeof(event));
+     virtio_notify(VIRTIO_DEVICE(vvc), vq);
+ 
+-out:
++    g_free(elem);
++    return;
++
++err:
++    virtqueue_detach_element(vq, elem, 0);
+     g_free(elem);
+ }
+ 
+-- 
+2.33.0
+
-- 
2.33.0



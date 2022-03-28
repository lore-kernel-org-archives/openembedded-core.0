Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D40C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 10:46:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9377.1648464402015510935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 03:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F16BD6E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 03:46:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E67E83F66F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 03:46:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: backport fixes for CVE-2022-26353 and CVE-2022-26354
Date: Mon, 28 Mar 2022 11:46:39 +0100
Message-Id: <20220328104639.1252865-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 10:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163704

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 ...ch-the-virqueue-element-in-case-of-e.patch | 60 +++++++++++++++++++
 ...-map-leaking-on-error-during-receive.patch | 43 +++++++++++++
 3 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-vhost-vsock-deta=
ch-the-virqueue-element-in-case-of-e.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-virtio-net-fix-m=
ap-leaking-on-error-during-receive.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index e9d2dae0405..9f2fa4322e9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,6 +30,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0001-acpi-tpm-Add-missing-device-identification-object=
s.patch \
            file://0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-defin=
iti.patch \
            file://0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
+           file://0001-vhost-vsock-detach-the-virqueue-element-in-case-o=
f-e.patch \
+           file://0002-virtio-net-fix-map-leaking-on-error-during-receiv=
e.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0001-vhost-vsock-detach-the-=
virqueue-element-in-case-of-e.patch b/meta/recipes-devtools/qemu/qemu/000=
1-vhost-vsock-detach-the-virqueue-element-in-case-of-e.patch
new file mode 100644
index 00000000000..dcea9040c75
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-vhost-vsock-detach-the-virqueu=
e-element-in-case-of-e.patch
@@ -0,0 +1,60 @@
+CVE: CVE-2022-26354
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 0190d651a73463dc2b8f170b29326d1f38140a04 Mon Sep 17 00:00:00 2001
+From: Stefano Garzarella <sgarzare@redhat.com>
+Date: Mon, 28 Feb 2022 10:50:58 +0100
+Subject: [PATCH 1/2] vhost-vsock: detach the virqueue element in case of=
 error
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
+---
+ hw/virtio/vhost-vsock-common.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-comm=
on.c
+index 3f3771274e..ed706681ac 100644
+--- a/hw/virtio/vhost-vsock-common.c
++++ b/hw/virtio/vhost-vsock-common.c
+@@ -153,19 +153,23 @@ static void vhost_vsock_common_send_transport_rese=
t(VHostVSockCommon *vvc)
+     if (elem->out_num) {
+         error_report("invalid vhost-vsock event virtqueue element with =
"
+                      "out buffers");
+-        goto out;
++        goto err;
+     }
+=20
+     if (iov_from_buf(elem->in_sg, elem->in_num, 0,
+                      &event, sizeof(event)) !=3D sizeof(event)) {
+         error_report("vhost-vsock event virtqueue element is too short"=
);
+-        goto out;
++        goto err;
+     }
+=20
+     virtqueue_push(vq, elem, sizeof(event));
+     virtio_notify(VIRTIO_DEVICE(vvc), vq);
+=20
+-out:
++    g_free(elem);
++    return;
++
++err:
++    virtqueue_detach_element(vq, elem, 0);
+     g_free(elem);
+ }
+=20
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-virtio-net-fix-map-leak=
ing-on-error-during-receive.patch b/meta/recipes-devtools/qemu/qemu/0002-=
virtio-net-fix-map-leaking-on-error-during-receive.patch
new file mode 100644
index 00000000000..59ccfdd03cc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-virtio-net-fix-map-leaking-on-=
error-during-receive.patch
@@ -0,0 +1,43 @@
+CVE: CVE-2022-26353
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 4d65ecbddd16f38a8cf23b3053ca5c3594f8d4a4 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Tue, 8 Mar 2022 10:42:51 +0800
+Subject: [PATCH 2/2] virtio-net: fix map leaking on error during receive
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
+---
+ hw/net/virtio-net.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
+index f2014d5ea0..e1f4748831 100644
+--- a/hw/net/virtio-net.c
++++ b/hw/net/virtio-net.c
+@@ -1862,6 +1862,7 @@ static ssize_t virtio_net_receive_rcu(NetClientSta=
te *nc, const uint8_t *buf,
+=20
+ err:
+     for (j =3D 0; j < i; j++) {
++        virtqueue_detach_element(q->rx_vq, elems[j], lens[j]);
+         g_free(elems[j]);
+     }
+=20
+--=20
+2.25.1
+
--=20
2.25.1



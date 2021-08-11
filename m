Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.2999.1628651335742251730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 20:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17B38s7H025699
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 20:08:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17B38sJ7012243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 20:08:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 20:08:53 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 20:08:53 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 1/5] qemu: fix CVE-2021-3527
Date: Tue, 10 Aug 2021 23:08:44 -0400
Message-ID: <20210811030848.11076-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id 17B38s7H025699
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2021-3527_1.patch           | 57 +++++++++++++++++++
 .../qemu/qemu/CVE-2021-3527_2.patch           | 40 +++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 3921546df7..8b77da7ebf 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -57,6 +57,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2020-27821.patch \
            file://CVE-2021-20263.patch \
            file://CVE-2021-3392.patch \
+           file://CVE-2021-3527_1.patch \
+           file://CVE-2021-3527_2.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3527_1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3527_1.patch
new file mode 100644
index 0000000000..0e116b5e70
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3527_1.patch
@@ -0,0 +1,57 @@
+From 7ec54f9eb62b5d177e30eb8b1cad795a5f8d8986 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 3 May 2021 15:29:12 +0200
+Subject: [PATCH] usb/redir: avoid dynamic stack allocation (CVE-2021-352=
7)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Use autofree heap allocation instead.
+
+Fixes: 4f4321c11ff ("usb: use iovecs in USBPacket")
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Message-Id: <20210503132915.2335822-3-kraxel@redhat.com>
+
+CVE: CVE-2021-3527
+Upstream-Status: Backport [7ec54f9eb62b5d177e30eb8b1cad795a5f8d8986]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/usb/redirect.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
+index 17f06f3417..6a75b0dc4a 100644
+--- a/hw/usb/redirect.c
++++ b/hw/usb/redirect.c
+@@ -620,7 +620,7 @@ static void usbredir_handle_iso_data(USBRedirDevice =
*dev, USBPacket *p,
+                 .endpoint =3D ep,
+                 .length =3D p->iov.size
+             };
+-            uint8_t buf[p->iov.size];
++            g_autofree uint8_t *buf =3D g_malloc(p->iov.size);
+             /* No id, we look at the ep when receiving a status back */
+             usb_packet_copy(p, buf, p->iov.size);
+             usbredirparser_send_iso_packet(dev->parser, 0, &iso_packet,
+@@ -818,7 +818,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice=
 *dev, USBPacket *p,
+         usbredirparser_send_bulk_packet(dev->parser, p->id,
+                                         &bulk_packet, NULL, 0);
+     } else {
+-        uint8_t buf[size];
++        g_autofree uint8_t *buf =3D g_malloc(size);
+         usb_packet_copy(p, buf, size);
+         usbredir_log_data(dev, "bulk data out:", buf, size);
+         usbredirparser_send_bulk_packet(dev->parser, p->id,
+@@ -923,7 +923,7 @@ static void usbredir_handle_interrupt_out_data(USBRe=
dirDevice *dev,
+                                                USBPacket *p, uint8_t ep=
)
+ {
+     struct usb_redir_interrupt_packet_header interrupt_packet;
+-    uint8_t buf[p->iov.size];
++    g_autofree uint8_t *buf =3D g_malloc(p->iov.size);
+=20
+     DPRINTF("interrupt-out ep %02X len %zd id %"PRIu64"\n", ep,
+             p->iov.size, p->id);
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3527_2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3527_2.patch
new file mode 100644
index 0000000000..d9ced3a8c7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3527_2.patch
@@ -0,0 +1,40 @@
+From 05a40b172e4d691371534828078be47e7fff524c Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 3 May 2021 15:29:15 +0200
+Subject: [PATCH] usb: limit combined packets to 1 MiB (CVE-2021-3527)
+
+usb-host and usb-redirect try to batch bulk transfers by combining many
+small usb packets into a single, large transfer request, to reduce the
+overhead and improve performance.
+
+This patch adds a size limit of 1 MiB for those combined packets to
+restrict the host resources the guest can bind that way.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Message-Id: <20210503132915.2335822-6-kraxel@redhat.com>
+
+CVE: CVE-2021-3527
+Upstream-Status: Backport [05a40b172e4d691371534828078be47e7fff524c]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/usb/combined-packet.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/hw/usb/combined-packet.c b/hw/usb/combined-packet.c
+index 5d57e883dc..e56802f89a 100644
+--- a/hw/usb/combined-packet.c
++++ b/hw/usb/combined-packet.c
+@@ -171,7 +171,9 @@ void usb_ep_combine_input_packets(USBEndpoint *ep)
+         if ((p->iov.size % ep->max_packet_size) !=3D 0 || !p->short_not=
_ok ||
+                 next =3D=3D NULL ||
+                 /* Work around for Linux usbfs bulk splitting + migrati=
on */
+-                (totalsize =3D=3D (16 * KiB - 36) && p->int_req)) {
++                (totalsize =3D=3D (16 * KiB - 36) && p->int_req) ||
++                /* Next package may grow combined package over 1MiB */
++                totalsize > 1 * MiB - ep->max_packet_size) {
+             usb_device_handle_data(ep->dev, first);
+             assert(first->status =3D=3D USB_RET_ASYNC);
+             if (first->combined) {
+--=20
+2.25.1
+
--=20
2.32.0


Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.5557.1619154715771277122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 22:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13N5BtoW024589
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 22:11:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 22:11:54 -0700
Received: from localhost.localdomain (128.224.72.54) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 22:11:54 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 5/6] qemu: fix CVE-2021-3416
Date: Fri, 23 Apr 2021 01:11:39 -0400
Message-ID: <20210423051140.106348-5-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423051140.106348-1-sakib.sajal@windriver.com>
References: <20210423051140.106348-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 13N5BtoW024589
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  10 +
 .../qemu/qemu/CVE-2021-3416_1.patch           | 177 ++++++++++++++++++
 .../qemu/qemu/CVE-2021-3416_10.patch          |  44 +++++
 .../qemu/qemu/CVE-2021-3416_2.patch           |  42 +++++
 .../qemu/qemu/CVE-2021-3416_3.patch           |  43 +++++
 .../qemu/qemu/CVE-2021-3416_4.patch           |  43 +++++
 .../qemu/qemu/CVE-2021-3416_5.patch           |  45 +++++
 .../qemu/qemu/CVE-2021-3416_6.patch           |  43 +++++
 .../qemu/qemu/CVE-2021-3416_7.patch           |  45 +++++
 .../qemu/qemu/CVE-2021-3416_8.patch           |  44 +++++
 .../qemu/qemu/CVE-2021-3416_9.patch           |  46 +++++
 11 files changed, 582 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patc=
h
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 13bf6373be..f41bda4f16 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,16 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
            file://CVE-2021-3409_4.patch \
            file://CVE-2021-3409_5.patch \
            file://CVE-2021-3409_6.patch \
+           file://CVE-2021-3416_1.patch \
+           file://CVE-2021-3416_2.patch \
+           file://CVE-2021-3416_3.patch \
+           file://CVE-2021-3416_4.patch \
+           file://CVE-2021-3416_5.patch \
+           file://CVE-2021-3416_6.patch \
+           file://CVE-2021-3416_7.patch \
+           file://CVE-2021-3416_8.patch \
+           file://CVE-2021-3416_9.patch \
+           file://CVE-2021-3416_10.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch
new file mode 100644
index 0000000000..5bacd67481
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch
@@ -0,0 +1,177 @@
+From 4b1988a29d67277d6c8ce1df52975f5616592913 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 11:44:36 +0800
+Subject: [PATCH 01/10] net: introduce qemu_receive_packet()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Some NIC supports loopback mode and this is done by calling
+nc->info->receive() directly which in fact suppresses the effort of
+reentrancy check that is done in qemu_net_queue_send().
+
+Unfortunately we can't use qemu_net_queue_send() here since for
+loopback there's no sender as peer, so this patch introduce a
+qemu_receive_packet() which is used for implementing loopback mode
+for a NIC with this check.
+
+NIC that supports loopback mode will be converted to this helper.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [705df5466c98f3efdd2b68d3b31dad86858acad7]
+CVE: CVE-2021-3416
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ include/net/net.h   |  5 +++++
+ include/net/queue.h |  8 ++++++++
+ net/net.c           | 38 +++++++++++++++++++++++++++++++-------
+ net/queue.c         | 22 ++++++++++++++++++++++
+ 4 files changed, 66 insertions(+), 7 deletions(-)
+
+diff --git a/include/net/net.h b/include/net/net.h
+index 778fc787c..03f058ecb 100644
+--- a/include/net/net.h
++++ b/include/net/net.h
+@@ -143,12 +143,17 @@ void *qemu_get_nic_opaque(NetClientState *nc);
+ void qemu_del_net_client(NetClientState *nc);
+ typedef void (*qemu_nic_foreach)(NICState *nic, void *opaque);
+ void qemu_foreach_nic(qemu_nic_foreach func, void *opaque);
++int qemu_can_receive_packet(NetClientState *nc);
+ int qemu_can_send_packet(NetClientState *nc);
+ ssize_t qemu_sendv_packet(NetClientState *nc, const struct iovec *iov,
+                           int iovcnt);
+ ssize_t qemu_sendv_packet_async(NetClientState *nc, const struct iovec =
*iov,
+                                 int iovcnt, NetPacketSent *sent_cb);
+ ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int si=
ze);
++ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int=
 size);
++ssize_t qemu_receive_packet_iov(NetClientState *nc,
++                                const struct iovec *iov,
++                                int iovcnt);
+ ssize_t qemu_send_packet_raw(NetClientState *nc, const uint8_t *buf, in=
t size);
+ ssize_t qemu_send_packet_async(NetClientState *nc, const uint8_t *buf,
+                                int size, NetPacketSent *sent_cb);
+diff --git a/include/net/queue.h b/include/net/queue.h
+index c0269bb1d..9f2f289d7 100644
+--- a/include/net/queue.h
++++ b/include/net/queue.h
+@@ -55,6 +55,14 @@ void qemu_net_queue_append_iov(NetQueue *queue,
+=20
+ void qemu_del_net_queue(NetQueue *queue);
+=20
++ssize_t qemu_net_queue_receive(NetQueue *queue,
++                               const uint8_t *data,
++                               size_t size);
++
++ssize_t qemu_net_queue_receive_iov(NetQueue *queue,
++                                   const struct iovec *iov,
++                                   int iovcnt);
++
+ ssize_t qemu_net_queue_send(NetQueue *queue,
+                             NetClientState *sender,
+                             unsigned flags,
+diff --git a/net/net.c b/net/net.c
+index 6a2c3d956..5e15e5d27 100644
+--- a/net/net.c
++++ b/net/net.c
+@@ -528,6 +528,17 @@ int qemu_set_vnet_be(NetClientState *nc, bool is_be=
)
+ #endif
+ }
+=20
++int qemu_can_receive_packet(NetClientState *nc)
++{
++    if (nc->receive_disabled) {
++        return 0;
++    } else if (nc->info->can_receive &&
++               !nc->info->can_receive(nc)) {
++        return 0;
++    }
++    return 1;
++}
++
+ int qemu_can_send_packet(NetClientState *sender)
+ {
+     int vm_running =3D runstate_is_running();
+@@ -540,13 +551,7 @@ int qemu_can_send_packet(NetClientState *sender)
+         return 1;
+     }
+=20
+-    if (sender->peer->receive_disabled) {
+-        return 0;
+-    } else if (sender->peer->info->can_receive &&
+-               !sender->peer->info->can_receive(sender->peer)) {
+-        return 0;
+-    }
+-    return 1;
++    return qemu_can_receive_packet(sender->peer);
+ }
+=20
+ static ssize_t filter_receive_iov(NetClientState *nc,
+@@ -679,6 +684,25 @@ ssize_t qemu_send_packet(NetClientState *nc, const =
uint8_t *buf, int size)
+     return qemu_send_packet_async(nc, buf, size, NULL);
+ }
+=20
++ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int=
 size)
++{
++    if (!qemu_can_receive_packet(nc)) {
++        return 0;
++    }
++
++    return qemu_net_queue_receive(nc->incoming_queue, buf, size);
++}
++
++ssize_t qemu_receive_packet_iov(NetClientState *nc, const struct iovec =
*iov,
++                                int iovcnt)
++{
++    if (!qemu_can_receive_packet(nc)) {
++        return 0;
++    }
++
++    return qemu_net_queue_receive_iov(nc->incoming_queue, iov, iovcnt);
++}
++
+ ssize_t qemu_send_packet_raw(NetClientState *nc, const uint8_t *buf, in=
t size)
+ {
+     return qemu_send_packet_async_with_flags(nc, QEMU_NET_PACKET_FLAG_R=
AW,
+diff --git a/net/queue.c b/net/queue.c
+index 19e32c80f..c872d51df 100644
+--- a/net/queue.c
++++ b/net/queue.c
+@@ -182,6 +182,28 @@ static ssize_t qemu_net_queue_deliver_iov(NetQueue =
*queue,
+     return ret;
+ }
+=20
++ssize_t qemu_net_queue_receive(NetQueue *queue,
++                               const uint8_t *data,
++                               size_t size)
++{
++    if (queue->delivering) {
++        return 0;
++    }
++
++    return qemu_net_queue_deliver(queue, NULL, 0, data, size);
++}
++
++ssize_t qemu_net_queue_receive_iov(NetQueue *queue,
++                                   const struct iovec *iov,
++                                   int iovcnt)
++{
++    if (queue->delivering) {
++        return 0;
++    }
++
++    return qemu_net_queue_deliver_iov(queue, NULL, 0, iov, iovcnt);
++}
++
+ ssize_t qemu_net_queue_send(NetQueue *queue,
+                             NetClientState *sender,
+                             unsigned flags,
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch
new file mode 100644
index 0000000000..7deec1a347
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch
@@ -0,0 +1,44 @@
+From 65b851efd3d0280425c202f4e5880c48f8334dae Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Mon, 1 Mar 2021 14:35:30 -0500
+Subject: [PATCH 10/10] lan9118: switch to use qemu_receive_packet() for
+ loopback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
+Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [37cee01784ff0df13e5209517e1b3594a5e792d1]
+CVE: CVE-2021-3416
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/lan9118.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
+index ab57c02c8..75f18ae2d 100644
+--- a/hw/net/lan9118.c
++++ b/hw/net/lan9118.c
+@@ -669,7 +669,7 @@ static void do_tx_packet(lan9118_state *s)
+     /* FIXME: Honor TX disable, and allow queueing of packets.  */
+     if (s->phy_control & 0x4000)  {
+         /* This assumes the receive routine doesn't touch the VLANClien=
t.  */
+-        lan9118_receive(qemu_get_queue(s->nic), s->txp->data, s->txp->l=
en);
++        qemu_receive_packet(qemu_get_queue(s->nic), s->txp->data, s->tx=
p->len);
+     } else {
+         qemu_send_packet(qemu_get_queue(s->nic), s->txp->data, s->txp->=
len);
+     }
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
new file mode 100644
index 0000000000..5e53e20bac
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
@@ -0,0 +1,42 @@
+From e2a48a3c7cc33dbbe89f896e0f07462cb04ff6b5 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 12:13:22 +0800
+Subject: [PATCH 02/10] e1000: switch to use qemu_receive_packet() for lo=
opback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [1caff0340f49c93d535c6558a5138d20d475315c]
+CVE: CVE-2021-3416
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/e1000.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/net/e1000.c b/hw/net/e1000.c
+index d7d05ae30..cf22c4f07 100644
+--- a/hw/net/e1000.c
++++ b/hw/net/e1000.c
+@@ -546,7 +546,7 @@ e1000_send_packet(E1000State *s, const uint8_t *buf,=
 int size)
+=20
+     NetClientState *nc =3D qemu_get_queue(s->nic);
+     if (s->phy_reg[PHY_CTRL] & MII_CR_LOOPBACK) {
+-        nc->info->receive(nc, buf, size);
++        qemu_receive_packet(nc, buf, size);
+     } else {
+         qemu_send_packet(nc, buf, size);
+     }
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch
new file mode 100644
index 0000000000..3fc469e3e3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch
@@ -0,0 +1,43 @@
+From c041a4da1ff119715e0ccf2d4a7af62568f17b93 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 12:57:40 +0800
+Subject: [PATCH 03/10] dp8393x: switch to use qemu_receive_packet() for
+ loopback packet
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [331d2ac9ea307c990dc86e6493e8f0c48d14bb33]
+CVE: CVE-2021-3416
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/dp8393x.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
+index 205c0decc..533a8304d 100644
+--- a/hw/net/dp8393x.c
++++ b/hw/net/dp8393x.c
+@@ -506,7 +506,7 @@ static void dp8393x_do_transmit_packets(dp8393xState=
 *s)
+             s->regs[SONIC_TCR] |=3D SONIC_TCR_CRSL;
+             if (nc->info->can_receive(nc)) {
+                 s->loopback_packet =3D 1;
+-                nc->info->receive(nc, s->tx_buffer, tx_len);
++                qemu_receive_packet(nc, s->tx_buffer, tx_len);
+             }
+         } else {
+             /* Transmit packet */
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch
new file mode 100644
index 0000000000..e14f37735d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch
@@ -0,0 +1,43 @@
+From 9ac5345344b75995bc96d171eaa5dc8d26bf0e21 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 13:00:01 +0800
+Subject: [PATCH 04/10] msf2-mac: switch to use qemu_receive_packet() for
+ loopback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [26194a58f4eb83c5bdf4061a1628508084450ba1]
+CVE: CVE-2021-3416
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/msf2-emac.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
+index 32ba9e841..3e6206044 100644
+--- a/hw/net/msf2-emac.c
++++ b/hw/net/msf2-emac.c
+@@ -158,7 +158,7 @@ static void msf2_dma_tx(MSF2EmacState *s)
+          * R_CFG1 bit 0 is set.
+          */
+         if (s->regs[R_CFG1] & R_CFG1_LB_EN_MASK) {
+-            nc->info->receive(nc, buf, size);
++            qemu_receive_packet(nc, buf, size);
+         } else {
+             qemu_send_packet(nc, buf, size);
+         }
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch
new file mode 100644
index 0000000000..c3f8f97592
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch
@@ -0,0 +1,45 @@
+From d465dc79c9ee729d91ef086b993e956b1935be69 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 13:14:35 +0800
+Subject: [PATCH 05/10] sungem: switch to use qemu_receive_packet() for
+ loopback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [8c92060d3c0248bd4d515719a35922cd2391b9b4]
+CVE: CVE-2021-3416
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/sungem.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/net/sungem.c b/hw/net/sungem.c
+index 33c3722df..3684a4d73 100644
+--- a/hw/net/sungem.c
++++ b/hw/net/sungem.c
+@@ -306,7 +306,7 @@ static void sungem_send_packet(SunGEMState *s, const=
 uint8_t *buf,
+     NetClientState *nc =3D qemu_get_queue(s->nic);
+=20
+     if (s->macregs[MAC_XIFCFG >> 2] & MAC_XIFCFG_LBCK) {
+-        nc->info->receive(nc, buf, size);
++        qemu_receive_packet(nc, buf, size);
+     } else {
+         qemu_send_packet(nc, buf, size);
+     }
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
new file mode 100644
index 0000000000..855c6970f4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
@@ -0,0 +1,43 @@
+From c0010f9b2bafe866fe32e3c2688454bc24147136 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 13:27:52 +0800
+Subject: [PATCH 06/10] tx_pkt: switch to use qemu_receive_packet_iov() f=
or
+ loopback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_receive_iov() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [8c552542b81e56ff532dd27ec6e5328954bdda73]
+CVE: CVE-2021-3416
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/net_tx_pkt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
+index da262edc3..1f9aa59ec 100644
+--- a/hw/net/net_tx_pkt.c
++++ b/hw/net/net_tx_pkt.c
+@@ -553,7 +553,7 @@ static inline void net_tx_pkt_sendv(struct NetTxPkt =
*pkt,
+     NetClientState *nc, const struct iovec *iov, int iov_cnt)
+ {
+     if (pkt->is_loopback) {
+-        nc->info->receive_iov(nc, iov, iov_cnt);
++        qemu_receive_packet_iov(nc, iov, iov_cnt);
+     } else {
+         qemu_sendv_packet(nc, iov, iov_cnt);
+     }
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch
new file mode 100644
index 0000000000..4e1115de02
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch
@@ -0,0 +1,45 @@
+From 64b38675c728354e4015e4bec3d975cd4cb8a981 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Fri, 26 Feb 2021 13:47:53 -0500
+Subject: [PATCH 07/10] rtl8139: switch to use qemu_receive_packet() for
+ loopback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Buglink: https://bugs.launchpad.net/qemu/+bug/1910826
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
+Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [5311fb805a4403bba024e83886fa0e7572265de4]
+CVE: CVE-2021-3416
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/rtl8139.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
+index ba5ace1ab..d2dd03e6a 100644
+--- a/hw/net/rtl8139.c
++++ b/hw/net/rtl8139.c
+@@ -1795,7 +1795,7 @@ static void rtl8139_transfer_frame(RTL8139State *s=
, uint8_t *buf, int size,
+         }
+=20
+         DPRINTF("+++ transmit loopback mode\n");
+-        rtl8139_do_receive(qemu_get_queue(s->nic), buf, size, do_interr=
upt);
++        qemu_receive_packet(qemu_get_queue(s->nic), buf, size);
+=20
+         if (iov) {
+             g_free(buf2);
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
new file mode 100644
index 0000000000..ed716468dc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
@@ -0,0 +1,44 @@
+From 023ce62f0a788ad3a8233c7a828554bceeafd031 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Mon, 1 Mar 2021 10:33:34 -0500
+Subject: [PATCH 08/10] pcnet: switch to use qemu_receive_packet() for lo=
opback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Buglink: https://bugs.launchpad.net/qemu/+bug/1917085
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
+Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [99ccfaa1edafd79f7a3a0ff7b58ae4da7c514928]
+CVE: CVE-2021-3416
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/pcnet.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
+index f3f18d859..dcd3fc494 100644
+--- a/hw/net/pcnet.c
++++ b/hw/net/pcnet.c
+@@ -1250,7 +1250,7 @@ txagain:
+             if (BCR_SWSTYLE(s) =3D=3D 1)
+                 add_crc =3D !GET_FIELD(tmd.status, TMDS, NOFCS);
+             s->looptest =3D add_crc ? PCNET_LOOPTEST_CRC : PCNET_LOOPTE=
ST_NOCRC;
+-            pcnet_receive(qemu_get_queue(s->nic), s->buffer, s->xmit_po=
s);
++            qemu_receive_packet(qemu_get_queue(s->nic), s->buffer, s->x=
mit_pos);
+             s->looptest =3D 0;
+         } else {
+             if (s->nic) {
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch
new file mode 100644
index 0000000000..39d32b33a4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch
@@ -0,0 +1,46 @@
+From ecf7e62bb2cb02c9bd40082504ae376f3e19ffd2 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Mon, 1 Mar 2021 14:33:43 -0500
+Subject: [PATCH 09/10] cadence_gem: switch to use qemu_receive_packet() =
for
+ loopback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [e73adfbeec9d4e008630c814759052ed945c3fed]
+CVE: CVE-2021-3416
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/cadence_gem.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
+index 7a534691f..43b760e3f 100644
+--- a/hw/net/cadence_gem.c
++++ b/hw/net/cadence_gem.c
+@@ -1275,8 +1275,8 @@ static void gem_transmit(CadenceGEMState *s)
+                 /* Send the packet somewhere */
+                 if (s->phy_loop || (s->regs[GEM_NWCTRL] &
+                                     GEM_NWCTRL_LOCALLOOP)) {
+-                    gem_receive(qemu_get_queue(s->nic), s->tx_packet,
+-                                total_bytes);
++                    qemu_receive_packet(qemu_get_queue(s->nic), s->tx_p=
acket,
++                                        total_bytes);
+                 } else {
+                     qemu_send_packet(qemu_get_queue(s->nic), s->tx_pack=
et,
+                                      total_bytes);
+--=20
+2.29.2
+
--=20
2.25.1


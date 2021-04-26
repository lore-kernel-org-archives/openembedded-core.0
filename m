Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.917.1619398513291207353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: QznVztE3QIzxuJnJAfL5i4WO/fZ5tzomTC5Xhe16rcjVU1N2xPKBJuXqbOK50idtjyZWYDg2XS
 OWzrS+BGVguw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="257568914"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257568914"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:21 -0700
IronPort-SDR: Ul+Ibx/JE/SVwrIkf3mKuEc1ff1NtqkAEyNLuMr55SkQcluK47ZBuT/3C4XdKJDwMpa9+5/izf
 oDAoX53eovzw==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067614"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 62/64] qemu: fix CVE-2021-3416
Date: Mon, 26 Apr 2021 08:53:33 +0800
Message-Id: <7a3ce8a79a6c682e1b38f757eb68534e0ce5589d.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e2b5bc11d1b26b73b62e1a63cb75572793282dcb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0ac33f87fc..177e453fff 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,16 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
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
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch
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
+Content-Type: text/plain; charset=UTF-8
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
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
+ ssize_t qemu_sendv_packet_async(NetClientState *nc, const struct iovec *iov,
+                                 int iovcnt, NetPacketSent *sent_cb);
+ ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size);
++ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int size);
++ssize_t qemu_receive_packet_iov(NetClientState *nc,
++                                const struct iovec *iov,
++                                int iovcnt);
+ ssize_t qemu_send_packet_raw(NetClientState *nc, const uint8_t *buf, int size);
+ ssize_t qemu_send_packet_async(NetClientState *nc, const uint8_t *buf,
+                                int size, NetPacketSent *sent_cb);
+diff --git a/include/net/queue.h b/include/net/queue.h
+index c0269bb1d..9f2f289d7 100644
+--- a/include/net/queue.h
++++ b/include/net/queue.h
+@@ -55,6 +55,14 @@ void qemu_net_queue_append_iov(NetQueue *queue,
+ 
+ void qemu_del_net_queue(NetQueue *queue);
+ 
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
+@@ -528,6 +528,17 @@ int qemu_set_vnet_be(NetClientState *nc, bool is_be)
+ #endif
+ }
+ 
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
+     int vm_running = runstate_is_running();
+@@ -540,13 +551,7 @@ int qemu_can_send_packet(NetClientState *sender)
+         return 1;
+     }
+ 
+-    if (sender->peer->receive_disabled) {
+-        return 0;
+-    } else if (sender->peer->info->can_receive &&
+-               !sender->peer->info->can_receive(sender->peer)) {
+-        return 0;
+-    }
+-    return 1;
++    return qemu_can_receive_packet(sender->peer);
+ }
+ 
+ static ssize_t filter_receive_iov(NetClientState *nc,
+@@ -679,6 +684,25 @@ ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size)
+     return qemu_send_packet_async(nc, buf, size, NULL);
+ }
+ 
++ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int size)
++{
++    if (!qemu_can_receive_packet(nc)) {
++        return 0;
++    }
++
++    return qemu_net_queue_receive(nc->incoming_queue, buf, size);
++}
++
++ssize_t qemu_receive_packet_iov(NetClientState *nc, const struct iovec *iov,
++                                int iovcnt)
++{
++    if (!qemu_can_receive_packet(nc)) {
++        return 0;
++    }
++
++    return qemu_net_queue_receive_iov(nc->incoming_queue, iov, iovcnt);
++}
++
+ ssize_t qemu_send_packet_raw(NetClientState *nc, const uint8_t *buf, int size)
+ {
+     return qemu_send_packet_async_with_flags(nc, QEMU_NET_PACKET_FLAG_RAW,
+diff --git a/net/queue.c b/net/queue.c
+index 19e32c80f..c872d51df 100644
+--- a/net/queue.c
++++ b/net/queue.c
+@@ -182,6 +182,28 @@ static ssize_t qemu_net_queue_deliver_iov(NetQueue *queue,
+     return ret;
+ }
+ 
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
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch
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
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
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
+         /* This assumes the receive routine doesn't touch the VLANClient.  */
+-        lan9118_receive(qemu_get_queue(s->nic), s->txp->data, s->txp->len);
++        qemu_receive_packet(qemu_get_queue(s->nic), s->txp->data, s->txp->len);
+     } else {
+         qemu_send_packet(qemu_get_queue(s->nic), s->txp->data, s->txp->len);
+     }
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
new file mode 100644
index 0000000000..5e53e20bac
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
@@ -0,0 +1,42 @@
+From e2a48a3c7cc33dbbe89f896e0f07462cb04ff6b5 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 12:13:22 +0800
+Subject: [PATCH 02/10] e1000: switch to use qemu_receive_packet() for loopback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
+@@ -546,7 +546,7 @@ e1000_send_packet(E1000State *s, const uint8_t *buf, int size)
+ 
+     NetClientState *nc = qemu_get_queue(s->nic);
+     if (s->phy_reg[PHY_CTRL] & MII_CR_LOOPBACK) {
+-        nc->info->receive(nc, buf, size);
++        qemu_receive_packet(nc, buf, size);
+     } else {
+         qemu_send_packet(nc, buf, size);
+     }
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch
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
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
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
+@@ -506,7 +506,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
+             s->regs[SONIC_TCR] |= SONIC_TCR_CRSL;
+             if (nc->info->can_receive(nc)) {
+                 s->loopback_packet = 1;
+-                nc->info->receive(nc, s->tx_buffer, tx_len);
++                qemu_receive_packet(nc, s->tx_buffer, tx_len);
+             }
+         } else {
+             /* Transmit packet */
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch
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
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch
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
+Content-Type: text/plain; charset=UTF-8
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
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
+@@ -306,7 +306,7 @@ static void sungem_send_packet(SunGEMState *s, const uint8_t *buf,
+     NetClientState *nc = qemu_get_queue(s->nic);
+ 
+     if (s->macregs[MAC_XIFCFG >> 2] & MAC_XIFCFG_LBCK) {
+-        nc->info->receive(nc, buf, size);
++        qemu_receive_packet(nc, buf, size);
+     } else {
+         qemu_send_packet(nc, buf, size);
+     }
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
new file mode 100644
index 0000000000..855c6970f4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
@@ -0,0 +1,43 @@
+From c0010f9b2bafe866fe32e3c2688454bc24147136 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 13:27:52 +0800
+Subject: [PATCH 06/10] tx_pkt: switch to use qemu_receive_packet_iov() for
+ loopback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_receive_iov() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
+@@ -553,7 +553,7 @@ static inline void net_tx_pkt_sendv(struct NetTxPkt *pkt,
+     NetClientState *nc, const struct iovec *iov, int iov_cnt)
+ {
+     if (pkt->is_loopback) {
+-        nc->info->receive_iov(nc, iov, iov_cnt);
++        qemu_receive_packet_iov(nc, iov, iov_cnt);
+     } else {
+         qemu_sendv_packet(nc, iov, iov_cnt);
+     }
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch
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
+Content-Type: text/plain; charset=UTF-8
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
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
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
+@@ -1795,7 +1795,7 @@ static void rtl8139_transfer_frame(RTL8139State *s, uint8_t *buf, int size,
+         }
+ 
+         DPRINTF("+++ transmit loopback mode\n");
+-        rtl8139_do_receive(qemu_get_queue(s->nic), buf, size, do_interrupt);
++        qemu_receive_packet(qemu_get_queue(s->nic), buf, size);
+ 
+         if (iov) {
+             g_free(buf2);
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
new file mode 100644
index 0000000000..ed716468dc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
@@ -0,0 +1,44 @@
+From 023ce62f0a788ad3a8233c7a828554bceeafd031 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Mon, 1 Mar 2021 10:33:34 -0500
+Subject: [PATCH 08/10] pcnet: switch to use qemu_receive_packet() for loopback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
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
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
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
+             if (BCR_SWSTYLE(s) == 1)
+                 add_crc = !GET_FIELD(tmd.status, TMDS, NOFCS);
+             s->looptest = add_crc ? PCNET_LOOPTEST_CRC : PCNET_LOOPTEST_NOCRC;
+-            pcnet_receive(qemu_get_queue(s->nic), s->buffer, s->xmit_pos);
++            qemu_receive_packet(qemu_get_queue(s->nic), s->buffer, s->xmit_pos);
+             s->looptest = 0;
+         } else {
+             if (s->nic) {
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch
new file mode 100644
index 0000000000..39d32b33a4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch
@@ -0,0 +1,46 @@
+From ecf7e62bb2cb02c9bd40082504ae376f3e19ffd2 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Mon, 1 Mar 2021 14:33:43 -0500
+Subject: [PATCH 09/10] cadence_gem: switch to use qemu_receive_packet() for
+ loopback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch switches to use qemu_receive_packet() which can detect
+reentrancy and return early.
+
+This is intended to address CVE-2021-3416.
+
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
++                    qemu_receive_packet(qemu_get_queue(s->nic), s->tx_packet,
++                                        total_bytes);
+                 } else {
+                     qemu_send_packet(qemu_get_queue(s->nic), s->tx_packet,
+                                      total_bytes);
+-- 
+2.29.2
+
-- 
2.30.2


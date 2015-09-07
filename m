Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A43F37404E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 14:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t87Ea2gG022694 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Sep 2015 15:36:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rhvTaWKsLm32
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 15:36:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t87EZnru022611
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Sep 2015 15:36:01 +0100
Message-ID: <1441636549.24871.251.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Sep 2015 15:35:49 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] qemu: Add fixes for smc91c11 qemu segfaults on arm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Sep 2015 14:36:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The smc91c111.c driver appears to have several issues. The can_receive()
function can return that the driver is ready when rx_fifo has not been 
freed yet. There is also no sanity check of rx_fifo() in _receive() which
can lead to corruption of the rx_fifo array.

release_packet() can also call qemu_flush_queued_packets() before rx_fifo 
has been cleaned up, resulting in cases where packets are submitted
for which there is not yet any space.

This patch therefore:

* fixes the logic in can_receive()
* adds logic to receive() as a sanity check
* moves the flush() calls to the correct places where data is ready
  to be received

Its currently undergoing discussion upstream about exactly which pieces
are the correct fix but for now, this stops the segfaults OE is seeing
which has to be an improvement.

[YOCTO #8234]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch b/meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch
new file mode 100644
index 0000000..e69af94
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch
@@ -0,0 +1,77 @@
+The smc91c111.c driver appears to have several issues. The can_receive()
+function can return that the driver is ready when rx_fifo has not been 
+freed yet. There is also no sanity check of rx_fifo() in _receive() which
+can lead to corruption of the rx_fifo array.
+
+release_packet() can also call qemu_flush_queued_packets() before rx_fifo 
+has been cleaned up, resulting in cases where packets are submitted
+for which there is not yet any space.
+
+This patch therefore:
+
+* fixes the logic in can_receive()
+* adds logic to receive() as a sanity check
+* moves the flush() calls to the correct places where data is ready
+  to be received
+
+Upstream-Status: Pending [discussion in progress on mailing list]
+RP 2015/9/7
+
+Index: qemu-2.4.0/hw/net/smc91c111.c
+===================================================================
+--- qemu-2.4.0.orig/hw/net/smc91c111.c
++++ qemu-2.4.0/hw/net/smc91c111.c
+@@ -185,7 +185,6 @@ static void smc91c111_release_packet(smc
+     s->allocated &= ~(1 << packet);
+     if (s->tx_alloc == 0x80)
+         smc91c111_tx_alloc(s);
+-    qemu_flush_queued_packets(qemu_get_queue(s->nic));
+ }
+ 
+ /* Flush the TX FIFO.  */
+@@ -237,9 +236,11 @@ static void smc91c111_do_tx(smc91c111_st
+             }
+         }
+ #endif
+-        if (s->ctr & CTR_AUTO_RELEASE)
++        if (s->ctr & CTR_AUTO_RELEASE) {
+             /* Race?  */
+             smc91c111_release_packet(s, packetnum);
++            qemu_flush_queued_packets(qemu_get_queue(s->nic));
++        }
+         else if (s->tx_fifo_done_len < NUM_PACKETS)
+             s->tx_fifo_done[s->tx_fifo_done_len++] = packetnum;
+         qemu_send_packet(qemu_get_queue(s->nic), p, len);
+@@ -379,9 +380,11 @@ static void smc91c111_writeb(void *opaqu
+                     smc91c111_release_packet(s, s->rx_fifo[0]);
+                 }
+                 smc91c111_pop_rx_fifo(s);
++                qemu_flush_queued_packets(qemu_get_queue(s->nic));
+                 break;
+             case 5: /* Release.  */
+                 smc91c111_release_packet(s, s->packet_num);
++                qemu_flush_queued_packets(qemu_get_queue(s->nic));
+                 break;
+             case 6: /* Add to TX FIFO.  */
+                 smc91c111_queue_tx(s, s->packet_num);
+@@ -642,7 +642,7 @@ static int smc91c111_can_receive(NetClie
+ 
+     if ((s->rcr & RCR_RXEN) == 0 || (s->rcr & RCR_SOFT_RST))
+         return 1;
+-    if (s->allocated == (1 << NUM_PACKETS) - 1)
++    if ((s->allocated == (1 << NUM_PACKETS) - 1) || (s->rx_fifo_len == NUM_PACKETS))
+         return 0;
+     return 1;
+ }
+@@ -671,9 +671,11 @@ static ssize_t smc91c111_receive(NetClie
+     /* TODO: Flag overrun and receive errors.  */
+     if (packetsize > 2048)
+         return -1;
++    if  (s->rx_fifo_len == NUM_PACKETS)
++        return -1;    
+     packetnum = smc91c111_allocate_packet(s);
+     if (packetnum == 0x80)
+         return -1;
+     s->rx_fifo[s->rx_fifo_len++] = packetnum;
+ 
+     p = &s->data[packetnum][0];
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index 5e5f786..d545b60 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
+            file://smc91c111_fix.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"




Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7EB6080F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 11:23:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2015 03:22:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,459,1444719600"; d="scan'208";a="866246902"
Received: from sentry.rb.intel.com ([10.237.105.108])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2015 03:22:43 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Dec 2015 13:24:21 +0200
Message-Id: <1450697061-1097-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH V2] qemu: upgrade to 2.5.0
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
X-List-Received-Date: Mon, 21 Dec 2015 11:23:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch removed,
included upstream;
- smc91c111_fix*.patch patches removed, included upstream;
- trace-remove-malloc-tracing.patch patch removed, included upstream;
- some configure options disappeared or changed name, updated.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  5 +-
 ..._mutex_lock_iothread-fix-race-condition-a.patch | 45 ----------
 .../recipes-devtools/qemu/qemu/smc91c111_fix.patch | 74 -----------------
 .../qemu/qemu/smc91c111_fix1.patch                 | 85 -------------------
 .../qemu/qemu/smc91c111_fix2.patch                 | 46 ----------
 .../qemu/qemu/smc91c111_fix3.patch                 | 33 --------
 .../qemu/qemu/trace-remove-malloc-tracing.patch    | 97 ----------------------
 .../qemu/{qemu_2.4.0.1.bb => qemu_2.5.0.bb}        |  8 +-
 8 files changed, 4 insertions(+), 389 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/smc91c111_fix1.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/smc91c111_fix2.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/smc91c111_fix3.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch
 rename meta/recipes-devtools/qemu/{qemu_2.4.0.1.bb => qemu_2.5.0.bb} (68%)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index abbace8..8b51324 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -21,7 +21,6 @@ SRC_URI = "\
     file://wacom.patch \
     file://add-ptest-in-makefile.patch \
     file://run-ptest \
-    file://cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch \
     "
 
 SRC_URI_append_class-native = "\
@@ -105,17 +104,17 @@ PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap a
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
 PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen,xen-libxenstore xen-libxenctrl xen-libxenguest"
-PACKAGECONFIG[vnc-tls] = "--enable-vnc --enable-vnc-tls,--disable-vnc-tls, gnutls,"
 PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
 PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpeg,"
 PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng,"
 PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
-PACKAGECONFIG[nss] = "--enable-smartcard-nss,--disable-smartcard-nss,nss,"
+PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
 PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+ libvte,"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
+PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,gcrypt,"
 PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
 PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
 PACKAGECONFIG[alsa] = ",,alsa-lib"
diff --git a/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch b/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch
deleted file mode 100644
index 45dffab..0000000
--- a/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Submitted
-
-From f354b9333408d411854af058cc44cceda60b4473 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Thu, 3 Sep 2015 14:07:34 -0500
-Subject: [PATCH] cpus.c: qemu_mutex_lock_iothread fix race condition at cpu
- thread init
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When QEMU starts the RCU thread executes qemu_mutex_lock_thread
-causing error "qemu:qemu_cpu_kick_thread: No such process" and exits.
-
-This isn't occur frequently but in glibc the thread id can exist and
-this not guarantee that the thread is on active/running state. If is
-inserted a sleep(1) after newthread assignment [1] the issue appears.
-
-So not make assumption that thread exist if first_cpu->thread is set
-then change the validation of cpu to created that is set into cpu
-threads (kvm, tcg, dummy).
-
-[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=nptl/pthread_create.c;h=d10f4ea8004e1d8f3a268b95cc0f8d93b8d89867;hb=HEAD#l621
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
----
- cpus.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cpus.c b/cpus.c
-index 7e4786e..05e5400 100644
---- a/cpus.c
-+++ b/cpus.c
-@@ -1171,7 +1171,7 @@ void qemu_mutex_lock_iothread(void)
-      * TCG code execution.
-      */
-     if (!tcg_enabled() || qemu_in_vcpu_thread() ||
--        !first_cpu || !first_cpu->thread) {
-+        !first_cpu || !first_cpu->created) {
-         qemu_mutex_lock(&qemu_global_mutex);
-         atomic_dec(&iothread_requesting_mutex);
-     } else {
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch b/meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch
deleted file mode 100644
index e37e777..0000000
--- a/meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-The smc91c111.c driver appears to have several issues. The can_receive()
-function can return that the driver is ready when rx_fifo has not been 
-freed yet. There is also no sanity check of rx_fifo() in _receive() which
-can lead to corruption of the rx_fifo array.
-
-release_packet() can also call qemu_flush_queued_packets() before rx_fifo 
-has been cleaned up, resulting in cases where packets are submitted
-for which there is not yet any space.
-
-This patch therefore:
-
-* fixes the logic in can_receive()
-* adds logic to receive() as a sanity check
-* moves the flush() calls to the correct places where data is ready
-  to be received
-
-Upstream-Status: Pending [discussion in progress on mailing list]
-RP 2015/9/7
-
-Index: qemu-2.4.0/hw/net/smc91c111.c
-===================================================================
---- qemu-2.4.0.orig/hw/net/smc91c111.c
-+++ qemu-2.4.0/hw/net/smc91c111.c
-@@ -185,7 +185,6 @@ static void smc91c111_release_packet(smc
-     s->allocated &= ~(1 << packet);
-     if (s->tx_alloc == 0x80)
-         smc91c111_tx_alloc(s);
--    qemu_flush_queued_packets(qemu_get_queue(s->nic));
- }
- 
- /* Flush the TX FIFO.  */
-@@ -237,9 +236,11 @@ static void smc91c111_do_tx(smc91c111_st
-             }
-         }
- #endif
--        if (s->ctr & CTR_AUTO_RELEASE)
-+        if (s->ctr & CTR_AUTO_RELEASE) {
-             /* Race?  */
-             smc91c111_release_packet(s, packetnum);
-+            qemu_flush_queued_packets(qemu_get_queue(s->nic));
-+        }
-         else if (s->tx_fifo_done_len < NUM_PACKETS)
-             s->tx_fifo_done[s->tx_fifo_done_len++] = packetnum;
-         qemu_send_packet(qemu_get_queue(s->nic), p, len);
-@@ -379,9 +380,11 @@ static void smc91c111_writeb(void *opaqu
-                     smc91c111_release_packet(s, s->rx_fifo[0]);
-                 }
-                 smc91c111_pop_rx_fifo(s);
-+                qemu_flush_queued_packets(qemu_get_queue(s->nic));
-                 break;
-             case 5: /* Release.  */
-                 smc91c111_release_packet(s, s->packet_num);
-+                qemu_flush_queued_packets(qemu_get_queue(s->nic));
-                 break;
-             case 6: /* Add to TX FIFO.  */
-                 smc91c111_queue_tx(s, s->packet_num);
-@@ -642,7 +642,7 @@ static int smc91c111_can_receive(NetClie
- 
-     if ((s->rcr & RCR_RXEN) == 0 || (s->rcr & RCR_SOFT_RST))
-         return 1;
--    if (s->allocated == (1 << NUM_PACKETS) - 1)
-+    if ((s->allocated == (1 << NUM_PACKETS) - 1) || (s->rx_fifo_len == NUM_PACKETS))
-         return 0;
-     return 1;
- }
-@@ -671,6 +671,8 @@ static ssize_t smc91c111_receive(NetClie
-     /* TODO: Flag overrun and receive errors.  */
-     if (packetsize > 2048)
-         return -1;
-+    if  (s->rx_fifo_len == NUM_PACKETS)
-+        return -1;    
-     packetnum = smc91c111_allocate_packet(s);
-     if (packetnum == 0x80)
-         return -1;
diff --git a/meta/recipes-devtools/qemu/qemu/smc91c111_fix1.patch b/meta/recipes-devtools/qemu/qemu/smc91c111_fix1.patch
deleted file mode 100644
index bd1223a..0000000
--- a/meta/recipes-devtools/qemu/qemu/smc91c111_fix1.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
-Subject: [RFT PATCH v1 1/3] net: smc91c111: guard flush_queued_packets() on
- can_rx()
-Date: Thu, 10 Sep 2015 21:23:43 -0700
-
-Check that the core can once again receive packets before asking the
-net layer to do a flush. This will make it more convenient to flush
-packets when adding new conditions to can_receive.
-
-Add missing if braces while moving the can_receive() core code.
-
-Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
-
-Upstream-Status: Submitted
-
----
-
- hw/net/smc91c111.c | 30 ++++++++++++++++++++++--------
- 1 file changed, 22 insertions(+), 8 deletions(-)
-
-Index: qemu-2.4.0/hw/net/smc91c111.c
-===================================================================
---- qemu-2.4.0.orig/hw/net/smc91c111.c
-+++ qemu-2.4.0/hw/net/smc91c111.c
-@@ -124,6 +124,24 @@ static void smc91c111_update(smc91c111_s
-     qemu_set_irq(s->irq, level);
- }
- 
-+static int smc91c111_can_receive(smc91c111_state *s)
-+{
-+    if ((s->rcr & RCR_RXEN) == 0 || (s->rcr & RCR_SOFT_RST)) {
-+        return 1;
-+    }
-+    if (s->allocated == (1 << NUM_PACKETS) - 1) {
-+        return 0;
-+    }
-+    return 1;
-+}
-+
-+static inline void smc91c111_flush_queued_packets(smc91c111_state *s)
-+{
-+    if (smc91c111_can_receive(s)) {
-+        qemu_flush_queued_packets(qemu_get_queue(s->nic));
-+    }
-+}
-+
- /* Try to allocate a packet.  Returns 0x80 on failure.  */
- static int smc91c111_allocate_packet(smc91c111_state *s)
- {
-@@ -185,7 +203,7 @@ static void smc91c111_release_packet(smc
-     s->allocated &= ~(1 << packet);
-     if (s->tx_alloc == 0x80)
-         smc91c111_tx_alloc(s);
--    qemu_flush_queued_packets(qemu_get_queue(s->nic));
-+    smc91c111_flush_queued_packets(s);
- }
- 
- /* Flush the TX FIFO.  */
-@@ -636,15 +654,11 @@ static uint32_t smc91c111_readl(void *op
-     return val;
- }
- 
--static int smc91c111_can_receive(NetClientState *nc)
-+static int smc91c111_can_receive_nc(NetClientState *nc)
- {
-     smc91c111_state *s = qemu_get_nic_opaque(nc);
- 
--    if ((s->rcr & RCR_RXEN) == 0 || (s->rcr & RCR_SOFT_RST))
--        return 1;
--    if (s->allocated == (1 << NUM_PACKETS) - 1)
--        return 0;
--    return 1;
-+    return smc91c111_can_receive(s);
- }
- 
- static ssize_t smc91c111_receive(NetClientState *nc, const uint8_t *buf, size_t size)
-@@ -739,7 +753,7 @@ static const MemoryRegionOps smc91c111_m
- static NetClientInfo net_smc91c111_info = {
-     .type = NET_CLIENT_OPTIONS_KIND_NIC,
-     .size = sizeof(NICState),
--    .can_receive = smc91c111_can_receive,
-+    .can_receive = smc91c111_can_receive_nc,
-     .receive = smc91c111_receive,
- };
- 
diff --git a/meta/recipes-devtools/qemu/qemu/smc91c111_fix2.patch b/meta/recipes-devtools/qemu/qemu/smc91c111_fix2.patch
deleted file mode 100644
index 018aed5..0000000
--- a/meta/recipes-devtools/qemu/qemu/smc91c111_fix2.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
-X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
-To: qemu-devel@nongnu.org
-Cc: peter.maydell@linaro.org, richard.purdie@linuxfoundation.org
-Subject: [RFT PATCH v1 2/3] net: smc91c111: gate can_receive() on rx FIFO
- having a slot
-Date: Thu, 10 Sep 2015 21:23:57 -0700
-
-Return false from can_receive() when the FIFO doesn't have a free RX
-slot. This fixes a bug in the current code where the allocated buffer
-is freed before the fifo pop, triggering a premature flush of queued RX
-packets. It also will handle a corner case, where the guest manually
-frees the allocated buffer before popping the rx FIFO (hence it is not
-enough to just delay the flush_queued_packets()).
-
-Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
-
-Upstream-Status: Submitted
----
-
- hw/net/smc91c111.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-Index: qemu-2.4.0/hw/net/smc91c111.c
-===================================================================
---- qemu-2.4.0.orig/hw/net/smc91c111.c
-+++ qemu-2.4.0/hw/net/smc91c111.c
-@@ -129,7 +129,8 @@ static int smc91c111_can_receive(smc91c1
-     if ((s->rcr & RCR_RXEN) == 0 || (s->rcr & RCR_SOFT_RST)) {
-         return 1;
-     }
--    if (s->allocated == (1 << NUM_PACKETS) - 1) {
-+    if (s->allocated == (1 << NUM_PACKETS) - 1 ||
-+        s->rx_fifo_len == NUM_PACKETS) {
-         return 0;
-     }
-     return 1;
-@@ -182,6 +183,7 @@ static void smc91c111_pop_rx_fifo(smc91c
-     } else {
-         s->int_level &= ~INT_RCV;
-     }
-+    smc91c111_flush_queued_packets(s);
-     smc91c111_update(s);
- }
- 
diff --git a/meta/recipes-devtools/qemu/qemu/smc91c111_fix3.patch b/meta/recipes-devtools/qemu/qemu/smc91c111_fix3.patch
deleted file mode 100644
index 9e865f7..0000000
--- a/meta/recipes-devtools/qemu/qemu/smc91c111_fix3.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
-To: qemu-devel@nongnu.org
-Cc: peter.maydell@linaro.org, richard.purdie@linuxfoundation.org
-Subject: [RFT PATCH v1 3/3] net: smc91c111: flush packets on RCR register
- changes
-Date: Thu, 10 Sep 2015 21:24:12 -0700
-
-The SOFT_RST or RXEN in the control register can be used as a condition
-to unblock the net layer via can_receive(). So check for possible
-flushes on RCR changes. This will drop all pending packets on soft
-reset or disable which is the functional intent of the can_receive()
-logic.
-
-Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
-
-Upstream-Status: Submitted
----
-
- hw/net/smc91c111.c | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: qemu-2.4.0/hw/net/smc91c111.c
-===================================================================
---- qemu-2.4.0.orig/hw/net/smc91c111.c
-+++ qemu-2.4.0/hw/net/smc91c111.c
-@@ -331,6 +331,7 @@ static void smc91c111_writeb(void *opaqu
-             if (s->rcr & RCR_SOFT_RST) {
-                 smc91c111_reset(DEVICE(s));
-             }
-+            smc91c111_flush_queued_packets(s);
-             return;
-         case 10: case 11: /* RPCR */
-             /* Ignored */
diff --git a/meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch b/meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch
deleted file mode 100644
index 73d699f..0000000
--- a/meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 98cf48f60aa4999f5b2808569a193a401a390e6a Mon Sep 17 00:00:00 2001
-From: Paolo Bonzini <pbonzini@redhat.com>
-Date: Wed, 16 Sep 2015 17:38:44 +0200
-Subject: [PATCH] trace: remove malloc tracing
-
-The malloc vtable is not supported anymore in glib, because it broke
-when constructors called g_malloc.  Remove tracing of g_malloc,
-g_realloc and g_free calls.
-
-Note that, for systemtap users, glib also provides tracepoints
-glib.mem_alloc, glib.mem_free, glib.mem_realloc, glib.slice_alloc
-and glib.slice_free.
-
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-Reviewed-by: Alberto Garcia <berto@igalia.com>
-Message-id: 1442417924-25831-1-git-send-email-pbonzini@redhat.com
-Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
-
-
-For Yocto:
-Upstream-Status: Backport [commit 98cf48f60a, included in 2.4.1]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
- trace-events |    3 ---
- vl.c         |   27 ---------------------------
- 2 files changed, 0 insertions(+), 30 deletions(-)
-
-diff --git a/trace-events b/trace-events
-index 6790292..b813ae4 100644
---- a/trace-events
-+++ b/trace-events
-@@ -603,9 +603,6 @@ scsi_request_sense(int target, int lun, int tag) "target %d lun %d tag %d"
- vm_state_notify(int running, int reason) "running %d reason %d"
- load_file(const char *name, const char *path) "name %s location %s"
- runstate_set(int new_state) "new state %d"
--g_malloc(size_t size, void *ptr) "size %zu ptr %p"
--g_realloc(void *ptr, size_t size, void *newptr) "ptr %p size %zu newptr %p"
--g_free(void *ptr) "ptr %p"
- system_wakeup_request(int reason) "reason=%d"
- qemu_system_shutdown_request(void) ""
- qemu_system_powerdown_request(void) ""
-diff --git a/vl.c b/vl.c
-index f2bd8d2..ea9e0e6 100644
---- a/vl.c
-+++ b/vl.c
-@@ -2703,26 +2703,6 @@ static const QEMUOption *lookup_opt(int argc, char **argv,
-     return popt;
- }
- 
--static gpointer malloc_and_trace(gsize n_bytes)
--{
--    void *ptr = malloc(n_bytes);
--    trace_g_malloc(n_bytes, ptr);
--    return ptr;
--}
--
--static gpointer realloc_and_trace(gpointer mem, gsize n_bytes)
--{
--    void *ptr = realloc(mem, n_bytes);
--    trace_g_realloc(mem, n_bytes, ptr);
--    return ptr;
--}
--
--static void free_and_trace(gpointer mem)
--{
--    trace_g_free(mem);
--    free(mem);
--}
--
- static int machine_set_property(void *opaque,
-                                 const char *name, const char *value,
-                                 Error **errp)
-@@ -2950,11 +2930,6 @@ int main(int argc, char **argv, char **envp)
-     bool userconfig = true;
-     const char *log_mask = NULL;
-     const char *log_file = NULL;
--    GMemVTable mem_trace = {
--        .malloc = malloc_and_trace,
--        .realloc = realloc_and_trace,
--        .free = free_and_trace,
--    };
-     const char *trace_events = NULL;
-     const char *trace_file = NULL;
-     ram_addr_t maxram_size;
-@@ -2970,8 +2945,6 @@ int main(int argc, char **argv, char **envp)
-     error_set_progname(argv[0]);
-     qemu_init_exec_dir(argv[0]);
- 
--    g_mem_set_vtable(&mem_trace);
--
-     module_call_init(MODULE_INIT_QOM);
- 
-     qemu_add_opts(&qemu_drive_opts);
--- 
-1.7.0.4
-
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.1.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
similarity index 68%
rename from meta/recipes-devtools/qemu/qemu_2.4.0.1.bb
rename to meta/recipes-devtools/qemu/qemu_2.5.0.bb
index c96da02..6ad7bbb 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -6,15 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
-            file://smc91c111_fix1.patch \
-            file://smc91c111_fix2.patch \
-            file://smc91c111_fix3.patch \
             file://no-valgrind.patch \
-            file://trace-remove-malloc-tracing.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "c99445164e77184a9ba2e7dbf7ed5c29"
-SRC_URI[sha256sum] = "ecfe8b88037e41e817d72c460c56c6a0b573d540d6ba38b162d0de4fd22d1bdb"
+SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
+SRC_URI[sha256sum] = "3443887401619fe33bfa5d900a4f2d6a79425ae2b7e43d5b8c36eb7a683772d4"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
2.5.0



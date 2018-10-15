Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3701679AAD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 08:59:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9F8xlkc004534
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 01:59:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 15 Oct 2018 01:59:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Oct 2018 16:59:44 +0800
Message-ID: <1539593984-444082-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] qemu: fix CVE-2018-17958/17962/17963
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
X-List-Received-Date: Mon, 15 Oct 2018 08:59:47 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../qemu/qemu/CVE-2018-17958.patch                 | 52 ++++++++++++++++
 .../qemu/qemu/CVE-2018-17962.patch                 | 70 ++++++++++++++++++++++
 .../qemu/qemu/CVE-2018-17963.patch                 | 51 ++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |  3 +
 4 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-17962.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-17963.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch
new file mode 100644
index 0000000..af40ff2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch
@@ -0,0 +1,52 @@
+From 06e88ca78d056ea4de885e3a1496805179dc47bc Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 15 Oct 2018 16:33:04 +0800
+Subject: [PATCH] ne2000: fix possible out of bound access in ne2000_receive
+
+In ne2000_receive(), we try to assign size_ to size which converts
+from size_t to integer. This will cause troubles when size_ is greater
+INT_MAX, this will lead a negative value in size and it can then pass
+the check of size < MIN_BUF_SIZE which may lead out of bound access of
+for both buf and buf1.
+
+Fixing by converting the type of size to size_t.
+
+CC: address@hidden
+Reported-by: Daniel Shapira <address@hidden>
+Reviewed-by: Michael S. Tsirkin <address@hidden>
+Signed-off-by: Jason Wang <address@hidden>
+
+Upstream-Status: Backport [https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg03273.html]
+
+CVE: CVE-2018-17958
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ hw/net/ne2000.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
+index 07d79e3..869518e 100644
+--- a/hw/net/ne2000.c
++++ b/hw/net/ne2000.c
+@@ -174,7 +174,7 @@ static int ne2000_buffer_full(NE2000State *s)
+ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
+ {
+     NE2000State *s = qemu_get_nic_opaque(nc);
+-    int size = size_;
++    size_t size = size_;
+     uint8_t *p;
+     unsigned int total_len, next, avail, len, index, mcast_idx;
+     uint8_t buf1[60];
+@@ -182,7 +182,7 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
+         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+ 
+ #if defined(DEBUG_NE2000)
+-    printf("NE2000: received len=%d\n", size);
++    printf("NE2000: received len=%zu\n", size);
+ #endif
+ 
+     if (s->cmd & E8390_STOP || ne2000_buffer_full(s))
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-17962.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-17962.patch
new file mode 100644
index 0000000..88bfd81
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-17962.patch
@@ -0,0 +1,70 @@
+From 20abe443ad9464b18ac494f71f7d53f19ee3748f Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 15 Oct 2018 16:38:08 +0800
+Subject: [PATCH] rtl8139: fix possible out of bound access
+
+In rtl8139_do_receive(), we try to assign size_ to size which converts
+from size_t to integer. This will cause troubles when size_ is greater
+INT_MAX, this will lead a negative value in size and it can then pass
+the check of size < MIN_BUF_SIZE which may lead out of bound access of
+for both buf and buf1.
+
+Fixing by converting the type of size to size_t.
+
+CC: address@hidden
+Reported-by: Daniel Shapira <address@hidden>
+Reviewed-by: Michael S. Tsirkin <address@hidden>
+Signed-off-by: Jason Wang <address@hidden>
+
+Upstream-Status: Backport [https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg03269.html]
+
+CVE: CVE-2018-17962
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ hw/net/rtl8139.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
+index 46daa16..2342a09 100644
+--- a/hw/net/rtl8139.c
++++ b/hw/net/rtl8139.c
+@@ -817,7 +817,7 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
+     RTL8139State *s = qemu_get_nic_opaque(nc);
+     PCIDevice *d = PCI_DEVICE(s);
+     /* size is the length of the buffer passed to the driver */
+-    int size = size_;
++    size_t size = size_;
+     const uint8_t *dot1q_buf = NULL;
+ 
+     uint32_t packet_header = 0;
+@@ -826,7 +826,7 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
+     static const uint8_t broadcast_macaddr[6] =
+         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+ 
+-    DPRINTF(">>> received len=%d\n", size);
++    DPRINTF(">>> received len=%zu\n", size);
+ 
+     /* test if board clock is stopped */
+     if (!s->clock_enabled)
+@@ -1035,7 +1035,7 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
+ 
+         if (size+4 > rx_space)
+         {
+-            DPRINTF("C+ Rx mode : descriptor %d size %d received %d + 4\n",
++            DPRINTF("C+ Rx mode : descriptor %d size %d received %zu + 4\n",
+                 descriptor, rx_space, size);
+ 
+             s->IntrStatus |= RxOverflow;
+@@ -1148,7 +1148,7 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
+         if (avail != 0 && RX_ALIGN(size + 8) >= avail)
+         {
+             DPRINTF("rx overflow: rx buffer length %d head 0x%04x "
+-                "read 0x%04x === available 0x%04x need 0x%04x\n",
++                "read 0x%04x === available 0x%04x need 0x%04zx\n",
+                 s->RxBufferSize, s->RxBufAddr, s->RxBufPtr, avail, size + 8);
+ 
+             s->IntrStatus |= RxOverflow;
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-17963.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-17963.patch
new file mode 100644
index 0000000..054cdc8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-17963.patch
@@ -0,0 +1,51 @@
+From e5ff72a8005dd1d9c0f63f8a9cc4298df5bb7551 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 15 Oct 2018 16:39:46 +0800
+Subject: [PATCH] pcnet: fix possible buffer overflow
+
+In pcnet_receive(), we try to assign size_ to size which converts from
+size_t to integer. This will cause troubles when size_ is greater
+INT_MAX, this will lead a negative value in size and it can then pass
+the check of size < MIN_BUF_SIZE which may lead out of bound access
+for both buf and buf1.
+
+Fixing by converting the type of size to size_t.
+
+CC: address@hidden
+Reported-by: Daniel Shapira <address@hidden>
+Reviewed-by: Michael S. Tsirkin <address@hidden>
+Signed-off-by: Jason Wang <address@hidden>
+
+Upstream-Status: Backport [https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg03268.html]
+
+CVE: CVE-2018-17963
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ hw/net/pcnet.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
+index 0c44554..d9ba04b 100644
+--- a/hw/net/pcnet.c
++++ b/hw/net/pcnet.c
+@@ -988,14 +988,14 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
+     uint8_t buf1[60];
+     int remaining;
+     int crc_err = 0;
+-    int size = size_;
++    size_t size = size_;
+ 
+     if (CSR_DRX(s) || CSR_STOP(s) || CSR_SPND(s) || !size ||
+         (CSR_LOOP(s) && !s->looptest)) {
+         return -1;
+     }
+ #ifdef PCNET_DEBUG
+-    printf("pcnet_receive size=%d\n", size);
++    printf("pcnet_receive size=%zu\n", size);
+ #endif
+ 
+     /* if too small buffer, then expand it */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 4569cae..776548b 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -22,6 +22,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
            file://CVE-2018-15746.patch \
+           file://CVE-2018-17958.patch \
+           file://CVE-2018-17962.patch \
+           file://CVE-2018-17963.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4



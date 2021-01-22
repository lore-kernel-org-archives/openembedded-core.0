Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.5681.1611299766265547091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 23:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,365,1602518400"; 
   d="scan'208";a="103729830"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Jan 2021 15:15:54 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D0E3C4CE602D
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 15:15:50 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 15:15:50 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] qemu: CVE-2018-18438 Security Advisory
Date: Fri, 22 Jan 2021 15:15:45 +0800
Message-ID: <1611299746-47965-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D0E3C4CE602D.AEC69
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18438

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2018-18438.patch            | 697 ++++++++++++++++++
 2 files changed, 698 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c894b81b10..d7f3613c3f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://mmap.patch \
            file://mmap2.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
+	   file://CVE-2018-18438.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch
new file mode 100644
index 0000000000..b6ce8fa57d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch
@@ -0,0 +1,697 @@
+From:	Philippe Mathieu-Daudé
+Subject:	[Qemu-devel] [PATCH v2 07/11] chardev: Let IOReadHandler use unsigned type
+Date:	Fri, 12 Oct 2018 02:22:13 +0200
+
+The number of bytes can not be negative nor zero.
+
+Fixed 2 format string:
+- hw/char/spapr_vty.c
+- hw/usb/ccid-card-passthru.c
+
+Suggested-by: Paolo Bonzini <address@hidden>
+Signed-off-by: Philippe Mathieu-Daudé <address@hidden>
+Acked-by: Alberto Garcia <address@hidden>
+---
+ backends/rng-egd.c          | 2 +-
+ chardev/char-mux.c          | 2 +-
+ gdbstub.c                   | 2 +-
+ hw/arm/pxa2xx.c             | 2 +-
+ hw/arm/strongarm.c          | 3 ++-
+ hw/char/bcm2835_aux.c       | 2 +-
+ hw/char/cadence_uart.c      | 2 +-
+ hw/char/cmsdk-apb-uart.c    | 2 +-
+ hw/char/digic-uart.c        | 2 +-
+ hw/char/escc.c              | 2 +-
+ hw/char/etraxfs_ser.c       | 2 +-
+ hw/char/exynos4210_uart.c   | 3 ++-
+ hw/char/grlib_apbuart.c     | 3 ++-
+ hw/char/imx_serial.c        | 2 +-
+ hw/char/ipoctal232.c        | 2 +-
+ hw/char/lm32_juart.c        | 2 +-
+ hw/char/lm32_uart.c         | 2 +-
+ hw/char/mcf_uart.c          | 2 +-
+ hw/char/milkymist-uart.c    | 2 +-
+ hw/char/pl011.c             | 2 +-
+ hw/char/riscv_htif.c        | 2 +-
+ hw/char/sclpconsole-lm.c    | 2 +-
+ hw/char/sclpconsole.c       | 2 +-
+ hw/char/serial.c            | 4 ++--
+ hw/char/sh_serial.c         | 2 +-
+ hw/char/sifive_uart.c       | 2 +-
+ hw/char/spapr_vty.c         | 4 ++--
+ hw/char/stm32f2xx_usart.c   | 3 ++-
+ hw/char/terminal3270.c      | 2 +-
+ hw/char/virtio-console.c    | 2 +-
+ hw/char/xen_console.c       | 2 +-
+ hw/char/xilinx_uartlite.c   | 2 +-
+ hw/ipmi/ipmi_bmc_extern.c   | 2 +-
+ hw/misc/ivshmem.c           | 4 ++--
+ hw/usb/ccid-card-passthru.c | 5 +++--
+ hw/usb/dev-serial.c         | 2 +-
+ hw/usb/redirect.c           | 3 ++-
+ include/qemu/main-loop.h    | 2 +-
+ monitor/hmp.c               | 2 +-
+ monitor/qmp.c               | 2 +-
+ net/colo-compare.c          | 4 ++--
+ net/filter-mirror.c         | 2 +-
+ net/slirp.c                 | 2 +-
+ softmmu/qtest.c             | 2 +-
+ target/xtensa/xtensa-semi.c | 2 +-
+ 45 files changed, 56 insertions(+), 50 deletions(-)
+
+diff --git a/backends/rng-egd.c b/backends/rng-egd.c
+index 4de142b9d..56292104a 100644
+--- a/backends/rng-egd.c
++++ b/backends/rng-egd.c
+@@ -62,7 +62,7 @@ static int rng_egd_chr_can_read(void *opaque)
+     return size;
+ }
+ 
+-static void rng_egd_chr_read(void *opaque, const uint8_t *buf, int size)
++static void rng_egd_chr_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     RngEgd *s = RNG_EGD(opaque);
+     size_t buf_offset = 0;
+diff --git a/chardev/char-mux.c b/chardev/char-mux.c
+index 6f980bb83..574a39074 100644
+--- a/chardev/char-mux.c
++++ b/chardev/char-mux.c
+@@ -210,7 +210,7 @@ static int mux_chr_can_read(void *opaque)
+     return 0;
+ }
+ 
+-static void mux_chr_read(void *opaque, const uint8_t *buf, int size)
++static void mux_chr_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     Chardev *chr = CHARDEV(opaque);
+     MuxChardev *d = MUX_CHARDEV(opaque);
+diff --git a/gdbstub.c b/gdbstub.c
+index f19f98ab1..98c75e31e 100644
+--- a/gdbstub.c
++++ b/gdbstub.c
+@@ -3296,7 +3296,7 @@ static int gdb_chr_can_receive(void *opaque)
+   return MAX_PACKET_LENGTH;
+ }
+ 
+-static void gdb_chr_receive(void *opaque, const uint8_t *buf, int size)
++static void gdb_chr_receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     int i;
+ 
+diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
+index 1a98f3bd5..393d98633 100644
+--- a/hw/arm/pxa2xx.c
++++ b/hw/arm/pxa2xx.c
+@@ -1963,7 +1963,7 @@ static int pxa2xx_fir_is_empty(void *opaque)
+     return (s->rx_len < 64);
+ }
+ 
+-static void pxa2xx_fir_rx(void *opaque, const uint8_t *buf, int size)
++static void pxa2xx_fir_rx(void *opaque, const uint8_t *buf, size_t size)
+ {
+     PXA2xxFIrState *s = (PXA2xxFIrState *) opaque;
+     if (!(s->control[0] & (1 << 4)))			/* RXE */
+diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
+index ca7c385f3..8557f9a31 100644
+--- a/hw/arm/strongarm.c
++++ b/hw/arm/strongarm.c
+@@ -1076,7 +1076,8 @@ static int strongarm_uart_can_receive(void *opaque)
+     return 1;
+ }
+ 
+-static void strongarm_uart_receive(void *opaque, const uint8_t *buf, int size)
++static void strongarm_uart_receive(void *opaque, const uint8_t *buf,
++                                   size_t size)
+ {
+     StrongARMUARTState *s = opaque;
+     int i;
+diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
+index dade2ab5f..3ac94f09f 100644
+--- a/hw/char/bcm2835_aux.c
++++ b/hw/char/bcm2835_aux.c
+@@ -240,7 +240,7 @@ static void bcm2835_aux_put_fifo(void *opaque, uint8_t value)
+     bcm2835_aux_update(s);
+ }
+ 
+-static void bcm2835_aux_receive(void *opaque, const uint8_t *buf, int size)
++static void bcm2835_aux_receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     bcm2835_aux_put_fifo(opaque, *buf);
+ }
+diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
+index e196906c9..c1b5214df 100644
+--- a/hw/char/cadence_uart.c
++++ b/hw/char/cadence_uart.c
+@@ -347,7 +347,7 @@ static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
+     cadence_uart_xmit(NULL, G_IO_OUT, s);
+ }
+ 
+-static void uart_receive(void *opaque, const uint8_t *buf, int size)
++static void uart_receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     CadenceUARTState *s = opaque;
+     uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
+diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
+index 626b68f2e..316426a84 100644
+--- a/hw/char/cmsdk-apb-uart.c
++++ b/hw/char/cmsdk-apb-uart.c
+@@ -122,7 +122,7 @@ static int uart_can_receive(void *opaque)
+     return 0;
+ }
+ 
+-static void uart_receive(void *opaque, const uint8_t *buf, int size)
++static void uart_receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
+ 
+diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
+index e130cb469..bcc265714 100644
+--- a/hw/char/digic-uart.c
++++ b/hw/char/digic-uart.c
+@@ -121,7 +121,7 @@ static int uart_can_rx(void *opaque)
+     return !(s->reg_st & ST_RX_RDY);
+ }
+ 
+-static void uart_rx(void *opaque, const uint8_t *buf, int size)
++static void uart_rx(void *opaque, const uint8_t *buf, size_t size)
+ {
+     DigicUartState *s = opaque;
+ 
+diff --git a/hw/char/escc.c b/hw/char/escc.c
+index 7d16ee868..2bd650ea8 100644
+--- a/hw/char/escc.c
++++ b/hw/char/escc.c
+@@ -628,7 +628,7 @@ static void serial_receive_break(ESCCChannelState *s)
+     escc_update_irq(s);
+ }
+ 
+-static void serial_receive1(void *opaque, const uint8_t *buf, int size)
++static void serial_receive1(void *opaque, const uint8_t *buf, size_t size)
+ {
+     ESCCChannelState *s = opaque;
+     serial_receive_byte(s, buf[0]);
+diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
+index d9fba2ae6..af3b1d30e 100644
+--- a/hw/char/etraxfs_ser.c
++++ b/hw/char/etraxfs_ser.c
+@@ -171,7 +171,7 @@ static Property etraxfs_ser_properties[] = {
+     DEFINE_PROP_END_OF_LIST(),
+ };
+ 
+-static void serial_receive(void *opaque, const uint8_t *buf, int size)
++static void serial_receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     ETRAXSerial *s = opaque;
+     int i;
+diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
+index 96afe3580..11b9d18b9 100644
+--- a/hw/char/exynos4210_uart.c
++++ b/hw/char/exynos4210_uart.c
+@@ -555,7 +555,8 @@ static int exynos4210_uart_can_receive(void *opaque)
+     return fifo_empty_elements_number(&s->rx);
+ }
+ 
+-static void exynos4210_uart_receive(void *opaque, const uint8_t *buf, int size)
++static void exynos4210_uart_receive(void *opaque, const uint8_t *buf,
++                                    size_t size)
+ {
+     Exynos4210UartState *s = (Exynos4210UartState *)opaque;
+     int i;
+diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
+index 3f80f6824..a5a210537 100644
+--- a/hw/char/grlib_apbuart.c
++++ b/hw/char/grlib_apbuart.c
+@@ -140,7 +140,8 @@ static int grlib_apbuart_can_receive(void *opaque)
+     return FIFO_LENGTH - uart->len;
+ }
+ 
+-static void grlib_apbuart_receive(void *opaque, const uint8_t *buf, int size)
++static void grlib_apbuart_receive(void *opaque, const uint8_t *buf, size_t
++size)
+ {
+     UART *uart = opaque;
+ 
+diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
+index 731b8fc64..ca52724a8 100644
+--- a/hw/char/imx_serial.c
++++ b/hw/char/imx_serial.c
+@@ -318,7 +318,7 @@ static void imx_put_data(void *opaque, uint32_t value)
+     imx_update(s);
+ }
+ 
+-static void imx_receive(void *opaque, const uint8_t *buf, int size)
++static void imx_receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     imx_put_data(opaque, *buf);
+ }
+diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
+index ad000a39b..14da6c383 100644
+--- a/hw/char/ipoctal232.c
++++ b/hw/char/ipoctal232.c
+@@ -472,7 +472,7 @@ static int hostdev_can_receive(void *opaque)
+     return ch->rx_enabled ? available_bytes : 0;
+ }
+ 
+-static void hostdev_receive(void *opaque, const uint8_t *buf, int size)
++static void hostdev_receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     SCC2698Channel *ch = opaque;
+     IPOctalState *dev = ch->ipoctal;
+diff --git a/hw/char/lm32_juart.c b/hw/char/lm32_juart.c
+index aced35701..3e7d1e52a 100644
+--- a/hw/char/lm32_juart.c
++++ b/hw/char/lm32_juart.c
+@@ -90,7 +90,7 @@ void lm32_juart_set_jrx(DeviceState *d, uint32_t jtx)
+     s->jrx &= ~JRX_FULL;
+ }
+ 
+-static void juart_rx(void *opaque, const uint8_t *buf, int size)
++static void juart_rx(void *opaque, const uint8_t *buf, size_t size)
+ {
+     LM32JuartState *s = opaque;
+ 
+diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
+index 2f58e2943..eb14db77c 100644
+--- a/hw/char/lm32_uart.c
++++ b/hw/char/lm32_uart.c
+@@ -214,7 +214,7 @@ static const MemoryRegionOps uart_ops = {
+     },
+ };
+ 
+-static void uart_rx(void *opaque, const uint8_t *buf, int size)
++static void uart_rx(void *opaque, const uint8_t *buf, size_t size)
+ {
+     LM32UartState *s = opaque;
+ 
+diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
+index e6814faff..28c03cd9a 100644
+--- a/hw/char/mcf_uart.c
++++ b/hw/char/mcf_uart.c
+@@ -279,7 +279,7 @@ static int mcf_uart_can_receive(void *opaque)
+     return s->rx_enabled && (s->sr & MCF_UART_FFULL) == 0;
+ }
+ 
+-static void mcf_uart_receive(void *opaque, const uint8_t *buf, int size)
++static void mcf_uart_receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     mcf_uart_state *s = (mcf_uart_state *)opaque;
+ 
+diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
+index a817c51eb..4cc05f6fd 100644
+--- a/hw/char/milkymist-uart.c
++++ b/hw/char/milkymist-uart.c
+@@ -160,7 +160,7 @@ static const MemoryRegionOps uart_mmio_ops = {
+     .endianness = DEVICE_NATIVE_ENDIAN,
+ };
+ 
+-static void uart_rx(void *opaque, const uint8_t *buf, int size)
++static void uart_rx(void *opaque, const uint8_t *buf, size_t size)
+ {
+     MilkymistUartState *s = opaque;
+ 
+diff --git a/hw/char/pl011.c b/hw/char/pl011.c
+index ede16c781..95216add1 100644
+--- a/hw/char/pl011.c
++++ b/hw/char/pl011.c
+@@ -297,7 +297,7 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
+     }
+ }
+ 
+-static void pl011_receive(void *opaque, const uint8_t *buf, int size)
++static void pl011_receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     pl011_put_fifo(opaque, *buf);
+ }
+diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
+index ba1af1cfc..4e8e9dfae 100644
+--- a/hw/char/riscv_htif.c
++++ b/hw/char/riscv_htif.c
+@@ -74,7 +74,7 @@ static int htif_can_recv(void *opaque)
+  * Called by the char dev to supply input to HTIF console.
+  * We assume that we will receive one character at a time.
+  */
+-static void htif_recv(void *opaque, const uint8_t *buf, int size)
++static void htif_recv(void *opaque, const uint8_t *buf, size_t size)
+ {
+     HTIFState *htifstate = opaque;
+ 
+diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
+index 81f6d0ed4..41e8c076b 100644
+--- a/hw/char/sclpconsole-lm.c
++++ b/hw/char/sclpconsole-lm.c
+@@ -75,7 +75,7 @@ static int chr_can_read(void *opaque)
+     return 1;
+ }
+ 
+-static void chr_read(void *opaque, const uint8_t *buf, int size)
++static void chr_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     SCLPConsoleLM *scon = opaque;
+ 
+diff --git a/hw/char/sclpconsole.c b/hw/char/sclpconsole.c
+index aa72ab40b..cae77319b 100644
+--- a/hw/char/sclpconsole.c
++++ b/hw/char/sclpconsole.c
+@@ -63,7 +63,7 @@ static int chr_can_read(void *opaque)
+ }
+ 
+ /* Send data from a char device over to the guest */
+-static void chr_read(void *opaque, const uint8_t *buf, int size)
++static void chr_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     SCLPConsole *scon = opaque;
+ 
+diff --git a/hw/char/serial.c b/hw/char/serial.c
+index 97f71879f..0f8fcf189 100644
+--- a/hw/char/serial.c
++++ b/hw/char/serial.c
+@@ -100,7 +100,7 @@
+ 
+ #define MAX_XMIT_RETRY      4
+ 
+-static void serial_receive1(void *opaque, const uint8_t *buf, int size);
++static void serial_receive1(void *opaque, const uint8_t *buf, size_t size);
+ static void serial_xmit(SerialState *s);
+ 
+ static inline void recv_fifo_put(SerialState *s, uint8_t chr)
+@@ -599,7 +599,7 @@ static int serial_can_receive1(void *opaque)
+     return serial_can_receive(s);
+ }
+ 
+-static void serial_receive1(void *opaque, const uint8_t *buf, int size)
++static void serial_receive1(void *opaque, const uint8_t *buf, size_t size)
+ {
+     SerialState *s = opaque;
+ 
+diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
+index 167f4d8cb..4752e18af 100644
+--- a/hw/char/sh_serial.c
++++ b/hw/char/sh_serial.c
+@@ -328,7 +328,7 @@ static void sh_serial_timeout_int(void *opaque)
+     }
+ }
+ 
+-static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
++static void sh_serial_receive1(void *opaque, const uint8_t *buf, size_t size)
+ {
+     sh_serial_state *s = opaque;
+ 
+diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
+index 3a00ba7f0..84961efb2 100644
+--- a/hw/char/sifive_uart.c
++++ b/hw/char/sifive_uart.c
+@@ -141,7 +141,7 @@ static const MemoryRegionOps uart_ops = {
+     }
+ };
+ 
+-static void uart_rx(void *opaque, const uint8_t *buf, int size)
++static void uart_rx(void *opaque, const uint8_t *buf, size_t size)
+ {
+     SiFiveUARTState *s = opaque;
+ 
+diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
+index e726d4d91..c3aa4cd15 100644
+--- a/hw/char/spapr_vty.c
++++ b/hw/char/spapr_vty.c
+@@ -29,7 +29,7 @@ static int vty_can_receive(void *opaque)
+     return VTERM_BUFSIZE - (dev->in - dev->out);
+ }
+ 
+-static void vty_receive(void *opaque, const uint8_t *buf, int size)
++static void vty_receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     SpaprVioVty *dev = VIO_SPAPR_VTY_DEVICE(opaque);
+     int i;
+@@ -43,7 +43,7 @@ static void vty_receive(void *opaque, const uint8_t *buf, int size)
+             static bool reported;
+             if (!reported) {
+                 error_report("VTY input buffer exhausted - characters dropped."
+-                             " (input size = %i)", size);
++				" (input size = %zu)", size);
+                 reported = true;
+             }
+             break;
+diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
+index 0d661be6d..801614097 100644
+--- a/hw/char/stm32f2xx_usart.c
++++ b/hw/char/stm32f2xx_usart.c
+@@ -52,7 +52,8 @@ static int stm32f2xx_usart_can_receive(void *opaque)
+     return 0;
+ }
+ 
+-static void stm32f2xx_usart_receive(void *opaque, const uint8_t *buf, int size)
++static void stm32f2xx_usart_receive(void *opaque, const uint8_t *buf,
++                                    size_t size)
+ {
+     STM32F2XXUsartState *s = opaque;
+ 
+diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
+index d77981bb6..78870e061 100644
+--- a/hw/char/terminal3270.c
++++ b/hw/char/terminal3270.c
+@@ -93,7 +93,7 @@ static gboolean send_timing_mark_cb(gpointer opaque)
+  * As of now, for such case, we simply terminate the connection,
+  * and we should come back here later with a better solution.
+  */
+-static void terminal_read(void *opaque, const uint8_t *buf, int size)
++static void terminal_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     Terminal3270 *t = opaque;
+     CcwDevice *ccw_dev = CCW_DEVICE(t);
+diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
+index bc752cf90..f7bdbffcf 100644
+--- a/hw/char/virtio-console.c
++++ b/hw/char/virtio-console.c
+@@ -138,7 +138,7 @@ static int chr_can_read(void *opaque)
+ }
+ 
+ /* Send data from a char device over to the guest */
+-static void chr_read(void *opaque, const uint8_t *buf, int size)
++static void chr_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     VirtConsole *vcon = opaque;
+     VirtIOSerialPort *port = VIRTIO_SERIAL_PORT(vcon);
+diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
+index 63153dfde..9450ea322 100644
+--- a/hw/char/xen_console.c
++++ b/hw/char/xen_console.c
+@@ -122,7 +122,7 @@ static int xencons_can_receive(void *opaque)
+     return ring_free_bytes(con);
+ }
+ 
+-static void xencons_receive(void *opaque, const uint8_t *buf, int len)
++static void xencons_receive(void *opaque, const uint8_t *buf, size_t len)
+ {
+     struct XenConsole *con = opaque;
+     struct xencons_interface *intf = con->sring;
+diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
+index 2e773ec4c..f2b6751f5 100644
+--- a/hw/char/xilinx_uartlite.c
++++ b/hw/char/xilinx_uartlite.c
+@@ -182,7 +182,7 @@ static Property xilinx_uartlite_properties[] = {
+     DEFINE_PROP_END_OF_LIST(),
+ };
+ 
+-static void uart_rx(void *opaque, const uint8_t *buf, int size)
++static void uart_rx(void *opaque, const uint8_t *buf, size_t size)
+ {
+     XilinxUARTLite *s = opaque;
+ 
+diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
+index c3f3306e6..c0d810275 100644
+--- a/hw/ipmi/ipmi_bmc_extern.c
++++ b/hw/ipmi/ipmi_bmc_extern.c
+@@ -313,7 +313,7 @@ static int can_receive(void *opaque)
+     return 1;
+ }
+ 
+-static void receive(void *opaque, const uint8_t *buf, int size)
++static void receive(void *opaque, const uint8_t *buf, size_t size)
+ {
+     IPMIBmcExtern *ibe = opaque;
+     int i;
+diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
+index e321e5cb6..8743caed4 100644
+--- a/hw/misc/ivshmem.c
++++ b/hw/misc/ivshmem.c
+@@ -580,14 +580,14 @@ static int ivshmem_can_receive(void *opaque)
+     return sizeof(s->msg_buf) - s->msg_buffered_bytes;
+ }
+ 
+-static void ivshmem_read(void *opaque, const uint8_t *buf, int size)
++static void ivshmem_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     IVShmemState *s = opaque;
+     Error *err = NULL;
+     int fd;
+     int64_t msg;
+ 
+-    assert(size >= 0 && s->msg_buffered_bytes + size <= sizeof(s->msg_buf));
++    assert(s->msg_buffered_bytes + size <= sizeof(s->msg_buf));
+     memcpy((unsigned char *)&s->msg_buf + s->msg_buffered_bytes, buf, size);
+     s->msg_buffered_bytes += size;
+     if (s->msg_buffered_bytes < sizeof(s->msg_buf)) {
+diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
+index e8e9d37e8..d419071a1 100644
+--- a/hw/usb/ccid-card-passthru.c
++++ b/hw/usb/ccid-card-passthru.c
+@@ -275,13 +275,14 @@ static void ccid_card_vscard_drop_connection(PassthruState *card)
+     card->vscard_in_pos = card->vscard_in_hdr = 0;
+ }
+ 
+-static void ccid_card_vscard_read(void *opaque, const uint8_t *buf, int size)
++static void ccid_card_vscard_read(void *opaque, const uint8_t *buf, size_t
++size)
+ {
+     PassthruState *card = opaque;
+     VSCMsgHeader *hdr;
+ 
+     if (card->vscard_in_pos + size > VSCARD_IN_SIZE) {
+-        error_report("no room for data: pos %u +  size %d > %" PRId64 "."
++        error_report("no room for data: pos %u +  size %zu > %" PRId64 "."
+                      " dropping connection.",
+                      card->vscard_in_pos, size, VSCARD_IN_SIZE);
+         ccid_card_vscard_drop_connection(card);
+diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
+index 19e1933f0..8d760f3fa 100644
+--- a/hw/usb/dev-serial.c
++++ b/hw/usb/dev-serial.c
+@@ -524,7 +524,7 @@ static int usb_serial_can_read(void *opaque)
+     return RECV_BUF - s->recv_used;
+ }
+ 
+-static void usb_serial_read(void *opaque, const uint8_t *buf, int size)
++static void usb_serial_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     USBSerialState *s = opaque;
+     int first_size, start;
+diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
+index 3238de6bb..e60b2ab25 100644
+--- a/hw/usb/redirect.c
++++ b/hw/usb/redirect.c
+@@ -1351,7 +1351,8 @@ static int usbredir_chardev_can_read(void *opaque)
+     return 1 * MiB;
+ }
+ 
+-static void usbredir_chardev_read(void *opaque, const uint8_t *buf, int size)
++static void usbredir_chardev_read(void *opaque, const uint8_t *buf, size_t
++size)
+ {
+     USBRedirDevice *dev = opaque;
+ 
+diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
+index d6892fd20..5de3d7d61 100644
+--- a/include/qemu/main-loop.h
++++ b/include/qemu/main-loop.h
+@@ -167,7 +167,7 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque);
+ 
+ /* async I/O support */
+ 
+-typedef void IOReadHandler(void *opaque, const uint8_t *buf, int size);
++typedef void IOReadHandler(void *opaque, const uint8_t *buf, size_t size);
+ 
+ /**
+  * IOCanReadHandler: Return the number of bytes that #IOReadHandler can accept
+diff --git a/monitor/hmp.c b/monitor/hmp.c
+index 120423399..3b0301a4e 100644
+--- a/monitor/hmp.c
++++ b/monitor/hmp.c
+@@ -1330,7 +1330,7 @@ cleanup:
+     free_cmdline_args(args, nb_args);
+ }
+ 
+-static void monitor_read(void *opaque, const uint8_t *buf, int size)
++static void monitor_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     MonitorHMP *mon = container_of(opaque, MonitorHMP, common);
+     int i;
+diff --git a/monitor/qmp.c b/monitor/qmp.c
+index b42f8c6af..6ce2f777f 100644
+--- a/monitor/qmp.c
++++ b/monitor/qmp.c
+@@ -368,7 +368,7 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
+     }
+ }
+ 
+-static void monitor_qmp_read(void *opaque, const uint8_t *buf, int size)
++static void monitor_qmp_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     MonitorQMP *mon = opaque;
+ 
+diff --git a/net/colo-compare.c b/net/colo-compare.c
+index 337025b44..342283cbe 100644
+--- a/net/colo-compare.c
++++ b/net/colo-compare.c
+@@ -854,7 +854,7 @@ static int compare_chr_can_read(void *opaque)
+  * Called from the main thread on the primary for packets
+  * arriving over the socket from the primary.
+  */
+-static void compare_pri_chr_in(void *opaque, const uint8_t *buf, int size)
++static void compare_pri_chr_in(void *opaque, const uint8_t *buf, size_t size)
+ {
+     CompareState *s = COLO_COMPARE(opaque);
+     int ret;
+@@ -871,7 +871,7 @@ static void compare_pri_chr_in(void *opaque, const uint8_t *buf, int size)
+  * Called from the main thread on the primary for packets
+  * arriving over the socket from the secondary.
+  */
+-static void compare_sec_chr_in(void *opaque, const uint8_t *buf, int size)
++static void compare_sec_chr_in(void *opaque, const uint8_t *buf, size_t size)
+ {
+     CompareState *s = COLO_COMPARE(opaque);
+     int ret;
+diff --git a/net/filter-mirror.c b/net/filter-mirror.c
+index 088d4dcac..001ba9316 100644
+--- a/net/filter-mirror.c
++++ b/net/filter-mirror.c
+@@ -119,7 +119,7 @@ static int redirector_chr_can_read(void *opaque)
+     return REDIRECTOR_MAX_LEN;
+ }
+ 
+-static void redirector_chr_read(void *opaque, const uint8_t *buf, int size)
++static void redirector_chr_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     NetFilterState *nf = opaque;
+     MirrorState *s = FILTER_REDIRECTOR(nf);
+diff --git a/net/slirp.c b/net/slirp.c
+index 77042e6df..a4a8f1450 100644
+--- a/net/slirp.c
++++ b/net/slirp.c
+@@ -908,7 +908,7 @@ static int guestfwd_can_read(void *opaque)
+     return slirp_socket_can_recv(fwd->slirp, fwd->server, fwd->port);
+ }
+ 
+-static void guestfwd_read(void *opaque, const uint8_t *buf, int size)
++static void guestfwd_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     struct GuestFwd *fwd = opaque;
+     slirp_socket_recv(fwd->slirp, fwd->server, fwd->port, buf, size);
+diff --git a/softmmu/qtest.c b/softmmu/qtest.c
+index 7965dc9a1..2312c9f81 100644
+--- a/softmmu/qtest.c
++++ b/softmmu/qtest.c
+@@ -801,7 +801,7 @@ static void qtest_process_inbuf(CharBackend *chr, GString *inbuf)
+     }
+ }
+ 
+-static void qtest_read(void *opaque, const uint8_t *buf, int size)
++static void qtest_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     CharBackend *chr = opaque;
+ 
+diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
+index 25f57a650..ffbbe4624 100644
+--- a/target/xtensa/xtensa-semi.c
++++ b/target/xtensa/xtensa-semi.c
+@@ -169,7 +169,7 @@ static int sim_console_can_read(void *opaque)
+ }
+ 
+ static IOReadHandler sim_console_read;
+-static void sim_console_read(void *opaque, const uint8_t *buf, int size)
++static void sim_console_read(void *opaque, const uint8_t *buf, size_t size)
+ {
+     XtensaSimConsole *p = opaque;
+     size_t copy = sizeof(p->input.buffer) - p->input.offset;
+-- 
+2.25.1
+
-- 
2.25.1




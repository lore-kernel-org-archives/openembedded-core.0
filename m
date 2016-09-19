Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0AACC7002B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 06:29:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8J6TPm0017791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 23:29:26 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Sep 2016 23:29:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Sep 2016 23:29:24 -0700
Message-ID: <5fb5e3dab0102991f20d961a230157a2ff8358ff.1474266271.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474266271.git.liezhi.yang@windriver.com>
References: <cover.1474266271.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemuppc.conf: adjust kernel console
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
X-List-Received-Date: Mon, 19 Sep 2016 06:29:26 -0000
Content-Type: text/plain

Fixed kernel trace when booting:
[   12.825809] random: crng init done
[   13.918323] irq 36: nobody cared (try booting with the "irqpoll" option)
[   13.924821] CPU: 0 PID: 335 Comm: getty Not tainted 4.8.0-rc5-yocto-standard #1
[   13.930492] Call Trace:
[   13.936214] [cff73f20] [c00790f0] __report_bad_irq.isra.0+0x3c/0x128 (unreliable)
[   13.941908] [cff73f40] [c0079518] note_interrupt+0x2b8/0x304
[   13.947265] [cff73f70] [c00766f4] handle_irq_event_percpu+0x5c/0x74
[   13.952503] [cff73f90] [c0076768] handle_irq_event+0x5c/0xdc
[   13.957667] [cff73fa0] [c007a29c] handle_fasteoi_irq+0xdc/0x234
[   13.962984] [cff73fc0] [c007592c] generic_handle_irq+0x3c/0x58
[   13.968288] [cff73fd0] [c0006c74] __do_irq+0x54/0x18c
[   13.973612] [cff73ff0] [c000f9c8] call_do_irq+0x24/0x3c
[   13.978742] [cf0cdb70] [c0006e40] do_IRQ+0x94/0x110
[   13.983992] [cf0cdba0] [c001215c] ret_from_except+0x0/0x14
[   13.989281] --- interrupt: 501 at pmz_set_termios+0x130/0x6d8
[   13.989281]     LR = pmz_set_termios+0xf0/0x6d8
[   13.999353] [cf0cdc90] [c049f130] uart_change_speed.isra.2+0x60/0x168
[   14.004436] [cf0cdcb0] [c049fdbc] uart_startup.part.8+0xec/0x1e0
[   14.009625] [cf0cdce0] [c04a0ab4] uart_open+0x138/0x16c
[   14.014723] [cf0cdd00] [c047e510] tty_open+0x118/0x65c
[   14.019743] [cf0cdd60] [c01894c8] chrdev_open+0xdc/0x1e0
[   14.024616] [cf0cdd90] [c01807d0] do_dentry_open+0x23c/0x358
[   14.029418] [cf0cddc0] [c0194878] path_openat+0x58c/0x1084
[   14.034054] [cf0cde50] [c01965b4] do_filp_open+0xbc/0x10c
[   14.038539] [cf0cdf00] [c01822fc] do_sys_open+0x154/0x224
[   14.043105] [cf0cdf40] [c0011a44] ret_from_syscall+0x0/0x38
[   14.047828] --- interrupt: c01 at 0xfeef5a0
[   14.047828]     LR = 0xfeef544
[   14.056543] handlers:
[   14.060980] [<c04a2b10>] pmz_interrupt
[   14.065468] Disabling IRQ #36

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/qemuppc.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index e4c8dac..e54c3dd 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -15,6 +15,6 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 QB_SYSTEM_NAME = "qemu-system-ppc"
 QB_MACHINE = "-machine mac99"
 QB_CPU = "-cpu G4"
-QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
+QB_KERNEL_CMDLINE_APPEND = "console=tty console=ttyS0"
 QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-pci,netdev=net0,mac=@MAC@"
-- 
2.9.0



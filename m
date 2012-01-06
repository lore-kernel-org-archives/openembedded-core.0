Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liming.wang@windriver.com>) id 1Rj5Lo-00069H-VR
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 09:40:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q068XC6k023118
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 00:33:12 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 6 Jan 2012 00:33:12 -0800
From: Liming Wang <liming.wang@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 6 Jan 2012 16:32:56 +0800
Message-ID: <1325838776-13150-2-git-send-email-liming.wang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1325838776-13150-1-git-send-email-liming.wang@windriver.com>
References: <1325838776-13150-1-git-send-email-liming.wang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] meta/qemuppc: replace kernel config file of qemu-ppc32 with mac99
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2012 08:40:37 -0000
Content-Type: text/plain

Repalce emulation of qemuppc from prep to mac99. Also add
qemu-ppc32-gfx.cfg file to support framebuffer and touchscreen.

Signed-off-by: Liming Wang <liming.wang@windriver.com>
---
 .../kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg |   11 +++++
 .../cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.cfg |   42 +++++++++++++++----
 .../cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.scc |    1 +
 3 files changed, 45 insertions(+), 9 deletions(-)
 create mode 100644 meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg

diff --git a/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg b/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg
new file mode 100644
index 0000000..5fee67f
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg
@@ -0,0 +1,11 @@
+CONFIG_VGA_ARB=y
+CONFIG_FB=y
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+CONFIG_FB_OF=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+
+CONFIG_INPUT_TABLET=y
+CONFIG_TABLET_USB_WACOM=y
+CONFIG_INPUT_MISC=y
diff --git a/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.cfg b/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.cfg
index f6648f5..2b9d68d 100644
--- a/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.cfg
+++ b/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.cfg
@@ -11,20 +11,44 @@
 #.........................................................................
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
-CONFIG_PPC_QEMU=y
-CONFIG_ISA=y
+CONFIG_PPC_PMAC=y
 # CONFIG_PNP is not set
 CONFIG_MII=y
-CONFIG_NET_ISA=y
-CONFIG_NE2000=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_PCI=y
-CONFIG_SERIAL_8250_NR_UARTS=4
-CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+CONFIG_PCNET32=y
+CONFIG_NE2K_PCI=y
+CONFIG_MACE=y
+CONFIG_BMAC=y
+
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_SERIAL_PMACZILOG=y
+CONFIG_SERIAL_PMACZILOG_TTYS=y
+CONFIG_SERIAL_PMACZILOG_CONSOLE=y
 
 CONFIG_IDE=y
 CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_IDEPCI=y
+CONFIG_BLK_DEV_IDEDMA_PCI=y
+CONFIG_BLK_DEV_IDE_PMAC=y
+CONFIG_BLK_DEV_IDEDMA=y
+
+CONFIG_ADB=y
+CONFIG_ADB_CUDA=y
+CONFIG_INPUT_ADBHID=y
+
+CONFIG_INPUT_KEYBOARD=y
+CONFIG_INPUT_MOUSE=y
+
+CONFIG_USB=y
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_MON=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_STORAGE=m
+
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIO=y
+# CONFIG_SERIO_SERPORT is not set
+
 
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=y
diff --git a/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.scc b/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.scc
index 859329d..43f9dc6 100644
--- a/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.scc
+++ b/meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.scc
@@ -1,4 +1,5 @@
 kconf hardware qemu-ppc32.cfg
+kconf hardware qemu-ppc32-gfx.cfg
 
 include features/profiling/profiling.scc
 include features/latencytop/latencytop.scc
-- 
1.7.5.4




Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 167A4760B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 07:52:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7M7qrTr017629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 00:52:53 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 00:52:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 00:52:42 -0700
Message-ID: <261b0852400affc22f9eb9176d35e131336ea401.1471850849.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471850849.git.liezhi.yang@windriver.com>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4 05/11] qemumips/qemumips64.conf: set vars for runqemu
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
X-List-Received-Date: Mon, 22 Aug 2016 07:52:53 -0000
Content-Type: text/plain

Add qemuboot-mips.inc to reduce duplicated code, the various mips bsps
which can be boot by runqemu can require qemuboot-mips.inc

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/qemuboot-mips.inc | 7 +++++++
 meta/conf/machine/qemumips.conf             | 1 +
 meta/conf/machine/qemumips64.conf           | 1 +
 3 files changed, 9 insertions(+)
 create mode 100644 meta/conf/machine/include/qemuboot-mips.inc

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
new file mode 100644
index 0000000..0f04b81
--- /dev/null
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -0,0 +1,7 @@
+# For runqemu
+IMAGE_CLASSES += "qemuboot"
+QB_MEM = "-m 256"
+QB_MACHINE = "-machine malta"
+QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
+QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -usbdevice tablet"
+QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index fbf8137..3182ea1 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -4,6 +4,7 @@
 
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-mips32r2.inc
+require conf/machine/include/qemuboot-mips.inc
 
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index 8c3f1fe..9529f4c 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -4,6 +4,7 @@
 
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-mips64.inc
+require conf/machine/include/qemuboot-mips.inc
 
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
-- 
2.9.0



Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEE67D70B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 02:45:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7K2jpiG023665
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 19:45:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 19 Aug 2019 19:45:45 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2019 10:45:44 +0800
Message-ID: <1566269144-308702-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] qemumips/qemumips64: move QB_SYSTEM_NAME to corresponding conf
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
X-List-Received-Date: Tue, 20 Aug 2019 02:45:51 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Configuration:
MACHINE = qemumips64

bitbake lib32-core-image-minimal
runqemu slirp nographic qemumips64 ext4

Error:
ERROR - Failed to run qemu: qemu-system-mips: unable to find CPU model 'MIPS64R2-generic'

Fixed by moving QB_SYSTEM_NAME to Respective configuration file

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/machine/include/qemuboot-mips.inc | 1 -
 meta/conf/machine/qemumips.conf             | 2 ++
 meta/conf/machine/qemumips64.conf           | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 75bb988..a5f9ed8 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -6,4 +6,3 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
 QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 48d9f41..31ad754 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -10,3 +10,5 @@ KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
+
+QB_SYSTEM_NAME = "qemu-system-mips"
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index 1872e7b..6d51746 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -12,3 +12,5 @@ KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
+
+QB_SYSTEM_NAME = "qemu-system-mips64"
-- 
2.7.4



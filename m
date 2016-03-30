Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9136FEFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 12:25:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2UCPDn6026647
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:25:13 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 05:25:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 08:25:02 -0400
Message-ID: <36283d1e201295d9da555478c4b72b59f3ac4d53.1459340441.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459340441.git.bruce.ashfield@windriver.com>
References: <cover.1459340441.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] linux-yocto/4.1: i2c: designware: Backport i2c patches
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
X-List-Received-Date: Wed, 30 Mar 2016 12:25:12 -0000
Content-Type: text/plain

To enable Apollo Lake/Broxton, we backport the following changes:

da451824f75f i2c: designware: Convert to use unified device property API
58b1b5365f4a i2c: designware: Do not require clock when SSCN and FFCN are provided
8995091cfa0f i2c: designware: retry transfer on transient failure
1fc62907f84e i2c: designware: Move common probe code into i2c_dw_probe()
678110c0f2b8 i2c: designware: Rename platform driver probe and PM functions
c51c2e104d40 i2c: designware: Make dw_readl() and dw_writel() static
98d2b6e244ad i2c: designware: Remove unused functions
3d04c6e99652 i2c: designware: Disable interrupts before requesting PCI device interrupt
fb5b7be0fbe7 i2c: designware: Remove interrupt clearing from i2c_dw_pci_probe()
d48fd08b11c8 i2c: designware: Make debug print in i2c_dw_isr() shorter
28f94bc07450 i2c: designware-pci: use IRQF_COND_SUSPEND flag 95f494846fc1 i2c: designware: Avoid unnecessary resuming during system suspend
fb2ae3705a3a i2c: dw: Add APM X-Gene ACPI I2C device support
516a0fc91e00 i2c: designware: Add support for AMD Seattle I2C
874d63b3c95c i2c: designware: fix IO timeout issue for AMD controller
47543e80c6dd i2c: designware: reverts "i2c: designware: Add support for AMD I2C controller"
076fe383c4b5 i2c: designware: use to_pci_dev()

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 15a63fc445e9..ccfe4038e9ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "b0b9b44cd66a067ac026b2a3db764d1e9b4dbb30"
+SRCREV_machine ?= "8c760c408f9333ca9ec8e47e5260bc8446ed3aa7"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 9dca92287cdd..1f516e038d08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "630b726098c95111a41336de04a5b7e201b012e9"
+SRCREV_machine ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 01708ddcc540..87baa625b63a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1582fc5caa4957ef6a1349c0ae4178c2846c1af1"
-SRCREV_machine_qemuarm64 ?= "630b726098c95111a41336de04a5b7e201b012e9"
-SRCREV_machine_qemumips ?= "9406ef8745f90c401e3551f45e2945d1f7408327"
-SRCREV_machine_qemuppc ?= "630b726098c95111a41336de04a5b7e201b012e9"
-SRCREV_machine_qemux86 ?= "630b726098c95111a41336de04a5b7e201b012e9"
-SRCREV_machine_qemux86-64 ?= "630b726098c95111a41336de04a5b7e201b012e9"
-SRCREV_machine_qemumips64 ?= "c29ac79ffc2957612e789ac7a5fe4919f99bf99f"
-SRCREV_machine ?= "630b726098c95111a41336de04a5b7e201b012e9"
+SRCREV_machine_qemuarm ?= "196e7ddacccbf85cc05123f40a2235ac5e7ffa38"
+SRCREV_machine_qemuarm64 ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
+SRCREV_machine_qemumips ?= "4fafbdad6385ca1ba8bd3ac98a607a0b11af4a4b"
+SRCREV_machine_qemuppc ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
+SRCREV_machine_qemux86 ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
+SRCREV_machine_qemux86-64 ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
+SRCREV_machine_qemumips64 ?= "4a22137cfe0ed14f15e1ddbae1064959f2e512bc"
+SRCREV_machine ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0



Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TYejd-00088f-Hw
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:18:37 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAEF343I022189;
	Wed, 14 Nov 2012 07:03:06 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Nov 2012 10:02:58 -0500
Message-Id: <f5a506a10be164f9160b6b840614e6f9b8b8c3da.1352840087.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, Rahul.Saxena@intel.com,
	dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto/3.4: efi/mmc fixes and fri2 updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 15:18:38 -0000

Updating the 3.4 SRCREVs to pick up the following two fixes:

 218bd8d efi: Add patch to fix 32bit EFI service mapping (rhbz 726701)
 b6d08f7 mmc: sdhci: Use DBG() instead of pr_warning() on large timeout

And the following meta branch config updates:

 68a635b fri2: Disable GPIO_PCH for preempt-rt
 2ec32d5 fri2: Add fri2-tiny support
 a7b9607 fri2: Required boot config for fri2
 bed2080 fri2: Remove graphics options from the core fri2 description

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    5 ++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   14 +++++++-------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index bbac322..bdbecf4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,9 +8,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "5705c8037d2c47938034ead87c70ae3ebef552f7"
-SRCREV_machine_qemuppc ?= "c8b651aab5d2d5c0839cdedc0c0ec5dc09cf47c0"
-SRCREV_meta ?= "0541ba5f98f31419e9bdfec895c18029bf424e7c"
+SRCREV_machine ?= "fb596148058bf5e7ef550a040d143bdfbf4146b0"
+SRCREV_machine_qemuppc ?= "b24ede45575d58ace08633f0e8fd31b594c5c80e"
+SRCREV_meta ?= "68a635bf8dfb64b02263c1ac80c948647cc76d5f"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index e1d349d..772cfef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -12,9 +12,8 @@ LINUX_VERSION ?= "3.4.11"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "449f7f520350700858f21a5554b81cc8ad23267d"
-SRCREV_meta ?= "0541ba5f98f31419e9bdfec895c18029bf424e7c"
-
+SRCREV_machine ?= "218bd8d2022b9852c60d32f0d770931e3cf343e2"
+SRCREV_meta ?= "68a635bf8dfb64b02263c1ac80c948647cc76d5f"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 904e79e..22593c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "8ee53c3b82ada3cdfd7d25f07d3975834ac9a9b2"
-SRCREV_machine_qemumips  ?= "caf99a20e3c3ba036ed1bb46875059a0d24e4fbd"
-SRCREV_machine_qemuppc ?= "7833f1549c3d44cce8aea38b65cd501229aad492"
-SRCREV_machine_qemux86 ?= "449f7f520350700858f21a5554b81cc8ad23267d"
-SRCREV_machine_qemux86-64 ?= "449f7f520350700858f21a5554b81cc8ad23267d"
-SRCREV_machine ?= "449f7f520350700858f21a5554b81cc8ad23267d"
-SRCREV_meta ?= "0541ba5f98f31419e9bdfec895c18029bf424e7c"
+SRCREV_machine_qemuarm ?= "cec289be595a5889740ad4f0a58d12579f528d5e"
+SRCREV_machine_qemumips  ?= "01ab58eb9dc64ceccb2d7be80ef4a511479fc899"
+SRCREV_machine_qemuppc ?= "c820da3c7fa5176507c116352ee3bd1e682f36bd"
+SRCREV_machine_qemux86 ?= "218bd8d2022b9852c60d32f0d770931e3cf343e2"
+SRCREV_machine_qemux86-64 ?= "218bd8d2022b9852c60d32f0d770931e3cf343e2"
+SRCREV_machine ?= "218bd8d2022b9852c60d32f0d770931e3cf343e2"
+SRCREV_meta ?= "68a635bf8dfb64b02263c1ac80c948647cc76d5f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.10.4




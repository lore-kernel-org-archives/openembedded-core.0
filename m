Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F05F6FF9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 12:25:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2UCPEUb002468
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:25:14 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 05:25:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 08:25:03 -0400
Message-ID: <b846e9b9a6d93dbb6ccd77bb82b35181eaf1c006.1459340441.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459340441.git.bruce.ashfield@windriver.com>
References: <cover.1459340441.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] linux-yocto/4.1: Apollo Lake/Broxton mmc backports
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
X-List-Received-Date: Wed, 30 Mar 2016 12:25:13 -0000
Content-Type: text/plain

Backporting the following commits:

2b0cc0f0ca23 mmc: It is not an error for the card to be removed while suspended
67903c1f4c77 mmc: sdhci: 64-bit DMA actually has 4-byte alignment
4e434f483381 mmc: sdhci: Do not BUG on invalid vdd
05be442eb234 mmc: mmc: Fix incorrect use of driver strength switching HS200 and HS400
97a5f396dca6 mmc: core: Make runtime resume default behavior for MMC/SD
b6ee1ac07f14 mmc: mmc: Improve reliability of mmc_select_hs400()
45de48ce0b3c mmc: mmc: Move mmc_switch_status()
9d6aaaa0f6b7 mmc: mmc: Fix HS setting in mmc_select_hs400()
d7795de930c5 mmc: mmc: Improve reliability of mmc_select_hs200()
ac98e33a088d mmc: sdhci-acpi: Add more ACPI HIDs for Intel controllers
87f52cce8123 mmc: sdhci-pci: Add more PCI IDs for Intel controllers
cf3a4d2d4c7d mmc: sdhci-pci: Add another PCI ID for an Intel eMMC host controller
b3ef45585504 mmc: sdhci-pci: Build o2micro support in the same module
b32a4e71f49d mmc: sdhci: enable tuning for DDR50
f8e213bee1e1 mmc: sdhci: call sdhci_init() before request irq
ece0925eb94e mmc: sdhci-pci: Enable HS400 for some Intel host controllers
1c01bcdceaf6 mmc: sdhci-pci: Add support for drive strength selection for SPT
c1d6e92915a9 mmc: sdhci: Add a callback to select drive strength
40deb3ac3331 mmc: mmc: Add driver strength selection
e7d602f5992f mmc: mmc: Read card's valid driver strength mask
bc193a886571 mmc: core: Record card drive strength
a548d3993cc8 mmc: core: Factor out common code in drive strength selection
6713f5cf3164 mmc: core: Add 'card' to drive strength selection callback
852e6bd69b77 mmc: core: Simplify card drive strength mask
0bb40266bbb9 mmc: core: Allow card drive strength to be different to host
940d30f1a212 mmc: core: Reset driver type to default
efbc6ba8cd27 mmc: cast u8 to unsigned long long to avoid unexpected error
bafe0e5beba9 mmc: core: Don't print reset warning if reset is not supported
5b2789151852 mmc: block: Retry errored data requests when re-tuning is needed
d14211a4b2fe mmc: block: Check re-tuning in the recovery path
1ff15c648159 mmc: core: Flag re-tuning is needed on CRC errors
12544ee1cdbb mmc: sdhci: Change to new way of doing re-tuning
995073b182f7 mmc: core: Add support for HS400 re-tuning
53a0d731e824 mmc: core: Separate out the mmc_switch status check so it can be re-used
d3f59f108bf7 mmc: mmc: Hold re-tuning in mmc_sleep()
465db9504a27 mmc: core: Hold re-tuning while bkops ongoing
60cacf85ee10 mmc: core: Hold re-tuning during erase commands
5bd43535f4c1 mmc: core: Hold re-tuning during switch commands
4baa45ff8d15 mmc: core: Add support for re-tuning before each request
cd2ca27f9282 mmc: core: Enable / disable re-tuning
65723236b746 mmc: host: Add facility to support re-tuning

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index ccfe4038e9ea..2b52aa56f2bf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "8c760c408f9333ca9ec8e47e5260bc8446ed3aa7"
+SRCREV_machine ?= "6b39da48a67a738eca3024c86ff977d5b6ba02dd"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 1f516e038d08..3361b1787a44 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
+SRCREV_machine ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 87baa625b63a..72cca01e2a90 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "196e7ddacccbf85cc05123f40a2235ac5e7ffa38"
-SRCREV_machine_qemuarm64 ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
-SRCREV_machine_qemumips ?= "4fafbdad6385ca1ba8bd3ac98a607a0b11af4a4b"
-SRCREV_machine_qemuppc ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
-SRCREV_machine_qemux86 ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
-SRCREV_machine_qemux86-64 ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
-SRCREV_machine_qemumips64 ?= "4a22137cfe0ed14f15e1ddbae1064959f2e512bc"
-SRCREV_machine ?= "da451824f75f47a44203c63bed245c8ead8f5fcd"
+SRCREV_machine_qemuarm ?= "6213179ad1ff33d166b57c080db39ec7f0f5caff"
+SRCREV_machine_qemuarm64 ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
+SRCREV_machine_qemumips ?= "31411f4bccac5574a1be7c3e34f9f7ca25306bb1"
+SRCREV_machine_qemuppc ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
+SRCREV_machine_qemux86 ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
+SRCREV_machine_qemux86-64 ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
+SRCREV_machine_qemumips64 ?= "556291afe538f9d31d707661bea5054a9af2add9"
+SRCREV_machine ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0



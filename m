Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48FAE70149
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:53:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u44HrOi1003331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 May 2016 10:53:24 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 4 May 2016 10:53:23 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 May 2016 13:53:10 -0400
Message-ID: <01caf74fb2c479436b3d560dfd13f0d8c22c7eaa.1462383941.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1462383941.git.bruce.ashfield@windriver.com>
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] linux-yocto/4.4: BXT mmc fixes + PUNIT, tubropower, and telemetry backport
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
X-List-Received-Date: Wed, 04 May 2016 17:53:24 -0000
Content-Type: text/plain

Integrating the following mainline (or mainline destined) patches to
support Intel Broxton:

076cc85486fd mmc: sdhci-acpi: Set MMC_CAP_AGGRESSIVE_PM for Broxton controllers
5d9c3aba78a1 mmc: sdhci-pci: Remove redundant runtime PM calls
aa0cd9a58d54 mmc: sdhci: Fix sdhci_runtime_pm_bus_on/off()
f47597d00af0 mmc: sdhci: 64-bit DMA actually has 4-byte alignment
a052a0703aed mmc: sdhci: Fix DMA descriptor with zero data length
f9200dd4bfec mmc: sdio: Fix invalid vdd in voltage switch power cycle
7bbf49488269 mmc: sdhci: Do not BUG on invalid vdd
39fde8b630a6 tools/power turbostat: decode BXT TSC frequency via CPUID
2b4b633da512 tools/power turbostat: initial BXT support
ee708ab5b74e intel_telemetry_debugfs: Fix unused warnings in telemetry debugfs
3053465d066b intel_telemetry_pltdrv: Change verbosity control bits
4c7732ec34bf platform:x86: Add Intel Telemetry Debugfs interfaces
401915397ddc platform:x86: Add Intel telemetry platform driver
eaaee25ac936 platform/x86: Add Intel Telemetry Core Driver
44c969c62726 platform:x86 decouple telemetry driver from the optional IPC resources
a6a2ecaf9980 platform:x86: Add Intel telemetry platform device
e1f16b86eab0 intel_pmc_ipc: Avoid pending IPC1 command during legacy suspend
ae91be46eb0d intel_pmc_ipc: Fix GCR register base address and length
3e15c1b19c81 intel_pmc_ipc: update acpi resource structure for Punit
5ec614cfd985 intel_punit_ipc: add NULL check for input parameters
4c3f01b178db platform:x86: add Intel P-Unit mailbox IPC driver
4826dbaac15f usb: dwc3: pci: add ID for one more Intel Broxton platform

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index cc94f230c3a7..d06f12ecb414 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "2c4d23062464d6decf8b43b27d011f7b124243c6"
+SRCREV_machine ?= "fcabc089b516e760d00a066893f9772d1535785c"
 SRCREV_meta ?= "e1515ef98cec975df218363e28c2abe3a71c6a59"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index dd07c4b98a6a..d8137da215a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
+SRCREV_machine ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
 SRCREV_meta ?= "e1515ef98cec975df218363e28c2abe3a71c6a59"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index ed1d04edb7bb..f81e3aee7f4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8f6d6325fdb8c561804af8c13456e372d6bd3b5b"
-SRCREV_machine_qemuarm64 ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
-SRCREV_machine_qemumips ?= "4bf7bd3c7df18f51bf422f625f1a6650bb456abd"
-SRCREV_machine_qemuppc ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
-SRCREV_machine_qemux86 ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
-SRCREV_machine_qemux86-64 ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
-SRCREV_machine_qemumips64 ?= "91c6f056a0fd3bada9f67c0276107b37fd3f6846"
-SRCREV_machine ?= "7a073202d4d47b5ffecf1e8f57b036f83b1fe2e0"
+SRCREV_machine_qemuarm ?= "1882e842bd477d8a4de02e304a13d230b597d142"
+SRCREV_machine_qemuarm64 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
+SRCREV_machine_qemumips ?= "3d1402582cd48731ccfaec497dd9296a59cda386"
+SRCREV_machine_qemuppc ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
+SRCREV_machine_qemux86 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
+SRCREV_machine_qemux86-64 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
+SRCREV_machine_qemumips64 ?= "6519e6317cc72e380bc1b7543e614ac0032a80ae"
+SRCREV_machine ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
 SRCREV_meta ?= "e1515ef98cec975df218363e28c2abe3a71c6a59"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0



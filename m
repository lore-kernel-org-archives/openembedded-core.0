Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TfGdz-0003c5-5o
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Dec 2012 22:00:07 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so1220094pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2012 12:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=RmFdW15xq2TF3LOHCTWpdtleYsQu5VMdfbZ0tRdZbnA=;
	b=RUAv4PSA+1jiw0K3x2v0F8PrMcHaQzVe4PF8BRRc39vky5DH4jt9zTYTld7PnSGUkD
	9A0xjpa8wfQOiJ37TzEbqJgGMD657f5W7k8aXTpG20RSLgeCCyXlzr1ZJY/NP5Zo3lbk
	iBlkEVZS1OHoVbZmOHyGaLY2fvsy468+UhhoMx9QK8sdD+6Ji4IGoRpLe7tw6A7KJj2t
	cZlsgtXN+cn/7wpQ+Hu/QSzpWAQLFC5PFiiiR7/e2Cxl7Vt0fJZ20sW2hTYU2eh9nPmR
	Ycka+rfmsZIIjghsofEJzd4TjaOrYwqtePbG1L5c2GWsKfyhHdRQO4O4G4uk6M9Ydmld
	ml9Q==
Received: by 10.68.216.73 with SMTP id oo9mr23573270pbc.80.1354481148815;
	Sun, 02 Dec 2012 12:45:48 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id vx2sm5128699pbc.33.2012.12.02.12.45.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Dec 2012 12:45:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2012 12:45:05 -0800
Message-Id: <59c6eb39edcf9308a81c9ad84f248e30e526f6ba.1354480962.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354480962.git.raj.khem@gmail.com>
References: <cover.1354480962.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Sun, 02 Dec 2012 21:00:07 -0000

kernel compiler is not special and we currently have it so
we want to pass -march and -mtune options as CFLAGS to kernel
build so that compiler picks the right subarch flags when
compiling assembly files in particular. Otherwise defaults
are chosen which may not be right in many case e.g. when
compiling kernel for collie machine we should use arch=armv4
but it uses toolchain/as defaults which is armv5te

in some case e.g. thumb1 we know that kernel can not be compiled
in thumb1 mode so we can provide that information e.g. -marm
option through KERNEL_HOST_CC_ARCH variable as we do now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel-arch.bbclass |   13 +++++++++++++
 meta/classes/kernel.bbclass      |   16 +---------------
 meta/classes/module-base.bbclass |   16 ----------------
 3 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index b3b78b6..a51e82b 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -43,3 +43,16 @@ def map_uboot_arch(a, d):
 
 export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
 
+# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
+# specific options necessary for building the kernel and modules.
+TARGET_CC_KERNEL_ARCH ?= ""
+HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
+TARGET_LD_KERNEL_ARCH ?= ""
+HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
+TARGET_AR_KERNEL_ARCH ?= ""
+HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
+
+KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
+KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR = "${AR} ${HOST_AR_KERNEL_ARCH}"
+
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8e13662..085b7c1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native update-modules"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
@@ -37,20 +37,6 @@ KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
-KERNEL_CCSUFFIX ?= ""
-KERNEL_LDSUFFIX ?= ""
-
-# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
-# specific options necessary for building the kernel and modules.
-#FIXME: should be this: TARGET_CC_KERNEL_ARCH ?= "${TARGET_CC_ARCH}"
-TARGET_CC_KERNEL_ARCH ?= ""
-HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
-TARGET_LD_KERNEL_ARCH ?= ""
-HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
-
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
-KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
-
 # Where built kernel lies in the kernel tree
 KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
 KERNEL_IMAGEDEST = "boot"
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 210c47c..cfee50a 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -7,22 +7,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
 KERNEL_OBJECT_SUFFIX = ".ko"
-KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
-KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"
-KERNEL_ARSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-arsuffix')}"
-
-# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
-# specific options necessary for building the kernel and modules.
-TARGET_CC_KERNEL_ARCH ?= ""
-HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
-TARGET_LD_KERNEL_ARCH ?= ""
-HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
-TARGET_AR_KERNEL_ARCH ?= ""
-HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
-
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}"
-KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR = "${HOST_PREFIX}ar${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
 
 # kernel modules are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.9.5




Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QS2xI-0006YL-Rs
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:08:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jun 2011 01:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; 
   d="scan'208";a="5775226"
Received: from unknown (HELO swold-MOBL.nomadix.com) ([10.255.12.203])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 01:05:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 01:05:04 -0700
Message-Id: <f64980f72be8fa7dfe648f40fc6f886190d05f95.1307001679.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [CONSOLIDATED PULL 05/12] u-boot: package up u-boot.bin for field upgrades
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
X-List-Received-Date: Thu, 02 Jun 2011 08:08:37 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-bsp/uboot/u-boot.inc        |   11 +++++++++++
 meta/recipes-bsp/uboot/u-boot_2011.03.bb |    2 +-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/uboot/u-boot.inc b/meta/recipes-bsp/uboot/u-boot.inc
index 83dfb6f..2be9fc9 100644
--- a/meta/recipes-bsp/uboot/u-boot.inc
+++ b/meta/recipes-bsp/uboot/u-boot.inc
@@ -21,6 +21,7 @@ python () {
 }
 
 UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
+UBOOT_BINARY ?= "u-boot.bin"
 UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
 UBOOT_MAKE_TARGET ?= "all"
 
@@ -32,6 +33,16 @@ do_compile () {
 	oe_runmake ${UBOOT_MAKE_TARGET}
 }
 
+do_install () {
+    install -d ${D}/boot
+    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+FILES_${PN} = "/boot"
+# no gnu_hash in uboot.bin, by design, so skip QA
+INSANE_SKIP_${PN} = True
+
 do_deploy () {
 	install ${S}/u-boot.bin ${DEPLOYDIR}/${UBOOT_IMAGE}
 
diff --git a/meta/recipes-bsp/uboot/u-boot_2011.03.bb b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
index 0fbb9ba..07f0609 100644
--- a/meta/recipes-bsp/uboot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
@@ -14,7 +14,7 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-git/${MACHINE
 
 SRCREV = "v2011.03"
 PV = "v2011.03+git${SRCPV}"
-PR="r3"
+PR="r4"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-- 
1.7.3.4




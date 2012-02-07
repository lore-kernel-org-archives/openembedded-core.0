Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvK-0004HU-7r
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:08 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206385"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:31 -0800
Message-Id: <2965aa2faaccce43f6c3e451c0a2ded3734766e4.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/35] u-boot inc: update inc file for newer u-boot versions
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:09 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* Add support for different suffixes found with later u-boot
  versions which have switched from .bin to .img
* Allow recipes that include u-boot.inc to also package an
  SPL if they build one.
    * Minimum requirement is to set the SPL_BINARY value to add
      the SPL to the u-boot package as well as into the deploy
      directory.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc |   35 +++++++++++++++++++++++++++++++----
 1 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 4180345..700d5d3 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -19,11 +19,22 @@ python () {
 		raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
 }
 
-UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
-UBOOT_BINARY ?= "u-boot.bin"
-UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
+# Some versions of u-boot use .bin and others use .img.  By default use .bin
+# but enable individual recipes to change this value.
+UBOOT_SUFFIX ?= "bin"
+UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
 UBOOT_MAKE_TARGET ?= "all"
 
+# Some versions of u-boot build an SPL (Second Program Loader) image that
+# should be packaged along with the u-boot binary as well as placed in the
+# deploy directory.  For those versions they can set the following variables
+# to allow packaging the SPL.
+SPL_BINARY ?= ""
+SPL_IMAGE ?= "${SPL_BINARY}-${PV}-${PR}"
+SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
+
 do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
@@ -36,15 +47,31 @@ do_install () {
     install -d ${D}/boot
     install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
     ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+
+    if [ "x${SPL_BINARY}" != "x" ]
+    then
+        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
+        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
+    fi
 }
 
 FILES_${PN} = "/boot"
 
 do_deploy () {
-	install ${S}/u-boot.bin ${DEPLOYDIR}/${UBOOT_IMAGE}
+    install -d ${DEPLOYDIR}
+	install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 
 	cd ${DEPLOYDIR}
 	rm -f ${UBOOT_SYMLINK}
 	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
+
+    if [ "x${SPL_BINARY}" != "x" ]
+    then
+        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+        rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
+        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
+        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
+    fi
 }
+
 addtask deploy before do_build after do_compile
-- 
1.7.6.5




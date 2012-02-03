Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1RtQz9-00013z-NZ
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 22:48:00 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q13Lbcc7031023
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Feb 2012 15:37:38 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q13LbbQL015310
	for <openembedded-core@lists.openembedded.org>;
	Sat, 4 Feb 2012 03:07:37 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 4 Feb 2012 03:07:37 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q13LbWJX028344;
	Sat, 4 Feb 2012 03:07:36 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Feb 2012 15:37:29 -0600
Message-ID: <1328305049-18696-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1328305049-18696-1-git-send-email-Chase.Maupin@ti.com>
References: <1328305049-18696-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/1] u-boot inc: update inc file for newer u-boot versions
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
X-List-Received-Date: Fri, 03 Feb 2012 21:48:00 -0000
Content-Type: text/plain

* Add support for different suffixes found with later u-boot
  versions which have switched from .bin to .img
* Allow recipes that include u-boot.inc to also package an
  SPL if they build one.
    * Minimum requirement is to set the SPL_BINARY value to add
      the SPL to the u-boot package as well as into the deploy
      directory.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc |   37 ++++++++++++++++++++++++++++++++---
 1 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 4180345..dcf5463 100644
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
@@ -36,15 +47,33 @@ do_install () {
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
+# no gnu_hash in uboot.bin, by design, so skip QA
+INSANE_SKIP_${PN} = True
 
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
1.7.0.4




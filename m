Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QR1DV-0004ev-2h
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 14:05:05 +0200
Received: by wwb17 with SMTP id 17so3249624wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2011 05:01:54 -0700 (PDT)
Received: by 10.227.198.17 with SMTP id em17mr4970373wbb.4.1306756913836;
	Mon, 30 May 2011 05:01:53 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b10sm2994595wbh.43.2011.05.30.05.01.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 05:01:53 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2011 14:01:49 +0200
Message-Id: <1306756909-18466-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] u-boot: package up u-boot.bin for field upgrades
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
X-List-Received-Date: Mon, 30 May 2011 12:05:05 -0000

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
1.6.6.1




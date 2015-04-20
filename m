Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 590 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Apr 2015 19:27:08 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 741217390D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 19:27:08 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 648B231BD6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 21:17:09 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 21:17:08 +0200
Message-Id: <1429557428-20033-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] u-boot.inc: make sure all counter variables are properly unset
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
X-List-Received-Date: Mon, 20 Apr 2015 19:27:09 -0000

The script does "i == j" checks to retrieve the config <-> type pairs from
the UBOOT_MACHINE and UBOOT_CONFIG lists. This check however requires both
j and i to be initially unset. Ensure this by explicitely unsetting i.

This fixes broken u-boot SPL installations with SolidRun machines
(the SPL wasn't being installed and deployed.)

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 7053a56..88e239d 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -78,6 +78,7 @@ do_compile () {
             done
             unset  j
         done
+        unset  i
     else
         oe_runmake ${UBOOT_MACHINE}
         oe_runmake ${UBOOT_MAKE_TARGET}
@@ -101,6 +102,7 @@ do_install () {
             done
             unset  j
         done
+        unset  i
     else
         install -d ${D}/boot
         install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
@@ -129,6 +131,7 @@ do_install () {
                 done
                 unset  j
             done
+            unset  i
         else
             install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
             ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
@@ -162,6 +165,7 @@ do_deploy () {
             done 
             unset  j
         done
+        unset  i
     else
         install -d ${DEPLOYDIR}
         install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
@@ -193,6 +197,7 @@ do_deploy () {
                  done
                  unset  j
              done
+             unset  i
          else
              install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
              rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
-- 
1.9.1



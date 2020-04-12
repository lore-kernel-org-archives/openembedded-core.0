Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5329.1586731405740725530
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2020 15:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 14E9C40C11;
	Sun, 12 Apr 2020 22:43:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VyTfVqYyUWz; Sun, 12 Apr 2020 22:43:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C6DC7409E7;
	Sun, 12 Apr 2020 22:43:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2654F1724AB;
	Sun, 12 Apr 2020 18:43:21 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Tom Rini <trini@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] u-boot.inc: install u-boot-initial-env as ${PN}-initial-env in $D and $DEPLOYDIR
Date: Sun, 12 Apr 2020 18:42:37 -0400
Message-Id: <1586731357-36079-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

The common u-boot.inc can be used by multiple recipes in the same build for
different cores and/or multiple stages of the bootloader. Naming initial-env
with ${PN} prefix avoids clashes in deploy and rootfs between those recipes.

This fixes 69b3b093079c2ca2744d6c02747c5d1b5d3e7ecf that unconditionally
builds, installs and deploys u-boot-initial-env in the common u-boot.inc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
This is also late in the cycle, but it fixes the change mentioned above
that was merged last minute and broke existing use cases. This change is
meant to be least invasive and transparent.

 meta/recipes-bsp/u-boot/u-boot.inc | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 188e529..80f828d 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -156,10 +156,10 @@ do_install () {
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
 
                     # Install the uboot-initial-env
-                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
-                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}
-                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${type}
-                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
+                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
+                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}
+                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${type}
+                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
                 fi
             done
             unset  j
@@ -170,9 +170,9 @@ do_install () {
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 
         # Install the uboot-initial-env
-        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
-        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}
-        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
+        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
+        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}
+        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
     fi
 
     if [ -n "${UBOOT_ELF}" ]
@@ -245,7 +245,7 @@ PACKAGE_BEFORE_PN += "${PN}-env"
 
 RPROVIDES_${PN}-env += "u-boot-default-env"
 FILES_${PN}-env = " \
-    ${sysconfdir}/u-boot-initial-env* \
+    ${sysconfdir}/${PN}-initial-env* \
     ${sysconfdir}/fw_env.config \
 "
 
@@ -269,10 +269,10 @@ do_deploy () {
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
 
                     # Deploy the uboot-initial-env
-                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
+                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
                     cd ${DEPLOYDIR}
-                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${MACHINE}-${type}
-                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${type}
+                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${MACHINE}-${type}
+                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${type}
                 fi
             done
             unset  j
@@ -287,10 +287,10 @@ do_deploy () {
         ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
 
         # Deploy the uboot-initial-env
-        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
+        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
         cd ${DEPLOYDIR}
-        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env-${MACHINE}
-        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env
+        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${PN}-initial-env-${MACHINE}
+        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${PN}-initial-env
     fi
 
     if [ -e ${WORKDIR}/fw_env.config ] ; then
-- 
2.7.4


Return-Path: <alessio.bogani@elettra.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A620C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 11:26:52 +0000 (UTC)
Received: from bacon.elettra.eu (bacon.elettra.eu [140.105.206.12])
 by mx.groups.io with SMTP id smtpd.web08.9405.1648812410709538565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 04:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: elettra.eu, ip: 140.105.206.12, mailfrom: alessio.bogani@elettra.eu)
X-Envelope-From: <alessio.bogani@elettra.eu>
Received: from zmp.elettra.eu (zmp.elettra.trieste.it [140.105.206.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bacon.elettra.eu (Postfix) with ESMTPS id 97E8A41D7D
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Apr 2022 13:26:45 +0200 (CEST)
Received: from zmp.elettra.eu (localhost [127.0.0.1])
	by zmp.elettra.eu (Postfix) with ESMTPS id 8D1911406758;
	Fri,  1 Apr 2022 13:26:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmp.elettra.eu (Postfix) with ESMTP id 79D5E141820E;
	Fri,  1 Apr 2022 13:26:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zmp.elettra.eu
Received: from zmp.elettra.eu ([127.0.0.1])
	by localhost (zmp.elettra.eu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id u8Si9i3gVvgx; Fri,  1 Apr 2022 13:26:45 +0200 (CEST)
Received: from voltumna.elettra.trieste.it (voltumna.elettra.trieste.it
 [192.168.205.44])
	by zmp.elettra.eu (Postfix) with ESMTP id 4C362140180A;
	Fri,  1 Apr 2022 13:26:45 +0200 (CEST)
From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
To: openembedded-core@lists.openembedded.org
Cc: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [meta/master][PATCH] kernel.bbclass: Use KERNEL_IMAGEDEST instead of
 hardcoded boot path
Date: Fri,  1 Apr 2022 13:26:41 +0200
Message-Id: <20220401112641.3265-1-alessio.bogani@elettra.eu>
X-Mailer: git-send-email 2.17.1
X-elettra-Libra-ESVA-Information: Please contact elettra for more information
X-elettra-Libra-ESVA-ID: 97E8A41D7D.AD609
X-elettra-Libra-ESVA: No virus found
X-elettra-Libra-ESVA-From: alessio.bogani@elettra.eu
X-elettra-Libra-ESVA-Watermark: 1649417206.06885@Iu6fOfReSGepLge9ecYfzA
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 11:26:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163885

The behaviour doesn't change because KERNEL_IMAGEDEST is defined as
'boot' in the same file (line 215).

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 meta/classes/kernel.bbclass | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b3bbd3b276..7ca847f0a3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -447,7 +447,6 @@ kernel_do_install() {
 	# Install various kernel output (zImage, map file, config, module support files)
 	#
 	install -d ${D}/${KERNEL_IMAGEDEST}
-	install -d ${D}/boot
 
 	#
 	# When including an initramfs bundle inside a FIT image, the fitImage is created after the install task
@@ -465,10 +464,10 @@ kernel_do_install() {
 		fi
 	done
 
-	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
-	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
-	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
-	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
+	install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}
+	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
+	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
+	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
 }
@@ -649,8 +648,8 @@ PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_
 FILES:${PN} = ""
 FILES:${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
 FILES:${KERNEL_PACKAGE_NAME}-image = ""
-FILES:${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
+FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
 FILES:${KERNEL_PACKAGE_NAME}-modules = ""
 RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
 # Allow machines to override this dependency if kernel image files are
@@ -712,7 +711,7 @@ python do_strip() {
     extra_sections = d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
     kernel_image = d.getVar('B') + "/" + d.getVar('KERNEL_OUTPUT_DIR') + "/vmlinux"
 
-    if (extra_sections and kernel_image.find('boot/vmlinux') != -1):
+    if (extra_sections and kernel_image.find('${KERNEL_IMAGEDEST}/vmlinux') != -1):
         kernel_image_stripped = kernel_image + ".stripped"
         shutil.copy2(kernel_image, kernel_image_stripped)
         oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
-- 
2.17.1



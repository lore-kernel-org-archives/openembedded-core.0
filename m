Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 094AA772D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 09:54:21 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g23so23319505wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 01:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KP0Kk3sO5LJcx3mx7rmKM+Zh2/VO1xz7JHVp3bOsPZw=;
	b=JbC5y5+F7izOQGOQdTSOONAaq+vAWN1XEg6pXzDoJwK+l2ggo3otu6WCOaG/mWTQp4
	q6lA3uKXQsYx9dOnRemPUFlP63dztt+kFd1vxOtd7cd0UkhPu4SOQA5x//gLJ7ukfZyP
	KOxYZK6vleysTIRM2KukhfoWwUC2S9zV/4/tLcc7uFbi0lvEu/a9Pb0y2k+TeBRDuk1R
	cQQXRiuqdv0GmEQ4PciIs3nur8LreeoOmNVERcRxtPHxCvnPdy12oMPaBxUgz6G1LU++
	deIfSTrJcXcFsy4YQncpKAn/9Z1Hwh3lOdpLkiNQ484APjeVklZr5CS23jAWgbT9KACW
	tWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KP0Kk3sO5LJcx3mx7rmKM+Zh2/VO1xz7JHVp3bOsPZw=;
	b=n2jBFBSFCnowqC9U9GCDJFFa1jzKBTT4S2z9zqYeNw+PUzutDhZ+ICjOs+SaZJ8EAn
	PANgLhd3ttsSB6IZsYjrtIJm21fN+3ebhTtHEQ4BPYxoD+Y50wFFmBAgStn7ddXoZROZ
	++SNirLNZahLtMG04jhTjWNOk/E5b0YTu08gTeGmzUeJ5+l2bcBhH9aSxvH6f8WwKunM
	rTHYpThmE3Kg594uVGM/Tqxo5e8PrnFTyD/CDdrsRA5pPOdtwMDaqS1QmDAYtzSVVaUd
	7xO+y/1XQcVKy6G9qZtog/c3B50cWRV8rBSP7kEeQ2ns8KcXbsyIy9rmJJoJcZ/pVd6r
	59sg==
X-Gm-Message-State: AIkVDXKzoJ17erxyIossfMbXkiOc5Znt3PUSurLqmftSrYRhHX1YYCA5u62pXjf2A0HRDQ==
X-Received: by 10.28.62.141 with SMTP id l135mr1234488wma.20.1482227662612;
	Tue, 20 Dec 2016 01:54:22 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	w197sm21258039wmd.11.2016.12.20.01.54.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Dec 2016 01:54:22 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2016 10:53:29 +0100
Message-Id: <20161220095329.12238-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] kernel: Fix symlinks
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
X-List-Received-Date: Tue, 20 Dec 2016 09:54:22 -0000

When installing a kernel package, the symlinks created by
update-alternatives should point to a path relative to KERNEL_IMAGEDEST
and not an absolute path to '/boot'.

Failing to do so causes problems when resolving the symlink inside some
bootloaders which mount the boot partition elsewhere.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/kernel.bbclass             | 6 +++---
 meta/recipes-kernel/linux/linux-dtb.inc | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fa598cff7f..3630042dbd 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -45,10 +45,11 @@ python __anonymous () {
 
     for type in types.split():
         typelower = type.lower()
+        imagedest = d.getVar('KERNEL_IMAGEDEST')
 
         d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
 
-        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type + '-${KERNEL_VERSION_NAME}')
+        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
 
         d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
 
@@ -56,9 +57,8 @@ python __anonymous () {
 
         d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
 
-        imagedest = d.getVar('KERNEL_IMAGEDEST')
         priority = d.getVar('KERNEL_PRIORITY')
-        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
+        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
         d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
 
         postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 8528d646dd..668f6342b5 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -70,7 +70,7 @@ pkg_postinst_kernel-devicetree () {
 			DTB_EXT=${DTB##*.}
 			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
+			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
 		done
 	done
 }
@@ -83,7 +83,7 @@ pkg_postrm_kernel-devicetree () {
 			DTB_EXT=${DTB##*.}
 			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
+			update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
 		done
 	done
 }
-- 
2.11.0



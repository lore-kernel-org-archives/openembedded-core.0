Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7494C78377
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 18:15:53 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d10so4208174qtb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 11:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=V2DJHvk5XAORpDqZLdO2M7DvBozvNpqKsCYwYHXLYzE=;
	b=XbWGb1qcl9vfWtSLVIXWUDI8ttz5aa9wN8jSh4da/jA7gSAYe04p5Rx6UjjUfGWLEt
	mMgP2Cc+2Y6VOxDI5K+GBwFXlC+Fww1VobCdZR+3701feGjlgQjfikar0dhh0dSiOnE9
	QATqP5deVQpa7lAhmrHLC0QwQa74mBLNaDcOkEkCgengP2+69q8ocxclW810hrCcWwBP
	EpIOi73B/SlB19fCcpcIYQSEu+GvAvpfGp+usoGia7uh8Il2aQCZgPnRkZgj6+NjW4cp
	Aemt8b1opomzs2aHlshiy9ZN6vfE5PGx2lsr6e1BZdrLetqaSkfQAikZmREROhtrNjXH
	fkVg==
X-Gm-Message-State: AHYfb5glSP0WPE0NlmkbeLeyaCZtfRSi/+YWzRabdn+TWsbWxjFkyYjS
	Hleub4eaEXC73gK/
X-Received: by 10.237.42.55 with SMTP id c52mr3781310qtd.311.1502907354129;
	Wed, 16 Aug 2017 11:15:54 -0700 (PDT)
Received: from localhost.localdomain ([181.220.72.143])
	by smtp.gmail.com with ESMTPSA id z85sm933567qkb.71.2017.08.16.11.15.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Aug 2017 11:15:53 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 16 Aug 2017 15:15:44 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 15:15:39 -0300
Message-Id: <20170816181539.5327-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Christopher Larson <chris_larson@mentor.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Wed, 16 Aug 2017 18:15:54 -0000

This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.

The commit has broken the alternatives concept as it is managed by
links controlled by the alternatives system. That said the failing
case identified (which some bootloaders fail to load the file) seems
to be due a misuse of the alternative system.

Cc: Christopher Larson <chris_larson@mentor.com>
Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

---

 meta/classes/kernel.bbclass             | 6 +++---
 meta/recipes-kernel/linux/linux-dtb.inc | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7a134d5c29..2622ada6f5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -49,11 +49,10 @@ python __anonymous () {
 
     for type in types.split():
         typelower = type.lower()
-        imagedest = d.getVar('KERNEL_IMAGEDEST')
 
         d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
 
-        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
+        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type + '-${KERNEL_VERSION_NAME}')
 
         d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
 
@@ -61,8 +60,9 @@ python __anonymous () {
 
         d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
 
+        imagedest = d.getVar('KERNEL_IMAGEDEST')
         priority = d.getVar('KERNEL_PRIORITY')
-        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
+        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
         d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
 
         postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 0174c80d85..6c0462126b 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -72,7 +72,7 @@ pkg_postinst_kernel-devicetree () {
 			DTB_EXT=${DTB##*.}
 			DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
+			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
 		done
 	done
 }
@@ -85,7 +85,7 @@ pkg_postrm_kernel-devicetree () {
 			DTB_EXT=${DTB##*.}
 			DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
+			update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
 		done
 	done
 }
-- 
2.14.1



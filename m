Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 545C17F2E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:30:07 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h2so12796571ljk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=672Eukg/NGWaPqyA3Y9uoGkgFarofeP4KjbAZEeSVjc=;
	b=gtuvl90RsrFWnLdbczDSLxLqUMD2L9SgpDt6+lPC1F4WePmOhvJFc/g5DCu2aoOwnI
	6sBHzb88K0NaGpQxp4y05Czhv5heV5kWRSe5LCl2HgcH1xknAkm60WoWKRRiQP5kLkrL
	MES5i0v5A/5FO0xBkM902gdP8RjLRLxvqxrbCB3WiArunpSMPHO36MFsufbjdGhHcH9I
	iSg1ng8gGFfSPioGz854W+Inbyod5AWf66QtBr4nv+q0V2SLypAH1+uQTcS19BowZiCO
	mi4C6uAJNW+yvtK2ULkGT7QKUB97/t/YMdgl6GPf9PQSsvqtpPr9NPKcRtk3Go4Vk5Wz
	VkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=672Eukg/NGWaPqyA3Y9uoGkgFarofeP4KjbAZEeSVjc=;
	b=B1z23D28Vp9AKRDVmCURfk3xIyexerS2p8Kc/rjYdN0vJQzENNpem9LdIvwzVX6S5p
	LeApg25gEJJkQa4z9bplWyBuF/7QN6DWx7JNss6c96omFXFuzq1SGg3mzI5PlUOVnbCx
	OIlOKwssuEHe3702V3q02nTaCBRmVO69vWrTDKPx8d1YKzykP1+hR9HY6OyFJ/qhaFvj
	Yn3ZiOCyf94He4TwaKJTY3d0WVVRIL9i5/PA9kzgxesEj96qJN4RBgR9XxS1oEAipBDQ
	iM8CoxJ5KMqyvpTY9wsFLtXfTLfhLU2TZflotFo4y8M+YiiAlaDB7mtkmwfcWkvLJmtA
	uZoQ==
X-Gm-Message-State: APjAAAWcdWqmyKJLTjYeS3ANJUPZJIpmqdL2AwvhgQGSzwIaDTWaVshr
	qRiK+kY/YuP1imdJlkWt6k/ILVtU
X-Google-Smtp-Source: APXvYqw5mHFA7QjtoGd+2+3KwSQ3kMnLQRCTJp6PglVXIHeWHm2Yy2OGpn93XNLra/8mXDC8PDnhqw==
X-Received: by 2002:a2e:8704:: with SMTP id m4mr22571520lji.65.1568194207557; 
	Wed, 11 Sep 2019 02:30:07 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.24])
	by smtp.gmail.com with ESMTPSA id
	t1sm4509306lji.101.2019.09.11.02.30.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:30:06 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 12:29:55 +0300
Message-Id: <20190911093001.7849-3-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911093001.7849-1-dbaryshkov@gmail.com>
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 3/9] grub-efi: switch to uefi.bbclass
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
X-List-Received-Date: Wed, 11 Sep 2019 09:30:08 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from uefi.bbclass instead of hardcoding them in the recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index aaa198ea23ec..bff3f6c25a20 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -1,5 +1,7 @@
 require grub2.inc
 
+inherit uefi
+
 GRUBPLATFORM = "efi"
 
 DEPENDS_append_class-target = " grub-efi-native"
@@ -18,18 +20,15 @@ python __anonymous () {
     prefix = "" if d.getVar('EFI_PROVIDER') == "grub-efi" else "grub-efi-"
     if target == "x86_64":
         grubtarget = 'x86_64'
-        grubimage = prefix + "bootx64.efi"
     elif re.match('i.86', target):
         grubtarget = 'i386'
-        grubimage = prefix + "bootia32.efi"
     elif re.match('aarch64', target):
         grubtarget = 'arm64'
-        grubimage = prefix + "bootaa64.efi"
     elif re.match('arm', target):
         grubtarget = 'arm'
-        grubimage = prefix + "bootarm.efi"
     else:
         raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
+    grubimage = prefix + d.getVar("EFI_BOOT_IMAGE")
     d.setVar("GRUB_TARGET", grubtarget)
     d.setVar("GRUB_IMAGE", grubimage)
     prefix = "grub-efi-" if prefix == "" else ""
@@ -45,7 +44,7 @@ do_mkimage() {
 	cd ${B}
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
-	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
+	grub-mkimage -c ../cfg -p ${EFIDIR} -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} \
 	               ${GRUB_BUILDIN}
 }
@@ -57,10 +56,8 @@ do_mkimage_class-native() {
 }
 
 do_install_append_class-target() {
-	install -d ${D}/boot
-	install -d ${D}/boot/EFI
-	install -d ${D}/boot/EFI/BOOT
-	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}/boot/EFI/BOOT/${GRUB_IMAGE}
+	install -d ${D}${EFI_FILES_PATH}
+	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}${EFI_FILES_PATH}/${GRUB_IMAGE}
 }
 
 do_install_class-native() {
@@ -100,7 +97,7 @@ addtask deploy after do_install before do_build
 
 FILES_${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                ${datadir}/grub \
-               /boot/EFI/BOOT/${GRUB_IMAGE} \
+               ${EFI_FILES_PATH}/${GRUB_IMAGE} \
                "
 
 FILES_${PN}_remove_aarch64 = "${libdir}/grub/${GRUB_TARGET}-efi"
-- 
2.23.0



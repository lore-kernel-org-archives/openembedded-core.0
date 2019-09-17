Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 82CD27F6D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 15:36:19 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o184so3729377wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1xAQkGVrJZ/o/fuXcAV12RhlmN8RDJAr4vnIfMphuSI=;
	b=uiTbo4Tvm7yjQoVhUPmeCD2QFJrYUg3JgsZVCKEOtNpDK0iZ4hSJEyXYbQuDO602A0
	BdvcmDdgIlXQWbsZaoF+l+KenYgduotCofXjqM/PKrjS69/3rCAmLwef3yAe6q7ZHCT2
	Yc1OIUU5KfToUR4x055tmqVOOKYF3K4unE+qZkMwTOGvKUnTfYsDLZ7f3vIalG5sd6R5
	aAGf07r93Jef0ayWuRHJgoSjl5+MFOb3LYKcS5HzvITsB6NXdOPMPDauJt5Jj+BKkFEa
	LzQ0xs/5eZBZXwTU0hWFQi5SjDrkJ70/dMnr8j9NL+2wPJ01HHXpfiY3jMYHhpOKy96z
	orpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1xAQkGVrJZ/o/fuXcAV12RhlmN8RDJAr4vnIfMphuSI=;
	b=DORJOLptFzkv+0BuaTOjPFc9duPvH1W5ylRUDUV58TwcFcxZ8kZr/mCrG/E3OPeWnT
	XVUrOe1W9ArFEtfK/ZbO88GUDa35Rd4D8PKgXiANsWvX+LoS0MbhHdnisxsy+W6KKYuc
	OzpmWcIsffB+P3RinI2+ZNlxjQJcQYQlidY8Z7UlSYqiAFQLmCaeD6uqc/OwsdO0ImMs
	oRxYN7kaQDbC9bAwa4R4ROImyJfYcY0+Y7MLzUq9rtm63UGvdxRD74v0usCQD+CqRm9P
	Iv0GD12+w5R5n389d8khpOBio450RsHi10pXGBS4BQrAr/wOcQTzDmzHZ7YUR/pb3LFH
	xmmg==
X-Gm-Message-State: APjAAAXLufO4B+suPz22j6APVbU2oG97yFTTrcIv148kqDqRTDLd42R4
	K71eezxww3uide55pUzU9EEkVmsO
X-Google-Smtp-Source: APXvYqw94m+byDpwUTersp9nGck+LsP1bCaRSTsliDm6P/RBUgitvvhIntUZluU3JW2mNbEiE0GDFQ==
X-Received: by 2002:a7b:c5c5:: with SMTP id n5mr3928761wmk.69.1568734579616;
	Tue, 17 Sep 2019 08:36:19 -0700 (PDT)
Received: from lothlann.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by smtp.gmail.com with ESMTPSA id
	o9sm4605245wrh.46.2019.09.17.08.36.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 08:36:18 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 18:36:07 +0300
Message-Id: <20190917153613.4954-3-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917153613.4954-1-dbaryshkov@gmail.com>
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 3/9] grub-efi: switch to uefi.conf
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
X-List-Received-Date: Tue, 17 Sep 2019 15:36:20 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from uefi.conf instead of hardcoding them in the recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index c85879b6772f..4a73a7dfddd9 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -1,5 +1,7 @@
 require grub2.inc
 
+require conf/uefi.conf
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



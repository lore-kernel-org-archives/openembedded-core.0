Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 27B937ECB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:44:46 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id y23so27229723ljn.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=672Eukg/NGWaPqyA3Y9uoGkgFarofeP4KjbAZEeSVjc=;
	b=H/Q1NzjUkZ1vkYNnqU32QmHlJTEFfWC5LWnM06VasjGt481NyZgj2GOlE8YkZnXYx/
	o8xdZKSfx/5P92gNj+fNfCqzlg0v6hC4YR2PCAxFVLWIJrX/9CviveS3kY8bpE6nSLJB
	h80+l4BKLf2RuJsB06EKc0BShgtzsPrZX2jdKskvAR9/7b9bdDXqBW0c3NwiyehBAugI
	x2KLsNOjJAfzrkf/BIVSODhHGNZOuSgAbxZOHiteLmgO3JuS73POKL6akStxjSImb9Zl
	tqBsr6nPTBHCJnBycwbuAi8xZN9W8esSvsDY5wxMjOxqTPMt55d2PzJbiOCkRI5qIlTh
	0MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=672Eukg/NGWaPqyA3Y9uoGkgFarofeP4KjbAZEeSVjc=;
	b=aGwV6XPAnhF5WqfY/UsxJ12XvMWNpWIGyB+KqV8usq1uEbfzcjseJ4cBzI2Bexi0Si
	UBEasBL2oNJ/iVtxlFyIpOHtqpZ4pEu/a4/7cWfo1wdzbvqh1eJeZ5wvsWMXJGg5HwaD
	AGjGXhCMio3WAIG6WbgWSpU96HT4yp5LEw19xal5zjSkqw7A0BOeMpFKDnQCuV2Hn3FZ
	UOW34jfKdJ92FTXTDJdgMHpCHQ6yiZ10s1Na+rMZwKg0oFq40NLFGGF3EaBtDwjaOFsL
	C+7Hv/aSHWI4y8mRvuzS9uPTJL0bXWzuk/CjPR2dnCUoATaqKCAfWg+WfqPPIbh6rjRN
	gnXg==
X-Gm-Message-State: APjAAAXhg1JxUHRvSBBmi5Y1eJvBJv+8JH0wve+8poaLTXxeIGIkMDWr
	KqvYiblcMiLwxMTsGYnYjGEu3X6c
X-Google-Smtp-Source: APXvYqwTT2ZHFTtmE7jSqsmejfiJ2ifxNtr7qt1QNY87Cf0ZKd22AqSn1wSqXpxKtPpY5p6M+Lh0JA==
X-Received: by 2002:a2e:8814:: with SMTP id x20mr31154659ljh.221.1568389486312;
	Fri, 13 Sep 2019 08:44:46 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.196])
	by smtp.gmail.com with ESMTPSA id
	t1sm6297169lji.101.2019.09.13.08.44.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 08:44:45 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 18:44:28 +0300
Message-Id: <20190913154434.29908-3-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913154434.29908-1-dbaryshkov@gmail.com>
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 3/9] grub-efi: switch to uefi.bbclass
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
X-List-Received-Date: Fri, 13 Sep 2019 15:44:46 -0000
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



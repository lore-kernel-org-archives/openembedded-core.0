Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7D67F2EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 13:17:31 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id d5so7171886lja.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XDGmibrj1ShWIgAqQpZ9Xlbw/V5famNFaHS8T8/CF00=;
	b=KGZDvUom/16vco94vLu0O/5YJXgaaY5Y9O5PkOb32bJ/XX8lv2oRNHq/zIpyA6tGiP
	ix0ALIHo4WMLYC5RK+//VqTpM3zYZ2voM2um8zxvBJ4Tbq6CSvdfXLNKHhgDpmqjHSAd
	M8zyQKu8v0Ws2IivSqG9JUFfcJQaadqveTuDnN0gkjV8E7fandKez2jbSJowqXghVm1x
	iqmyuk0MS8n0nz5YXmm8bFMRlGGiRm3Xf0GrJip1U+uFmVDgjKUt7sO/yMKFyMWxRRV0
	8AjqfbMBkNqQsfeATSV9Ux4DUiYjmo1zF74TutoE4oUrpv2Aa/amzjDMjN17OAAw9LTY
	YqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XDGmibrj1ShWIgAqQpZ9Xlbw/V5famNFaHS8T8/CF00=;
	b=Y48PrBA97c4Rq3haPvhRDyoCTD70WKWNn1rjbR0iRtfIOTfM1i6sN3wpXPia2JzBA8
	c4NdVoKYIsce+5+yhjMppBrRdLWE7uYpmTq1cKV1ULraGGkLF7GAWniJdgFo1SAvv1lt
	bHLSVe5nLPg3pLKz6KJnqOsXB4ogbu3VGtSie9MKv1DgrvkTr+E/LLhp8wd8p3D5Hoc7
	zNcFbh+pzTJxOCZ9bMOLBfTSlF/da5xMp8hcNNiUxjGX9lI8dU8vsLf6IDoOZ4WfGG1P
	aeEivIsDAOMWLEIFPQ/nKBsdByu5pnu0b8paEQephK6xs6NX4K+2lXz5E1gzOuoZsulG
	GUZA==
X-Gm-Message-State: APjAAAVRdi1NxzRK5cAU07IhPs/EPV2cceXH8UtUhzWnit1hy0Z3jorb
	Q4sC6vUVwIp4y4/2OhKq6HoBabLW
X-Google-Smtp-Source: APXvYqxSkiADTceayom2RK+Ox+Z0T4Q3Qzli715URCHE8BLtjnGqEWW/D/XzrJjw99n9FWsFKm/zgw==
X-Received: by 2002:a05:651c:154:: with SMTP id
	c20mr1675680ljd.83.1568812651260; 
	Wed, 18 Sep 2019 06:17:31 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.37])
	by smtp.gmail.com with ESMTPSA id u10sm999466lfk.34.2019.09.18.06.17.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 06:17:30 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 16:12:43 +0300
Message-Id: <20190918131247.26488-3-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918131247.26488-1-dbaryshkov@gmail.com>
References: <20190918131247.26488-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 3/7] grub-efi: switch to image-uefi.conf
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
X-List-Received-Date: Wed, 18 Sep 2019 13:17:31 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from image-uefi.conf instead of hardcoding them in the
recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index c85879b6772f..b9d6225d2774 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -1,5 +1,7 @@
 require grub2.inc
 
+require conf/image-uefi.conf
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



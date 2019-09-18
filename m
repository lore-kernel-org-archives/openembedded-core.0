Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 55E227F93F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 13:17:36 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id t8so5620873lfc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Z5hgEViypV6Z4ZjLoQ4Hio15rWEAp3Coa/VdJHrAstU=;
	b=XKZzhpQfsuuv8Kalnjx4Ide81DMegre7CTJZG4PbhmtZcHYCAq6SPi9rYgMDjDX9Wr
	9nUqGCprmDMwqXKS81Rp8T2axzNQOPzbYlFInf6rAhke1EHAvxbndO9syDuzY0QTQTnr
	jxErS+eRuYP0dgMe+R2TI1hBT4AdArb4Oet5mnGp1rJ3xoXoX9kBkcNhGdz3LRi6nyxa
	Ywn+VHxqtO60w/zgjreesWhxsGBBM/4sjvyXb5kQXAciHDzGia6kBLuAMEgrvijdFI80
	H8nh41JasPqXYEcqAA/RXX3d2OruGScCWkNrn2/mIHkHW1dQzoFvvOhrQ1oyQvGoJqTw
	mApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Z5hgEViypV6Z4ZjLoQ4Hio15rWEAp3Coa/VdJHrAstU=;
	b=AXJVQNFt7O0EHsj6QNYD5OGi7ORjH83XilLKS07mn4axD1244QRk+l/dvZ6bDlLQ/+
	ylyzIjvcN2CCadmyuAClXfpelXl3EfhYf1rFrZi7X7h/s27loiCiOsEXxuOw/qvpZ/p5
	x62aGZGAUEp3e8MSbo//n2ueGfE7dpJ6KNvyhW1yWiOAuOJM8j/VBmgCABF60jim/FDp
	fRLMXwOg2/f+E5EdXrhKhxci/LCmqrBXCu4xGCAw8hALQ8H27+jQBhiFOOIGsGOUVLK8
	B62oobtXF0GUR+vCVWrta0j+YGi3iwusZ2idDUa1lPpQdbyVcbmLynmNsxKx1S79nncw
	vf9Q==
X-Gm-Message-State: APjAAAW5CvxgVIlhiOaCYEleDY8N5vaVGjKyg4DBpFctq2dXs//4yK5z
	KsLa0ke8Ddu0SV/CFm/2T5W9FlSQ
X-Google-Smtp-Source: APXvYqyTYehLlhNaQsl77TMyv5U+kuPAS+1b4+3tJIvrjvmB6iCEyQRmFadLLbOuEAPhz8aKCHTNVg==
X-Received: by 2002:a19:22cd:: with SMTP id i196mr2084928lfi.160.1568812656384;
	Wed, 18 Sep 2019 06:17:36 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.37])
	by smtp.gmail.com with ESMTPSA id u10sm999466lfk.34.2019.09.18.06.17.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 06:17:35 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 16:12:47 +0300
Message-Id: <20190918131247.26488-7-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918131247.26488-1-dbaryshkov@gmail.com>
References: <20190918131247.26488-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 7/7] live-vm-common.bbclass: provide efi population functions for live images
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
X-List-Received-Date: Wed, 18 Sep 2019 13:17:36 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Define common functions for populating EFI directories in live image by
reusing common code from grub-efi and systemd-boot bbclasses.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/grub-efi.bbclass       | 28 +-----------------------
 meta/classes/live-vm-common.bbclass | 33 +++++++++++++++++++++++++++++
 meta/classes/systemd-boot.bbclass   | 22 ++-----------------
 3 files changed, 36 insertions(+), 47 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 724bbe86842c..8fc6999e52a8 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -2,33 +2,7 @@ inherit grub-efi-cfg
 require conf/image-uefi.conf
 
 efi_populate() {
-	# DEST must be the root of the image so that EFIDIR is not
-	# nested under a top level directory.
-	DEST=$1
-
-	install -d ${DEST}${EFIDIR}
-
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/grub-efi-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
-	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-	printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
+	efi_populate_common "$1" grub-efi
 
 	install -m 0644 ${GRUB_CFG} ${DEST}${EFIDIR}/grub.cfg
 }
-
-efi_iso_populate() {
-	iso_dir=$1
-	efi_populate $iso_dir
-	# Build a EFI directory to create efi.img
-	mkdir -p ${EFIIMGDIR}/${EFIDIR}
-	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
-	cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
-	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-	printf 'fs0:%s\%s\n' "$EFIPATH" "grub-efi-${EFI_BOOT_IMAGE}" > ${EFIIMGDIR}/startup.nsh
-	if [ -f "$iso_dir/initrd" ] ; then
-		cp $iso_dir/initrd ${EFIIMGDIR}
-	fi
-}
-
-efi_hddimg_populate() {
-	efi_populate $1
-}
diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-common.bbclass
index 68105d9b84f9..74e7074a5397 100644
--- a/meta/classes/live-vm-common.bbclass
+++ b/meta/classes/live-vm-common.bbclass
@@ -29,6 +29,39 @@ def pcbios(d):
 PCBIOS = "${@pcbios(d)}"
 PCBIOS_CLASS = "${@['','syslinux'][d.getVar('PCBIOS') == '1']}"
 
+# efi_populate_common DEST BOOTLOADER
+efi_populate_common() {
+        # DEST must be the root of the image so that EFIDIR is not
+        # nested under a top level directory.
+        DEST=$1
+
+        install -d ${DEST}${EFIDIR}
+
+        install -m 0644 ${DEPLOY_DIR_IMAGE}/$2-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
+}
+
+efi_iso_populate() {
+        iso_dir=$1
+        efi_populate $iso_dir
+        # Build a EFI directory to create efi.img
+        mkdir -p ${EFIIMGDIR}/${EFIDIR}
+        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
+        cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
+
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${EFIIMGDIR}/startup.nsh
+
+        if [ -f "$iso_dir/initrd" ] ; then
+                cp $iso_dir/initrd ${EFIIMGDIR}
+        fi
+}
+
+efi_hddimg_populate() {
+	efi_populate $1
+}
+
 inherit ${EFI_CLASS}
 inherit ${PCBIOS_CLASS}
 
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index bb3221dacca8..336c4c2ff58c 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -16,38 +16,20 @@ require conf/image-uefi.conf
 inherit fs-uuid
 
 efi_populate() {
-        DEST=$1
+        efi_populate_common "$1" systemd
 
-        install -d ${DEST}${EFIDIR}
         # systemd-boot requires these paths for configuration files
         # they are not customizable so no point in new vars
         install -d ${DEST}/loader
         install -d ${DEST}/loader/entries
-        install -m 0644 ${DEPLOY_DIR_IMAGE}/systemd-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
-        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
         install -m 0644 ${SYSTEMD_BOOT_CFG} ${DEST}/loader/loader.conf
         for i in ${SYSTEMD_BOOT_ENTRIES}; do
             install -m 0644 ${i} ${DEST}/loader/entries
         done
 }
 
-efi_iso_populate() {
-        iso_dir=$1
-        efi_populate $iso_dir
-        mkdir -p ${EFIIMGDIR}/${EFIDIR}
-        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
+efi_iso_populate_append() {
         cp -r $iso_dir/loader ${EFIIMGDIR}
-        cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
-        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        echo "fs0:${EFIPATH}\\${EFI_BOOT_IMAGE}" > ${EFIIMGDIR}/startup.nsh
-        if [ -f "$iso_dir/initrd" ] ; then
-            cp $iso_dir/initrd ${EFIIMGDIR}
-        fi
-}
-
-efi_hddimg_populate() {
-        efi_populate $1
 }
 
 inherit systemd-boot-cfg
-- 
2.23.0



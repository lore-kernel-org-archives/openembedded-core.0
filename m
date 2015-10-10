Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 82CC076E3F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 01:53:31 +0000 (UTC)
Received: by qkas79 with SMTP id s79so40017420qka.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 18:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hZmdMzGLZrknEICRoVpSQRt+VUMCatKIjPIcfFtWIKM=;
	b=bsbW9vwGyI4g9EIXosKoNHVy/pNxAfNtee5sE9G1Iw/tppT0RODujSzPbxu4WbVqR1
	prjUWeI5xoBW6w35JWKTJQZiyPl8ud0qQ0FmY7dBn3R9kovpFS8QtqjulOpPOi5et0Jg
	2FQ9zvBsgm99R+bneT7Acx7YsKrEr+DyYvcXYiGDagrNJgKUs5BuRxjjSudqd00CxV5h
	ZFHj57jEsibY+K2y93juwY8qm+st3eIbCmT1xRg367wQNgN1AMwtzVewtLkGLrDgmt2L
	pQma6tNuEUMD0AFr4EDDnO9MuzKmxv8f1UOtgPhnY8S6DqFpTQnm/urlCqE5EOfJuHOZ
	jo+g==
X-Received: by 10.55.22.70 with SMTP id g67mr18644935qkh.43.1444442011487;
	Fri, 09 Oct 2015 18:53:31 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	187sm1941433qhf.16.2015.10.09.18.53.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Oct 2015 18:53:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Oct 2015 01:53:25 +0000
Message-Id: <1444442005-105476-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [PATCH] grub-efi, gummiboot: Emit correct path in startup.nsh
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
X-List-Received-Date: Sat, 10 Oct 2015 01:53:33 -0000

when we generate hddimage and use it to prepare SD card
using scripts/contrib/mkefidisk.sh as described here

http://elinux.org/Minnowboard:MinnowMaxYoctoProject

The content of startup.nsh contains

bootx64.efi

but this file is actually not in same dir as startup.nsh
its in /EFI/BOOT so for this to work entry in startup.nsh
should be

fs0:\EFI\BOOT\bootx64.efi

Otherwise the image is D-O-A

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/grub-efi.bbclass  | 3 ++-
 meta/classes/gummiboot.bbclass | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 4ddc2bb..9a4220a 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -52,7 +52,8 @@ efi_iso_populate() {
 	mkdir -p ${EFIIMGDIR}/${EFIDIR}
 	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
 	cp $iso_dir/vmlinuz ${EFIIMGDIR}
-	echo "${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
+	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+	echo "fs0:${EFIPATH}\\${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
 	if [ -f "$iso_dir/initrd" ] ; then
 		cp $iso_dir/initrd ${EFIIMGDIR}
 	fi
diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbclass
index 3d9c08b..9a97ac1 100644
--- a/meta/classes/gummiboot.bbclass
+++ b/meta/classes/gummiboot.bbclass
@@ -46,7 +46,8 @@ efi_iso_populate() {
         mkdir -p ${EFIIMGDIR}/${EFIDIR}
         cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
         cp $iso_dir/vmlinuz ${EFIIMGDIR}
-        echo "${DEST_EFI_IMAGE}" > ${EFIIMGDIR}/startup.nsh
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        echo "fs0:${EFIPATH}\\${DEST_EFI_IMAGE}" > ${EFIIMGDIR}/startup.nsh
         if [ -f "$iso_dir/initrd" ] ; then
             cp $iso_dir/initrd ${EFIIMGDIR}
         fi
-- 
2.6.1



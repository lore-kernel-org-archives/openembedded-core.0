Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 668AC77131
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id B041E60900B
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:27 +0100
Message-Id: <38fe481911e7c4e9f674ded8f66878dff9e12ce3.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 06/52] grub-efi, gummiboot: Emit correct path in startup.nsh
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:20 -0000

From: Khem Raj <raj.khem@gmail.com>

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
Signed-off-by: Ross Burton <ross.burton@intel.com>
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
2.1.4



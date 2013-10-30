Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 545716D3A1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 17:35:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9UHZx4j028355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 10:36:00 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 30 Oct 2013 10:35:59 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 30 Oct 2013 12:35:17 -0500
Message-ID: <1383154517-5949-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] grub-efi.bbclass: Fix startup.nsh to work on more EFI revs
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
X-List-Received-Date: Wed, 30 Oct 2013 17:35:59 -0000
Content-Type: text/plain

Some revs of the EFI firmware + shell do not automatically setup the
path in a such a way as to execute a binary without an absolute
reference like "FS0:\EFI\BOOT\bootx64.efi".  All the versions that I
have tested work properly by simply calling the binary which is in the
EFI\BOOT directory by name like "bootx64.efi".

The error you see on the console looks like the following:

startup.nsh> EFI\BOOT\bootx64.efi
'EFI\BOOT\bootx64.efi' is not recognized as an internal or external command, operable program, or batch file
Shell>

This patch simply drops the EFI\BOOT for greater compatibility.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/grub-efi.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 96fb98b..0809ec6 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -48,7 +48,7 @@ grubefi_iso_populate() {
 	mkdir -p ${EFIIMGDIR}/${EFIDIR}
 	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
 	cp $iso_dir/vmlinuz ${EFIIMGDIR}
-	echo "EFI\\BOOT\\${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
+	echo "${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
 	if [ -f "$iso_dir/initrd" ] ; then
 		cp $iso_dir/initrd ${EFIIMGDIR}
 	fi
-- 
1.7.9.5



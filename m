Return-Path: <pranav.tipnis@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9B20176802
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 01:34:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 19 Aug 2016 18:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,547,1464678000"; d="scan'208";a="1044523153"
Received: from pranav.fm.intel.com ([10.80.42.9])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2016 18:34:39 -0700
From: Pranav Tipnis <pranav.tipnis@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 18:28:41 -0700
Message-Id: <1471656521-52469-2-git-send-email-pranav.tipnis@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1471656521-52469-1-git-send-email-pranav.tipnis@intel.com>
References: <1471656521-52469-1-git-send-email-pranav.tipnis@intel.com>
Subject: [PATCH 1/1] grub-efi.bbclass: Fix path in startup.nsh for iso image.
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
X-List-Received-Date: Sat, 20 Aug 2016 01:34:36 -0000

The path in startup.nsh for iso image is corrupted as follows:
fs0:\EFI\BOOT^Hootx64.efi

Using printf will emit correct path which is:
fs0:\EFI\BOOT\bootx64.efi

This happens because of echo command. Switching to printf
like the one used in efi_populate() function.

Signed-off-by: Pranav Tipnis <pranav.tipnis@intel.com>
---
 meta/classes/grub-efi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index ae8ee38..178d0c8 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -59,7 +59,7 @@ efi_iso_populate() {
 	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
 	cp $iso_dir/vmlinuz ${EFIIMGDIR}
 	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-	echo "fs0:${EFIPATH}\\${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
+	printf 'fs0:%s\%s\n' "$EFIPATH" "$GRUB_IMAGE" > ${EFIIMGDIR}/startup.nsh
 	if [ -f "$iso_dir/initrd" ] ; then
 		cp $iso_dir/initrd ${EFIIMGDIR}
 	fi
-- 
1.9.1



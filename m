Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id D099565D2F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Apr 2014 01:15:16 +0000 (UTC)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1WaEOY-00040l-2D; Wed, 16 Apr 2014 01:12:19 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1WaET3-0001zu-N2; Wed, 16 Apr 2014 01:16:49 +0000
From: Philip Tricca <flihp@twobit.us>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Apr 2014 01:16:48 +0000
Message-Id: <1397611008-7653-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH] grub-efi: Use a variable to specify built-in grub modules.
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
X-List-Received-Date: Wed, 16 Apr 2014 01:15:17 -0000

The previous behavior defines a static set of modules that are built
into the grub efi executable. This works fine for a limited set of boot
environments namely the standard linux/initrd. This patch conditionally
 assigns the same modules to a variable. This allows other meta layers
to add additional modules or completely override the defaults. The use
case driving this patch is the use of multiboot2 and related modules.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 6944cb2..4b43749 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -70,12 +70,14 @@ do_install_class-native() {
 	install -m 755 grub-mkimage ${D}${bindir}
 }
 
+GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search"
+
 do_deploy() {
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
 	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
-	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
+	               ${GRUB_BUILDIN}
 	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
 }
 
-- 
1.7.10.4



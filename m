Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 854D060762
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 11:22:07 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3r2jlf2ZNXz3hjNF;
	Sun,  8 May 2016 13:22:06 +0200 (CEST)
X-Auth-Info: dcktgYUznUon0xK9HCSZ1sZrNQtbHX6bL8Xt+5QLG7U=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3r2jlf0R6zzvdWS;
	Sun,  8 May 2016 13:22:05 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 May 2016 13:21:53 +0200
Message-Id: <1462706513-5019-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.7.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] kernel: fitimage: Repair misuse of shell test command
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
X-List-Received-Date: Sun, 08 May 2016 11:22:09 -0000

The kernel fitImage must be amended with signature if and only if
UBOOT_SIGN_ENABLE = 1 . In the current case, the UBOOT_SIGN_ENABLE
could be either 0 (default) or 1 , which test -n always correctly
interprets as non-empty string, thus always true. This does not
match the logic above though, so replace the test with check which
passes only for UBOOT_SIGN_ENABLE = 1 .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Yannick Gicquel <yannick.gicquel@iot.bzh>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
NOTE: It'd be real nice if I was CCed on the original patches
NOTE: I'm not convinced that UBOOT_SIGN_ENABLE is the right name
      for this variable, since the signed object is really the
      fitImage and U-Boot only verifies the signature. Maybe we
      should rename it, is it still possible ?

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 809bd4d..298eda2 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -250,7 +250,7 @@ do_assemble_fitimage() {
 		#
 		# Step 5: Sign the image and add public key to U-Boot dtb
 		#
-		if test -n "${UBOOT_SIGN_ENABLE}"; then
+		if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
 			uboot-mkimage \
 				${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 				-F -k "${UBOOT_SIGN_KEYDIR}" \
-- 
2.7.0



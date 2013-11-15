Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC046D2FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 13:31:01 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>) id 1VhJUE-0002DK-Hy
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 14:31:02 +0100
Message-ID: <1384522261.23724.16.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 13:31:01 +0000
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: If kernel_do_compile() encounters a .lzma image for
	the initramfs, 
	it attempts to decompress it using the little-known "lzmash" utility.
	This
	may not be present, which will cause the build to fail. Fortunately,
	it appears
	that the more mainstream "lzma" tool is compatible so we can use that
	one instead. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: PATCH] kernel.bbclass: Use lzma not lzmash for decompressing
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
X-List-Received-Date: Fri, 15 Nov 2013 13:31:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If kernel_do_compile() encounters a .lzma image for the initramfs, it
attempts to decompress it using the little-known "lzmash" utility.  This
may not be present, which will cause the build to fail.

Fortunately, it appears that the more mainstream "lzma" tool is
compatible so we can use that one instead.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e99cb2f..48a429f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -103,7 +103,7 @@ copy_initramfs() {
 				;;
 			*lzma)
 				echo "lzma decompressing image"
-				lzmash -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				lzma -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
 				break
 				;;
 			*xz)
-- 
1.8.4.rc3





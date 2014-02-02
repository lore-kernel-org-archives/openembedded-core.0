Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 878D86EA40
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2014 12:34:56 +0000 (UTC)
Received: from [212.183.132.39] (helo=[192.168.42.139])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W9wGE-00027E-HW
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Feb 2014 13:34:56 +0100
Message-ID: <1391341137.3068.55.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Sun, 02 Feb 2014 11:38:57 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.8.5-2+b1 
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: If the rootfs is read-only then we aren't going to be
	updating
	any alternatives or modifying the password file and these binaries will
	be
	redundant. In an ideal world we would be able to stop them from being
	installed
	in the first place but this is non-trivial to arrange. As a workaround
	in the meantime,
	let's just uninstall them once image construction is finished.
	[...] Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] image.bbclass: Also uninstall update-alternatives and shadow for read-only-rootfs
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
X-List-Received-Date: Sun, 02 Feb 2014 12:34:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If the rootfs is read-only then we aren't going to be updating any
alternatives or modifying the password file and these binaries will
be redundant.  In an ideal world we would be able to stop them from
being installed in the first place but this is non-trivial to arrange.
As a workaround in the meantime, let's just uninstall them once image
construction is finished.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d1283d2..25bc5f3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -559,7 +559,7 @@ rootfs_uninstall_unneeded () {
 			fi
 
 			# Remove package only if it's installed
-			pkgs_to_remove="update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+			pkgs_to_remove="update-rc.d base-passwd update-alternatives shadow ${ROOTFS_BOOTSTRAP_INSTALL}"
 			for pkg in $pkgs_to_remove; do
 			    # regexp for pkg, to be used in grep and sed
 			    pkg_regexp="^`echo $pkg | sed 's/\./\\\./'` "
-- 
1.8.4.3





Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A9E876EA47
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2014 12:38:12 +0000 (UTC)
Received: from [212.183.132.39] (helo=[192.168.42.139])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W9wJO-00027E-2Q
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Feb 2014 13:38:13 +0100
Message-ID: <1391344687.3068.60.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Sun, 02 Feb 2014 12:38:07 +0000
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.8.5-2+b1 
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
	Content preview: Commit a5362de60c0051f16b88a40bd9cb41915bee0b0f
	restricted
	us to writing only a single entry to the status file for any given
	package.
	This avoids writing garbage entries (with no Status) when multiple
	versions of the same package exist in the feed. However,
	in the case where the same
	version exists for multiple architectures (for example,
	has been built for both cortexa15 and generic armv7a),
	we do need to write out status file entries
	for all of them since we can't trivially determine which one opkg will
	decide to install. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] rootfs_ipk: Ensure that BAD_RECOMMENDATIONS are honoured for all architectures
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
X-List-Received-Date: Sun, 02 Feb 2014 12:38:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Commit a5362de60c0051f16b88a40bd9cb41915bee0b0f restricted us to writing
only a single entry to the status file for any given package.  This
avoids writing garbage entries (with no Status) when multiple versions
of the same package exist in the feed.  However, in the case where the
same version exists for multiple architectures (for example, has been
built for both cortexa15 and generic armv7a), we do need to write out
status file entries for all of them since we can't trivially determine
which one opkg will decide to install.

Fix this by undoing a5362de60c0051f16b88a40bd9cb41915bee0b0f and writing
out an entry for everything that matches, but ensuring that we force the
Status to the correct value for each one.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/rootfs_ipk.bbclass | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index ce88c32..8d78cb0 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -46,13 +46,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 	for i in ${BAD_RECOMMENDATIONS}; do
 		pkginfo="`opkg-cl ${OPKG_ARGS} info $i`"
 		if [ ! -z "$pkginfo" ]; then
-			# Take just the first package stanza as otherwise only
-			# the last one will have the right Status line.
-			echo "$pkginfo" | awk "/^Package:/ { print } \
-                        		       /^Architecture:/ { print } \
-                        		       /^Version:/ { print } \
-                        		       /^$/ { exit } \
-                        		       END { print \"Status: deinstall hold not-installed\n\" }" - >> $STATUS
+			echo "$pkginfo" | awk "/^Status:/ { print \"Status: deinstall hold not-installed\n\" }" - >> $STATUS
 		else
 			echo "Requested ignored recommendation $i is not a package"
 		fi
-- 
1.8.4.3





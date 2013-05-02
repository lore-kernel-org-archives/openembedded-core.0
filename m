Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UXuFi-0004Vu-Qg for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 16:12:54 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UXtyR-0000Wg-Fp
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 15:55:03 +0200
Message-ID: <1367502902.14512.256.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 02 May 2013 14:55:02 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] fs-perms.txt: Don't tinker with file modes in /usr/src/debug
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 14:12:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since 6775feb9fe935ab01fd9cae2b2d3fce5824a9a72 our local "copy" of the
debug sources has in fact been hardlinked to ${S} and potentially other
places too.  This means that any modifications we make to these files
might have wider consequences than intended.

Avoid this potential pitfall by telling fixup_perms() to leave the file
modes in this directory alone.  No great harm will result from shipping
debug sources with a mode other than 0644: if the mode was permissive
enough for us to compile the sources in the first place then it must
also be permissive enough for subsequent debugging.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/files/fs-perms.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index ef44e26..becb85c 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -41,7 +41,7 @@ ${includedir}		0755	root	root	true	0644	root	root
 ${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Cleanup debug src
-/usr/src/debug		0755	root	root	true	0644	root	root
+/usr/src/debug		0755	root	root	true	-	root	root
 
 # Items from base-files
 # Links
-- 
1.7.10.4






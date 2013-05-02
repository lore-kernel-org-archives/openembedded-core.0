Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UXthy-0007Ik-EJ for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 15:38:10 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UXtQf-0000V2-LQ
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 15:20:09 +0200
Message-ID: <1367500809.14512.252.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 02 May 2013 14:20:09 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] package.bbclass: Remove redundant chmod/chown operations
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
X-List-Received-Date: Thu, 02 May 2013 13:38:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These were introduced in 6021e309e69d823e1467648aee12a32182945569.  The
code currently reads:

                os.link(file, fpath)
                fstat = cpath.stat(file)
                os.chmod(fpath, fstat.st_mode)
                os.chown(fpath, fstat.st_uid, fstat.st_gid)

which can have no useful effect since, if "fpath" is a hard link to
"file", it will (by definition) have the same mode, uid and gid.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/package.bbclass |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4136a9f..99eda77 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1000,9 +1000,6 @@ python populate_packages () {
             fpath = os.path.join(root,file)
             if not cpath.islink(file):
                 os.link(file, fpath)
-                fstat = cpath.stat(file)
-                os.chmod(fpath, fstat.st_mode)
-                os.chown(fpath, fstat.st_uid, fstat.st_gid)
                 continue
             ret = bb.utils.copyfile(file, fpath)
             if ret is False or ret == 0:
-- 
1.7.10.4






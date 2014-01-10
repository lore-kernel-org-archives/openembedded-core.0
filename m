Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 22B0360C03
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 14:38:34 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W1dEI-00077W-Cf
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jan 2014 15:38:34 +0100
Message-ID: <1389364712.9182.153.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2014 14:38:32 +0000
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
	Content preview: Since ca86603607a69a17cc5540d69de0e242b33382d3 we are
	now
	calling stat() on all the pkgfiles[] during emit_pkgdata(). If symlink
	snapping
	has removed some of the files then we will blow up trying to stat a
	path
	that no longer exists. Fix that by ensuring that pkgfiles[] is updated
	when we process the list of library renames. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] package: Keep global pkgfiles[] up to date when snapping library symlinks
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
X-List-Received-Date: Fri, 10 Jan 2014 14:38:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since ca86603607a69a17cc5540d69de0e242b33382d3 we are now calling stat() on
all the pkgfiles[] during emit_pkgdata().  If symlink snapping has removed
some of the files then we will blow up trying to stat a path that no longer
exists.  Fix that by ensuring that pkgfiles[] is updated when we process the 
list of library renames.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/package.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 08b78db..726a84f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1474,6 +1474,8 @@ python package_do_shlibs() {
         for (old, new) in renames:
             bb.note("Renaming %s to %s" % (old, new))
             os.rename(old, new)
+            pkgfiles[pkg].remove(old)
+	    
         shlibs_file = os.path.join(shlibswork_dir, pkg + ".list")
         shver_file = os.path.join(shlibswork_dir, pkg + ".ver")
         if len(sonames):
-- 
1.8.5





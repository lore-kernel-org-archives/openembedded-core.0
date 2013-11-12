Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6556D7E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 13:29:24 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>) id 1VgE20-0007ND-Uf
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Nov 2013 14:29:25 +0100
Message-ID: <1384262964.16718.165.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2013 13:29:24 +0000
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
	Content preview: bb.fetch.decodeurl() will throw if it doesn't like the
	look
	of the URL that it's given. (Bitbake's idea of what constitutes a valid
	URL
	is somewhat idiosyncratic so it is fairly easy to trip over this by
	mistake when writing a recipe.) [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] insane, license: Trap MalformedUrl exceptions when parsing LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 12 Nov 2013 13:29:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

bb.fetch.decodeurl() will throw if it doesn't like the look of the URL that
it's given.  (Bitbake's idea of what constitutes a valid URL is somewhat
idiosyncratic so it is fairly easy to trip over this by mistake when writing
a recipe.)

If these exceptions are allowed to propagate all the way up to better_exec()
then we will get a large amount of python stack trace spew when they are
finally caught.  Avoid that by catching them locally and throwing
bb.build.FuncFailed() with a suitable explanation instead.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/insane.bbclass  | 5 ++++-
 meta/classes/license.bbclass | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index eb440c2..3558dee 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -594,7 +594,10 @@ def package_qa_check_license(workdir, d):
     srcdir = d.getVar('S', True)
 
     for url in lic_files.split():
-        (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
+        try:
+            (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
+        except bb.fetch.MalformedUrl:
+            raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
             raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile)
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 6abdae4..1c1b679 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -228,7 +228,10 @@ def find_license_files(d):
         return lic_files_paths
 
     for url in lic_files.split():
-        (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
+        try:
+            (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
+        except bb.fetch.MalformedUrl:
+            raise bb.build.FuncFailed("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF', True), url))
         # We want the license filename and path
         srclicfile = os.path.join(srcdir, path)
         lic_files_paths.append((os.path.basename(path), srclicfile))
-- 
1.8.4.rc3





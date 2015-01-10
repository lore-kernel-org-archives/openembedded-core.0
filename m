Return-Path: <milo-software@users.sourceforge.net>
X-Greylist: delayed 413 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 Jan 2015 13:53:40 UTC
Received: from smtp09.online.nl (smtp09.online.nl [194.134.42.54])
	by mail.openembedded.org (Postfix) with ESMTP id 64116724FF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Jan 2015 13:53:40 +0000 (UTC)
Received: from smtp09.online.nl (localhost [127.0.0.1])
	by smtp09.online.nl (Postfix) with ESMTP id AF7E91E383;
	Sat, 10 Jan 2015 14:46:45 +0100 (CET)
Received: from phenom.local (s55969068.adsl.online.nl [85.150.144.104])
	by smtp09.online.nl (Postfix) with ESMTP;
	Sat, 10 Jan 2015 14:46:45 +0100 (CET)
From: Mike Looijmans <milo-software@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Jan 2015 14:46:42 +0100
Message-Id: <1420897602-29467-1-git-send-email-milo-software@users.sourceforge.net>
X-Mailer: git-send-email 1.7.9.5
X-Online-Scanned: by Cloudmark authority (on smtp09.online.nl)
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] package.bbclass: Let PR server update PKGV, not PV
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
X-List-Received-Date: Sat, 10 Jan 2015 13:53:46 -0000

From: Mike Looijmans <mike.looijmans@topic.nl>

PV is the package version as we need it to be during the build. PKGV is the
final version as it ends up in the package, and defaults to PV.

The packager handled builds without PR-server by replacing the AUTOINC string
in PKGV, but when the PR-server is being used, the script replaces the contents
of PKGV with the PV if the PV contains "AUTOINC". Thus the packager overrides
any change to PKGV the recipe might have made.
This breaks classes like gitpkgv that provide a correctly numbered PKGV, the
number as calculated by that class will simply be replaced with a 0-based index
from the PR-server.

This patch makes the packager look at the PKGV version instead of the PV, and
update the PKGV only based on the PKGV contents as set by the recipe.

See also the discussion here:
http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100329.html

From investigating the history of the code and changes in the past year, the
use of "pv" instead of "pkgv" appears to be just an oversight, introduced in:
commit b27b438221e16ac3df6ac66d761b77e3bd43db67 "prs: use the PRServer to replace the BB_URI_LOCALCOUNT functionality"
A later commit 865d001de168915a5796e5c760f96bdd04cebd61 "package/prserv: Merge two similar functions into one"
silently fixed this only for the case without PR-server by using pkgv there.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/package.bbclass |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fc501fc..93e2461 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -403,9 +403,10 @@ python package_get_auto_pr() {
     if not (host is None):
         d.setVar("PRSERV_HOST", host)
 
+    pkgv = d.getVar("PKGV", True)
+
     # PR Server not active, handle AUTOINC
     if not d.getVar('PRSERV_HOST', True):
-        pkgv = d.getVar("PKGV", True)
         if 'AUTOINC' in pkgv:
             d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
         return
@@ -428,11 +429,11 @@ python package_get_auto_pr() {
         if conn is None:
             conn = oe.prservice.prserv_make_conn(d)
         if conn is not None:
-            if "AUTOINC" in pv:
+            if "AUTOINC" in pkgv:
                 srcpv = bb.fetch2.get_srcrev(d)
                 base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
                 value = conn.getPR(base_ver, pkgarch, srcpv)
-                d.setVar("PKGV", pv.replace("AUTOINC", str(value)))
+                d.setVar("PKGV", pkgv.replace("AUTOINC", str(value)))
 
             auto_pr = conn.getPR(version, pkgarch, checksum)
     except Exception as e:
-- 
1.7.9.5



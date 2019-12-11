Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD967FBDB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 16:48:24 +0000 (UTC)
IronPort-SDR: 7yK0CVrXjromP8eeajGJ0VAE5XGmO7dQn58JgB1cHAY6aMNb9bE7cXGQlNC8KyiWvRSf5HdNal
	WQuZdBSXjflCAKcUiYWjJLr9Bc7p3XZ7jaOMpDoGHC7uJMe/jiPml6mdr2q3Yhk/3dI7Db/MMz
	PsIGUDUmn7TCfxKWNlcrQM9TcWNvCJuSpSVTAQh8VYT1nTDPnItt+7qsvhwvIXI3+wfYrpIDX5
	ur4pe6jHUOOnndkk8X1tcThnG2P51LeEWCROIyza4kwINYdh/ehLpFukStuqyuFt522nhWFt6t
	tVA=
X-IronPort-AV: E=Sophos;i="5.69,302,1571695200"; 
   d="scan'208";a="3390379"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 17:48:16 +0100
Message-Id: <20191211164820.26588-4-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211164820.26588-1-pkj@axis.com>
References: <20191211164820.26588-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCHv3 4/8] base.bbclass: Simplify the check for whitelisted licenses
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
X-List-Received-Date: Wed, 11 Dec 2019 16:48:25 -0000
Content-Transfer-Encoding: 8bit

After a number of rewrites, the code checking if a package has been
whitelisted for an incompatible license was calculating the
whitelisted packages twice (as 'whitelist' and as 'incompatwl').

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/base.bbclass | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 31457f9f12..a3170d219c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -526,23 +526,21 @@ python () {
             bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
             whitelist = []
-            incompatwl = []
             for lic in bad_licenses:
                 spdx_license = return_spdx(d, lic)
                 whitelist.extend((d.getVar("WHITELIST_" + lic) or "").split())
                 if spdx_license:
                     whitelist.extend((d.getVar("WHITELIST_" + spdx_license) or "").split())
+
+            if pn in whitelist:
                 '''
                 We need to track what we are whitelisting and why. If pn is
                 incompatible we need to be able to note that the image that
                 is created may infact contain incompatible licenses despite
                 INCOMPATIBLE_LICENSE being set.
                 '''
-                incompatwl.extend((d.getVar("WHITELIST_" + lic) or "").split())
-                if spdx_license:
-                    incompatwl.extend((d.getVar("WHITELIST_" + spdx_license) or "").split())
-
-            if not pn in whitelist:
+                bb.note("Including %s as buildable despite it having an incompatible license because it has been whitelisted" % pn)
+            else:
                 pkgs = d.getVar('PACKAGES').split()
                 skipped_pkgs = []
                 unskipped_pkgs = []
@@ -562,9 +560,6 @@ python () {
                 elif all_skipped or incompatible_license(d, bad_licenses):
                     bb.debug(1, "SKIPPING recipe %s because it's %s" % (pn, license))
                     raise bb.parse.SkipRecipe("it has an incompatible license: %s" % license)
-            elif pn in whitelist:
-                if pn in incompatwl:
-                    bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
 
         # Try to verify per-package (LICENSE_<pkg>) values. LICENSE should be a
         # superset of all per-package licenses. We do not do advanced (pattern)
-- 
2.21.0



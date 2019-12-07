Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3884C7FA9E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 05:38:20 +0000 (UTC)
IronPort-SDR: SOjOLiz6m1Bbw6bxJYKtZihmy9e+SqzARDjeigDJ1QWJ/0xdTWGZBR8XgsHB07TakBDM3DxveY
	CBAXF/x/WYHgBNokyyXat0WB0zpEQAKGy0JFmD08yj8/y6PsGQOIo5dAKxbjA2gnwqCuJ7+3ne
	1vyg5M06e293W2eiTuwdrdM0iL6DK6lgPtBZMqW0EJC3y5YVXObBhbKs/6qNgX0+gU9ESvl4Fo
	+pYe/cn4cZcKKQNc9GvA45flEUt0QyRdYi6XIM5iLlKyLOqglQE3xxTDAWWB1IArugz8eDcJE+
	P2U=
X-IronPort-AV: E=Sophos;i="5.69,286,1571695200"; 
   d="scan'208";a="3353226"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Dec 2019 06:38:12 +0100
Message-Id: <20191207053815.1757-4-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191207053815.1757-1-pkj@axis.com>
References: <20191207053815.1757-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 4/7] base.bbclass: Simplify the check for whitelisted licenses
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
X-List-Received-Date: Sat, 07 Dec 2019 05:38:20 -0000
Content-Transfer-Encoding: 8bit

After a number of rewrites, the code checking if a package has been
whitelisted for an incompatible license was calculating the
whitelisted packages twice (as 'whitelist' and as 'incompatwl').

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/base.bbclass | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3306b316bb..5176168cf8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -531,23 +531,21 @@ python () {
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
@@ -567,9 +565,6 @@ python () {
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



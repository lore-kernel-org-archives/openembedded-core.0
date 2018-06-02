Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B835744AA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 19:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E6BFF1814A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:30:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id RFAaNPescagr
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:30:43 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8903318133
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:30:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 732B41A05B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:30:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 678D91A058
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:30:43 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:30:43 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 5B6A325A4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:30:43 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w52JUYos014687
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Jun 2018 21:30:34 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w52JUY3K014686
	for openembedded-core@lists.openembedded.org;
	Sat, 2 Jun 2018 21:30:34 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jun 2018 21:30:32 +0200
Message-Id: <20180602193033.14641-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2 1/2] oe-pkgdata-util: Make parse_pkgdatafile() support package suffixed vars
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
X-List-Received-Date: Sat, 02 Jun 2018 19:30:44 -0000

Support for variables suffixed with package names, e.g., PKGV_foo, was
removed in commit 3d2c87c4, which broke support for recipes that set
other versions on their packages than what is in ${PV}.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-pkgdata-util | 46 ++++++++++++++++++----------------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index aea8a57516..965f473725 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -286,36 +286,26 @@ def lookup_recipe(args):
 
 def package_info(args):
     def parse_pkgdatafile(pkgdatafile):
+        vars = ['PKGV', 'PKGE', 'PKGR', 'PN', 'PV', 'PE', 'PR', 'PKGSIZE']
         with open(pkgdatafile, 'r') as f:
-            pkge = ''
-            pkgr = ''
-            pe = ''
-            pr = ''
+            vals = dict()
             for line in f:
-                if line.startswith('PKGV:'):
-                    pkg_version = line.split(':', 1)[1].strip()
-                elif line.startswith('PKGE:'):
-                    pkge = line.split(':', 1)[1].strip()
-                elif line.startswith('PKGR:'):
-                    pkgr = line.split(':', 1)[1].strip()
-                elif line.startswith('PN:'):
-                    recipe = line.split(':', 1)[1].strip()
-                elif line.startswith('PV:'):
-                    recipe_version = line.split(':', 1)[1].strip()
-                elif line.startswith('PE:'):
-                    pe = line.split(':', 1)[1].strip()
-                elif line.startswith('PR:'):
-                    pr = line.split(':', 1)[1].strip()
-                elif line.startswith('PKGSIZE'):
-                    pkg_size = line.split(':', 1)[1].strip()
-            if pkge:
-                pkg_version = pkge + ":" + pkg_version
-            if pkgr:
-                pkg_version = pkg_version + "-" + pkgr
-            if pe:
-                recipe_version = pe + ":" + recipe_version
-            if pr:
-                recipe_version = recipe_version + "-" + pr
+                for var in vars:
+                    m = re.match(var + '(?:_\S+)?:\s*(.+?)\s*$', line)
+                    if m:
+                        vals[var] = m.group(1)
+            pkg_version = vals['PKGV'] or ''
+            recipe = vals['PN'] or ''
+            recipe_version = vals['PV'] or ''
+            pkg_size = vals['PKGSIZE'] or ''
+            if 'PKGE' in vals:
+                pkg_version = vals['PKGE'] + ":" + pkg_version
+            if 'PKGR' in vals:
+                pkg_version = pkg_version + "-" + vals['PKGR']
+            if 'PE' in vals:
+                recipe_version = vals['PE'] + ":" + recipe_version
+            if 'PR' in vals:
+                recipe_version = recipe_version + "-" + vals['PR']
             print("%s %s %s %s %s" % (pkg, pkg_version, recipe, recipe_version, pkg_size))
 
     # Handle both multiple arguments and multiple values within an arg (old syntax)
-- 
2.12.0



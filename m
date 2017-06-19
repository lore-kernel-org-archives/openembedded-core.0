Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA976780B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8D98D1826F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:31:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id mdjIxKtCAgJm
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:31:49 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0223B180E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:31:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0FBF1E07D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:31:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D44421E07B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:31:48 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:31:48 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id C87B81193
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:31:48 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5JEVmOE011962
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:31:48 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5JEVmWj011961
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Jun 2017 16:31:48 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 16:31:45 +0200
Message-Id: <20170619143145.11911-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv3] oe-pkgdata-util: package-info: Allow extra variables to be displayed
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
X-List-Received-Date: Mon, 19 Jun 2017 14:31:49 -0000

By specifying the -e <var> option one or multiple times, extra
variables available in the pkgdata can be displayed, e.,g,
`oe-pkgdata-util package-info -e SUMMARY -e LICENSE ...`. The extra
variables displayed are quoted since some of them may contain
whitespace.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
PATCHv2: Changed references to SRC_URI into LICENSE, since SRC_URI is
not an available variable in the pkgdata.

PATCHv3: Avoid a "TypeError: 'NoneType' object is not iterable" if
no --extra argument is specified. Duh!

 scripts/oe-pkgdata-util | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 6255662a4b..5d61c05f23 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -325,8 +325,15 @@ def package_info(args):
             recipe_version = recipe_version + "-" + mappings[pkg]['PR']
         pkg_size = mappings[pkg]['PKGSIZE']
 
-        items.append("%s %s %s %s %s" %
-                     (pkg, pkg_version, recipe, recipe_version, pkg_size))
+        line = "%s %s %s %s %s" % (pkg, pkg_version, recipe, recipe_version, pkg_size)
+
+        if args.extra:
+            for val in args.extra:
+                src_uri = mappings[pkg][val].strip()
+                src_uri = re.sub(r'\s+', ' ', src_uri)
+                line += ' "%s"' % src_uri
+
+        items.append(line)
     print('\n'.join(items))
 
 def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
@@ -530,6 +537,7 @@ def main():
                                           description='Looks up the specified runtime package(s) and display information')
     parser_package_info.add_argument('pkg', nargs='*', help='Runtime package name to look up')
     parser_package_info.add_argument('-f', '--file', help='Read package names from the specified file (one per line, first field only)')
+    parser_package_info.add_argument('-e', '--extra', help='Extra variables to display, e.g., LICENSE (can be specified multiple times)', action='append')
     parser_package_info.set_defaults(func=package_info)
 
     parser_find_path = subparsers.add_parser('find-path',
-- 
2.12.0



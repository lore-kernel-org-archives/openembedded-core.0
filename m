Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6E0DC77E5E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 07:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id DB4332E5AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:34:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id phjQyi-hp6h0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:34:10 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 18FFD2E589
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:34:10 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0EDE1A0A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:34:09 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E56F31A0A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:34:09 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:34:09 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id D91202413
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:34:09 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v517YATI030347
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Jun 2017 09:34:10 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v517YAbk030346
	for openembedded-core@lists.openembedded.org;
	Thu, 1 Jun 2017 09:34:10 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 09:33:49 +0200
Message-Id: <20170601073349.30295-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2] oe-pkgdata-util: package-info: Allow extra variables to be displayed
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
X-List-Received-Date: Thu, 01 Jun 2017 07:34:11 -0000

By specifying the -e <var> option one or multiple times, extra
variables available in the pkgdata can be displayed, e.,g,
`oe-pkgdata-util package-info -e SUMMARY -e LICENSE ...`. The extra
variables displayed are quoted since some of them may contain
whitespace.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
PATCHv2: Changed references to SRC_URI into LICENSE, since SRC_URI is
not an available variable in the pkgdata.

 scripts/oe-pkgdata-util | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 6255662a4b..87beecb9da 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -325,8 +325,14 @@ def package_info(args):
             recipe_version = recipe_version + "-" + mappings[pkg]['PR']
         pkg_size = mappings[pkg]['PKGSIZE']
 
-        items.append("%s %s %s %s %s" %
-                     (pkg, pkg_version, recipe, recipe_version, pkg_size))
+        line = "%s %s %s %s %s" % (pkg, pkg_version, recipe, recipe_version, pkg_size)
+
+        for val in args.extra:
+            src_uri = mappings[pkg][val].strip()
+            src_uri = re.sub(r'\s+', ' ', src_uri)
+            line += ' "%s"' % src_uri
+
+        items.append(line)
     print('\n'.join(items))
 
 def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
@@ -530,6 +536,7 @@ def main():
                                           description='Looks up the specified runtime package(s) and display information')
     parser_package_info.add_argument('pkg', nargs='*', help='Runtime package name to look up')
     parser_package_info.add_argument('-f', '--file', help='Read package names from the specified file (one per line, first field only)')
+    parser_package_info.add_argument('-e', '--extra', help='Extra variables to display, e.g., LICENSE (can be specified multiple times)', action='append')
     parser_package_info.set_defaults(func=package_info)
 
     parser_find_path = subparsers.add_parser('find-path',
-- 
2.12.0



Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA29601D4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B8AB618581;
	Fri,  8 Sep 2017 16:33:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id tlHqT8KQoR5N; Fri,  8 Sep 2017 16:33:20 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 86B72185A3;
	Fri,  8 Sep 2017 16:33:20 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 728A41E06C;
	Fri,  8 Sep 2017 16:33:20 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 675CC1E075;
	Fri,  8 Sep 2017 16:33:20 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri,  8 Sep 2017 16:33:20 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 5AD882BF3;
	Fri,  8 Sep 2017 16:33:20 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v88EXJ5V030374;
	Fri, 8 Sep 2017 16:33:19 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v88EXJpB030373;
	Fri, 8 Sep 2017 16:33:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:33:15 +0200
Message-Id: <20170908143315.30326-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [pyro][PATCHv2] oe-pkgdata-util: package-info: Allow extra variables to be displayed
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
X-List-Received-Date: Fri, 08 Sep 2017 14:33:22 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

By specifying the -e <var> option one or multiple times, extra
variables available in the pkgdata can be displayed, e.,g,
`oe-pkgdata-util package-info -e SUMMARY -e LICENSE ...`. The extra
variables displayed are quoted since some of them may contain
whitespace.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

This is a backport of the corresponding change (6f054fcf) on master.
It should not change anything unless one actually uses the --extra
option to oe-pkgdata-util.

PATCHv2: Now without Change-Id footer.

 scripts/oe-pkgdata-util | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 6255662a4b..677effeef6 100755
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
+            for var in args.extra:
+                val = mappings[pkg][var].strip()
+                val = re.sub(r'\s+', ' ', val)
+                line += ' "%s"' % val
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



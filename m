Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 134317289F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 07:07:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t07777RS007917
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 6 Jan 2015 23:07:08 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 6 Jan 2015 23:07:07 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 7 Jan 2015 15:06:50 +0800
Message-ID: <b58837680ca41fb5fad61cdb2d8b13719260d9f7.1420613743.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420613743.git.hongxu.jia@windriver.com>
References: <cover.1420613743.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] scripts/oe-pkgdata-util: add ability to list all produced packages from a recipe
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
X-List-Received-Date: Wed, 07 Jan 2015 07:07:11 -0000
Content-Type: text/plain

Add a "list-packages" command to list all produced packages by a
particular recipe.

[YOCTO #5264]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/oe-pkgdata-util | 47 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index e43f773..984f66e 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -28,6 +28,7 @@ import re
 import optparse
 from collections import defaultdict
 import codecs
+import errno
 
 def glob(args, usage, debug=False):
     if len(args) < 3:
@@ -308,6 +309,46 @@ def collect_rprovides(pkgdata_dir):
 
     return rprovides_dict
 
+def list_packages(args, usage, debug=False):
+    if len(args) < 2:
+        usage()
+        sys.exit(1)
+
+    pkgdata_dir = args[0]
+    if not os.path.exists(pkgdata_dir):
+        print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
+        sys.exit(1)
+
+    if len(args[1].split()) != 1:
+        print('ERROR: Only one recipe name is acceptable')
+        sys.exit(1)
+
+    recipe = args[1]
+    packages = ""
+    try:
+        with open(os.path.join(pkgdata_dir, recipe)) as f:
+            for line in f.readlines():
+                if line.startswith('PACKAGES: '):
+                    packages = line.split(': ', 1)[1].split()
+                    break
+    except IOError as e:
+        if e.errno == errno.ENOENT:
+            print('ERROR: The recipe %s does not exist' % recipe)
+            sys.exit(1)
+        else:
+            raise
+
+    # Filter out packages that not generated
+    for pkg in packages[:]:
+        flag_packaged = "%s/runtime/%s.packaged" % (pkgdata_dir, pkg)
+        if not os.access(flag_packaged, os.R_OK):
+            if debug:
+                print("%s not produced by %s" % (pkg, recipe))
+            packages.remove(pkg)
+
+    print '\n'.join(packages)
+
+
 def find_path(args, usage, debug=False):
     if len(args) < 2:
         usage()
@@ -354,7 +395,9 @@ Available commands:
         find the package providing the specified path (wildcards * ? allowed)
     read-value <pkgdatadir> <value-name> "<pkgs>"
         read the named value from the pkgdata files for the specified
-        packages''')
+        packages
+    list-packages <pkgdatadir> "<recipe>"
+        list all packages produced by the particular recipe''')
 
     parser.add_option("-d", "--debug",
             help = "Enable debug output",
@@ -377,6 +420,8 @@ Available commands:
         find_path(args[1:], parser.print_help, options.debug)
     elif args[0] == "read-value":
         read_value(args[1:], parser.print_help, options.debug)
+    elif args[0] == "list-packages":
+        list_packages(args[1:], parser.print_help, options.debug)
     else:
         parser.print_help()
         sys.exit(1)
-- 
1.9.1



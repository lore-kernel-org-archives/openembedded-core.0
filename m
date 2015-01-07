Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6636E609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 07:07:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t07775Uq021653
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 6 Jan 2015 23:07:05 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 6 Jan 2015 23:07:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 7 Jan 2015 15:06:49 +0800
Message-ID: <7ae53a614634dedc2828f1ccab13fed8f0c0e5e4.1420613743.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420613743.git.hongxu.jia@windriver.com>
References: <cover.1420613743.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] scripts/oe-pkgdata-util: support rprovides for lookup-recipe
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

If failed to invoke lookup-recipe while pkg not generated but provided
by others, such as python3, it is provided by python3-core
...
$ bitbake python3
$ oe-pkgdata-util -d lookup-recipe tmp/sysroots/qemux86/pkgdata/ "python3"
ERROR: the following packages could not be found: python3
...

In this situation, we search the pkg's rprovides (if available) to replace.

[YOCTO #5264]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/oe-pkgdata-util | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index bf87547..e43f773 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -27,6 +27,7 @@ import fnmatch
 import re
 import optparse
 from collections import defaultdict
+import codecs
 
 def glob(args, usage, debug=False):
     if len(args) < 3:
@@ -234,6 +235,19 @@ def lookup_recipe(args, usage, debug=False):
         print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
         sys.exit(1)
 
+    # If the pkg not generated, search the rprovides to replace
+    rprovides = collect_rprovides(pkgdata_dir)
+    for pkg in pkgs[:]:
+        pkgfile = os.path.join(pkgdata_dir, 'runtime', pkg)
+        if not os.path.exists(pkgfile):
+            for newpkg, oldpkg in rprovides.items():
+                if oldpkg == pkg:
+                    if debug:
+                        print('%s rprovides %s' % (newpkg, pkg))
+                    pkgs.remove(pkg)
+                    pkgs.append(newpkg)
+                    break
+
     mappings = defaultdict(list)
     for pkg in pkgs:
         pkgfile = os.path.join(pkgdata_dir, 'runtime-reverse', pkg)
@@ -254,6 +268,46 @@ def lookup_recipe(args, usage, debug=False):
         items.extend(mappings.get(pkg, []))
     print '\n'.join(items)
 
+def collect_rprovides(pkgdata_dir):
+    def read_pkgdatafile(fn):
+        pkgdata = {}
+        def decode(str):
+            c = codecs.getdecoder("string_escape")
+            return c(str)[0]
+
+        if os.access(fn, os.R_OK):
+            import re
+            f = open(fn, 'r')
+            lines = f.readlines()
+            f.close()
+            r = re.compile("([^:]+):\s*(.*)")
+            for l in lines:
+                m = r.match(l)
+                if m:
+                    pkgdata[m.group(1)] = decode(m.group(2))
+        return pkgdata
+
+    rprovides_dict = dict()
+    if os.path.exists(pkgdata_dir):
+        for root, dirs, files in os.walk("%s/runtime" % pkgdata_dir):
+            for pkgname in files:
+                pkgdatafile = "%s/%s" % (root, pkgname)
+                if not os.access("%s.packaged" % pkgdatafile, os.R_OK):
+                    continue
+
+                try:
+                    sdata = read_pkgdatafile(pkgdatafile)
+                    rprovides = sdata.get('RPROVIDES_%s' % pkgname)
+                    if rprovides:
+                        rprovides_dict[pkgname] = rprovides
+
+                except Exception as e:
+                    print("ERROR:%s: Failed to read pkgdata file %s: %s: %s" %
+                          (pkgname, pkgdatafile, e.__class__, str(e)))
+                    sys.exit(1)
+
+    return rprovides_dict
+
 def find_path(args, usage, debug=False):
     if len(args) < 2:
         usage()
-- 
1.9.1



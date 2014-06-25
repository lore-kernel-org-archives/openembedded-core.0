Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C563960E24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:40:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5P9eHa9027550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 02:40:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 25 Jun 2014 02:40:16 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jun 2014 17:39:44 +0800
Message-ID: <a2fb3f6f46f9ceb8adea6126f7b62717e77b862d.1403689140.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403689140.git.Chong.Lu@windriver.com>
References: <cover.1403689140.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] scripts/contrib/verify-homepage.py: add a script to verify HOMEPAGE
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
X-List-Received-Date: Wed, 25 Jun 2014 09:40:18 -0000
Content-Type: text/plain

Add a script to verify all the recipes' HOMEPAGE.

[YOCTO #5689]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 scripts/contrib/verify-homepage.py | 63 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100755 scripts/contrib/verify-homepage.py

diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
new file mode 100755
index 0000000..86cc82b
--- /dev/null
+++ b/scripts/contrib/verify-homepage.py
@@ -0,0 +1,63 @@
+#!/usr/bin/env python
+
+# This script is used for verify HOMEPAGE.
+# The result is influenced by network environment, since the timeout of connect url is 5 seconds as default.
+
+import sys
+import os
+import subprocess
+import urllib2
+
+def search_bitbakepath():
+    bitbakepath = ""
+
+    # Search path to bitbake lib dir in order to load bb modules
+    if os.path.exists(os.path.join(os.path.dirname(sys.argv[0]), '../../bitbake/lib/bb')):
+        bitbakepath = os.path.join(os.path.dirname(sys.argv[0]), '../../bitbake/lib')
+        bitbakepath = os.path.abspath(bitbakepath)
+    else:
+        # Look for bitbake/bin dir in PATH
+        for pth in os.environ['PATH'].split(':'):
+            if os.path.exists(os.path.join(pth, '../lib/bb')):
+                bitbakepath = os.path.abspath(os.path.join(pth, '../lib'))
+                break
+        if not bitbakepath:
+            sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
+            sys.exit(1)
+    return bitbakepath
+
+# For importing the following modules
+sys.path.insert(0, search_bitbakepath())
+import bb.tinfoil
+
+def wgetHomepage(pn, homepage):
+    result = subprocess.call('wget ' + '-q -T 5 -t 1 --spider ' + homepage, shell = True)
+    if result:
+        bb.warn("Failed to verify HOMEPAGE (%s) of %s" % (homepage, pn))
+        return 1
+    else:
+        return 0
+
+def verifyHomepage(bbhandler):
+    pkg_pn = bbhandler.cooker.recipecache.pkg_pn
+    pnlist = sorted(pkg_pn)
+    count = 0
+    for pn in pnlist:
+        fn = pkg_pn[pn].pop()
+        data = bb.cache.Cache.loadDataFull(fn, bbhandler.cooker.collection.get_file_appends(fn), bbhandler.config_data)
+        homepage = data.getVar("HOMEPAGE")
+        if homepage:
+            try:
+                urllib2.urlopen(homepage, timeout=5)
+            except Exception:
+                count = count + wgetHomepage(pn, homepage)
+    return count
+
+if __name__=='__main__':
+    failcount = 0
+    bbhandler = bb.tinfoil.Tinfoil()
+    bbhandler.prepare()
+    print "Start to verify HOMEPAGE:"
+    failcount = verifyHomepage(bbhandler)
+    print "finish to verify HOMEPAGE."
+    print "Summary: %s failed" % failcount
-- 
1.9.1



Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 71EBB73163
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 20:08:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Sep 2016 13:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,358,1470726000"; d="scan'208";a="1058565584"
Received: from yewyangh-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.139])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2016 13:08:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 08:08:06 +1200
Message-Id: <3914ebc55625ceb10c332f2e93f6737276acf736.1474229259.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/10] recipetool: create: fix name/version extraction from filename
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
X-List-Received-Date: Sun, 18 Sep 2016 20:08:52 -0000

I ran into an example where recipetool was getting the name/version
completely wrong:

https://bitbucket.org/sortsmill/libunicodenames/downloads/libunicodenames-1.1.0_beta1.tar.xz

From this it would create a libunicodenames-1.1.0-beta1_1.1.0-beta1.bb
file (likely because it couldn't split the file name and therefore took
all of it, then got the version from one of the files inside the
tarball). When this happens it's just irritating because you then have
to delete the recipe / run devtool reset and then run recipetool create
/ devtool add again and specify the version manually.

This patch is the result of systematically running the
determine_from_filename() function over the files on the Yocto Project
source mirror and my local downloads directory and fixing as many of the
generic issues as reasonably practical - it now gets the name and
version correct much more often. There are still cases where it won't,
but they are now in the minority.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 50 +++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index cd86747..f7b0676 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -256,27 +256,49 @@ def validate_pv(pv):
 
 def determine_from_filename(srcfile):
     """Determine name and version from a filename"""
-    part = ''
-    if '.tar.' in srcfile:
-        namepart = srcfile.split('.tar.')[0].lower()
-    else:
-        namepart = os.path.splitext(srcfile)[0].lower()
     if is_package(srcfile):
         # Force getting the value from the package metadata
         return None, None
+
+    if '.tar.' in srcfile:
+        namepart = srcfile.split('.tar.')[0]
     else:
-        splitval = namepart.rsplit('_', 1)
+        namepart = os.path.splitext(srcfile)[0]
+    namepart = namepart.lower().replace('_', '-')
+    if namepart.endswith('.src'):
+        namepart = namepart[:-4]
+    if namepart.endswith('.orig'):
+        namepart = namepart[:-5]
+    splitval = namepart.split('-')
+    logger.debug('determine_from_filename: split name %s into: %s' % (srcfile, splitval))
+
+    ver_re = re.compile('^v?[0-9]')
+
+    pv = None
+    pn = None
     if len(splitval) == 1:
-        splitval = namepart.rsplit('-', 1)
-    pn = splitval[0].replace('_', '-')
-    if len(splitval) > 1:
-        if splitval[1][0] in '0123456789':
-            pv = splitval[1]
+        # Try to split the version out if there is no separator (or a .)
+        res = re.match('^([^0-9]+)([0-9.]+.*)$', namepart)
+        if res:
+            if len(res.group(1)) > 1 and len(res.group(2)) > 1:
+                pn = res.group(1).rstrip('.')
+                pv = res.group(2)
         else:
-            pn = '-'.join(splitval).replace('_', '-')
-            pv = None
+            pn = namepart
     else:
-        pv = None
+        if splitval[-1] in ['source', 'src']:
+            splitval.pop()
+        if len(splitval) > 2 and re.match('^(alpha|beta|stable|release|rc[0-9]|pre[0-9]|p[0-9]|[0-9]{8})', splitval[-1]) and ver_re.match(splitval[-2]):
+            pv = '-'.join(splitval[-2:])
+            if pv.endswith('-release'):
+                pv = pv[:-8]
+            splitval = splitval[:-2]
+        elif ver_re.match(splitval[-1]):
+            pv = splitval.pop()
+        pn = '-'.join(splitval)
+        if pv and pv.startswith('v'):
+            pv = pv[1:]
+    logger.debug('determine_from_filename: name = "%s" version = "%s"' % (pn, pv))
     return (pn, pv)
 
 def determine_from_url(srcuri):
-- 
2.5.5



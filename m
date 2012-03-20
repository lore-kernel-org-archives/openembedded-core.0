Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SA1jg-0006ph-Cx
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 17:16:36 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2012 09:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141958475"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.195])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2012 09:06:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 16:06:24 +0000
Message-Id: <8c7e0bb53a02dae0bdde4ab6220684dce129363b.1332259383.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332259383.git.paul.eggleton@linux.intel.com>
References: <cover.1332259383.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332259383.git.paul.eggleton@linux.intel.com>
References: <cover.1332259383.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] buildhistory_analysis: use bb.utils.explode_dep_versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2012 16:16:36 -0000

Previously this had its own implementation of splitting a list of
packages with optional version e.g. "libncurses-dev (>= 5.9)"; switch to
using the already existing bitbake function which does this as it is
much better tested.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |   11 +++++++++--
 scripts/buildhistory-diff            |   21 ++++++++++++++++++---
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index d09911c..c0fa339 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -13,6 +13,7 @@ import os.path
 import difflib
 import git
 import re
+import bb.utils
 
 
 # How to display fields
@@ -55,8 +56,13 @@ class ChangeRecord:
             prefix = ''
 
         def pkglist_split(pkgs):
-            pkgit = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+ [^ )]+\))?', pkgs, 0)
-            pkglist = [p.group(0) for p in pkgit]
+            depver = bb.utils.explode_dep_versions(pkgs)
+            pkglist = []
+            for k,v in depver.iteritems():
+                if v:
+                    pkglist.append("%s (%s)" % (k,v))
+                else:
+                    pkglist.append(k)
             return pkglist
 
         if self.fieldname in list_fields or self.fieldname in list_order_fields:
@@ -68,6 +74,7 @@ class ChangeRecord:
                 bitems = self.newvalue.split()
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
+
             if removed or added:
                 out = '%s:%s%s' % (self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
             else:
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 6b344eb..9936a4b 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -6,7 +6,7 @@
 # Author: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 import sys
-import os.path
+import os
 
 # Ensure PythonGit is installed (buildhistory_analysis needs it)
 try:
@@ -24,8 +24,23 @@ def main():
         sys.exit(1)
 
     # Set path to OE lib dir so we can import the buildhistory_analysis module
-    newpath = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])) + '/../meta/lib')
-    sys.path = sys.path + [newpath]
+    basepath = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])) + '/..')
+    newpath = basepath + '/meta/lib'
+    # Set path to bitbake lib dir so the buildhistory_analysis module can load bb.utils
+    if os.path.exists(basepath + '/bitbake/lib/bb'):
+        bitbakepath = basepath + '/bitbake'
+    else:
+        # look for bitbake/bin dir in PATH
+        bitbakepath = None
+        for pth in os.environ['PATH'].split(':'):
+            if os.path.exists(os.path.join(pth, '../lib/bb')):
+                bitbakepath = os.path.abspath(os.path.join(pth, '..'))
+                break
+        if not bitbakepath:
+            print("Unable to find bitbake by searching parent directory of this script or PATH")
+            sys.exit(1)
+
+    sys.path.extend([newpath, bitbakepath + '/lib'])
     import oe.buildhistory_analysis
 
     if len(sys.argv) > 3:
-- 
1.7.5.4




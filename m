Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 755137700B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520297"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:28 +0100
Message-Id: <625282f1c707a678ab8535d766d0b3eacecd0c05.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/27] recipetool: create: fix creating empty shell functions
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:18 -0000

The shell considers empty functions to be a syntax error, so for
template shell functions that contain only comments (or no lines at all)
then add a : to act as a no-op which avoids the syntax error.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index c4754db..99d9cc8 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -46,10 +46,26 @@ class RecipeHandler():
             results.extend(glob.glob(os.path.join(path, spec)))
         return results
 
-    def genfunction(self, outlines, funcname, content):
-        outlines.append('%s () {' % funcname)
+    def genfunction(self, outlines, funcname, content, python=False, forcespace=False):
+        if python:
+            prefix = 'python '
+        else:
+            prefix = ''
+        outlines.append('%s%s () {' % (prefix, funcname))
+        if python or forcespace:
+            indent = '    '
+        else:
+            indent = '\t'
+        addnoop = not python
         for line in content:
-            outlines.append('\t%s' % line)
+            outlines.append('%s%s' % (indent, line))
+            if addnoop:
+                strippedline = line.lstrip()
+                if strippedline and not strippedline.startswith('#'):
+                    addnoop = False
+        if addnoop:
+            # Without this there'll be a syntax error
+            outlines.append('%s:' % indent)
         outlines.append('}')
         outlines.append('')
 
-- 
2.1.0



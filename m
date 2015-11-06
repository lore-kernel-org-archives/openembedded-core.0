Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 17C6860124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 17:01:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2015 09:01:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844321632"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 09:01:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 17:01:39 +0000
Message-Id: <40510017f055ab7576a1b8be71c3fd680e0facec.1446829227.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446829227.git.paul.eggleton@linux.intel.com>
References: <cover.1446829227.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446829227.git.paul.eggleton@linux.intel.com>
References: <cover.1446829227.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] verify-homepage: use scriptpath to find bitbake path
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
X-List-Received-Date: Fri, 06 Nov 2015 17:01:59 -0000

We have shared code for this, let's use it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/verify-homepage.py | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 86cc82b..9953bab 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -8,26 +8,16 @@ import os
 import subprocess
 import urllib2
 
-def search_bitbakepath():
-    bitbakepath = ""
 
-    # Search path to bitbake lib dir in order to load bb modules
-    if os.path.exists(os.path.join(os.path.dirname(sys.argv[0]), '../../bitbake/lib/bb')):
-        bitbakepath = os.path.join(os.path.dirname(sys.argv[0]), '../../bitbake/lib')
-        bitbakepath = os.path.abspath(bitbakepath)
-    else:
-        # Look for bitbake/bin dir in PATH
-        for pth in os.environ['PATH'].split(':'):
-            if os.path.exists(os.path.join(pth, '../lib/bb')):
-                bitbakepath = os.path.abspath(os.path.join(pth, '../lib'))
-                break
-        if not bitbakepath:
-            sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
-            sys.exit(1)
-    return bitbakepath
-
-# For importing the following modules
-sys.path.insert(0, search_bitbakepath())
+# Allow importing scripts/lib modules
+scripts_path = os.path.abspath(os.path.dirname(os.path.realpath(__file__)) + '/..')
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+import scriptpath
+
+# Allow importing bitbake modules
+bitbakepath = scriptpath.add_bitbake_lib_path()
+
 import bb.tinfoil
 
 def wgetHomepage(pn, homepage):
-- 
2.1.0



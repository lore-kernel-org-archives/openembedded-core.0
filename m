Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 673016AC00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213425"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:30 +1300
Message-Id: <51e9b3a521e181e53ae5c4d6fa6459f4495b8414.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/18] devtool: ensure we change back to the original dir on error
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:13 -0000

This is just belt-and-braces but we ought to use try..finally in this
kind of situation, so just do it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 50604e6..e617d60 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -100,18 +100,20 @@ def setup_tinfoil(config_only=False, basepath=None, tracking=False):
     """Initialize tinfoil api from bitbake"""
     import scriptpath
     orig_cwd = os.path.abspath(os.curdir)
-    if basepath:
-        os.chdir(basepath)
-    bitbakepath = scriptpath.add_bitbake_lib_path()
-    if not bitbakepath:
-        logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
-        sys.exit(1)
-
-    import bb.tinfoil
-    tinfoil = bb.tinfoil.Tinfoil(tracking=tracking)
-    tinfoil.prepare(config_only)
-    tinfoil.logger.setLevel(logger.getEffectiveLevel())
-    os.chdir(orig_cwd)
+    try:
+        if basepath:
+            os.chdir(basepath)
+        bitbakepath = scriptpath.add_bitbake_lib_path()
+        if not bitbakepath:
+            logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
+            sys.exit(1)
+
+        import bb.tinfoil
+        tinfoil = bb.tinfoil.Tinfoil(tracking=tracking)
+        tinfoil.prepare(config_only)
+        tinfoil.logger.setLevel(logger.getEffectiveLevel())
+    finally:
+        os.chdir(orig_cwd)
     return tinfoil
 
 def get_recipe_file(cooker, pn):
-- 
2.1.0



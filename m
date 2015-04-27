Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5F40273D41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 09:53:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2015 02:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,656,1422950400"; d="scan'208";a="562337931"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.219])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2015 02:53:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2015 10:53:20 +0100
Message-Id: <09724576413a924b254d711b0c76048ba449edb4.1430128109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 8/9] devtool: update-recipe: handle unversioned bbappends
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
X-List-Received-Date: Mon, 27 Apr 2015 09:53:39 -0000

Use the proper bbappend file name, don't just assume it will have a
version suffix (because it won't if the original recipe doesn't).

Fixes [YOCTO #7651].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d561e40..a642112 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -434,12 +434,6 @@ def update_recipe(args, config, basepath, workspace):
         logger.error("no recipe named %s in your workspace" % args.recipename)
         return -1
 
-    # Get initial revision from bbappend
-    appends = glob.glob(os.path.join(config.workspace_path, 'appends', '%s_*.bbappend' % args.recipename))
-    if not appends:
-        logger.error('unable to find workspace bbappend for recipe %s' % args.recipename)
-        return -1
-
     tinfoil = setup_tinfoil()
     import bb
     from oe.patch import GitApplyTree
@@ -450,6 +444,12 @@ def update_recipe(args, config, basepath, workspace):
         return -1
     recipefile = rd.getVar('FILE', True)
 
+    # Get initial revision from bbappend
+    append = os.path.join(config.workspace_path, 'appends', '%s.bbappend' % os.path.splitext(os.path.basename(recipefile))[0])
+    if not os.path.exists(append):
+        logger.error('unable to find workspace bbappend for recipe %s' % args.recipename)
+        return -1
+
     orig_src_uri = rd.getVar('SRC_URI', False) or ''
     if args.mode == 'auto':
         if 'git://' in orig_src_uri:
@@ -520,7 +520,7 @@ def update_recipe(args, config, basepath, workspace):
             initial_rev = args.initial_rev
         else:
             initial_rev = None
-            with open(appends[0], 'r') as f:
+            with open(append, 'r') as f:
                 for line in f:
                     if line.startswith('# initial_rev:'):
                         initial_rev = line.split(':')[-1].strip()
-- 
2.1.0



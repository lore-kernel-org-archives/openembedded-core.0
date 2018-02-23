Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 538127881B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:02:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2018 19:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,381,1515484800"; d="scan'208";a="30026543"
Received: from vsharmab-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.74.120])
	by orsmga003.jf.intel.com with ESMTP; 22 Feb 2018 19:02:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 16:02:10 +1300
Message-Id: <cadd0106ebc693841883e6b7f2d3b8ac8f949e76.1519354910.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519354910.git.paul.eggleton@linux.intel.com>
References: <cover.1519354910.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/8] devtool: fix poor handling of upgraded BBCLASSEXTENDed recipes
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
X-List-Received-Date: Fri, 23 Feb 2018 03:02:54 -0000

Fix two aspects of handling BBCLASSEXTENDed targets (e.g.
openssl-native) that have been run through "devtool upgrade":

* Fix recipe name not showing up in "devtool status"
* Fix "devtool reset" not deleting empty directories under the recipe
  directory within the workspace, which may lead to problems if you
  subsequently run "devtool upgrade" on the same target again

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                 | 5 +++--
 scripts/lib/devtool/standard.py | 6 +++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index a651d8f213a..b4bfbb8329c 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -117,12 +117,13 @@ def read_workspace():
             for line in f:
                 res = externalsrc_re.match(line.rstrip())
                 if res:
-                    pn = res.group(2) or os.path.splitext(os.path.basename(fn))[0].split('_')[0]
+                    recipepn = os.path.splitext(os.path.basename(fn))[0].split('_')[0]
+                    pn = res.group(2) or recipepn
                     # Find the recipe file within the workspace, if any
                     bbfile = os.path.basename(fn).replace('.bbappend', '.bb').replace('%', '*')
                     recipefile = glob.glob(os.path.join(config.workspace_path,
                                                         'recipes',
-                                                        pn,
+                                                        recipepn,
                                                         bbfile))
                     if recipefile:
                         recipefile = recipefile[0]
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 26187a0c413..7c4ae859434 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1744,6 +1744,7 @@ def status(args, config, basepath, workspace):
 
 def _reset(recipes, no_clean, config, basepath, workspace):
     """Reset one or more recipes"""
+    import oe.path
 
     def clean_preferred_provider(pn, layerconf_path):
         """Remove PREFERRED_PROVIDER from layer.conf'"""
@@ -1802,7 +1803,10 @@ def _reset(recipes, no_clean, config, basepath, workspace):
                         preservedir(os.path.join(root, dn))
                 os.rmdir(origdir)
 
-        preservedir(os.path.join(config.workspace_path, 'recipes', pn))
+        recipefile = workspace[pn]['recipefile']
+        if recipefile and oe.path.is_path_under(recipefile, config.workspace_path):
+            # This should always be true if recipefile is set, but just in case
+            preservedir(os.path.dirname(recipefile))
         # We don't automatically create this dir next to appends, but the user can
         preservedir(os.path.join(config.workspace_path, 'appends', pn))
 
-- 
2.14.3



Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 13C737404E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:53:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2015 04:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,580,1437462000"; d="scan'208";a="796374445"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2015 04:53:09 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 14:52:58 +0300
Message-Id: <1443095587-13852-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v3 01/10] recipeutils: implement get_recipe_local_files()
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
X-List-Received-Date: Thu, 24 Sep 2015 11:53:11 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 35b88d3..56056db 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -336,6 +336,22 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
     return remotes
 
 
+def get_recipe_local_files(d, patches=False):
+    """Get a list of local files in SRC_URI within a recipe."""
+    uris = (d.getVar('SRC_URI', True) or "").split()
+    fetch = bb.fetch2.Fetch(uris, d)
+    ret = {}
+    for uri in uris:
+        if fetch.ud[uri].type == 'file':
+            if (not patches and
+                    bb.utils.exec_flat_python_func('patch_path', uri, fetch, '')):
+                continue
+            # Skip files that are referenced by absolute path
+            if not os.path.isabs(fetch.ud[uri].basepath):
+                ret[fetch.ud[uri].basepath] = fetch.localpath(uri)
+    return ret
+
+
 def get_recipe_patches(d):
     """Get a list of the patches included in SRC_URI within a recipe."""
     patchfiles = []
-- 
2.1.4



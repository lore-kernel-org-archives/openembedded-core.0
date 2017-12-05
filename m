Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 34B8760049
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:41:54 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:41:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181356145"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:41:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:16 +1300
Message-Id: <a99c084e27b0c41bb7fabd8e33d26f014c541cc3.1512438000.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/12] lib/oe/recipeutils: allow patch_recipe_file() to be re-called
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
X-List-Received-Date: Tue, 05 Dec 2017 01:41:54 -0000

If patch_recipe_file() is called with output redirection on the same
file twice in succession, then we don't want to wipe out the changes the
first call made so we need to be reading in the redirected file if it
exists instead of the original one.

This is important to enable devtool finish to work with multiple source
trees within the same recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 4e0859e..4928727 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -258,13 +258,18 @@ def patch_recipe_file(fn, values, patch=False, relpath='', redirect_output=None)
        since this cannot handle all situations.
     """
 
-    with open(fn, 'r') as f:
+    read_fn = fn
+    if redirect_output:
+        redirect_fn = os.path.join(redirect_output, os.path.basename(fn))
+        if os.path.exists(redirect_fn):
+            read_fn = redirect_fn
+    with open(read_fn, 'r') as f:
         fromlines = f.readlines()
 
     _, tolines = patch_recipe_lines(fromlines, values)
 
     if redirect_output:
-        with open(os.path.join(redirect_output, os.path.basename(fn)), 'w') as f:
+        with open(redirect_fn, 'w') as f:
             f.writelines(tolines)
         return None
     elif patch:
-- 
2.9.5



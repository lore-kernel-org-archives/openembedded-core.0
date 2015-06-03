Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2C24F73CE3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:50:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jun 2015 07:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,547,1427785200"; d="scan'208";a="704663449"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2015 07:50:35 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 17:50:26 +0300
Message-Id: <1433343032-4559-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/7] recipeutils: implement get_recipe_local_files()
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
X-List-Received-Date: Wed, 03 Jun 2015 14:50:42 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index f05b6c0..4bd5ce7 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -278,6 +278,14 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
     return remotes
 
 
+def get_recipe_local_files(d):
+    """Get a list of local files in SRC_URI within a recipe."""
+    uris = (d.getVar('SRC_URI', True) or "").split()
+    fetch = bb.fetch2.Fetch(uris, d)
+    return dict([(fetch.ud[uri].basepath, fetch.localpath(uri)) for uri in uris
+                 if uri.startswith('file://')])
+
+
 def get_recipe_patches(d):
     """Get a list of the patches included in SRC_URI within a recipe."""
     patchfiles = []
-- 
2.1.4



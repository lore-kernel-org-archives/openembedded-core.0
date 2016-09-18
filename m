Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EA2536FFED
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 20:09:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Sep 2016 13:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,358,1470726000"; d="scan'208";a="1058565672"
Received: from yewyangh-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.139])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2016 13:09:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 08:08:12 +1200
Message-Id: <89d68923d93f02e598929c552d5c5f6d9b607c2c.1474229259.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/10] lib/oe/recipeutils: fix invalid character detection in validate_pn()
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
X-List-Received-Date: Sun, 18 Sep 2016 20:09:06 -0000

* validate_pn() is supposed to protect against invalid characters, fix
  the function so that it actually does (unanchored regex strikes
  again...)
* However, now that the function is enforcing the restrictions, we do
  still want to allow + in recipe names (e.g. "gtk+")

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index a0d78dd..58e4028 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -449,8 +449,8 @@ def get_recipe_patched_files(d):
 def validate_pn(pn):
     """Perform validation on a recipe name (PN) for a new recipe."""
     reserved_names = ['forcevariable', 'append', 'prepend', 'remove']
-    if not re.match('[0-9a-z-.]+', pn):
-        return 'Recipe name "%s" is invalid: only characters 0-9, a-z, - and . are allowed' % pn
+    if not re.match('^[0-9a-z-.+]+$', pn):
+        return 'Recipe name "%s" is invalid: only characters 0-9, a-z, -, + and . are allowed' % pn
     elif pn in reserved_names:
         return 'Recipe name "%s" is invalid: is a reserved keyword' % pn
     elif pn.startswith('pn-'):
-- 
2.5.5



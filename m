Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D755B734DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 09:53:35 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2015 02:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,656,1422950400"; d="scan'208";a="562337888"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.219])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2015 02:53:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2015 10:53:17 +0100
Message-Id: <6486cde228cba7bba31df4b3170c3c083a29607b.1430128109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 5/9] devtool: handle . in recipe name
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
X-List-Received-Date: Mon, 27 Apr 2015 09:53:36 -0000

Names such as glib-2.0 are valid (and used) recipe names, so we need to
support them.

Fixes [YOCTO #7643].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 4 ++--
 scripts/devtool            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 09bd7fd..19d97b6 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -269,8 +269,8 @@ def get_recipe_patches(d):
 def validate_pn(pn):
     """Perform validation on a recipe name (PN) for a new recipe."""
     reserved_names = ['forcevariable', 'append', 'prepend', 'remove']
-    if not re.match('[0-9a-z-]+', pn):
-        return 'Recipe name "%s" is invalid: only characters 0-9, a-z and - are allowed' % pn
+    if not re.match('[0-9a-z-.]+', pn):
+        return 'Recipe name "%s" is invalid: only characters 0-9, a-z, - and . are allowed' % pn
     elif pn in reserved_names:
         return 'Recipe name "%s" is invalid: is a reserved keyword' % pn
     elif pn.startswith('pn-'):
diff --git a/scripts/devtool b/scripts/devtool
index 981ff51..841831c 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -101,7 +101,7 @@ def read_workspace():
             _create_workspace(config.workspace_path, config, basepath)
 
     logger.debug('Reading workspace in %s' % config.workspace_path)
-    externalsrc_re = re.compile(r'^EXTERNALSRC(_pn-[a-zA-Z0-9-]*)? =.*$')
+    externalsrc_re = re.compile(r'^EXTERNALSRC(_pn-[^ =]+)? =.*$')
     for fn in glob.glob(os.path.join(config.workspace_path, 'appends', '*.bbappend')):
         pn = os.path.splitext(os.path.basename(fn))[0].split('_')[0]
         with open(fn, 'r') as f:
-- 
2.1.0



Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B05073D81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:19:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 09:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,632,1422950400"; d="scan'208";a="484753709"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 09:18:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:18:29 +0100
Message-Id: <2b53bef8b71b267095e6e279aac68a5dcb7f8b9d.1429805738.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/8] devtool: handle . in recipe name
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
X-List-Received-Date: Thu, 23 Apr 2015 16:19:12 -0000

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



Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BA41877CB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 10:41:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 03:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,190,1488873600"; d="scan'208";a="247654613"
Received: from lheah-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.133.64])
	by fmsmga004.fm.intel.com with ESMTP; 12 Apr 2017 03:41:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 22:41:29 +1200
Message-Id: <5c24a70930d011375e353b5db3b52361fe16e40e.1491993601.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491993601.git.paul.eggleton@linux.intel.com>
References: <cover.1491993601.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] recipetool: create: hide missing npm error when called from devtool
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
X-List-Received-Date: Wed, 12 Apr 2017 10:41:42 -0000

If devtool is called with a URL to a source repository containing a
node.js module, we don't know that until recipetool has fetched it, and
due to the structure of the code we have to exit with a special code in
order to let devtool know it needs to build nodejs-native. We also want
to suppress the error message that recipetool would normally print under
these circumstances; there is already a mechanism for this but it wasn't
operative in the case where we're pointed to a source repository rather
than an npm:// URL, so create some plumbing so that we know to hide the
message.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py     | 4 ++++
 scripts/lib/recipetool/create_npm.py | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 439dca0..5af58a1 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -59,6 +59,9 @@ class RecipeHandler(object):
     recipecmakefilemap = {}
     recipebinmap = {}
 
+    def __init__(self):
+        self._devtool = False
+
     @staticmethod
     def load_libmap(d):
         '''Load library->recipe mapping'''
@@ -622,6 +625,7 @@ def create_recipe(args):
     handlers.sort(key=lambda item: (item[1], -item[2]), reverse=True)
     for handler, priority, _ in handlers:
         logger.debug('Handler: %s (priority %d)' % (handler.__class__.__name__, priority))
+        setattr(handler, '_devtool', args.devtool)
     handlers = [item[0] for item in handlers]
 
     # Apply the handlers
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index a79a9afb..cb8f338 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -189,7 +189,7 @@ class NpmRecipeHandler(RecipeHandler):
         files = RecipeHandler.checkfiles(srctree, ['package.json'])
         if files:
             d = bb.data.createCopy(tinfoil.config_data)
-            npm_bindir = check_npm(tinfoil)
+            npm_bindir = check_npm(tinfoil, self._devtool)
             d.prependVar('PATH', '%s:' % npm_bindir)
 
             data = read_package_json(files[0])
-- 
2.9.3



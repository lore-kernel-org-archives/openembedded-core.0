Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 762267319A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621978999"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:01 +1300
Message-Id: <62efcee7f94a198f0c3cf9e3559768746b16043f.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/26] recipetool: create: set up priority system for recipe handlers
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:32 -0000

Sometimes we want to force one handler to run before another; if the two
handlers are in different plugins that's difficult without some kind of
priority number, so add one and sort by it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 3d5a373..5c249ab 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -251,10 +251,22 @@ def create_recipe(args):
         lines_after.append('')
 
     # Find all plugins that want to register handlers
-    handlers = []
+    logger.debug('Loading recipe handlers')
+    raw_handlers = []
     for plugin in plugins:
         if hasattr(plugin, 'register_recipe_handlers'):
-            plugin.register_recipe_handlers(handlers)
+            plugin.register_recipe_handlers(raw_handlers)
+    # Sort handlers by priority
+    handlers = []
+    for i, handler in enumerate(raw_handlers):
+        if isinstance(handler, tuple):
+            handlers.append((handler[0], handler[1], i))
+        else:
+            handlers.append((handler, 0, i))
+    handlers.sort(key=lambda item: (item[1], -item[2]), reverse=True)
+    for handler, priority, _ in handlers:
+        logger.debug('Handler: %s (priority %d)' % (handler.__class__.__name__, priority))
+    handlers = [item[0] for item in handlers]
 
     # Apply the handlers
     classes = []
-- 
2.5.0



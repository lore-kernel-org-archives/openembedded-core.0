Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1D21B65C8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 18:13:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 27 Mar 2017 11:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,232,1486454400"; d="scan'208";a="948711500"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga003.jf.intel.com with ESMTP; 27 Mar 2017 11:13:08 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 11:13:06 -0700
Message-Id: <d29c49125ba4ea0378545ab7cba3d7795c49a354.1490638349.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1490638349.git.mariano.lopez@linux.intel.com>
References: <cover.1490638349.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] oeqa/core/loader.py: Do not import underscore modules by default
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
X-List-Received-Date: Mon, 27 Mar 2017 18:13:09 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Underscore modules are meant to be run only when manually added to the test
suite, so far another mechanisms are in place to make this happen with
runtime, sdk, and esdk (mostly in test* bbclasses).

This will add such functionality in the core framework so other specific
frameworks can take use this without adding something else.

[YOCTO 10980]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 74f1117..63a1703 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -223,8 +223,21 @@ class OETestLoader(unittest.TestLoader):
                 msg = 'Tried to import %s test module but is a built-in'
                 raise ImportError(msg % module.__name__)
 
-            if not self.modules or "all" in self.modules or \
-                    module.__name__ in self.modules:
+            # Normal test modules are loaded if no modules were specified,
+            # if module is in the specified module list or if 'all' is in
+            # module list.
+            # Underscore modules are loaded only if specified in module list.
+            load_module = True if not module.__name__.startswith('_') \
+                                  and (not self.modules \
+                                       or module.__name__ in self.modules \
+                                       or 'all' in self.modules) \
+                               else False
+
+            load_underscore = True if module.__name__.startswith('_') \
+                                      and module.__name__ in self.modules \
+                                   else False
+
+            if load_module or load_underscore:
                 return super(OETestLoader, self).loadTestsFromModule(
                         module, *args, pattern=pattern, **kws)
             else:
@@ -238,8 +251,21 @@ class OETestLoader(unittest.TestLoader):
                 msg = 'Tried to import %s test module but is a built-in'
                 raise ImportError(msg % module.__name__)
 
-            if not self.modules or "all" in self.modules or \
-                    module.__name__ in self.modules:
+            # Normal test modules are loaded if no modules were specified,
+            # if module is in the specified module list or if 'all' is in
+            # module list.
+            # Underscore modules are loaded only if specified in module list.
+            load_module = True if not module.__name__.startswith('_') \
+                                  and (not self.modules \
+                                       or module.__name__ in self.modules \
+                                       or 'all' in self.modules) \
+                               else False
+
+            load_underscore = True if module.__name__.startswith('_') \
+                                      and module.__name__ in self.modules \
+                                   else False
+
+            if load_module or load_underscore:
                 return super(OETestLoader, self).loadTestsFromModule(
                         module, use_load_tests)
             else:
-- 
2.10.2



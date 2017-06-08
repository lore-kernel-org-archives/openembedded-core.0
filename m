Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBE778286
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:32:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="271875698"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 09:32:08 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 11:32:07 -0500
Message-Id: <0ffac7a80b8afebf7d8f79c54d84f6a123f3b9c3.1496939387.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] oeqa/core/loader: Fix filtering on test modules with submodules
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
X-List-Received-Date: Thu, 08 Jun 2017 16:32:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Our filtering allows to specify which tests to run using,

<module_name>.[test_class].[test_name]

But the module name logic was restricted to only accept one level,
for example: runtime_test vs oelib.types, to support multiple
submodules use only the first part for filtering.

This allows to run the whole tests in a module with more than tree
levels.

Due to the ambiguity on the test filtering options with test cases
with more than tree levels the supported sytnax is,

<module>

or

<module>.[submoduleN].[test_class].[test_name]

[YOCTO #11632]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 70 +++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index b9385ea..d110881 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -164,8 +164,11 @@ class OETestLoader(unittest.TestLoader):
         """
             Returns True if test case must be filtered, False otherwise.
         """
-        # Filters by module.class.name
-        module_name = case.__module__
+        # XXX; If the module has more than one namespace only use
+        # the first to support run the whole module specifying the
+        # <module_name>.[test_class].[test_name]
+        module_name = case.__module__.split('.')[0]
+
         class_name = case.__class__.__name__
         test_name = case._testMethodName
 
@@ -280,6 +283,33 @@ class OETestLoader(unittest.TestLoader):
 
         return self.suiteClass(cases) if cases else big_suite
 
+    def _filterModule(self, module):
+        if module.__name__ in sys.builtin_module_names:
+            msg = 'Tried to import %s test module but is a built-in'
+            raise ImportError(msg % module.__name__)
+
+        # XXX; If the module has more than one namespace only use
+        # the first to support run the whole module specifying the
+        # <module_name>.[test_class].[test_name]
+        module_name = module.__name__.split('.')[0]
+
+        # Normal test modules are loaded if no modules were specified,
+        # if module is in the specified module list or if 'all' is in
+        # module list.
+        # Underscore modules are loaded only if specified in module list.
+        load_module = True if not module_name.startswith('_') \
+                              and (not self.modules \
+                                   or module_name in self.modules \
+                                   or 'all' in self.modules) \
+                           else False
+
+        load_underscore = True if module_name.startswith('_') \
+                                  and module_name in self.modules \
+                               else False
+
+        return (load_module, load_underscore)
+
+
     # XXX After Python 3.5, remove backward compatibility hacks for
     # use_load_tests deprecation via *args and **kws.  See issue 16662.
     if sys.version_info >= (3,5):
@@ -287,23 +317,7 @@ class OETestLoader(unittest.TestLoader):
             """
                 Returns a suite of all tests cases contained in module.
             """
-            if module.__name__ in sys.builtin_module_names:
-                msg = 'Tried to import %s test module but is a built-in'
-                raise ImportError(msg % module.__name__)
-
-            # Normal test modules are loaded if no modules were specified,
-            # if module is in the specified module list or if 'all' is in
-            # module list.
-            # Underscore modules are loaded only if specified in module list.
-            load_module = True if not module.__name__.startswith('_') \
-                                  and (not self.modules \
-                                       or module.__name__ in self.modules \
-                                       or 'all' in self.modules) \
-                               else False
-
-            load_underscore = True if module.__name__.startswith('_') \
-                                      and module.__name__ in self.modules \
-                                   else False
+            load_module, load_underscore = self._filterModule(module)
 
             if load_module or load_underscore:
                 return super(OETestLoader, self).loadTestsFromModule(
@@ -315,23 +329,7 @@ class OETestLoader(unittest.TestLoader):
             """
                 Returns a suite of all tests cases contained in module.
             """
-            if module.__name__ in sys.builtin_module_names:
-                msg = 'Tried to import %s test module but is a built-in'
-                raise ImportError(msg % module.__name__)
-
-            # Normal test modules are loaded if no modules were specified,
-            # if module is in the specified module list or if 'all' is in
-            # module list.
-            # Underscore modules are loaded only if specified in module list.
-            load_module = True if not module.__name__.startswith('_') \
-                                  and (not self.modules \
-                                       or module.__name__ in self.modules \
-                                       or 'all' in self.modules) \
-                               else False
-
-            load_underscore = True if module.__name__.startswith('_') \
-                                      and module.__name__ in self.modules \
-                                   else False
+            load_module, load_underscore = self._filterModule(module)
 
             if load_module or load_underscore:
                 return super(OETestLoader, self).loadTestsFromModule(
-- 
2.1.4



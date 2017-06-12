Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 941D8782D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 21:41:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2017 14:41:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,335,1493708400"; d="scan'208";a="867194801"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2017 14:41:17 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 16:41:18 -0500
Message-Id: <1497303678-20255-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1497303678-20255-1-git-send-email-anibal.limon@linux.intel.com>
References: <1497303678-20255-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/core/loader: Use full and small module name on filtering
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
X-List-Received-Date: Mon, 12 Jun 2017 21:41:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The small module name was added to support run a whole suite that
has more that 3 levels in the test case name, but this broke the
behaviour for use a full test case name.

[YOCTO #11632]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index d110881..229f094 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -167,21 +167,28 @@ class OETestLoader(unittest.TestLoader):
         # XXX; If the module has more than one namespace only use
         # the first to support run the whole module specifying the
         # <module_name>.[test_class].[test_name]
-        module_name = case.__module__.split('.')[0]
+        module_name_small = case.__module__.split('.')[0]
+        module_name = case.__module__
 
         class_name = case.__class__.__name__
         test_name = case._testMethodName
 
         if self.modules:
-            if not module_name in self.modules:
-                return True
+            module = None
+            try:
+                module = self.modules[module_name_small]
+            except KeyError:
+                try:
+                    module = self.modules[module_name]
+                except KeyError:
+                    return True
 
-            if self.modules[module_name]:
-                if not class_name in self.modules[module_name]:
+            if module:
+                if not class_name in module:
                     return True
 
-                if self.modules[module_name][class_name]:
-                    if test_name not in self.modules[module_name][class_name]:
+                if module[class_name]:
+                    if test_name not in module[class_name]:
                         return True
 
         # Decorator filters
@@ -291,7 +298,8 @@ class OETestLoader(unittest.TestLoader):
         # XXX; If the module has more than one namespace only use
         # the first to support run the whole module specifying the
         # <module_name>.[test_class].[test_name]
-        module_name = module.__name__.split('.')[0]
+        module_name_small = module.__name__.split('.')[0]
+        module_name = module.__name__
 
         # Normal test modules are loaded if no modules were specified,
         # if module is in the specified module list or if 'all' is in
@@ -300,11 +308,13 @@ class OETestLoader(unittest.TestLoader):
         load_module = True if not module_name.startswith('_') \
                               and (not self.modules \
                                    or module_name in self.modules \
+                                   or module_name_small in self.modules \
                                    or 'all' in self.modules) \
                            else False
 
         load_underscore = True if module_name.startswith('_') \
-                                  and module_name in self.modules \
+                                  and (module_name in self.modules or \
+                                  module_name_small in self.modules) \
                                else False
 
         return (load_module, load_underscore)
-- 
2.1.4



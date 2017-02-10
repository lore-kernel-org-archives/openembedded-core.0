Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7E62C7739B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 22:20:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 14:20:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="57405775"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga004.jf.intel.com with ESMTP; 10 Feb 2017 14:20:29 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 14:15:57 +0000
Message-Id: <a04d92d3992ceb1fcc964f56e624978ff70a3fe3.1486735704.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1486735704.git.mariano.lopez@linux.intel.com>
References: <cover.1486735704.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1486735704.git.mariano.lopez@linux.intel.com>
References: <cover.1486735704.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/2] oeqa/core/loader.py: Avoid importing tests with built-ins name
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
X-List-Received-Date: Fri, 10 Feb 2017 22:20:30 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

If importing a test with the same name as a built-in module,
it will silently import the built-in and check for tests in
built-in module. This happened with syslog module in debian
based machines, so add a raise to avoid this behavior.

[YOCTO #10978]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index bf13a5a..a28512b 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -217,6 +217,13 @@ class OETestLoader(unittest.TestLoader):
     # use_load_tests deprecation via *args and **kws.  See issue 16662.
     if sys.version_info >= (3,5):
         def loadTestsFromModule(self, module, *args, pattern=None, **kws):
+            """
+                Returns a suite of all tests cases contained in module.
+            """
+            if module.__name__ in sys.builtin_module_names:
+                msg = 'Tried to import %s test module but is a built-in'
+                raise ImportError(msg % module.__name__)
+
             if not self.modules or "all" in self.modules or \
                     module.__name__ in self.modules:
                 return super(OETestLoader, self).loadTestsFromModule(
@@ -228,6 +235,10 @@ class OETestLoader(unittest.TestLoader):
             """
                 Returns a suite of all tests cases contained in module.
             """
+            if module.__name__ in sys.builtin_module_names:
+                msg = 'Tried to import %s test module but is a built-in'
+                raise ImportError(msg % module.__name__)
+
             if not self.modules or "all" in self.modules or \
                     module.__name__ in self.modules:
                 return super(OETestLoader, self).loadTestsFromModule(
-- 
2.6.6



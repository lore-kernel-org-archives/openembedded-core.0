Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4197A72FC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 15:47:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2017 07:46:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,215,1484035200"; d="scan'208";a="828950360"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2017 07:46:59 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2017 07:45:01 +0000
Message-Id: <6633b71423628270258d04e0d36a8152f6a10e42.1488181279.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1488181279.git.mariano.lopez@linux.intel.com>
References: <cover.1488181279.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1488181279.git.mariano.lopez@linux.intel.com>
References: <cover.1488181279.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 2/2] oeqa/core/loader.py: Avoid importing tests with built-ins name
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
X-List-Received-Date: Mon, 27 Feb 2017 15:47:01 -0000

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
index b9ba923..74f1117 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -216,6 +216,13 @@ class OETestLoader(unittest.TestLoader):
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
@@ -227,6 +234,10 @@ class OETestLoader(unittest.TestLoader):
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



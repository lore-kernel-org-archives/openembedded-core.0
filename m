Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E06B372F9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 20:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490645130; x=1522181130;
	h=from:to:cc:subject:date:message-id;
	bh=h9WkIXpqmFUT0x8XR4GOI6vRXl8NyE+Pc3eLo0rUV+k=;
	b=CTPEnqdI8bdvb6qDr/JPZW448MB6iTURd8tJEo9fouMn+tEgdLmpCsYD
	+1IVlSWPlxKBgp/0I7NFAZn9Payrkg==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 13:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,233,1486454400"; d="scan'208";a="839020804"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Mar 2017 13:05:30 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 13:05:24 -0700
Message-Id: <b075e0dd2a8a56625a115431a0ad146bed5707e5.1490645010.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1490645010.git.mariano.lopez@linux.intel.com>
References: <cover.1490645010.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1490645010.git.mariano.lopez@linux.intel.com>
References: <cover.1490645010.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/1] oeqa/core/loader.py: Do not import underscore modules by default
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
X-List-Received-Date: Mon, 27 Mar 2017 20:05:29 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Underscore modules are meant to be run only when manually added to the test
suite, so far another mechanisms are in place to make this happen with
runtime, sdk, and esdk (mostly in test* bbclasses).

This will add such functionality in the core framework so other specific
frameworks can take use this without adding something else.

[YOCTO #10980]

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



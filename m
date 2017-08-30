Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 689DB783C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:35 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494541"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:16 +1200
Message-Id: <5b63898d61d653f0e29a9fde63f91d4b3fe10e77.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/13] oe-selftest: tinfoil: add a test for variable history
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
X-List-Received-Date: Wed, 30 Aug 2017 23:55:35 -0000

I recently found that variable history wasn't working properly for
recipes when we enable history tracking, resulting in minor
functionality loss in devtool upgrade, so add a test to ensure this
doesn't regress now that it's fixed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 471517f..f889a47 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -195,3 +195,37 @@ class TinfoilTests(OESelftestTestCase):
             tinfoil.config_data.appendVar('OVERRIDES', ':overrideone')
             value = tinfoil.config_data.getVar('TESTVAR')
             self.assertEqual(value, 'one', 'Variable overrides not functioning correctly')
+
+    def test_variable_history(self):
+        # Basic test to ensure that variable history works when tracking=True
+        with bb.tinfoil.Tinfoil(tracking=True) as tinfoil:
+            tinfoil.prepare(config_only=False, quiet=2)
+            # Note that _tracking for any datastore we get will be
+            # false here, that's currently expected - so we can't check
+            # for that
+            history = tinfoil.config_data.varhistory.variable('DL_DIR')
+            for entry in history:
+                if entry['file'].endswith('/bitbake.conf'):
+                    if entry['op'] in ['set', 'set?']:
+                        break
+            else:
+                self.fail('Did not find history entry setting DL_DIR in bitbake.conf. History: %s' % history)
+            # Check it works for recipes as well
+            testrecipe = 'zlib'
+            rd = tinfoil.parse_recipe(testrecipe)
+            history = rd.varhistory.variable('LICENSE')
+            bbfound = -1
+            recipefound = -1
+            for i, entry in enumerate(history):
+                if entry['file'].endswith('/bitbake.conf'):
+                    if entry['detail'] == 'INVALID' and entry['op'] in ['set', 'set?']:
+                        bbfound = i
+                elif entry['file'].endswith('.bb'):
+                    if entry['op'] == 'set':
+                        recipefound = i
+            if bbfound == -1:
+                self.fail('Did not find history entry setting LICENSE in bitbake.conf parsing %s recipe. History: %s' % (testrecipe, history))
+            if recipefound == -1:
+                self.fail('Did not find history entry setting LICENSE in %s recipe. History: %s' % (testrecipe, history))
+            if bbfound > recipefound:
+                self.fail('History entry setting LICENSE in %s recipe and in bitbake.conf in wrong order. History: %s' % (testrecipe, history))
-- 
2.9.5



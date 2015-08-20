Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 54B5465CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:32:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2015 01:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787609109"
Received: from ljegan-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.54])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2015 01:32:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 09:31:57 +0100
Message-Id: <d5b584748fbfb60c8be339bd71b300ca3a4cbf75.1440059460.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440059460.git.paul.eggleton@linux.intel.com>
References: <cover.1440059460.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440059460.git.paul.eggleton@linux.intel.com>
References: <cover.1440059460.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] oe-selftest: replace assertTrue(False, ...) with fail(...)
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
X-List-Received-Date: Thu, 20 Aug 2015 08:32:09 -0000

I'd somehow missed the existence of fail() when I wrote these. It's
preferable here so you don't get the somewhat useless "false is not
true" message in the case of failure.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py    | 2 +-
 meta/lib/oeqa/selftest/recipetool.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 947d8ee..70ee634 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -51,7 +51,7 @@ class DevtoolBase(oeSelfTest):
                 bbappendfile = bbappend
                 break
         else:
-            self.assertTrue(False, 'bbappend for recipe %s does not seem to be created in test layer' % testrecipe)
+            self.fail('bbappend for recipe %s does not seem to be created in test layer' % testrecipe)
         return bbappendfile
 
     def _create_temp_layer(self, templayerdir, addlayer, templayername, priority=999, recipepathspec='recipes-*/*'):
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 689d41b..c34ad68 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -282,7 +282,7 @@ class RecipetoolTests(RecipetoolBase):
                 self.assertIn('add-file.patch', line, 'Unexpected warning found in output:\n%s' % line)
                 break
         else:
-            self.assertTrue(False, 'Patch warning not found in output:\n%s' % output)
+            self.fail('Patch warning not found in output:\n%s' % output)
 
     @testcase(1188)
     def test_recipetool_appendfile_script(self):
@@ -351,7 +351,7 @@ class RecipetoolTests(RecipetoolBase):
                         bbappendfile = f
                         break
             if not bbappendfile:
-                self.assertTrue(False, 'No bbappend file created')
+                self.fail('No bbappend file created')
             runCmd('rm -rf %s/recipes-*' % self.templayerdir)
             return bbappendfile
 
-- 
2.1.0



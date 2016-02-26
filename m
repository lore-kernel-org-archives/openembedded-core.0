Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 903977743F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:37:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2016 06:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="921762346"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2016 06:37:07 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 958432C8001;
	Fri, 26 Feb 2016 07:24:55 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 16:40:48 +0200
Message-Id: <1456497651-23161-6-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 6/9] recipetests: base - Base Class for Test Recipes
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
X-List-Received-Date: Fri, 26 Feb 2016 14:37:41 -0000

Test Recipes should inherit this class.
It sets up a custom tmp dir for the recipe under test.

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/recipetests/base.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/lib/oeqa/recipetests/base.py

diff --git a/meta/lib/oeqa/recipetests/base.py b/meta/lib/oeqa/recipetests/base.py
new file mode 100644
index 0000000..148c123
--- /dev/null
+++ b/meta/lib/oeqa/recipetests/base.py
@@ -0,0 +1,25 @@
+import os
+import shutil
+from oeqa.selftest.base import oeSelfTest
+import oeqa.utils.ftools as ftools
+
+
+class RecipeTests(oeSelfTest):
+
+    def __init__(self, methodName="runTest"):
+        super(RecipeTests, self).__init__(methodName)
+        self.testinc_path = os.path.join(self.builddir, 'conf/testrecipe.inc')
+        self.required_path = os.path.join(self.builddir, 'conf/required.inc')
+        self.testrecipe = os.getenv("TESTRECIPE")
+
+        # Use a clean TMPDIR for each run
+        tmpdir_name = self.builddir + '/tmp_' + self.testrecipe
+        shutil.rmtree(tmpdir_name, ignore_errors=True)
+
+        feature = 'TMPDIR = "%s"\n' % tmpdir_name
+        self.set_required_config(feature)
+
+    # write to <builddir>/conf/requred.inc
+    def set_required_config(self, data):
+        self.log.debug("Writing to: %s\n%s\n" % (self.required_path, data))
+        ftools.write_file(self.required_path, data)
-- 
2.1.0



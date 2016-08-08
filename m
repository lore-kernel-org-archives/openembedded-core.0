Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 158B0771BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316016"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:53 -0700
Message-Id: <83a24f6ceadb25c25dca7841d6756396827377f7.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 05/20] oeqa.selftest.buildhistory: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:21 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildhistory.py        | 10 +++++++++-
 meta/lib/oeqa/selftest/conf/buildhistory.conf |  3 +++
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/buildhistory.conf

diff --git a/meta/lib/oeqa/selftest/buildhistory.py b/meta/lib/oeqa/selftest/buildhistory.py
index 674da62..9553788 100644
--- a/meta/lib/oeqa/selftest/buildhistory.py
+++ b/meta/lib/oeqa/selftest/buildhistory.py
@@ -5,13 +5,21 @@ import datetime
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import bitbake, get_bb_var
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
 
 
 class BuildhistoryBase(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     def config_buildhistory(self, tmp_bh_location=False):
         if (not 'buildhistory' in get_bb_var('USER_CLASSES')) and (not 'buildhistory' in get_bb_var('INHERIT')):
-            add_buildhistory_config = 'INHERIT += "buildhistory"\nBUILDHISTORY_COMMIT = "1"'
+            add_buildhistory_config = self.config.get(
+                                    'buildhistory',
+                                    'config_buildhistory_features')
             self.append_config(add_buildhistory_config)
 
         if tmp_bh_location:
diff --git a/meta/lib/oeqa/selftest/conf/buildhistory.conf b/meta/lib/oeqa/selftest/conf/buildhistory.conf
new file mode 100644
index 0000000..e81c701
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/buildhistory.conf
@@ -0,0 +1,3 @@
+[buildhistory]
+config_buildhistory_features = INHERIT += "buildhistory"
+                               BUILDHISTORY_COMMIT = "1"
-- 
1.8.3.1



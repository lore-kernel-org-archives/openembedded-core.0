Return-Path: <costin.c.constantin@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5731360557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 11:26:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 21 Aug 2015 04:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,721,1432623600"; d="scan'208";a="752829788"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 21 Aug 2015 04:26:59 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id B858C6A4083;
	Fri, 21 Aug 2015 04:26:09 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Aug 2015 14:37:49 +0300
Message-Id: <1440157069-9790-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/oetest.py: add better pkg. search for hasPackage()
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
X-List-Received-Date: Fri, 21 Aug 2015 11:27:00 -0000

Modified hasPackage() to split the content of pkg. manifest file
in containing lines and search at the begining of each line the
existance of the needed pkg.

[YOCTO #8170]

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/oetest.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index dfed3de..9bfc76d 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -99,10 +99,12 @@ class oeTest(unittest.TestCase):
 
     @classmethod
     def hasPackage(self, pkg):
-
-        if re.search(pkg, oeTest.tc.pkgmanifest):
-            return True
-        return False
+        for item in oeTest.tc.pkgmanifest.split('\n'):
+            if re.match(pkg, item):
+                return True
+                break
+        else:
+            return False
 
     @classmethod
     def hasFeature(self,feature):
-- 
2.1.4



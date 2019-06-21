Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 556277E5B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 01:06:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5L169ve024613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 18:06:09 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 18:06:08 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2019 09:18:03 +0800
Message-ID: <1fa8223277fe326a09bbd4812567faf8ec3b4f10.1561023072.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1561023072.git.Qi.Chen@windriver.com>
References: <cover.1561023072.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa: avoid class setup method to run when skipping the whole class
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
X-List-Received-Date: Fri, 21 Jun 2019 01:06:11 -0000
Content-Type: text/plain

For now, even if we have specified to skip the whole module/class via
command line, e.g., `oe-selftest -R gotoolchain', the class setup method
is still run. This at least results in unnecessary builds, and at worst
results in ERROR, if the setup method fails.

So improve the skipping mechanism to avoid class setup method to run
when specified to skip.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/core/case.py    | 2 ++
 meta/lib/oeqa/core/context.py | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index 54977c8..aca144e 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -32,6 +32,8 @@ class OETestCase(unittest.TestCase):
     @classmethod
     def _oeSetUpClass(clss):
         _validate_td_vars(clss.td, clss.td_vars, "class")
+        if hasattr(clss, 'setUpHooker') and callable(getattr(clss, 'setUpHooker')):
+            clss.setUpHooker()
         clss.setUpClassMethod()
 
     @classmethod
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 7882697..68819cc 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -50,10 +50,18 @@ class OETestContext(object):
             def func():
                 raise unittest.SkipTest(skipmsg)
             return func
+        class_ids = {}
         for test in self.suites:
+            if test.__class__ not in class_ids:
+                class_ids[test.__class__] = '.'.join(test.id().split('.')[:-1])
             for skip in skips:
                 if (test.id()+'.').startswith(skip+'.'):
                     setattr(test, 'setUp', skipfuncgen('Skip by the command line argument "%s"' % skip))
+        for tclass in class_ids:
+            cid = class_ids[tclass]
+            for skip in skips:
+                if (cid + '.').startswith(skip + '.'):
+                    setattr(tclass, 'setUpHooker', skipfuncgen('Skip by the command line argument "%s"' % skip))
 
     def loadTests(self, module_paths, modules=[], tests=[],
             modules_manifest="", modules_required=[], filters={}):
-- 
1.9.1



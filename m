Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59E0079064
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 02:51:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7T2poh7002302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 19:51:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 28 Aug 2018 19:51:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 10:56:29 +0800
Message-ID: <b748dad29771b4fa8d4aa7f1a6fe18456f724cc8.1535511291.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1535511291.git.Qi.Chen@windriver.com>
References: <cover.1535511291.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] sdk/context.py: add ability to check for multilib version of target package
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
X-List-Received-Date: Wed, 29 Aug 2018 02:51:49 -0000
Content-Type: text/plain

Add a named argument 'multilib' for the hasTargetPackage function. Its default
value is False. When setting to True, it will try to get the correct multilib
prefix from the sdk_env, the environment setup script.

We need this because we don't want unexpected run of some sdk test cases.
The following steps will generate error.

1. Enable multilib for qemux86-64
   require conf/multilib.conf
   MULTILIBS ?= "multilib:lib32"
   DEFAULTTUNE_virtclass-multilib-lib32 ?= "core2-32"
2. bitbake core-image-sato -c populate_sdk
3. bitbake core-image-sato -c testsdk

The error message is like below.

  No package 'gtk+-3.0' found
  RESULTS - buildgalculator.GalculatorTest.test_galculator - Testcase -1: FAILED

As we don't have lib32-gtk+3 installed, the test case should be skipped when
testing against the lib32 environment setup script.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/sdk/context.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 7c091c0..ec8972d 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -29,7 +29,13 @@ class OESDKTestContext(OETestContext):
     def hasHostPackage(self, pkg):
         return self._hasPackage(self.host_pkg_manifest, pkg)
 
-    def hasTargetPackage(self, pkg):
+    def hasTargetPackage(self, pkg, multilib=False):
+        if multilib:
+            # match multilib according to sdk_env
+            mls = self.td.get('MULTILIB_VARIANTS', '').split()
+            for ml in mls:
+                if ('ml'+ml) in self.sdk_env:
+                    pkg = ml + '-' + pkg
         return self._hasPackage(self.target_pkg_manifest, pkg)
 
 class OESDKTestContextExecutor(OETestContextExecutor):
-- 
1.9.1



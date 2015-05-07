Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4C91C73DB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 13:52:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2015 06:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,384,1427785200"; d="scan'208";a="725330234"
Received: from jlbuthle-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.24.56])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2015 06:52:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 May 2015 14:52:24 +0100
Message-Id: <f793dfd86d0063abe8cd46c49514a48f67015db3.1431006684.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431006684.git.paul.eggleton@linux.intel.com>
References: <cover.1431006684.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431006684.git.paul.eggleton@linux.intel.com>
References: <cover.1431006684.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] devtool: fix for rename of gcc-source
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
X-List-Received-Date: Thu, 07 May 2015 13:52:42 -0000

After OE-Core commit 67db7182faf6742b0d971d61d8c5ba34f69d2e12, PV is
appended to the end of the gcc-source PN, thus we need to handle that in
devtool and the corresponding test.

Part of the fix for [YOCTO #7729].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 10 +++++++++-
 scripts/lib/devtool/standard.py   |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 2af6114..2344fac 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -325,7 +325,15 @@ class DevtoolTests(oeSelfTest):
         self.track_for_cleanup(workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
 
-        testrecipes = 'perf gcc-source kernel-devsrc package-index core-image-minimal meta-toolchain packagegroup-core-sdk meta-ide-support'.split()
+        testrecipes = 'perf kernel-devsrc package-index core-image-minimal meta-toolchain packagegroup-core-sdk meta-ide-support'.split()
+        # Find actual name of gcc-source since it now includes the version - crude, but good enough for this purpose
+        result = runCmd('bitbake-layers show-recipes gcc-source*')
+        reading = False
+        for line in result.output.splitlines():
+            if line.startswith('=='):
+                reading = True
+            elif reading and not line.startswith(' '):
+                testrecipes.append(line.split(':')[0])
         for testrecipe in testrecipes:
             # Check it's a valid recipe
             bitbake('%s -e' % testrecipe)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index cb4b57b..81a44d4 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -124,7 +124,7 @@ def _check_compatible_recipe(pn, d):
         logger.error("The perf recipe does not actually check out source and thus cannot be supported by this tool")
         return False
 
-    if pn in ['gcc-source', 'kernel-devsrc', 'package-index']:
+    if pn in ['kernel-devsrc', 'package-index'] or pn.startswith('gcc-source'):
         logger.error("The %s recipe is not supported by this tool" % pn)
         return False
 
-- 
2.1.0



Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8384177344
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 00:29:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 16:29:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,387,1449561600"; d="scan'208";a="904289409"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 16:29:09 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 18:30:37 -0600
Message-Id: <f4fae173e814851f4a14b4c1e47f5de5c497a7b7.1454459362.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH v2 25/28] oeqa/oetest.py: SDK{Ext, } improve host and target manifest load.
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
X-List-Received-Date: Wed, 03 Feb 2016 00:29:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Don't pass variable name instead of it expands the host and target
manifest at init of the classes.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 6a95c28..80b40b6 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -382,18 +382,18 @@ class SDKTestContext(TestContext):
         self.sdktestdir = sdktestdir
         self.sdkenv = sdkenv
 
-        if not hasattr(self, 'target_manifest_name'):
-            self.target_manifest_name = "SDK_TARGET_MANIFEST"
+        if not hasattr(self, 'target_manifest'):
+            self.target_manifest = d.getVar("SDK_TARGET_MANIFEST", True)
         try:
-            with open(d.getVar(self.target_manifest_name, True)) as f:
+            with open(self.target_manifest) as f:
                  self.pkgmanifest = f.read()
         except IOError as e:
             bb.fatal("No package manifest file found. Did you build the sdk image?\n%s" % e)
 
-        if not hasattr(self, 'host_manifest_name'):
-            self.host_manifest_name = "SDK_HOST_MANIFEST"
+        if not hasattr(self, 'host_manifest'):
+            self.host_manifest = d.getVar("SDK_HOST_MANIFEST", True)
         try:
-            with open(d.getVar(self.host_manifest_name, True)) as f:
+            with open(self.host_manifest) as f:
                 self.hostpkgmanifest = f.read()
         except IOError as e:
             bb.fatal("No host package manifest file found. Did you build the sdk image?\n%s" % e)
@@ -410,8 +410,8 @@ class SDKTestContext(TestContext):
 
 class SDKExtTestContext(SDKTestContext):
     def __init__(self, d, sdktestdir, sdkenv):
-        self.target_manifest_name = "SDK_EXT_TARGET_MANIFEST"
-        self.host_manifest_name = "SDK_EXT_HOST_MANIFEST"
+        self.target_manifest = d.getVar("SDK_EXT_TARGET_MANIFEST", True)
+        self.host_manifest = d.getVar("SDK_EXT_HOST_MANIFEST", True)
 
         super(SDKExtTestContext, self).__init__(d, sdktestdir, sdkenv)
 
-- 
2.1.4



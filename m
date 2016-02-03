Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8D84A7732F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 00:29:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 16:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,387,1449561600"; d="scan'208";a="904289394"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 16:29:08 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 18:30:36 -0600
Message-Id: <a8f1c80fcf1de63001a600cbc348a1e6611dad3f.1454459362.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH v2 24/28] oeqa/oetest: oeSDKTest when run a command redirect env output to null
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
X-List-Received-Date: Wed, 03 Feb 2016 00:29:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some tests are failing because the eSDK env load script shows a help message
on the output so redirect this to /dev/null.

classes/testsdk: Removed deprecated OE_SDK_EXT_SILENT variable.

See Revert "classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env
variable" commit for details.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass | 2 --
 meta/lib/oeqa/oetest.py      | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index cce889b..757c769 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -104,8 +104,6 @@ def testsdkext_main(d):
     new_path = new_path[:-1]
     os.environ['PATH'] = new_path
 
-    os.environ['OE_SDK_EXT_SILENT'] = "1"
-
     pn = d.getVar("PN", True)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR", True))
 
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index c951989..6a95c28 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -125,7 +125,7 @@ class oeSDKTest(oeTest):
         return False
 
     def _run(self, cmd):
-        return subprocess.check_output(". %s; " % self.tc.sdkenv + cmd, shell=True)
+        return subprocess.check_output(". %s > /dev/null; %s;" % (self.tc.sdkenv, cmd), shell=True)
 
 class oeSDKExtTest(oeSDKTest):
     pass
-- 
2.1.4



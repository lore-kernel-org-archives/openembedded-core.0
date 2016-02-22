Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD0B771CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 18:29:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 22 Feb 2016 10:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; d="scan'208";a="657283088"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.35])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2016 10:29:18 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 12:31:31 -0600
Message-Id: <c13d78521086cbc445617508eaabdc01de8f25d5.1456165797.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1456165797.git.anibal.limon@linux.intel.com>
References: <cover.1456165797.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1456165797.git.anibal.limon@linux.intel.com>
References: <cover.1456165797.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCHv2 2/4] classes/testsdk: Move the removal of bitbake PATH to eSDK context only
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
X-List-Received-Date: Mon, 22 Feb 2016 18:29:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

The removal of bitbake and scripts PATH is only needed by eSDK tests
so move to eSDK context only.

This also it's a support for eSDK update test because it needs to
execute oe-publish-sdk from scripts.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/testsdk.bbclass |  9 ++++-----
 meta/lib/oeqa/oetest.py      | 12 +++++++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 41e03d6..157077e 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -96,11 +96,10 @@ def testsdkext_main(d):
     # extensible sdk use network
     export_proxies(d)
 
-    # extensible sdk shows a warning if found bitbake in the path
-    # because can cause problems so clean it
-    paths_to_avoid = ['bitbake/bin', 'poky/scripts',
-                       d.getVar('STAGING_DIR', True),
-                       d.getVar('BASE_WORKDIR', True)]
+    # extensible sdk can be contaminated if native programs are
+    # in PATH, i.e. use perl-native instead of eSDK one.
+    paths_to_avoid = [d.getVar('STAGING_DIR', True),
+                      d.getVar('BASE_WORKDIR', True)]
     os.environ['PATH'] = avoid_paths_in_environ(paths_to_avoid)
 
     pn = d.getVar("PN", True)
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 3e2ea0f..3809ed7 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -21,6 +21,7 @@ import logging
 import oeqa.runtime
 import oeqa.sdkext
 from oeqa.utils.decorators import LogResults, gettag, getResults
+from oeqa.utils import avoid_paths_in_environ
 
 logger = logging.getLogger("BitBake")
 
@@ -128,7 +129,16 @@ class oeSDKTest(oeTest):
         return subprocess.check_output(". %s > /dev/null; %s;" % (self.tc.sdkenv, cmd), shell=True)
 
 class oeSDKExtTest(oeSDKTest):
-    pass
+    def _run(self, cmd):
+        # extensible sdk shows a warning if found bitbake in the path
+        # because can cause contamination, i.e. use devtool from
+        # poky/scripts instead of eSDK one.
+        env = os.environ.copy()
+        paths_to_avoid = ['bitbake/bin', 'poky/scripts']
+        env['PATH'] = avoid_paths_in_environ(paths_to_avoid)
+
+        return subprocess.check_output(". %s > /dev/null;"\
+            " %s;" % (self.tc.sdkenv, cmd), shell=True, env=env)
 
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
-- 
2.1.4



Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EFEB67718E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 15:01:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 22 Feb 2016 07:01:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,484,1449561600"; d="scan'208";a="657171973"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.35])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2016 07:01:12 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 09:03:26 -0600
Message-Id: <75c56decd6a173c298ef989a57f2ea4e682e04e0.1456153260.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1456153260.git.anibal.limon@linux.intel.com>
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1456153260.git.anibal.limon@linux.intel.com>
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCH 1/4] classes/testsdk: Move code for avoid PATHs to oeqa.utils
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
X-List-Received-Date: Mon, 22 Feb 2016 15:01:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

Due to the neeed to use in other modules.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/testsdk.bbclass    | 18 ++++--------------
 meta/lib/oeqa/utils/__init__.py | 17 +++++++++++++++++
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index a56ad5e..7e245e9 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -88,30 +88,20 @@ def testsdkext_main(d):
     import os
     import oeqa.sdkext
     import subprocess
-    from oeqa.oetest import SDKTestContext, SDKExtTestContext
     from bb.utils import export_proxies
+    from oeqa.oetest import SDKTestContext, SDKExtTestContext
+    from oeqa.utils import avoid_paths_in_environ
+
 
     # extensible sdk use network
     export_proxies(d)
 
     # extensible sdk shows a warning if found bitbake in the path
     # because can cause problems so clean it
-    new_path = ''
     paths_to_avoid = ['bitbake/bin', 'poky/scripts',
                        d.getVar('STAGING_DIR', True),
                        d.getVar('BASE_WORKDIR', True)]
-    for p in os.environ['PATH'].split(':'):
-       avoid = False
-       for pa in paths_to_avoid:
-           if pa in p:
-              avoid = True
-              break
-       if avoid:
-           continue
-
-       new_path = new_path + p + ':'
-    new_path = new_path[:-1]
-    os.environ['PATH'] = new_path
+    avoid_paths_in_environ(paths_to_avoid)
 
     pn = d.getVar("PN", True)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR", True))
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index 2260046..b246c69 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -13,3 +13,20 @@ class CommandError(Exception):
     def __str__(self):
         return "Command '%s' returned non-zero exit status %d with output: %s" % (self.cmd, self.retcode, self.output)
 
+def avoid_paths_in_environ(paths_to_avoid):
+    import os
+
+    new_path = ''
+    for p in os.environ['PATH'].split(':'):
+       avoid = False
+       for pa in paths_to_avoid:
+           if pa in p:
+              avoid = True
+              break
+       if avoid:
+           continue
+
+       new_path = new_path + p + ':'
+
+    new_path = new_path[:-1]
+    os.environ['PATH'] = new_path
-- 
2.1.4



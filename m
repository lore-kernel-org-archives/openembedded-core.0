Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2254960079
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 20:53:41 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 26 Sep 2016 13:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,401,1470726000"; d="scan'208";a="13939066"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga004.jf.intel.com with ESMTP; 26 Sep 2016 13:53:43 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 13:53:13 -0700
Message-Id: <1474923193-25918-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] build.py: fix os.getcwd() exception
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
X-List-Received-Date: Mon, 26 Sep 2016 20:53:42 -0000

When trying to obtain the current directory from a directory
that does not exist anymore, an exception is raised.
This patch handles such exception.

[YOCTO #10331]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 bitbake/lib/bb/build.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
index 2ed0441..249f7d6 100644
--- a/bitbake/lib/bb/build.py
+++ b/bitbake/lib/bb/build.py
@@ -261,9 +261,14 @@ def exec_func(func, d, dirs = None, pythonexception=False):
         else:
             exec_func_shell(func, d, runfile, cwd=adir)
 
-    if oldcwd and os.getcwd() != oldcwd:
+    try:
+        curcwd = os.getcwd()
+    except:
+        curcwd = None
+
+    if oldcwd and curcwd != oldcwd:
         try:
-            bb.warn("Task %s changed cwd to %s" % (func, os.getcwd()))
+            bb.warn("Task %s changed cwd to %s" % (func, curcwd))
             os.chdir(oldcwd)
         except:
             pass
-- 
2.7.4



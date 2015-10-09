Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3891E75A38
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 17:18:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Oct 2015 10:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,658,1437462000"; d="scan'208";a="788675308"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Oct 2015 10:18:16 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 140D16A4005;
	Fri,  9 Oct 2015 10:17:17 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Oct 2015 20:16:26 +0300
Message-Id: <1444410986-17870-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/testimage: Add support for test folder export.
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
X-List-Received-Date: Fri, 09 Oct 2015 17:18:48 -0000

If tests are organized in folders then it will copy the whole
folder to the export location. This should keep the original
directory structure for exported oeqa/runtime.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/classes/testimage.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index c575db1..e8989b7 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -238,11 +238,23 @@ def exportTests(d,tc):
     bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/runtime/files"))
     bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/utils"))
     # copy test modules, this should cover tests in other layers too
+    bbpath = d.getVar("BBPATH", True).split(':')
     for t in tc.testslist:
+        isfolder = False
         if re.search("\w+\.\w+\.test_\S+", t):
             t = '.'.join(t.split('.')[:3])
         mod = pkgutil.get_loader(t)
-        shutil.copy2(mod.filename, os.path.join(exportpath, "oeqa/runtime"))
+        # More depth than usual?
+        if (t.count('.') > 2):
+            for p in bbpath:
+                foldername = os.path.join(p, 'lib',  os.sep.join(t.split('.')).rsplit(os.sep, 1)[0])
+                if os.path.isdir(foldername):
+                    isfolder = True
+                    target_folder = os.path.join(exportpath, "oeqa", "runtime", os.path.basename(foldername))
+                    if not os.path.exists(target_folder):
+                        shutil.copytree(foldername, target_folder)
+        if not isfolder:
+            shutil.copy2(mod.filename, os.path.join(exportpath, "oeqa/runtime"))
     # copy __init__.py files
     oeqadir = pkgutil.get_loader("oeqa").filename
     shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(exportpath, "oeqa"))
-- 
2.1.4



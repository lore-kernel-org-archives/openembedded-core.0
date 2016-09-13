Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 063817724D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 20:25:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 13 Sep 2016 13:25:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,330,1470726000"; d="scan'208";a="760353268"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.144])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Sep 2016 13:25:08 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 15:25:42 -0500
Message-Id: <1473798342-12583-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: joshuagloe@gmail.com
Subject: [PATCH] oeqa/utils/decorators: LogResults fix race condition in linkfile
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
X-List-Received-Date: Tue, 13 Sep 2016 20:25:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to avoid race condition when test if exists the linkfile
use bb.utils.lock, the best solution is to create a unique name
for the link file.

There is no way to create a unique linkfile name at this decorator
because is needed the machine and image variables, those variables
can't be passed easily in this code.

To avoid broke test export functionality use a try/except because bb
isn't available when use test export

[YOCTO #10225]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 615fd95..25f9c54 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -189,10 +189,24 @@ def LogResults(original_class):
         if passed:
             local_log.results("Testcase "+str(test_case)+": PASSED")
 
+        # XXX: In order to avoid race condition when test if exists the linkfile
+        # use bb.utils.lock, the best solution is to create a unique name for the
+        # link file.
+        try:
+            import bb
+            has_bb = True
+            lockfilename = linkfile + '.lock'
+        except ImportError:
+            has_bb = False
+
+        if has_bb:
+            lf = bb.utils.lockfile(lockfilename, block=True)
         # Create symlink to the current log
         if os.path.lexists(linkfile):
             os.remove(linkfile)
         os.symlink(logfile, linkfile)
+        if has_bb:
+            bb.utils.unlockfile(lf)
 
     original_class.run = run
 
-- 
2.1.4



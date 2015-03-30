Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 745EE6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 09:00:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Mar 2015 02:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,492,1422950400"; d="scan'208";a="548242479"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 30 Mar 2015 02:00:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 0EBE26A408D;
	Mon, 30 Mar 2015 02:00:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Mar 2015 12:00:18 +0300
Message-Id: <1427706018-1695-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] package_manager: Run createrepo sequentially
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
X-List-Received-Date: Mon, 30 Mar 2015 09:00:31 -0000

Running multiple createrepo in parallel can cause raice conditions
when creating/accessing rpm database. Createrepo fails with the
error "package_manager: rpmdb: BDB0060 PANIC: fatal region error detected"
in such cases.

Running createrepo sequentially should fix the race as rpm database
will not be accessed by multiple createrepo at the same time.

[YOCTO #6571]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c9a8084..c956116 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -108,25 +108,22 @@ class RpmIndexer(Indexer):
         archs = archs.union(set(sdk_pkg_archs))
 
         rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
-        index_cmds = []
         rpm_dirs_found = False
         for arch in archs:
             arch_dir = os.path.join(self.deploy_dir, arch)
             if not os.path.isdir(arch_dir):
                 continue
 
-            index_cmds.append("%s --update -q %s" % (rpm_createrepo, arch_dir))
-
             rpm_dirs_found = True
 
+            result = create_index("%s --update -q %s" % (rpm_createrepo, arch_dir))
+            if result:
+                bb.fatal(result)
+
         if not rpm_dirs_found:
             bb.note("There are no packages in %s" % self.deploy_dir)
             return
 
-        result = oe.utils.multiprocess_exec(index_cmds, create_index)
-        if result:
-            bb.fatal('%s' % ('\n'.join(result)))
-
 
 class OpkgIndexer(Indexer):
     def write_index(self):
-- 
2.1.4



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E65D5736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 00:16:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 30 Mar 2015 17:16:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,497,1422950400"; d="scan'208";a="706443369"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Mar 2015 17:16:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E35B66A408D;
	Mon, 30 Mar 2015 17:16:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Mar 2015 03:16:41 +0300
Message-Id: <1427761001-25332-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1427759396-24932-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1427759396-24932-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH] package_manager: call createrepo with --dbpath pointing inside WORKDIR
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
X-List-Received-Date: Tue, 31 Mar 2015 00:16:51 -0000

Rpm database in staging area is used only by createrepo.
createrepo fails with the error
"rpmdb: BDB0060 PANIC: fatal region error detected"
if rpm database is broken during previous run of createrepo.

Made createrepo to create rpm db in $WORKDIR/rpmdb/ from scratch
for every build. This should potentially fix the failure.

[YOCTO #6571]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 743c7cb..2461acd 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -110,12 +110,16 @@ class RpmIndexer(Indexer):
         rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
         index_cmds = []
         rpm_dirs_found = False
+        dbpath = os.path.join(self.d.getVar('WORKDIR', True), 'rpmdb')
+        if os.path.exists(dbpath):
+            bb.utils.remove(dbpath, True)
         for arch in archs:
             arch_dir = os.path.join(self.deploy_dir, arch)
             if not os.path.isdir(arch_dir):
                 continue
 
-            index_cmds.append("%s --update -q %s" % (rpm_createrepo, arch_dir))
+            index_cmds.append("%s --dbpath %s --update -q %s" % \
+                             (rpm_createrepo, dbpath, arch_dir))
 
             rpm_dirs_found = True
 
-- 
2.1.4



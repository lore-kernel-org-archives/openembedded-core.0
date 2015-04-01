Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D896D60034
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 11:17:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 01 Apr 2015 04:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,503,1422950400"; d="scan'208";a="475394490"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Apr 2015 04:17:16 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 7F7CE6A408D;
	Wed,  1 Apr 2015 04:16:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Apr 2015 14:17:06 +0300
Message-Id: <1427887026-10094-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <551AC6CA.7030500@windriver.com>
References: <551AC6CA.7030500@windriver.com>
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
X-List-Received-Date: Wed, 01 Apr 2015 11:17:17 -0000

Rpm database in staging area is used only by createrepo.
createrepo fails with the error
"rpmdb: BDB0060 PANIC: fatal region error detected"
if rpm database is broken during previous run of createrepo.

Made createrepo to create rpm db in $WORKDIR/rpmdb/ from scratch
for every build and architecture. This should potentially fix the
failure as every run of createrepo will be using separate db.

[YOCTO #6571]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 743c7cb..ed0c9a7 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -111,11 +111,15 @@ class RpmIndexer(Indexer):
         index_cmds = []
         rpm_dirs_found = False
         for arch in archs:
+            dbpath = os.path.join(self.d.getVar('WORKDIR', True), 'rpmdb', arch)
+            if os.path.exists(dbpath):
+                bb.utils.remove(dbpath, True)
             arch_dir = os.path.join(self.deploy_dir, arch)
             if not os.path.isdir(arch_dir):
                 continue
 
-            index_cmds.append("%s --update -q %s" % (rpm_createrepo, arch_dir))
+            index_cmds.append("%s --dbpath %s --update -q %s" % \
+                             (rpm_createrepo, dbpath, arch_dir))
 
             rpm_dirs_found = True
 
-- 
2.1.4



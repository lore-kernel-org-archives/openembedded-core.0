Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8862C6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 08:30:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 30 Mar 2015 01:30:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,492,1422950400"; d="scan'208";a="699996401"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2015 01:30:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id DC8346A408F;
	Mon, 30 Mar 2015 01:30:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Mar 2015 11:30:12 +0300
Message-Id: <1427704212-1179-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] rootfs.py: Remove rpm database from staging area
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
X-List-Received-Date: Mon, 30 Mar 2015 08:30:25 -0000

Rpm database in staging area is used only by createrepo.
createrepo fails with the error
"rpmdb: BDB0060 PANIC: fatal region error detected"
if rpm database is broken from the previous run of createrepo.

Removing the databae before running createrepo can hopefully
prevent this failure to happen.

[YOCTO #6571]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 4e4e6eb..9f7dc65 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -306,6 +306,9 @@ class RpmRootfs(Rootfs):
             bb.utils.remove(self.image_rootfs, True)
         else:
             self.pm.recovery_packaging_data()
+        dbpath = os.path.join(self.d.getVar('STAGING_DIR_NATIVE', True),
+                              'var/lib/rpm/*')
+        bb.utils.remove(dbpath, recurse=True)
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
 
         self.pm.create_configs()
-- 
2.1.4



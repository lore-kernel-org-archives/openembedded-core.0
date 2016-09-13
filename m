Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65CE4771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 08:48:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8D8maPQ002633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Sep 2016 01:48:36 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Sep 2016 01:48:35 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Sep 2016 04:48:32 -0400
Message-ID: <8c9eea181c3ed9e9bac6d5d6480351795860e2e6.1473756300.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1473756300.git.hongxu.jia@windriver.com>
References: <cover.1473756300.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package_manager.py: fix bitbake package-index failed
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
X-List-Received-Date: Tue, 13 Sep 2016 08:48:36 -0000
Content-Type: text/plain

Previously the following commit in oe-core move RPM metadata
from DEPLOY_DIR to WORKDIR.
-----------
commit a92c196449c516fe51786d429078bbb1213bb029
Author: Stephano Cetola <stephano.cetola@linux.intel.com>
Date:   Wed Aug 10 13:03:16 2016 -0700

    Allow for simultaneous do_rootfs tasks with rpm

    Give each rootfs its own RPM channel to use.  This puts the RPM metadata
    in a private subdirectory of $WORKDIR, rather than living in DEPLOY_DIR
    where other tasks may race with it.
-----------

In the modification of 'class RpmIndexer, it should not
directly set arch_dir with WORKDIR. It caused 'bitbake
package-index' could not work correctly.

Assign WORKDIR as input parameter at RpmIndexer initial time
could fix the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/package_manager.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2802254..30e1de9 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -176,7 +176,7 @@ class RpmIndexer(Indexer):
             dbpath = os.path.join(self.d.getVar('WORKDIR', True), 'rpmdb', arch)
             if os.path.exists(dbpath):
                 bb.utils.remove(dbpath, True)
-            arch_dir = os.path.join(self.d.getVar('WORKDIR', True), 'rpms', arch)
+            arch_dir = os.path.join(self.deploy_dir, arch)
             if not os.path.isdir(arch_dir):
                 continue
 
@@ -686,7 +686,8 @@ class RpmPM(PackageManager):
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
 
-        self.indexer = RpmIndexer(self.d, self.deploy_dir)
+        packageindex_dir = os.path.join(self.d.getVar('WORKDIR', True), 'rpms')
+        self.indexer = RpmIndexer(self.d, packageindex_dir)
         self.pkgs_list = RpmPkgsList(self.d, self.target_rootfs, arch_var, os_var)
 
         self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
-- 
2.8.1



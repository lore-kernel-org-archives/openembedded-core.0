Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B5582600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 12:34:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 20 May 2015 05:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,464,1427785200"; d="scan'208";a="713054887"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 20 May 2015 05:33:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 5D88D6A408F;
	Wed, 20 May 2015 05:33:23 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 13:40:18 +0300
Message-Id: <1432118418-24634-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] rootfs.py: Improve rpm log_check_regex
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
X-List-Received-Date: Wed, 20 May 2015 12:34:06 -0000

Current regex can cause false negatives if paths in bitbake log files
contain "ERR" or "Fail". do_rootfs fails with return code 1 in
this case.

Improved regexp is based on error messages produced by rpm.
Those are found by analyzing rpm source code.

[YOCTO #7789]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 6fb749f..ce23b23 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -295,7 +295,9 @@ class Rootfs(object):
 class RpmRootfs(Rootfs):
     def __init__(self, d, manifest_dir):
         super(RpmRootfs, self).__init__(d)
-        self.log_check_regex = '(unpacking of archive failed|Cannot find package|exit 1|ERR|Fail)'
+        self.log_check_regex = '(unpacking of archive failed|Cannot find package'\
+                               '|exit 1|ERROR: |Error: |Error |ERROR '\
+                               '|Failed |Failed: |Failed$|Failed\(\d+\):)'
         self.manifest = RpmManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
-- 
2.1.4



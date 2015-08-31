Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 021A260043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 08:35:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 Aug 2015 01:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,439,1437462000"; d="scan'208";a="779218439"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 31 Aug 2015 01:35:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 447BE6A4005;
	Mon, 31 Aug 2015 01:34:49 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 11:35:36 +0300
Message-Id: <1441010136-19955-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] oe-selftest: wic: fix test19_image_env test case
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
X-List-Received-Date: Mon, 31 Aug 2015 08:35:41 -0000

This test case fails on qemu machines as not all expected bitbake
variables are present in .env file.

Fixed by filtering out optional variables.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index deb2333..6bc4b60 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -180,8 +180,10 @@ class Wic(oeSelfTest):
         path = os.path.join(imgdatadir, basename) + '.env'
         self.assertTrue(os.path.isfile(path))
 
-        wicvars = get_bb_var('WICVARS', image).split()
-        wicvars.remove('IMAGE_BOOT_FILES') # this variable is optional
+        wicvars = set(get_bb_var('WICVARS', image).split())
+        # filter out optional variables
+        wicvars = wicvars.difference(('HDDDIR', 'IMAGE_BOOT_FILES',
+                                      'INITRD', 'ISODIR'))
         with open(path) as envfile:
             content = dict(line.split("=", 1) for line in envfile)
             # test if variables used by wic present in the .env file
-- 
2.1.4



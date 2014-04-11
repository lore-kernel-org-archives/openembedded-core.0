Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0204965E07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 11:04:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2014 03:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,841,1389772800"; d="scan'208";a="519081327"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2014 04:04:32 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id DE1676A4087;
	Fri, 11 Apr 2014 04:04:14 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Apr 2014 14:04:49 +0300
Message-Id: <1397214289-16423-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] selftest: DiskMonTest: use a high value for free space
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
X-List-Received-Date: Fri, 11 Apr 2014 11:04:32 -0000

Using the free space of the host works when
oe-selftest is the only build running, but if something else
on the host remove things this will fail (as seen on AB).
Using an absurdly high value should fix this.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 8ff40ba..27fc452 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -51,17 +51,15 @@ class ImageOptionsTests(oeSelfTest):
 class DiskMonTest(oeSelfTest):
 
     def test_stoptask_behavior(self):
-        result = runCmd("df -Pk %s" % os.getcwd())
-        size = result.output.split("\n")[1].split()[3]
-        self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},%sK,4510K"' % size)
+        self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
         res = bitbake("m4", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output)
         self.assertEqual(res.status, 1)
-        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},%sK,4510K"' % size)
+        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"')
         res = bitbake("m4", ignore_status = True)
         self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output)
         self.assertEqual(res.status, 1)
-        self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},%sK,4510K"' % size)
+        self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"')
         res = bitbake("m4")
         self.assertTrue('WARNING: The free space' in res.output)
 
-- 
1.9.0



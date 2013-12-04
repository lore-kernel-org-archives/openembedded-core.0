Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 105B66D99E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:13:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2013 05:13:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,824,1378882800"; d="scan'208";a="419227858"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2013 05:13:21 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 25A186A400F;
	Wed,  4 Dec 2013 05:13:18 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 15:13:52 +0200
Message-Id: <1386162832-7609-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/selftest: buildoptions: small fixes for some tests
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
X-List-Received-Date: Wed, 04 Dec 2013 13:13:22 -0000

While harmless, we should overwrite the config not append to it,
and use m4 as target, otherwise the WARN check will
build an entire image and we are not interested in that.
Also add an output check for the WARN_QA test.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index f99dda7..5fb69d8 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -46,16 +46,16 @@ class DiskMonTest(oeSelfTest):
     def test_stoptask_behavior(self):
         result = runCmd("df -k %s" % os.getcwd())
         size = result.output.split("\n")[1].split()[3]
-        self.append_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},%sK,4510K"' % size)
-        res = bitbake("core-image-minimal", ignore_status = True)
+        self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},%sK,4510K"' % size)
+        res = bitbake("m4", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output)
         self.assertEqual(res.status, 1)
-        self.append_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},%sK,4510K"' % size)
-        res = bitbake("core-image-minimal", ignore_status = True)
+        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},%sK,4510K"' % size)
+        res = bitbake("m4", ignore_status = True)
         self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output)
         self.assertEqual(res.status, 1)
-        self.append_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},%sK,4510K"' % size)
-        res = bitbake("core-image-minimal")
+        self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},%sK,4510K"' % size)
+        res = bitbake("m4")
         self.assertTrue('WARNING: The free space' in res.output)
 
 class SanityOptionsTest(oeSelfTest):
@@ -74,9 +74,10 @@ class SanityOptionsTest(oeSelfTest):
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         self.append_config('ERROR_QA_remove = "packages-list"')
         self.append_config('WARN_QA_append = " packages-list"')
-        bitbake("xcursor-transparent-theme")
+        res = bitbake("xcursor-transparent-theme")
         bitbake("xcursor-transparent-theme -ccleansstate")
         self.delete_recipeinc('xcursor-transparent-theme')
+        self.assertTrue("WARNING: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output)
 
     def test_sanity_userspace_dependency(self):
         self.append_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
-- 
1.8.3.1



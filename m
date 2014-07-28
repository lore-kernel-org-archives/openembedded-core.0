Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3466C70668
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 13:54:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jul 2014 06:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,749,1400050800"; d="scan'208";a="550145064"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 28 Jul 2014 06:54:20 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 1FCD56A4007;
	Mon, 28 Jul 2014 06:53:43 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jul 2014 18:59:19 +0300
Message-Id: <1406563159-3717-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] selftest/buildoptions.py: fix QA_WARN test and add more output when failing
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
X-List-Received-Date: Mon, 28 Jul 2014 13:54:20 -0000

The -ccleansstate should be done before building the package for the second time.
Also printing the command output when failing.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 27fc452..ec541e5 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -74,15 +74,15 @@ class SanityOptionsTest(oeSelfTest):
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         res = bitbake("xcursor-transparent-theme", ignore_status=True)
         self.delete_recipeinc('xcursor-transparent-theme')
-        self.assertTrue("ERROR: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output)
+        self.assertTrue("ERROR: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output, msg=res.output)
         self.assertEqual(res.status, 1)
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         self.append_config('ERROR_QA_remove = "packages-list"')
         self.append_config('WARN_QA_append = " packages-list"')
-        res = bitbake("xcursor-transparent-theme")
         bitbake("xcursor-transparent-theme -ccleansstate")
+        res = bitbake("xcursor-transparent-theme")
         self.delete_recipeinc('xcursor-transparent-theme')
-        self.assertTrue("WARNING: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output)
+        self.assertTrue("WARNING: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output, msg=res.output)
 
     def test_sanity_userspace_dependency(self):
         self.append_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
-- 
1.8.3.2



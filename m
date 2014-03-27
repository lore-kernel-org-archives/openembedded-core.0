Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3B76E27B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:28:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Mar 2014 01:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,739,1389772800"; d="scan'208";a="508755590"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 27 Mar 2014 01:28:34 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 4AD576A4007;
	Thu, 27 Mar 2014 01:28:20 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 12:32:03 +0200
Message-Id: <1395916323-4223-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH v2] selftest/bbtests.py: Fixed regex and added bitbake output to test_warnings_errors
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
X-List-Received-Date: Thu, 27 Mar 2014 08:28:56 -0000

The test failed when more than 1 error or 1 warning is present.
Also pasting the bitbake output when the test fails.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index ee1f82a..6815ecf 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -47,10 +47,10 @@ class BitbakeTests(oeSelfTest):
 
     def test_warnings_errors(self):
         result = bitbake('-b asdf', ignore_status=True)
-        find_warnings = re.search("Summary: There was [1-9][0-9]* WARNING message shown.", result.output)
-        find_errors = re.search("Summary: There was [1-9][0-9]* ERROR message shown.", result.output)
-        self.assertTrue(find_warnings)
-        self.assertTrue(find_errors)
+        find_warnings = re.search("Summary: There w.{2,3}? [1-9][0-9]* WARNING messages* shown", result.output)
+        find_errors = re.search("Summary: There w.{2,3}? [1-9][0-9]* ERROR messages* shown", result.output)
+        self.assertTrue(find_warnings, msg="Did not find the mumber of warnings at the end of the build:\n" + result.output)
+        self.assertTrue(find_errors, msg="Did not find the mumber of errors at the end of the build:\n" + result.output)
 
     def test_invalid_patch(self):
         self.write_recipeinc('man', 'SRC_URI += "file://man-1.5h1-make.patch"')
-- 
1.8.3.2



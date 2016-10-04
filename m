Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4331571A4C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 20:07:57 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 04 Oct 2016 13:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,444,1473145200"; d="scan'208";a="16196098"
Received: from besquive-mobl2.zpn.intel.com ([10.219.5.36])
	by fmsmga005.fm.intel.com with ESMTP; 04 Oct 2016 13:07:58 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 15:08:16 -0500
Message-Id: <1475611696-3190-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] selftest: fetcher error changed and test needs update
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
X-List-Received-Date: Tue, 04 Oct 2016 20:07:58 -0000

the following poky commit:

4359ef08 base.bbclass: Use bb.fatal() instead of raising FuncFailed

changed the way the fetcher error is reported.

Previous reporting:
...Function failed: Fetcher failure for URL:...

New reporting:
...Fetcher failure for URL:...

Updating how the check is done fixes the test error and accurately
confirms the tested scenario for test_invalid_recipe_src_uri.

[YOCTO#10370]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index d8cb835..baae1e0 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -145,7 +145,7 @@ INHERIT_remove = \"report-error\"
         self.assertEqual(result.status, 1, msg="Command succeded when it should have failed. bitbake output: %s" % result.output)
         self.assertTrue('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output, msg = "\"invalid\" file \
 doesn't exist, yet no error message encountered. bitbake output: %s" % result.output)
-        line = self.getline(result, 'Function failed: Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.')
+        line = self.getline(result, 'Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.')
         self.assertTrue(line and line.startswith("ERROR:"), msg = "\"invalid\" file \
 doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result.output)
 
-- 
2.5.5



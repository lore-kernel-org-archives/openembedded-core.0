Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9C1786DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 15:50:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2017 07:50:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,432,1508828400"; d="scan'208";a="188435920"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 20 Dec 2017 07:50:45 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2017 17:45:11 +0200
Message-Id: <20171220154511.12364-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171220154511.12364-1-alexander.kanavin@linux.intel.com>
References: <20171220154511.12364-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] runtime/cases/ptest.py: fail when ptests fail on target
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
X-List-Received-Date: Wed, 20 Dec 2017 15:50:45 -0000

That's the whole point isn't it? Previously this testcase succeeded
even if some of the underlying on-target tests failed; the only way
to find out if anything was wrong was to manually inspect the logs.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 6669e24f141..c5b8c9cb8fb 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -83,3 +83,11 @@ class PtestRunnerTest(OERuntimeTestCase):
             # Remove the old link to create a new one
             os.remove(ptest_log_dir_link)
         os.symlink(os.path.basename(ptest_log_dir), ptest_log_dir_link)
+
+        failed_tests = {}
+        for section in parse_result.result_dict:
+            failed_testcases = [ test for test, result in parse_result.result_dict[section] if result == 'fail' ]
+            if failed_testcases:
+                failed_tests[section] = failed_testcases
+
+        self.assertFalse(failed_tests, msg = "Failed ptests: %s" %(str(failed_tests)))
-- 
2.15.1



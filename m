Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E88A178866
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 12:51:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Dec 2017 04:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,435,1508828400"; 
   d="scan'208";a="4596269"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 21 Dec 2017 04:51:06 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Dec 2017 14:45:00 +0200
Message-Id: <20171221124500.29810-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171221124500.29810-1-alexander.kanavin@linux.intel.com>
References: <20171221124500.29810-1-alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 3/3] runtime/cases/ptest.py: fail when ptests fail on target
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
X-List-Received-Date: Thu, 21 Dec 2017 12:51:06 -0000

That's the whole point isn't it? Previously this testcase succeeded
even if some of the underlying on-target tests failed; the only way
to find out if anything was wrong was to manually inspect the logs.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 63e119530dc..8f208a5ff21 100644
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



Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2CA74C2D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 12:40:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jul 2018 05:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,393,1526367600"; d="scan'208";a="74713594"
Received: from vhaapala-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.249.33.190])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2018 05:40:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 14:40:14 +0200
Message-Id: <20180723124014.11332-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oe-selftest: fix for changes to buildhistory-diff
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
X-List-Received-Date: Mon, 23 Jul 2018 12:40:28 -0000

Now we're not reporting the related fields (as of openembedded-core
8658b3677b9f7cb70806061c41570c709086ef05) we shouldn't expect to see
PR reported here since it's not monitored by buildhistory-diff. However,
with a bit of messing about we can check for the exact output that we
should now see as a result of the test changing PR to go backwards.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 1ee753763ec..bcdc2d5ac07 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -10,6 +10,19 @@ class BuildhistoryDiffTests(BuildhistoryBase):
         target = 'xcursor-transparent-theme'
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True)
+        result = runCmd("oe-pkgdata-util read-value PKGV %s" % target)
+        pkgv = result.output.rstrip()
         result = runCmd("buildhistory-diff -p %s" % get_bb_var('BUILDHISTORY_DIR'))
-        expected_output = 'PR changed from "r1" to "r0"'
-        self.assertTrue(expected_output in result.output, msg="Did not find expected output: %s" % result.output)
+        expected_endlines = [
+            "xcursor-transparent-theme-dev: RDEPENDS: removed \"xcursor-transparent-theme (['= %s-r1'])\", added \"xcursor-transparent-theme (['= %s-r0'])\"" % (pkgv, pkgv),
+            "xcursor-transparent-theme-staticdev: RDEPENDS: removed \"xcursor-transparent-theme-dev (['= %s-r1'])\", added \"xcursor-transparent-theme-dev (['= %s-r0'])\"" % (pkgv, pkgv)
+        ]
+        for line in result.output.splitlines():
+            for el in expected_endlines:
+                if line.endswith(el):
+                    expected_endlines.remove(el)
+                    break
+            else:
+                self.fail('Unexpected line:\n%s\nExpected line endings:\n  %s' % (line, '\n  '.join(expected_endlines)))
+        if expected_endlines:
+            self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
-- 
2.17.1



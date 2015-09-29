Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 93FB977035
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:34:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 29 Sep 2015 07:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,608,1437462000"; d="scan'208";a="799678951"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2015 07:34:41 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2015 06:27:07 +0000
Message-Id: <1443508027-4877-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] oeqa/utils/decorators: Append the testname without the full path
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
X-List-Received-Date: Tue, 29 Sep 2015 14:34:41 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

When getting the failures/errors/skipped lists, include the
unit test without the full path.

This issue was found on this scenario

    | test_1_logrotate_setup (oeqa.runtime.logrotate.LogrotateTest) ... FAIL
    | test_2_logrotate (oeqa.runtime.logrotate.LogrotateTest) ... ok

Where test_1_logrotate failed and test_2_logrotate should not have
run because

    @skipUnlessPassed("test_1_logrotate_setup")
    def test_2_logrotate(self):

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 7116208..f55e3d8 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -33,6 +33,10 @@ class getResults(object):
                     ret.append(s.replace("setUpModule (", "").replace(")",""))
                 else:
                     ret.append(s)
+                # Append also the test without the full path
+                testname = s.split('.')[-1]
+                if testname:
+                    ret.append(testname)
             return ret
         self.faillist = handleList(upperf.f_locals['result'].failures)
         self.errorlist = handleList(upperf.f_locals['result'].errors)
-- 
1.8.4.5



Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 946DC785E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 12:13:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 04:13:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,507,1508828400"; 
   d="scan'208";a="8420300"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 Jan 2018 04:13:47 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:13:44 +0200
Message-Id: <20180104121346.18976-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCHv3 1/3] runtime/cases/ptest.py: do not require ptest-pkgs in IMAGE_FEATURES; run only when ptest-runner is availalble;
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
X-List-Received-Date: Thu, 04 Jan 2018 12:13:47 -0000

Previously the test would execute only when all available ptests
for packages in the image were installed; some of those tests may
be broken, never finish, take a very long time or simply irrelevant
to the user who wants to check ptests of only a few specific packages,
and does so by listing them explicitly via IMAGE_INSTALL_append or similar.

Presence of ptest-runner means there is at least one ptest package installed
as they pull it in via a class dependency; ptest-runner is not generally
installed otherwise.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index ec8c038a566..a2b6ffdfe11 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -48,9 +48,12 @@ class PtestRunnerTest(OERuntimeTestCase):
 
     @OETestID(1600)
     @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
-    @skipIfNotFeature('ptest-pkgs', 'Test requires ptest-pkgs to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_ptestrunner(self):
+        status, output = self.target.run('which ptest-runner', 0)
+        if status != 0:
+            self.skipTest("No -ptest packages are installed in the image")
+
         import datetime
 
         test_log_dir = self.td.get('TEST_LOG_DIR', '')
-- 
2.15.1



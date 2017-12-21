Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2B97878B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 12:51:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Dec 2017 04:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,435,1508828400"; 
   d="scan'208";a="4596260"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 21 Dec 2017 04:51:03 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Dec 2017 14:44:58 +0200
Message-Id: <20171221124500.29810-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCHv2 1/3] runtime/cases/ptest.py: do not require ptest-pkgs in IMAGE_FEATURES
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
X-List-Received-Date: Thu, 21 Dec 2017 12:51:04 -0000

Doing so means that all available ptests for packages in the image
will be installed and run; some of them may be broken, never finish,
take a very long time or simply irrelevant to the user who wants to
check ptests of only a few specific packages, and does so by listing
them explicitly via IMAGE_INSTALL_append or similar.

Conversely, do not run the test if ptest-runner is not installed
(which means there are no ptests available, as they pull it in via a
dependency).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index ec8c038a566..63e119530dc 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -48,9 +48,12 @@ class PtestRunnerTest(OERuntimeTestCase):
 
     @OETestID(1600)
     @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
-    @skipIfNotFeature('ptest-pkgs', 'Test requires ptest-pkgs to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_ptestrunner(self):
+        status, output = self.target.run('which ptest-runner', 0)
+        if len(output) == 0:
+            self.skipTest("No -ptest packages are installed in the image")
+
         import datetime
 
         test_log_dir = self.td.get('TEST_LOG_DIR', '')
-- 
2.15.1



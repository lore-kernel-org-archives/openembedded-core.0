Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6A7A75171
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 03:09:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5438rw1003776
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Jun 2018 20:09:09 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 3 Jun 2018 20:08:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2018 11:10:07 +0800
Message-ID: <87cf5a4e6e04ba739ab6e50fe2ec41b843487e1c.1528081495.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528081495.git.Qi.Chen@windriver.com>
References: <cover.1528081495.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/14] oeqa/runtime/cases/selftest.py: rename to _selftest.py
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
X-List-Received-Date: Mon, 04 Jun 2018 03:09:18 -0000
Content-Type: text/plain

This test modules is designed to be invoked only by selftest. It's
not meant to be tested by normal runtime test. So it should be renamed
with '_' prefix, so that it will not be automatically loaded by normal
runtime tests when 'auto' is in TEST_SUITES.

The failure message is as below.

  RESULTS - selftest.Selftest.test_install_package - Testcase -1: FAILED

Also, change selftest/cases/runtime_test.py to use '_selftest' accordingly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

fix _selftest

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py} | 2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py} (94%)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/selftest.py b/meta-selftest/lib/oeqa/runtime/cases/_selftest.py
similarity index 94%
rename from meta-selftest/lib/oeqa/runtime/cases/selftest.py
rename to meta-selftest/lib/oeqa/runtime/cases/_selftest.py
index 19de740..e6c05ef 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/selftest.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/_selftest.py
@@ -17,7 +17,7 @@ class Selftest(OERuntimeTestCase):
         (status, output) = self.target.run("socat -V")
         self.assertEqual(status, 0, msg="socat is not installed")
 
-    @OETestDepends(['selftest.Selftest.test_install_package'])
+    @OETestDepends(['_selftest.Selftest.test_install_package'])
     def test_verify_uninstall(self):
         """
         Summary: Check basic package installation functionality.
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 9c9b4b3..def3819 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -122,7 +122,7 @@ class TestImage(OESelftestTestCase):
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
         features = 'INHERIT += "testimage"\n'
-        features += 'TEST_SUITES = "ping ssh selftest"\n'
+        features += 'TEST_SUITES = "ping ssh _selftest"\n'
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
1.9.1



Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 626FD78CD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 09:06:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5C96CNF016858
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 02:06:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 12 Jun 2018 02:06:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2018 17:08:56 +0800
Message-ID: <c5c4efe9e8916d3100c21126f1fe5974411c387a.1528772440.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528772440.git.Qi.Chen@windriver.com>
References: <cover.1528772440.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa/runtime/cases/selftest.py: rename to _selftest.py
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
X-List-Received-Date: Tue, 12 Jun 2018 09:06:15 -0000
Content-Type: text/plain

This test modules is designed to be invoked only by selftest. It's
not meant to be tested by normal runtime test. So it should be renamed
with '_' prefix, so that it will not be automatically loaded by normal
runtime tests when 'auto' is in TEST_SUITES.

The failure message is as below.

  RESULTS - selftest.Selftest.test_install_package - Testcase -1: FAILED

Change selftest/cases/runtime_test.py to use '_selftest' accordingly.
Rename selftest.json to _selftest.json accordingly.
Also, fix a typo in runtime_test.py.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../lib/oeqa/runtime/cases/{selftest.json => _selftest.json}          | 0
 meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py}    | 2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py                          | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-selftest/lib/oeqa/runtime/cases/{selftest.json => _selftest.json} (100%)
 rename meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py} (94%)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/selftest.json b/meta-selftest/lib/oeqa/runtime/cases/_selftest.json
similarity index 100%
rename from meta-selftest/lib/oeqa/runtime/cases/selftest.json
rename to meta-selftest/lib/oeqa/runtime/cases/_selftest.json
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
index 30fd9b2..3bd0ca6 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -122,10 +122,10 @@ class TestImage(OESelftestTestCase):
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
         features = 'INHERIT += "testimage"\n'
-        features += 'TEST_SUITES = "ping ssh selftest"\n'
+        features += 'TEST_SUITES = "ping ssh _selftest"\n'
         self.write_config(features)
 
-        # Build core-image-sato and testimage
+        # Build core-image-full-cmdline and testimage
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
-- 
1.9.1



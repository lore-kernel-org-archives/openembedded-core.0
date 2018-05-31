Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D61A774F04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 08:31:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4V8VcK0014770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 01:31:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 May 2018 01:31:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2018 16:32:53 +0800
Message-ID: <9aea022ceee459eaaf63a0af8a494eb6ea1dac82.1527755435.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1527755434.git.Qi.Chen@windriver.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Thu, 31 May 2018 08:31:38 -0000
Content-Type: text/plain

This test modules is designed to be invoked only by selftest. It's
not meant to be tested by normal runtime test. So it should be renamed
with '_' prefix, so that it will not be automatically loaded by normal
runtime tests when 'auto' is in TEST_SUITES.

The failure message is as below.

  RESULTS - selftest.Selftest.test_install_package - Testcase -1: FAILED

Also, change selftest/cases/runtime_test.py to use '_selftest' accordingly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py} | 0
 meta/lib/oeqa/selftest/cases/runtime_test.py                       | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py} (100%)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/selftest.py b/meta-selftest/lib/oeqa/runtime/cases/_selftest.py
similarity index 100%
rename from meta-selftest/lib/oeqa/runtime/cases/selftest.py
rename to meta-selftest/lib/oeqa/runtime/cases/_selftest.py
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



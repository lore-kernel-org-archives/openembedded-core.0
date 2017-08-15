Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 91F06784F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 11:35:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 04:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1205843502"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2017 04:35:05 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 14:34:55 +0300
Message-Id: <c5a0306927ac3cef9692c23c202f96322768675e.1502795847.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
References: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v4 6/8] oeqa: fix dnf tests
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
X-List-Received-Date: Tue, 15 Aug 2017 11:35:04 -0000

Rename one dnf runtime test that it will recognized as a python module
and thus also found by the oe test loader. Also, fix value of
TEST_SUITES in dnf selftest so that all test dependencies are satisfied
and the runtime test may be successfully run from there.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta-selftest/lib/oeqa/runtime/cases/{dnf-runtime.py => dnf_runtime.py} | 0
 meta/lib/oeqa/selftest/cases/runtime_test.py                            | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-selftest/lib/oeqa/runtime/cases/{dnf-runtime.py => dnf_runtime.py} (100%)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf-runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
similarity index 100%
rename from meta-selftest/lib/oeqa/runtime/cases/dnf-runtime.py
rename to meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 72f906deea..27cf584ea5 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -138,7 +138,7 @@ class TestImage(OESelftestTestCase):
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
         features = 'INHERIT += "testimage"\n'
-        features += 'TEST_SUITES = "ping ssh dnf-runtime"\n'
+        features += 'TEST_SUITES = "ping ssh dnf_runtime dnf.DnfBasicTest.test_dnf_help"\n'
         # We don't yet know what the server ip and port will be - they will be patched
         # in at the start of the on-image test
         features += 'PACKAGE_FEED_URIS = "http://bogus_ip:bogus_port"\n'
-- 
2.12.3



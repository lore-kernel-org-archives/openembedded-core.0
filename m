Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 905417750A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:24:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2017 09:24:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,264,1486454400"; d="scan'208";a="1106280682"
Received: from jyotigan-mobl.ger.corp.intel.com (HELO
	jlock-mobl1.ger.corp.intel.com) ([10.252.22.226])
	by orsmga001.jf.intel.com with ESMTP; 08 Mar 2017 09:24:23 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 17:24:17 +0000
Message-Id: <20170308172417.15776-4-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170308172417.15776-1-joshua.g.lock@intel.com>
References: <20170308172417.15776-1-joshua.g.lock@intel.com>
Subject: [PATCH 4/4] lib/oeqa/selftest/bbtests: update test_non_gplv3 to use selftest-ed
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
X-List-Received-Date: Wed, 08 Mar 2017 17:24:22 -0000

GPLv2 recipes have been moved to a new layer (meta-gplv2), instead of
readline perform this test on the selftest-ed recipe in meta-selftest
which has gplv2 and gplv3 variants.

Tested with oe-selftest -r bbtests.BitbakeTests.test_non_gplv3

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 4d9eec1..c2b79c6 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -231,11 +231,11 @@ INHERIT_remove = \"report-error\"
     @testcase(1119)
     def test_non_gplv3(self):
         self.write_config('INCOMPATIBLE_LICENSE = "GPLv3"')
-        result = bitbake('readline', ignore_status=True)
+        result = bitbake('selftest-ed', ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
         lic_dir = get_bb_var('LICENSE_DIRECTORY')
-        self.assertFalse(os.path.isfile(os.path.join(lic_dir, 'readline/generic_GPLv3')))
-        self.assertTrue(os.path.isfile(os.path.join(lic_dir, 'readline/generic_GPLv2')))
+        self.assertFalse(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPLv3')))
+        self.assertTrue(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPLv2')))
 
     @testcase(1422)
     def test_setscene_only(self):
-- 
2.9.3



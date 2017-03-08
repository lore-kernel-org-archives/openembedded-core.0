Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9117F771E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:24:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2017 09:24:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,264,1486454400"; d="scan'208";a="1106280676"
Received: from jyotigan-mobl.ger.corp.intel.com (HELO
	jlock-mobl1.ger.corp.intel.com) ([10.252.22.226])
	by orsmga001.jf.intel.com with ESMTP; 08 Mar 2017 09:24:22 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 17:24:16 +0000
Message-Id: <20170308172417.15776-3-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170308172417.15776-1-joshua.g.lock@intel.com>
References: <20170308172417.15776-1-joshua.g.lock@intel.com>
Subject: [PATCH 3/4] lib/oeqa/selftest/oescripts: make test_cleanup_workdir use selftest-ed
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
X-List-Received-Date: Wed, 08 Mar 2017 17:24:21 -0000

Use a recipe which is bundled in the meta-selftest layer for this test,
rather than relying on OE-Core remaining static (or updating the tests
when OE-Core changes recipes).

Tested with oe-selftest -r oescripts.TestScripts.test_cleanup_workdir

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/selftest/oescripts.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/oescripts.py b/meta/lib/oeqa/selftest/oescripts.py
index 28345dc..baf3b6a 100644
--- a/meta/lib/oeqa/selftest/oescripts.py
+++ b/meta/lib/oeqa/selftest/oescripts.py
@@ -14,10 +14,10 @@ class TestScripts(oeSelfTest):
 
     @testcase(300)
     def test_cleanup_workdir(self):
-        path = os.path.dirname(get_bb_var('WORKDIR', 'gzip'))
-        old_version_recipe = os.path.join(get_bb_var('COREBASE'), 'meta/recipes-extended/gzip/gzip_1.3.12.bb')
-        old_version = '1.3.12'
-        bitbake("-c clean gzip")
+        path = os.path.dirname(get_bb_var('WORKDIR', 'selftest-ed'))
+        old_version_recipe = os.path.join(get_bb_var('COREBASE'), 'meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb')
+        old_version = '0.5'
+        bitbake("-c clean selftest-ed")
         bitbake("-c clean -b %s" % old_version_recipe)
 
         if os.path.exists(path):
@@ -25,7 +25,7 @@ class TestScripts(oeSelfTest):
         else:
             initial_contents = []
 
-        bitbake('gzip')
+        bitbake('selftest-ed')
         intermediary_contents = os.listdir(path)
         bitbake("-b %s" % old_version_recipe)
         runCmd('cleanup-workdir')
-- 
2.9.3



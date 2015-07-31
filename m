Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE3777638A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 09:31:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2015 02:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,583,1432623600"; d="scan'208";a="759091797"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.23.101])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2015 02:31:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 10:31:35 +0100
Message-Id: <b2f6c6c33b33d0e5a9d478bc15c87b8c723ae337.1438335038.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438335038.git.paul.eggleton@linux.intel.com>
References: <cover.1438335038.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438335038.git.paul.eggleton@linux.intel.com>
References: <cover.1438335038.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] oe-selftest: devtool: fix teardown warning in test_devtool_update_recipe_append
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
X-List-Received-Date: Fri, 31 Jul 2015 09:31:38 -0000

We don't need to run bitbake -c cleansstate on this because it's being
cleaned out as part of "devtool reset".

Addresses [YOCTO #8031].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index c833e54..b59db15 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -170,7 +170,6 @@ class DevtoolTests(DevtoolBase):
         bitbake('libftdi -c cleansstate')
         # Test devtool build
         result = runCmd('devtool build libftdi')
-        self.add_command_to_tearDown('bitbake -c cleansstate libftdi')
         staging_libdir = get_bb_var('STAGING_LIBDIR', 'libftdi')
         self.assertTrue(staging_libdir, 'Could not query STAGING_LIBDIR variable')
         self.assertTrue(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), "libftdi binary not found in STAGING_LIBDIR. Output of devtool build libftdi %s" % result.output)
-- 
2.1.0



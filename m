Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 09BAB71ABD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 21:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491254445; x=1522790445;
	h=from:to:cc:subject:date:message-id;
	bh=NY76YBik4dGj75R3l/3tZMWoS8GAzpEWTeqyJCn3ALo=;
	b=DPDAEpMKHI9ju9Z3w5jGqQYha25as/ZseY091Qe0GvvD8dNiH0sEnooo
	LQTLdw8QxoUtCvOGgOAtmZwPtXInGQ==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2017 14:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,272,1486454400"; d="scan'208";a="951315435"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga003.jf.intel.com with ESMTP; 03 Apr 2017 14:20:44 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 21:20:08 -0700
Message-Id: <20170404042008.23356-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] selftest/devtool: skip test in case of poky-tiny distro
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
X-List-Received-Date: Mon, 03 Apr 2017 21:20:44 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The recipe being tested (devtoo-test-patch-gz) by devtool has dependencies (at
least libxres and virtual/libx11) that cannot be built with poky-tiny distro so
skip the test for this particular policy.

[YOCTO #10891]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 7f9efe6..7e65e52 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1035,6 +1035,8 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_update_recipe_local_patch_gz(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-patch-gz'
+        if get_bb_var('DISTRO') == 'poky-tiny':
+            self.skipTest("The DISTRO 'poky-tiny' does not provide the dependencies needed by %s" % testrecipe)
         bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
-- 
2.10.2



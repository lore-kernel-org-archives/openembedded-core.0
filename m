Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 663DD77CE3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 16:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491496928; x=1523032928;
	h=from:to:cc:subject:date:message-id;
	bh=4tZYiNPgSy87Oul0cCj/Vzga8xxxA2n9Ck66bz4X6yI=;
	b=KdPxSPFQGLfkRFbUvVYZnkgccVFx/WP3Py4OaPKn4fr5QkMIuBAYduG9
	8oKNdGCIDx46W5+wsijstP0rJ3ylgw==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 09:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,160,1488873600"; d="scan'208";a="245289452"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 06 Apr 2017 09:41:51 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 09:41:51 -0700
Message-Id: <20170406164151.40269-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] selftest/recipetool: skip create_git in case x11 feature is not present
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
X-List-Received-Date: Thu, 06 Apr 2017 16:42:06 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The unit test requires x11 as distro feature, otherwise it will fail
while building the test requirements.

[YOCTO #10903]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index d47b9dd..7bfb02f 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -382,6 +382,8 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1194)
     def test_recipetool_create_git(self):
+        if 'x11' not in get_bb_var('DISTRO_FEATURES'):
+            self.skipTest('Test requires x11 as distro feature')
         # Ensure we have the right data in shlibs/pkgdata
         bitbake('libpng pango libx11 libxext jpeg libcheck')
         # Try adding a recipe
-- 
2.10.2



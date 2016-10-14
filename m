Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 945D971ACA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:36:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2016 09:36:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,493,1473145200"; d="scan'208";a="19705478"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.48])
	by orsmga005.jf.intel.com with ESMTP; 14 Oct 2016 09:36:31 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 11:40:27 -0500
Message-Id: <88ed2fc1a30df53f6c94192966c00c5c41de3869.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/9] selftest: skip two bbtest tests depending on distro
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
X-List-Received-Date: Fri, 14 Oct 2016 16:36:30 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There are two bbtests that just makes sense on certain distros:
test_bitbake_g cannot be done on poky-tiny and test_non_gplv3
just makes sense on poky and poky-tiny. Skip these when
necessary under the latter conditions.

[YOCTO #8525]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index baae1e0..9b11cd9 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -114,6 +114,9 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(167)
     def test_bitbake_g(self):
+        if self.distro == 'poky-tiny':
+            self.skipTest('core-image-full-cmdline is not buildable with poky-tiny')
+
         result = bitbake('-g core-image-full-cmdline')
         for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
             self.addCleanup(os.remove, f)
@@ -229,6 +232,10 @@ INHERIT_remove = \"report-error\"
 
     @testcase(1119)
     def test_non_gplv3(self):
+        supported_distros = ['poky', 'poky-tiny']
+        if not self.distro in supported_distros:
+            self.skipTest('Test considers only %s distros' % ','.join(supported_distros))
+
         data = 'INCOMPATIBLE_LICENSE = "GPLv3"'
         conf = os.path.join(self.builddir, 'conf/local.conf')
         ftools.append_file(conf ,data)
-- 
2.1.4



Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 76B3E772BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 22:43:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 31 Jan 2017 14:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,316,1477983600"; d="scan'208";a="1101358188"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2017 14:43:47 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 16:50:51 -0600
Message-Id: <dd2babbc347035c9db064fd45d0d608a8d042091.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 3/4] selftest/bbtests: use write_config instead of local.conf file
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
X-List-Received-Date: Tue, 31 Jan 2017 22:43:47 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Extra configuration data should be write using the write_config
method instead of manually appending to the local.conf file

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index c4e50cb..9dbac95 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -229,10 +229,7 @@ INHERIT_remove = \"report-error\"
 
     @testcase(1119)
     def test_non_gplv3(self):
-        data = 'INCOMPATIBLE_LICENSE = "GPLv3"'
-        conf = os.path.join(self.builddir, 'conf/local.conf')
-        ftools.append_file(conf ,data)
-        self.addCleanup(ftools.remove_from_file, conf ,data)
+        self.write_config('INCOMPATIBLE_LICENSE = "GPLv3"')
         result = bitbake('readline', ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
         lic_dir = get_bb_var('LICENSE_DIRECTORY')
-- 
2.1.4



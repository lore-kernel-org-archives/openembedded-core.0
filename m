Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A005571DDA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 20:41:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2017 12:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,326,1477983600"; d="scan'208";a="38952060"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2017 12:41:17 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 14:48:27 -0600
Message-Id: <1486068507-3533-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] selftest/buildoptions: force compile task instead of cleaning sstates
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
X-List-Received-Date: Thu, 02 Feb 2017 20:41:18 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There is no need to clean m4 sstates, use force instead.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index d40eb00..a6cdc2d 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -36,8 +36,8 @@ class ImageOptionsTests(oeSelfTest):
         p = get_bb_var('SYSROOT_DESTDIR', 'ccache-native') + get_bb_var('bindir', 'ccache-native') + "/" + "ccache"
         self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
-        bitbake("m4 -c cleansstate")
-        bitbake("m4 -c compile")
+        bitbake("m4 -c compile -f")
+        bitbake("m4 -c clean")
         self.addCleanup(bitbake, 'ccache-native -ccleansstate')
         res = runCmd("grep ccache %s" % (os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile")), ignore_status=True)
         self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile"))
-- 
2.1.4



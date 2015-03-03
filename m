Return-Path: <george.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC5E6017E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 10:32:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2015 02:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,681,1418112000"; d="scan'208";a="693188718"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 03 Mar 2015 02:32:04 -0800
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 7B1486A408D;
	Tue,  3 Mar 2015 02:31:49 -0800 (PST)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2015 12:31:12 +0200
Message-Id: <1425378672-9385-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest: Added a testcase to verify INCOMPATIBLE_LICENSE option.
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
X-List-Received-Date: Tue, 03 Mar 2015 10:32:17 -0000

Fixes bug 6933

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 5708d3d..aeccbf5 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -177,3 +177,14 @@ class BitbakeTests(oeSelfTest):
 	manver = re.search("NOTE: recipe xcursor-transparent-theme-(.*?): task do_unpack: Started", result.output)
 	continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
 	self.assertLess(errorpos,continuepos)
+
+    @testcase(1119)
+    def test_non_gplv3(self):
+        data = 'INCOMPATIBLE_LICENSE = "GPLv3"'
+        conf = os.path.join(self.builddir, 'conf/local.conf')
+        ftools.append_file(conf ,data)
+        result = bitbake('readline', ignore_status=True)
+        self.assertEqual(result.status, 0)
+        self.assertFalse(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv3')))
+        self.assertTrue(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv2')))
+        ftools.remove_from_file(conf ,data)
\ No newline at end of file
-- 
2.1.0



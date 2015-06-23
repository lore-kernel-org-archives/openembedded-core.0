Return-Path: <junhuix.zhang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9773260132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 07:49:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2015 00:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,664,1427785200"; d="scan'208";a="593051090"
Received: from dddd.sh.intel.com ([10.239.52.71])
	by orsmga003.jf.intel.com with ESMTP; 23 Jun 2015 00:49:54 -0700
From: zjh <junhuix.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 15:54:26 +0800
Message-Id: <1435046066-2894-1-git-send-email-junhuix.zhang@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] testimage: Support full TC path such oeqa.runtime.pnp.get_memory_size in TEST_SUITES
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
X-List-Received-Date: Tue, 23 Jun 2015 07:49:59 -0000

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7834

If a TC name start with "oeqa", it is thought as a full TC path. if not,
follow original logic (assume under oeqa.runtime), and this case will be    7 load by loadTests.
for example:
TEST_SUITES = "oeqa.runtime.pnp.get_memory_size oeqa.runtime.sanity.reboot"
this will run these two case when bitbake -c testimage

Signed-off-by: zjh <junhuix.zhang@intel.com>
---
 meta/classes/testimage.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 4074ff7..5d74fe4 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -77,6 +77,9 @@ def get_tests_list(d, type="runtime"):
     testslist = []
     for testname in testsuites:
         if testname != "auto":
+            if testname.startswith("oeqa."):
+                testslist.append(testname)
+                continue
             found = False
             for p in bbpath:
                 if os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname + '.py')):
-- 
1.9.1



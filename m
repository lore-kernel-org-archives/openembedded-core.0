Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 258AD65E6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 10:54:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2014 03:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,833,1389772800"; d="scan'208";a="518410971"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2014 03:53:53 -0700
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id AD3A36A4007;
	Thu, 10 Apr 2014 03:53:35 -0700 (PDT)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2014 13:59:00 +0300
Message-Id: <1397127540-9152-1-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] selftest: DiskMonTest: use POSIX output for df
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
X-List-Received-Date: Thu, 10 Apr 2014 10:54:27 -0000

Without "-P" df  splits the output on multiple lines and breaks the test

Signed-off-by: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 93b02cf..8ff40ba 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -51,7 +51,7 @@ class ImageOptionsTests(oeSelfTest):
 class DiskMonTest(oeSelfTest):
 
     def test_stoptask_behavior(self):
-        result = runCmd("df -k %s" % os.getcwd())
+        result = runCmd("df -Pk %s" % os.getcwd())
         size = result.output.split("\n")[1].split()[3]
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},%sK,4510K"' % size)
         res = bitbake("m4", ignore_status = True)
-- 
1.8.3.1



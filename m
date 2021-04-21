Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8497.1618985195073168650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 23:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: F8oXX2n1ZogdQYOxzHmzaKYA8+/s57tob2hUd63P70LsnpYyP+Zmu+V994sPPzZ6p3bW5vkCVd
 /q6GmJdyi0FA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195671502"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="195671502"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:36 -0700
IronPort-SDR: LLQSc/iMbBtN1Xl8Ch/+sTTEHXSUiJaILQNU6SE2m7QhGmCm7A2Nzj3WPk6UYvNDLSglCz/IXM
 So/To/SIVtag==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="385684419"
Received: from slow4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.252])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:35 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 3/8] oeqa/selftest: Hardcode test assumptions about heartbeat event timings
Date: Wed, 21 Apr 2021 14:06:15 +0800
Message-Id: <166ec4cfa34b33fd810e04ae7d21554910bfa28f.1618984878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618984878.git.anuj.mittal@intel.com>
References: <cover.1618984878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Setting a value of 10 for heartbeat events causes the test to fail. Hardcode
a value to ensure it works correctly even if the default is changed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 08b2c9a23ce43ed65a16f5f0714b19a571e1b54a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index e91f0bd18f..b1b9ea7e55 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -57,15 +57,15 @@ class ImageOptionsTests(OESelftestTestCase):
 class DiskMonTest(OESelftestTestCase):
 
     def test_stoptask_behavior(self):
-        self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
+        self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
-        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"')
+        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
-        self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"')
+        self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay")
         self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
-- 
2.30.2


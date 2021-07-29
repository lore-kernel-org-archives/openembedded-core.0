Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.3550.1627521701722762411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 18:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="199999054"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="199999054"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 18:21:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="517870711"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2021 18:21:35 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][Patch 2/7] oeqa/runtime : add test for RTC(Real Time Clock)
Date: Thu, 29 Jul 2021 09:21:18 +0800
Message-Id: <20210729012123.27489-2-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729012123.27489-1-jay.shen.teoh@intel.com>
References: <20210729012123.27489-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test is checking the functionality of the RTC(Real Time Clock). The Check_if_RTC_(Real_Time_Clock)_can_work_correctly manual test case from oeqa/manual/bsp-hw can be replace by this runtime test.

(From OE-Core rev: c6961c2fc04edbc5bc3827c7703997085d9c609e)

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/rtc.py | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/rtc.py

diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
new file mode 100644
index 0000000000..a34c101a9d
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -0,0 +1,38 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+import re
+
+class RTCTest(OERuntimeTestCase):
+
+    def setUp(self):
+        if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
+            self.logger.debug('Stopping systemd-timesyncd daemon')
+            self.target.run('systemctl disable --now systemd-timesyncd')
+
+    def tearDown(self):
+        if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
+            self.logger.debug('Starting systemd-timesyncd daemon')
+            self.target.run('systemctl enable --now systemd-timesyncd')
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['coreutils', 'busybox'])
+    def test_rtc(self):
+        (status, output) = self.target.run('hwclock -r')
+        self.assertEqual(status, 0, msg='Failed to get RTC time, output: %s' % output)
+        
+        (status, current_datetime) = self.target.run('date +"%m%d%H%M%Y"')
+        self.assertEqual(status, 0, msg='Failed to get system current date & time, output: %s' % current_datetime)
+
+        example_datetime = '062309452008'
+        (status, output) = self.target.run('date %s ; hwclock -w ; hwclock -r' % example_datetime)
+        check_hwclock = re.search('2008-06-23 09:45:..', output)
+        self.assertTrue(check_hwclock, msg='The RTC time was not set correctly, output: %s' % output)
+
+        (status, output) = self.target.run('date %s' % current_datetime)
+        self.assertEqual(status, 0, msg='Failed to reset system date & time, output: %s' % output)
+        
+        (status, output) = self.target.run('hwclock -w')
+        self.assertEqual(status, 0, msg='Failed to reset RTC time, output: %s' % output)
+        
-- 
2.32.0


Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.3705.1600993552164753717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 17:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: RqUt9jJcvYFWjwkJ41bn/55wxyA6LvgCAzjOO7MEEYD2sZJydIlyVcW/Sna9MA6iOKnRXRAvf3
 6/wDCHan6qIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="158732809"
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; 
   d="scan'208";a="158732809"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2020 17:25:51 -0700
IronPort-SDR: b/pHdiN4Fa7G0FAzEb54BF6jb3eYOjgE/Pi9NhL48unw6s3j04V17nAN+MdOAF3X5DZFVy/Xx0
 hZwXvRWGoSFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; 
   d="scan'208";a="292400327"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 24 Sep 2020 17:25:50 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime : add test for RTC(Real Time Clock)
Date: Fri, 25 Sep 2020 08:25:42 +0800
Message-Id: <1600993542-59734-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test is checking the functionality of the RTC(Real Time Clock). The Check_if_RTC_(Real_Time_Clock)_can_work_correctly manual test case from oeqa/manual/bsp-hw can be replace by this runtime test.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/rtc.py | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/rtc.py

diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
new file mode 100644
index 0000000..a34c101
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
2.7.4


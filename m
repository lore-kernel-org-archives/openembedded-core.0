Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.27430.1610328069832532064
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 17:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: /tbAS5Yj1NtK+n6VUQh7wDaRdOgu27CXMHYasFqNQOu1xi/6U/zcfSq9JD+eHIzrGzxW8J1l7D
 d9Bu+ejsZoOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="177011148"
X-IronPort-AV: E=Sophos;i="5.79,337,1602572400"; 
   d="scan'208";a="177011148"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2021 17:21:07 -0800
IronPort-SDR: yvDJ02qvdDmrnbuXGYEOigd/KM7iJdQUxaOhf4H38F7Jr9rSryNBPZy6Ds0KT0VKROrXuTBb9n
 QmvL85pVpm2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,337,1602572400"; 
   d="scan'208";a="344754593"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jan 2021 17:21:06 -0800
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/cpu_utilization_test : add test for cpu utilization after standby state
Date: Mon, 11 Jan 2021 09:21:03 +0800
Message-Id: <1610328063-33463-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test is checking the cpu utilization before and after standby state. The check_CPU_utilization_after_standby manual test case from oeqa/manual/bsp-hw can be replace by this runtime test.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 .../lib/oeqa/runtime/cases/cpu_utilization_test.py | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/cpu_utilization_test.py

diff --git a/meta/lib/oeqa/runtime/cases/cpu_utilization_test.py b/meta/lib/oeqa/runtime/cases/cpu_utilization_test.py
new file mode 100644
index 0000000..a44b4ec
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/cpu_utilization_test.py
@@ -0,0 +1,23 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfQemu
+
+
+class CPU_utilization_test(OERuntimeTestCase):
+      
+    def set_standby(self): 
+        (status, output) = self.target.run('rtcwake -m mem -s 10')
+        self.assertEqual(status, 0,  msg = 'Failed to set your system into standby mode, output : %s' % output)
+    
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_CPU_utilization_after_standby(self):
+        (status, cpu_usage_before_standby) = self.target.run("export TERM=xterm && top -b -n2 | grep 'Cpu(s)' | tail -n 1 | awk '{print $2 + $6}'")
+        self.assertEqual(status, 0,  msg = 'Failed to run the top command, output : %s' % cpu_usage_before_standby)
+        self.set_standby()
+        (status, cpu_usage_after_standby) = self.target.run("export TERM=xterm && top -b -n2 | grep 'Cpu(s)' | tail -n 1 | awk '{print $2 + $6}'")
+        self.assertEqual(status, 0,  msg = 'Failed to run the top command, output : %s' % cpu_usage_after_standby)
+        cpu_usage_before_standby = int(float(cpu_usage_before_standby))
+        cpu_usage_after_standby = int(float(cpu_usage_after_standby))
+        cpu_usage_comparison = ((cpu_usage_before_standby - 5) <= cpu_usage_after_standby <= (cpu_usage_before_standby + 5))
+        self.assertTrue(cpu_usage_comparison, msg='There should be no big difference in the cpu utilization before/after standby, cpu usage before standby : % s, cpu usage after standby : % s' % (cpu_usage_before_standby , cpu_usage_after_standby))
-- 
2.7.4


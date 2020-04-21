Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.414.1587430214285275147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 17:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: 0CivLZcK1wv0ft8o6wd6pv5YTzQrv9ibHEJ2C9IiC2jCYQRDtmFBSz9m+OOdjqK3SqP1hMXRUA
 tqqGAnxl4uxw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 17:50:14 -0700
IronPort-SDR: fZpHbB89ZoHNb5k2JpQBRPcBIShg0N8JuXiT86tRTVckl/xlvGXQr5MMojWmNrZAVX+8wVd2/H
 kqPOXjnemZnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,408,1580803200"; 
   d="scan'208";a="279437866"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 20 Apr 2020 17:50:13 -0700
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH v03] oeqa/runtime/weston: Enhance weston tests
Date: Tue, 21 Apr 2020 08:50:09 +0800
Message-Id: <1587430209-55521-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587430209-55521-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1587430209-55521-1-git-send-email-ee.peng.yeoh@intel.com>

Existing weston test available make sure that a process
for weston-desktop-shell exist when image boot up.

Enhance weston tests by:
 - execute weston-info to make sure weston interface(s)
   are initialized
 - execute weston and make sure it can initialize a
   new wayland compositor (retry checking for
   wayland processes up to 5 times)
 - enable weston logging for debugging when fail
   to initialize wayland compositor

[YOCTO# 10690]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/weston.py | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index f32599a..ac29eca 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -6,8 +6,15 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
+import threading
+import time
 
 class WestonTest(OERuntimeTestCase):
+    weston_log_file = '/tmp/weston.log'
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.tc.target.run('rm %s' % cls.weston_log_file)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['weston'])
@@ -17,3 +24,46 @@ class WestonTest(OERuntimeTestCase):
         msg = ('Weston does not appear to be running %s' %
               self.target.run(self.tc.target_cmds['ps'])[1])
         self.assertEqual(status, 0, msg=msg)
+
+    def get_processes_of(self, target, error_msg):
+        status, output = self.target.run('pidof %s' % target)
+        self.assertEqual(status, 0, msg='Retrieve %s (%s) processes error: %s' % (target, error_msg, output))
+        return output.split(" ")
+
+    def get_weston_command(self, cmd):
+        return 'export XDG_RUNTIME_DIR=/run/user/0; export WAYLAND_DISPLAY=wayland-0; %s' % cmd
+
+    def run_weston_init(self):
+        self.target.run(self.get_weston_command('weston --log=%s' % self.weston_log_file))
+
+    def get_new_wayland_processes(self, existing_wl_processes):
+        try_cnt = 0
+        while try_cnt < 5:
+            time.sleep(5 + 5*try_cnt)
+            try_cnt += 1
+            wl_processes = self.get_processes_of('weston-desktop-shell', 'existing and new')
+            new_wl_processes = [x for x in wl_processes if x not in existing_wl_processes]
+            if new_wl_processes:
+                return new_wl_processes, try_cnt
+
+        return new_wl_processes, try_cnt
+
+    @OEHasPackage(['weston'])
+    def test_weston_info(self):
+        status, output = self.target.run(self.get_weston_command('weston-info'))
+        self.assertEqual(status, 0, msg='weston-info error: %s' % output)
+
+    @OEHasPackage(['weston'])
+    def test_weston_can_initialize_new_wayland_compositor(self):
+        existing_wl_processes = self.get_processes_of('weston-desktop-shell', 'existing')
+        existing_weston_processes = self.get_processes_of('weston', 'existing')
+
+        weston_thread = threading.Thread(target=self.run_weston_init)
+        weston_thread.start()
+        new_wl_processes, try_cnt = self.get_new_wayland_processes(existing_wl_processes)
+        existing_and_new_weston_processes = self.get_processes_of('weston', 'existing and new')
+        new_weston_processes = [x for x in existing_and_new_weston_processes if x not in existing_weston_processes]
+        for w in new_weston_processes:
+            self.target.run('kill -9 %s' % w)
+        __, weston_log = self.target.run('cat %s' % self.weston_log_file)
+        self.assertTrue(new_wl_processes, msg='Could not get new weston-desktop-shell processes (%s, try_cnt:%s) weston log: %s' % (new_wl_processes, try_cnt, weston_log))
-- 
2.7.4


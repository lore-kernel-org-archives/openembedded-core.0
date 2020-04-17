Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.2534.1587088221953962938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2020 18:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: F7NvbM54qt/bmZNsVZw2ZpU+5xJnSoQZDQjdeB85SLfbb6a7l7vnA0aLokwE+NIEy28vRabqwO
 Z6N1ewZi77hA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 18:50:21 -0700
IronPort-SDR: u6FTVPSvz8uvpu/wW2Y4xt+aL5EmOfqHl/4qly2hqcCxQf2jbeUQZvuTv4gW5BOMimw8EzWwo0
 Gj4I4MaPht/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,393,1580803200"; 
   d="scan'208";a="289107274"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2020 18:50:20 -0700
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH v02] oeqa/runtime/weston: Enhance weston tests
Date: Fri, 17 Apr 2020 09:50:18 +0800
Message-Id: <1587088218-41298-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4

Existing weston test available make sure that a process
for weston-desktop-shell exist when image boot up.

Enhance weston tests by:
 - execute weston-info to make sure weston interface(s)
   are initialized
 - execute weston and make sure it can initialize a
   new wayland compositor (retry checking for
   wayland processes up to 5 times)

[YOCTO# 10690]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/weston.py | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index f32599a..5c01765 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -6,6 +6,8 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
+import threading
+import time
 
 class WestonTest(OERuntimeTestCase):
 
@@ -17,3 +19,41 @@ class WestonTest(OERuntimeTestCase):
         msg = ('Weston does not appear to be running %s' %
               self.target.run(self.tc.target_cmds['ps'])[1])
         self.assertEqual(status, 0, msg=msg)
+
+    def get_weston_command(self, cmd):
+        return 'export XDG_RUNTIME_DIR=/run/user/0; export DISPLAY=:0; %s' % cmd
+
+    def run_weston_init(self):
+        self.target.run(self.get_weston_command('weston'))
+
+    def get_new_wayland_process(self, existing_wl_processes):
+        try_cnt = 0
+        while try_cnt < 5:
+            time.sleep(5 + 5*try_cnt)
+            try_cnt += 1
+            status, output = self.target.run('pidof weston-desktop-shell')
+            self.assertEqual(status, 0, msg='Retrieve existing and new weston-desktop-shell processes error: %s' % output)
+            wl_processes = output.split(" ")
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
+        status, output = self.target.run('pidof weston-desktop-shell')
+        self.assertEqual(status, 0, msg='Retrieve existing weston-desktop-shell processes error: %s' % output)
+        existing_wl_processes = output.split(" ")
+
+        weston_thread = threading.Thread(target=self.run_weston_init)
+        weston_thread.start()
+        new_wl_processes, try_cnt = self.get_new_wayland_process(existing_wl_processes)
+        self.assertTrue(new_wl_processes, msg='Check new weston-desktop-shell processes error: %s (try_cnt:%s)' % (new_wl_processes, try_cnt))
+        for wl in new_wl_processes:
+            self.target.run('kill -9 %s' % wl)
-- 
2.7.4


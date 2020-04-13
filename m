Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.11613.1586767757386698994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 01:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: ZP2e57j91k2j2YfIs6hwgiLFV79RrsHAvTrxnU4PJzIY2txTGFOGiRQM+ZtmFC82b3I6n8TqHN
 lhHqoS7PyhYg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 01:49:17 -0700
IronPort-SDR: gJfh7rAAkfHQl5YMcWysjuUBQBgoJpibwHCW3uh2p+Mumq6XltCY+GjDJ+dXQmXznifU5YWAC/
 2YHVkWmtOJWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="243486076"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2020 01:49:16 -0700
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH] oeqa/runtime/weston: Enhance weston tests
Date: Mon, 13 Apr 2020 16:49:13 +0800
Message-Id: <1586767753-29252-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4

Existing weston test available make sure that a process
for weston-desktop-shell exist when image boot up.

Enhance weston tests by:
 - execute weston-info to make sure weston interface(s)
   are initialized
 - execute weston and make sure it can initialize a
   new wayland compositor

[YOCTO# 10690]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/weston.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index f32599a..f79ed64 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -6,6 +6,8 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
+import threading
+import time
 
 class WestonTest(OERuntimeTestCase):
 
@@ -17,3 +19,31 @@ class WestonTest(OERuntimeTestCase):
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
+        time.sleep(5)
+        status, output = self.target.run('pidof weston-desktop-shell')
+        self.assertEqual(status, 0, msg='Retrieve existing and new weston-desktop-shell processes error: %s' % output)
+        wl_processes = output.split(" ")
+        new_wl_processes = [x for x in wl_processes if x not in existing_wl_processes]
+        self.assertTrue(new_wl_processes, msg='Check new weston-desktop-shell processes error: %s' % new_wl_processes)
+        for wl in new_wl_processes:
+            self.target.run('kill -9 %s' % wl)
-- 
2.7.4


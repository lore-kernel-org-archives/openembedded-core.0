Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.5602.1614671727848041525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 23:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: rjxi6+S/LKUa90cErMwyJ1BqtibJcY4+DRE+Xyr1kP1cK0yY6K5vpg2UVwFCfjhrAgOyb1AXS0
 RiViZbLu9P7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184288556"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="184288556"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 23:55:27 -0800
IronPort-SDR: 4IzaQVZUhhwb/OXe7i/owrztuj1xc4yWwTAUObdaovpVJoADb6P/B3lt9HhDZXP3+hICguJGQd
 jtnD03IiXOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="398210142"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2021 23:55:26 -0800
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: sangeeta jain <sangeeta.jain@intel.com>
Subject: [OE-core] [PATCH 1/2] lib/oeqa/selftest/cases/reproducible.py : updated test to faketime in future when buiding the second test build.
Date: Tue,  2 Mar 2021 15:55:21 +0800
Message-Id: <1614671722-23680-1-git-send-email-sangeeta.jain@intel.com>
X-Mailer: git-send-email 2.7.4

From: sangeeta jain <sangeeta.jain@intel.com>

This update will ensure that recipes are not including time stamps by creating an
image with modified system time. It uses libfaketime recipe to fake system
time to advance by 34308122 seconds.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index f2d9f95..1592c96 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -163,6 +163,7 @@ class ReproducibleTests(OESelftestTestCase):
     # will test that and also make the test run faster. If your sstate is not
     # reproducible, disable this in your derived test class
     build_from_sstate = True
+    use_faketime = False
 
     def setUpLocal(self):
         super().setUpLocal()
@@ -210,7 +211,7 @@ class ReproducibleTests(OESelftestTestCase):
         bb.utils.mkdirhier(os.path.dirname(dest))
         shutil.copyfile(source, dest)
 
-    def do_test_build(self, name, use_sstate):
+    def do_test_build(self, name, use_sstate, use_faketime):
         capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
 
         tmpdir = os.path.join(self.topdir, name, 'tmp')
@@ -239,6 +240,18 @@ class ReproducibleTests(OESelftestTestCase):
                 SSTATE_MIRRORS = ""
                 ''')
 
+        if use_faketime:
+            # This config fragment will enable to fake system time
+            # advance by 34308122 sec
+            bitbake("libfaketime")
+            find_binary = "find . -path '*/image/*/libfaketime.so.1"
+            full_path_to_binary = runCmd(find_binary)
+            binary_path = full_path_to_binary.split("./")
+            ld_preload_path = os.path.join(os.environ.get('BUILDDIR'), binary_path[1])
+            seconds_add_to_system_time = "+34308122"
+            cmd = 'LD_PRELOAD=%s FAKETIME=%s' %(ld_preload_path, seconds_add_to_system_time)
+            runCmd(cmd)
+
         self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
         self.write_config(config)
         d = get_bb_vars(capture_vars)
@@ -265,9 +278,9 @@ class ReproducibleTests(OESelftestTestCase):
             os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
             self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
 
-        vars_A = self.do_test_build('reproducibleA', self.build_from_sstate)
+        vars_A = self.do_test_build('reproducibleA', self.build_from_sstate, self.use_faketime))
 
-        vars_B = self.do_test_build('reproducibleB', False)
+        vars_B = self.do_test_build('reproducibleB', False, True)
 
         # NOTE: The temp directories from the reproducible build are purposely
         # kept after the build so it can be diffed for debugging.
-- 
2.7.4


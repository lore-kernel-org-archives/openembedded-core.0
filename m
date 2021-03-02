Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.5838.1614672493735126718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 00:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: KwWieXscGAMhSSn2n/dRzr8CBDivDMCKIV5g+iPGUUrQW0Iz2tpoHgPUdP7p4Rfd0BLnNq83dH
 9bI1i7jxALYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186055157"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="186055157"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2021 00:08:12 -0800
IronPort-SDR: ULWmtJnADQRyAD823WeMYWHsRdayBXsANBR0yAgGTwCCbJ1oSCxW5qwnxwz6bDKuhblCGEoupz
 KiiaHCRTNhUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="373505261"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga007.fm.intel.com with ESMTP; 02 Mar 2021 00:08:11 -0800
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: sangeeta jain <sangeeta.jain@intel.com>
Subject: [OE-core] [PATCH v2 1/2] lib/oeqa/selftest/cases/reproducible.py : updated test to faketime in future when buiding the second test build.
Date: Tue,  2 Mar 2021 16:08:07 +0800
Message-Id: <1614672488-32161-1-git-send-email-sangeeta.jain@intel.com>
X-Mailer: git-send-email 2.7.4

From: sangeeta jain <sangeeta.jain@intel.com>

This update will ensure that recipes are not including time stamps by creating an
image with modified system time. It uses libfaketime recipe to fake system
time to advance by 34308122 seconds

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index f2d9f95..c7e1fdf 100644
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
+        vars_A = self.do_test_build('reproducibleA', self.build_from_sstate, self.use_faketime)
 
-        vars_B = self.do_test_build('reproducibleB', False)
+        vars_B = self.do_test_build('reproducibleB', False, True)
 
         # NOTE: The temp directories from the reproducible build are purposely
         # kept after the build so it can be diffed for debugging.
-- 
2.7.4


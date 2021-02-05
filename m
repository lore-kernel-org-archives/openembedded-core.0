Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.8328.1612533566225247300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 05:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: a56mpyKA3c5BC8o2gi01KSzAesEbSFjP4342U2pzQ92DIpLQN/1dpuDxBGSbcYNfGGnOvYTUR8
 /Y6d4rHJd3lQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="200439025"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; 
   d="scan'208";a="200439025"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:59:19 -0800
IronPort-SDR: QpSTuG6pYC1UvtS50aRI4Kq48xfrHIccwbXiG62pB7A9mSPUSiZm/WvE1of90i0czzX+15OiB9
 pj91r0LUJYJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; 
   d="scan'208";a="360374566"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga006.jf.intel.com with ESMTP; 05 Feb 2021 05:59:17 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/3] oeqa: wic: Add tests for permissions and change-directory
Date: Fri,  5 Feb 2021 21:59:15 +0800
Message-Id: <20210205135916.55589-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205135916.55589-1-chee.yang.lee@intel.com>
References: <20210205135916.55589-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Make sure that the permissions and username are respected when using all
the rootfs modifiers.

Add tests for change-directory command

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4aad9531df44d1b0637bd559161702ad86861b46)
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 13b6a0cc72..d4c0db8bda 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -62,6 +62,12 @@ def extract_files(debugfs_output):
     return [line.split('/')[5].strip() for line in \
             debugfs_output.strip().split('/\n')]
 
+def files_own_by_root(debugfs_output):
+    for line in debugfs_output.strip().split('/\n'):
+        if line.split('/')[3:5] != ['0', '0']:
+            print(debugfs_output)
+            return False
+    return True
 
 class WicTestCase(OESelftestTestCase):
     """Wic test class."""
@@ -84,6 +90,7 @@ class WicTestCase(OESelftestTestCase):
                 self.skipTest('wic-tools cannot be built due its (intltool|gettext)-native dependency and NLS disable')
 
             bitbake('core-image-minimal')
+            bitbake('core-image-minimal-mtdutils')
             WicTestCase.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)
@@ -506,6 +513,89 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
+    def test_permissions(self):
+        """Test permissions are respected"""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        t_normal = """
+part / --source rootfs --fstype=ext4
+"""
+        t_exclude = """
+part / --source rootfs --fstype=ext4 --exclude-path=home
+"""
+        t_multi = """
+part / --source rootfs --ondisk sda --fstype=ext4
+part /export --source rootfs --rootfs=core-image-minimal-mtdutils --fstype=ext4
+"""
+        t_change = """
+part / --source rootfs --ondisk sda --fstype=ext4 --exclude-path=etc/   
+part /etc --source rootfs --fstype=ext4 --change-directory=etc
+"""
+        tests = [t_normal, t_exclude, t_multi, t_change]
+
+        try:
+            for test in tests:
+                include_path = os.path.join(self.resultdir, 'test-include')
+                os.makedirs(include_path)
+                wks_file = os.path.join(include_path, 'temp.wks')
+                with open(wks_file, 'w') as wks:
+                    wks.write(test)
+                runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
+
+                for part in glob(os.path.join(self.resultdir, 'temp-*.direct.p*')):
+                    res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part))
+                    self.assertEqual(True, files_own_by_root(res.output))
+
+                rmtree(self.resultdir, ignore_errors=True)
+
+        finally:
+            os.environ['PATH'] = oldpath
+
+    def test_change_directory(self):
+        """Test --change-directory wks option."""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        try:
+            include_path = os.path.join(self.resultdir, 'test-include')
+            os.makedirs(include_path)
+            wks_file = os.path.join(include_path, 'temp.wks')
+            with open(wks_file, 'w') as wks:
+                wks.write("part /etc --source rootfs --fstype=ext4 --change-directory=etc")
+            runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
+
+            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
+
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
+            files = extract_files(res.output)
+            self.assertIn('passwd', files)
+
+        finally:
+            os.environ['PATH'] = oldpath
+
+    def test_change_directory_errors(self):
+        """Test --change-directory wks option error handling."""
+        wks_file = 'temp.wks'
+
+        # Absolute argument.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --change-directory /usr")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
+        # Argument pointing to parent directory.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --change-directory ././..")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
 class Wic2(WicTestCase):
 
     def test_bmap_short(self):
-- 
2.17.1


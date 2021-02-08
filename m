Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.29523.1612747378725735329
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 17:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: IQaUyt6iETmKOgeDFIbmayPjjJ89AvorlvFOKk4rLmYCKOLn/yoqo66R9X2be1GZ65+0592gch
 BS2enNNwnHig==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="180867526"
X-IronPort-AV: E=Sophos;i="5.81,160,1610438400"; 
   d="scan'208";a="180867526"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2021 17:22:57 -0800
IronPort-SDR: NskuJD/3IybnwwAbVA2Gypv9x2vjjFgo/R+5H+lk6kZ8+mRb9WHm0e9XGOAli5LdyhefYvTM5y
 nKugJFu7tZZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,160,1610438400"; 
   d="scan'208";a="584942799"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga005.fm.intel.com with ESMTP; 07 Feb 2021 17:22:56 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: debug mode to keep tmp directory
Date: Mon,  8 Feb 2021 09:22:55 +0800
Message-Id: <20210208012255.34097-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <Chee.Yang.Lee@intel.com>

files in wic tmp directory can be usefull for debugging, so do not remove
tmp directory when wic create run with debugging mode (-D or --debug).

also update wic.Wic.test_debug_short and wic.Wic.test_debug_long to
check for tmp directory.

[YOCTO#14216]

Signed-off-by: Lee Chee Yang <Chee.Yang.Lee@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py      | 2 ++
 scripts/lib/wic/plugins/imager/direct.py | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 03a3ac565c..2bf5cb9a86 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -318,6 +318,7 @@ class Wic(WicTestCase):
                                    "--image-name=core-image-minimal "
                                    "-D -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "tmp.wic*")))
 
     def test_debug_long(self):
         """Test --debug option"""
@@ -325,6 +326,7 @@ class Wic(WicTestCase):
                                    "--image-name=core-image-minimal "
                                    "--debug -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "tmp.wic*")))
 
     def test_skip_build_check_short(self):
         """Test -s option"""
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 7e1c1c03ab..ea709e8c54 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -54,6 +54,7 @@ class DirectPlugin(ImagerPlugin):
         self.native_sysroot = native_sysroot
         self.oe_builddir = oe_builddir
 
+        self.debug = options.debug
         self.outdir = options.outdir
         self.compressor = options.compressor
         self.bmap = options.bmap
@@ -274,8 +275,9 @@ class DirectPlugin(ImagerPlugin):
             if os.path.isfile(path):
                 shutil.move(path, os.path.join(self.outdir, fname))
 
-        # remove work directory
-        shutil.rmtree(self.workdir, ignore_errors=True)
+        # remove work directory when it is not in debugging mode
+        if not self.debug:
+            shutil.rmtree(self.workdir, ignore_errors=True)
 
 # Overhead of the MBR partitioning scheme (just one sector)
 MBR_OVERHEAD = 1
-- 
2.17.1


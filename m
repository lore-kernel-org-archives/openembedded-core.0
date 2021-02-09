Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: QHyPSAFafzgnTacjae+NGQXRebIqwIp09Hj/A6JvGp0WD6xT8egAsQw/FfZdKH9wvN9HOuWMHW
 U9+SrauThEnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968645"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968645"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:59 -0800
IronPort-SDR: KItisRlJeLi0f9PQu+8ABl7Az3GqQP7tQH1EMfs9IJHgzoYZmz2WWZAjWMk//SBtA1Iyvw/QV2
 mMpcVYzFLExQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215473"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:57 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/35] wic/selftest: test_permissions also test bitbake image
Date: Tue,  9 Feb 2021 23:52:00 +0800
Message-Id: <d0a7383ca3e8ac206c88ac3cc1b8e1f18b439964.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

existing test case test_permissions use Wic command as standalone
tools to create wic image and check that wic image for permissions.

add extra steps to the test case to also check against image build
using bitbake do_image_wic.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 551ce73a90757ba43501fe5cf9ac84a7b77de549)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 714637ec1e..9f4a9db444 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -588,6 +588,9 @@ part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-imag
     def test_permissions(self):
         """Test permissions are respected"""
 
+        # prepare wicenv and rootfs
+        bitbake('core-image-minimal core-image-minimal-mtdutils -c do_rootfs_wicenv')
+
         oldpath = os.environ['PATH']
         os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
 
@@ -621,6 +624,19 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                     res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part))
                     self.assertEqual(True, files_own_by_root(res.output))
 
+                config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "%s"\n' % wks_file
+                self.append_config(config)
+                bitbake('core-image-minimal')
+                tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'),'build-wic')
+
+                # check each partition for permission
+                for part in glob(os.path.join(tmpdir, 'temp-*.direct.p*')):
+                    res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part))
+                    self.assertTrue(files_own_by_root(res.output)
+                        ,msg='Files permission incorrect using wks set "%s"' % test)
+
+                # clean config and result directory for next cases
+                self.remove_config(config)
                 rmtree(self.resultdir, ignore_errors=True)
 
         finally:
-- 
2.29.2


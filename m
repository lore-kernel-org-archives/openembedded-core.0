Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.928.1619398501109409766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: j0usyx7wskjTGihPWUduoDyboKxRVgKVIfV80W3H/PblHN1Vr+ab4JsDW4cgw5wo/pA6Nb5vXE
 bI10qgIIrl4g==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818270"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818270"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:03 -0700
IronPort-SDR: apGWXNrsb1FfjyPxVzxPOI0EzYbdFNGh6BTBGwDUgi3ZiKKlBgp4F7ldSzoz4ym+dKSUdK56/R
 NPeIvBmscCaA==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067518"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:02 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 49/64] deb: apply postinstall on sdk
Date: Mon, 26 Apr 2021 08:53:20 +0800
Message-Id: <07aaa526c60c6d545ca856fc3d51606b669f641c.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: hongxu <hongxu.jia@windriver.com>

If not postinstall applied, some nativesdk command could not be found
in sdk due to update-alternatives in postinst not be executed, such as chroot:

$ which chroot
/sbin/chroot
$ which chroot.coreutils
path-to-sdk/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/chroot.coreutils

After applying the fix
$ which chroot
path-to-sdk/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/chroot
$ which chroot.coreutils
path-to-sdk/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/chroot.coreutils

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a9bf19502766baa4087456649d5471483d04f6a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/package_manager/deb/sdk.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index 9859d8f32d..f4b0b6510a 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -65,6 +65,8 @@ class PkgSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
+        self.target_pm.run_pre_post_installs()
+
         self.target_pm.run_intercepts(populate_sdk='target')
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
@@ -78,6 +80,8 @@ class PkgSdk(Sdk):
         self._populate_sysroot(self.host_pm, self.host_manifest)
         self.install_locales(self.host_pm)
 
+        self.host_pm.run_pre_post_installs()
+
         self.host_pm.run_intercepts(populate_sdk='host')
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
-- 
2.30.2


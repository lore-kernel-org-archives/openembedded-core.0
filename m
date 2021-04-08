Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.5468.1617872670490018455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 02:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 13894S3K011347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 02:04:29 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 02:04:28 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 02:04:28 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] deb: apply postinstall on sdk
Date: Thu, 8 Apr 2021 02:04:28 -0700
Message-ID: <20210408090428.78741-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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
2.27.0


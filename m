Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.34639.1620052602095814023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 07:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: YkmQwkx9EShmOZbdGofwxl4qOvhbKyVOlxtwQzwzcLNpl7QUMTnVQE6hNt8OhdUIUPWm7h/8W/
 O3MxVq+jKxSg==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197849538"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="197849538"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 07:36:47 -0700
IronPort-SDR: oe7GdEAkgUhtlei79MEi+adKwIdsixQgtJHhwQhFhc4W6q5rcP1fmZ9RRZRLY1CYfIBUVy32U1
 fRFIazJOfaFw==
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="405697143"
Received: from semohdyu-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.72.206])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 07:36:46 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 4/6] deb: apply postinstall on sdk
Date: Mon,  3 May 2021 22:36:32 +0800
Message-Id: <cbbdb5333d36bda3e6ce833d95960a8d4b09fbea.1620052258.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620052258.git.anuj.mittal@intel.com>
References: <cover.1620052258.git.anuj.mittal@intel.com>
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
index b25eb70b00..76548b06f0 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -65,6 +65,8 @@ class DpkgSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
+        self.target_pm.run_pre_post_installs()
+
         self.target_pm.run_intercepts(populate_sdk='target')
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
@@ -78,6 +80,8 @@ class DpkgSdk(Sdk):
         self._populate_sysroot(self.host_pm, self.host_manifest)
         self.install_locales(self.host_pm)
 
+        self.host_pm.run_pre_post_installs()
+
         self.host_pm.run_intercepts(populate_sdk='host')
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
-- 
2.30.2


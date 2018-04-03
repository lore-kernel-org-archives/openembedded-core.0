Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5EF7487D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 15:51:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 08:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,401,1517904000"; d="scan'208";a="39069225"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2018 08:51:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 18:45:22 +0300
Message-Id: <20180403154524.31588-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
References: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/8] sdk.py: run postinst intercepts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 15:51:56 -0000

Previously this wasn't done, and so any packages installed from
populate_sdk would not have the postinsts fully executed
(particularly generation of various caches via running nativesdk or target
binaries with qemu wasn't working).

[YOCTO #12630]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass |  2 +-
 meta/lib/oe/sdk.py                     | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 60a5abc7dc8..77ec8aaec27 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -46,7 +46,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native pixz-native cross-localedef-native"
+SDK_DEPENDS = "virtual/fakeroot-native pixz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
 SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 6cd4115202f..d6a503372a3 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -209,6 +209,8 @@ class RpmSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
+        self.target_pm.run_intercepts()
+
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
         if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
@@ -218,6 +220,8 @@ class RpmSdk(Sdk):
         self._populate_sysroot(self.host_pm, self.host_manifest)
         self.install_locales(self.host_pm)
 
+        self.host_pm.run_intercepts()
+
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
         if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
@@ -293,6 +297,8 @@ class OpkgSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
+        self.target_pm.run_intercepts()
+
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
         if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
@@ -302,6 +308,8 @@ class OpkgSdk(Sdk):
         self._populate_sysroot(self.host_pm, self.host_manifest)
         self.install_locales(self.host_pm)
 
+        self.host_pm.run_intercepts()
+
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
         if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
@@ -378,6 +386,8 @@ class DpkgSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
+        self.target_pm.run_intercepts()
+
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
         self._copy_apt_dir_to(os.path.join(self.sdk_target_sysroot, "etc", "apt"))
@@ -389,6 +399,8 @@ class DpkgSdk(Sdk):
         self._populate_sysroot(self.host_pm, self.host_manifest)
         self.install_locales(self.host_pm)
 
+        self.host_pm.run_intercepts()
+
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
         self._copy_apt_dir_to(os.path.join(self.sdk_output, self.sdk_native_path,
-- 
2.16.1



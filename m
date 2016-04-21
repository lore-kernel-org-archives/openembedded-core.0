Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 806696011B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 18:44:43 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Z002K7YPZ8P51@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2016 13:44:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=Q4-j1AaZAAAA:8
	a=22rwm3C9IjoZm-yYUn0A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
Received: by 100.15.86.14 with SMTP id 16f80483; Thu, 21 Apr 2016 18:44:28 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 23A9F161FB4;	Thu,
	21 Apr 2016 14:44:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 14:44:22 -0400
Message-id: <1461264262-31937-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] sdk.py: preserve packaging data when SDKIMAGE_FEATURES has "package-management"
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
X-List-Received-Date: Thu, 21 Apr 2016 18:44:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is not enabled by default, as there are still limitations and possible
issues with opkg (and rpm?) packaging data containing broken symlinks for
local indexes:

http://cgit.openembedded.org/openembedded-core/commit/?id=c8e0ec2da9ad4ce1c103966906a85f68c15400dd

There are other use cases for the packaging data to be available in SDK,
since it provides comprehensive info about SDK's contents and in the case of
opkg and dpkg is all text-based and can be easily parsed by simple scripts.

Introduce new "package-management" flag for SDKIMAGE_FEATURES list (similar
to the one already used for IMAGE_FEATURES) that controls presence of the
packaging data in resulting SDK, while unifying this behavior across the
board for supported pkg managers - rpm, opkg, dpkg.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/lib/oe/sdk.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index f15fbdb..f1bbef6 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -155,14 +155,16 @@ class RpmSdk(Sdk):
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND", True))
 
-        self.target_pm.remove_packaging_data()
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.target_pm.remove_packaging_data()
 
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND", True))
 
-        self.host_pm.remove_packaging_data()
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.host_pm.remove_packaging_data()
 
         # Move host RPM library data
         native_rpm_state_dir = os.path.join(self.sdk_output,
@@ -232,14 +234,16 @@ class OpkgSdk(Sdk):
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND", True))
 
-        self.target_pm.remove_packaging_data()
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.target_pm.remove_packaging_data()
 
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND", True))
 
-        self.host_pm.remove_packaging_data()
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.host_pm.remove_packaging_data()
 
         target_sysconfdir = os.path.join(self.sdk_target_sysroot, self.sysconfdir)
         host_sysconfdir = os.path.join(self.sdk_host_sysroot, self.sysconfdir)
@@ -314,6 +318,9 @@ class DpkgSdk(Sdk):
 
         self._copy_apt_dir_to(os.path.join(self.sdk_target_sysroot, "etc", "apt"))
 
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.target_pm.remove_packaging_data()
+
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
 
@@ -322,6 +329,9 @@ class DpkgSdk(Sdk):
         self._copy_apt_dir_to(os.path.join(self.sdk_output, self.sdk_native_path,
                                            "etc", "apt"))
 
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.host_pm.remove_packaging_data()
+
         native_dpkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
                                              "var", "lib", "dpkg")
         self.mkdirhier(native_dpkg_state_dir)
-- 
2.2.0



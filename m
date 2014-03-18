Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3566F8E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 11:38:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Mar 2014 04:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,677,1389772800"; d="scan'208";a="494272083"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2014 04:38:54 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2014 13:38:47 +0200
Message-Id: <6ef8a3c6d9bc6ffaaa3ba9e542ef1e5858fedfe7.1395142153.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395142153.git.laurentiu.palcu@intel.com>
References: <cover.1395142153.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1395142153.git.laurentiu.palcu@intel.com>
References: <cover.1395142153.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/4] rootfs.py, sdk.py: adjust/create the wrappers for creating installed packages list
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
X-List-Received-Date: Tue, 18 Mar 2014 11:38:56 -0000

Since we created a new PkgsList object that will deal with listing the
installed packages in a rootfs, use the new class both for images and
SDKs in the wrapper functions.

The old list_installed_packages() wrapper listed only the packages inside
an image rootfs. It didn't deal with target/host SDK rootfs's.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/rootfs.py |   19 ++++---------------
 meta/lib/oe/sdk.py    |   18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 30a1321..0e6c8bc 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -709,28 +709,17 @@ def create_rootfs(d, manifest_dir=None):
     os.environ.update(env_bkp)
 
 
-def list_installed_packages(d, format=None, rootfs_dir=None):
+def image_list_installed_packages(d, format=None, rootfs_dir=None):
     if not rootfs_dir:
         rootfs_dir = d.getVar('IMAGE_ROOTFS', True)
 
     img_type = d.getVar('IMAGE_PKGTYPE', True)
     if img_type == "rpm":
-        return RpmPM(d,
-                     rootfs_dir,
-                     d.getVar('TARGET_VENDOR', True)
-                     ).list_installed(format)
+        return RpmPkgsList(d, rootfs_dir).list(format)
     elif img_type == "ipk":
-        return OpkgPM(d,
-                      rootfs_dir,
-                      d.getVar("IPKGCONF_TARGET", True),
-                      d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True)
-                      ).list_installed(format)
+        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET", True)).list(format)
     elif img_type == "deb":
-        return DpkgPM(d,
-                      rootfs_dir,
-                      d.getVar('PACKAGE_ARCHS', True),
-                      d.getVar('DPKG_ARCH', True)
-                      ).list_installed(format)
+        return DpkgPkgsList(d, rootfs_dir).list(format)
 
 if __name__ == "__main__":
     """
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 01a1807..5643199 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -289,6 +289,24 @@ class DpkgSdk(Sdk):
         bb.utils.remove(os.path.join(self.sdk_output, "var"), True)
 
 
+def sdk_list_installed_packages(d, target, format=None, rootfs_dir=None):
+    if rootfs_dir is None:
+        sdk_output = d.getVar('SDK_OUTPUT', True)
+        target_path = d.getVar('SDKTARGETSYSROOT', True).strip('/')
+
+        rootfs_dir = [sdk_output, os.path.join(sdk_output, target_path)][target is True]
+
+    img_type = d.getVar('IMAGE_PKGTYPE', True)
+    if img_type == "rpm":
+        arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
+        os_var = ["SDK_OS", None][target is True]
+        return RpmPkgsList(d, rootfs_dir, arch_var, os_var).list(format)
+    elif img_type == "ipk":
+        conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_Target"][target is True]
+        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var, True)).list(format)
+    elif img_type == "deb":
+        return DpkgPkgsList(d, rootfs_dir).list(format)
+
 def populate_sdk(d, manifest_dir=None):
     env_bkp = os.environ.copy()
 
-- 
1.7.9.5



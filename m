Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3E2609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 07:07:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0777BhN007923
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 6 Jan 2015 23:07:11 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 6 Jan 2015 23:07:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 7 Jan 2015 15:06:52 +0800
Message-ID: <2a50ba757d8439a7701338d7299a7e923896c535.1420613743.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420613743.git.hongxu.jia@windriver.com>
References: <cover.1420613743.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] manifest.py/image.bbclass: add var-INSTALL_ALL to install all packages of a recipes.
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
X-List-Received-Date: Wed, 07 Jan 2015 07:07:11 -0000
Content-Type: text/plain

Add variable INSTALL_ALL to install all available packages of a recipe, the recipe
comes from the package listed in PACKAGE_INSTALL (IMAGE_INSTALL also)

Here is the design:
1) According to the packages listed in PACKAGE_INSTALL, figure out recipes
   which produced them by invoking script oe-pkgdata-util;

2) Go on invoking script oe-pkgdata-util to list all available packages in
   these recipes except *-(doc|dbg|dev|staticdev|locale|ptest), and use them
   to replace packages in PACKAGE_INSTALL;

3) Packages installation at do_rootfs time as normal;

4) INSTALL_ALL is a global switch for all packages listed in PACKAGE_INSTALL,
   you also could assign INSTALL_ALL_pkgname ?= "1" for the particular
   package in PACKAGE_INSTALL;

[YOCTO #5264]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/image.bbclass | 19 +++++++++++++++-
 meta/lib/oe/manifest.py    | 56 ++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 07e7f99..8c7df9a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -54,6 +54,16 @@ def check_image_features(d):
         if feature not in valid_features:
             bb.fatal("'%s' in IMAGE_FEATURES is not a valid image feature. Valid features: %s" % (feature, ' '.join(valid_features)))
 
+# Assign INSTALL_ALL ?= "1" means:
+# 1) According to the packages listed in PACKAGE_INSTALL, figure out recipes
+#    which produced them by invoking script oe-pkgdata-util;
+# 2) Go on invoking script oe-pkgdata-util to list all available packages in
+#    these recipes except *-(doc|dbg|dev|staticdev|locale|ptest), and use them
+#    to replace packages in PACKAGE_INSTALL;
+# 3) INSTALL_ALL is a global switch for all packages listed in PACKAGE_INSTALL,
+#    you also could assign INSTALL_ALL_pkgname ?= "1" for the particular
+#    package in PACKAGE_INSTALL.
+INSTALL_ALL ?= "0"
 IMAGE_INSTALL ?= ""
 IMAGE_INSTALL[type] = "list"
 export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
@@ -95,9 +105,16 @@ def rootfs_variables(d):
                  'SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP',
                  'MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
                  'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','BUILDNAME','USE_DEVFS',
-                 'STAGING_KERNEL_DIR','COMPRESSIONTYPES']
+                 'STAGING_KERNEL_DIR','COMPRESSIONTYPES', 'INSTALL_ALL']
     variables.extend(command_variables(d))
     variables.extend(variable_depends(d))
+
+    for pkg in (d.getVar('PACKAGE_INSTALL', True) or '').split():
+        installall_var = 'INSTALL_ALL_%s' % pkg
+        installall_val = d.getVar(installall_var, True)
+        if installall_val and installall_var not in variables:
+            variables.append(installall_var)
+
     return " ".join(variables)
 
 do_rootfs[vardeps] += "${@rootfs_variables(d)}"
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 42832f1..b61ee9d 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -2,6 +2,7 @@ from abc import ABCMeta, abstractmethod
 import os
 import re
 import bb
+import subprocess
 
 
 class Manifest(object):
@@ -139,6 +140,55 @@ class Manifest(object):
         pass
 
     """
+    Find recipe which produced package pkgname, and look up all available
+    packages in that recipe except *-(doc|dbg|dev|staticdev|locale|ptest)
+    """
+    def _lookup_packages(self, pkgtype=PKG_TYPE_ATTEMPT_ONLY, pkgname=None):
+        if pkgname is None:
+            bb.warn('pkgname is None')
+            return []
+
+        if pkgtype == self.PKG_TYPE_ATTEMPT_ONLY or \
+           pkgtype == self.PKG_TYPE_LANGUAGE:
+            return []
+
+        if self.d.getVar('INSTALL_ALL', True) != '1' and \
+           self.d.getVar('INSTALL_ALL_%s' % pkgname, True) != '1':
+            return []
+
+        pkgdata_dir = self.d.getVar('PKGDATA_DIR', True)
+        cmd = "oe-pkgdata-util lookup-recipe %s %s" % (pkgdata_dir, pkgname)
+        try:
+            recipe = subprocess.check_output(cmd,
+                                             stderr=subprocess.STDOUT,
+                                             shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.note("Could not lookup recipe for package %s" % (pkgname))
+            return []
+
+        cmd = "oe-pkgdata-util list-packages %s %s" % (pkgdata_dir, recipe)
+        try:
+            output = subprocess.check_output(cmd,
+                                             stderr=subprocess.STDOUT,
+                                             shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Could not list packages for recipe %s. Command "
+                     "'%s' returned %d:\n%s" %
+                     (recipe, cmd, e.returncode, e.output))
+
+        packages = []
+        for pkg in output.split('\n'):
+            if not pkg or pkg.endswith("-ptest") or \
+               pkg.endswith("-dev") or pkg.endswith("-staticdev") or \
+               pkg.endswith("-locale") or pkg.endswith("-dbg") or \
+               pkg.endswith("-doc"):
+                continue
+
+            packages.append(pkg)
+
+        return packages
+
+    """
     The following function parses an initial manifest and returns a dictionary
     object with the must install, attempt only, multilib and language packages.
     """
@@ -162,10 +212,12 @@ class Manifest(object):
                     pkg_type = pkg.group(1)
                     pkg_name = pkg.group(2)
 
+                    packages = self._lookup_packages(pkg_type, pkg_name) or \
+                                                                  [pkg_name]
                     if not pkg_type in pkgs:
-                        pkgs[pkg_type] = [pkg_name]
+                        pkgs[pkg_type] = packages
                     else:
-                        pkgs[pkg_type].append(pkg_name)
+                        pkgs[pkg_type] = list(set(packages + pkgs[pkg_type]))
 
         return pkgs
 
-- 
1.9.1



Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 911DE6EFAC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 20:14:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 14 Feb 2014 12:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,846,1384329600"; d="scan'208";a="475432272"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2014 12:14:21 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 22:14:18 +0200
Message-Id: <4e62efc1659a4be94b6437049a771ec444515600.1392408543.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392408543.git.laurentiu.palcu@intel.com>
References: <cover.1392408543.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392408543.git.laurentiu.palcu@intel.com>
References: <cover.1392408543.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] package_manager.py: move multilib prefix list computation function to RpmIndexer
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
X-List-Received-Date: Fri, 14 Feb 2014 20:14:22 -0000

Since the code from anonymous function in rootfs_rpm.bbclass has been
removed, MULTILIB_PREFIX_LIST variable was never set. Hence not all
directories got indexed.

This commit will move the multilib prefix list computation function from
RpmPM class to RpmIndexer, since the indexer needs it too. I was hoping
to avoid this but, unfortunately, I couldn't.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/package_manager.py |  105 ++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 52 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index af14d5a..2faf422 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -35,14 +35,64 @@ class Indexer(object):
 
 
 class RpmIndexer(Indexer):
+    def get_ml_prefix_and_os_list(self, arch_var=None, os_var=None):
+        package_archs = {
+            'default': [],
+        }
+
+        target_os = {
+            'default': "",
+        }
+
+        if arch_var is not None and os_var is not None:
+            package_archs['default'] = self.d.getVar(arch_var, True).split()
+            package_archs['default'].reverse()
+            target_os['default'] = self.d.getVar(os_var, True).strip()
+        else:
+            package_archs['default'] = self.d.getVar("PACKAGE_ARCHS", True).split()
+            # arch order is reversed.  This ensures the -best- match is
+            # listed first!
+            package_archs['default'].reverse()
+            target_os['default'] = self.d.getVar("TARGET_OS", True).strip()
+            multilibs = self.d.getVar('MULTILIBS', True) or ""
+            for ext in multilibs.split():
+                eext = ext.split(':')
+                if len(eext) > 1 and eext[0] == 'multilib':
+                    localdata = bb.data.createCopy(self.d)
+                    default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
+                    default_tune = localdata.getVar(default_tune_key, False)
+                    if default_tune:
+                        localdata.setVar("DEFAULTTUNE", default_tune)
+                        bb.data.update_data(localdata)
+                        package_archs[eext[1]] = localdata.getVar('PACKAGE_ARCHS',
+                                                                  True).split()
+                        package_archs[eext[1]].reverse()
+                        target_os[eext[1]] = localdata.getVar("TARGET_OS",
+                                                              True).strip()
+
+        ml_prefix_list = dict()
+        for mlib in package_archs:
+            if mlib == 'default':
+                ml_prefix_list[mlib] = package_archs[mlib]
+            else:
+                ml_prefix_list[mlib] = list()
+                for arch in package_archs[mlib]:
+                    if arch in ['all', 'noarch', 'any']:
+                        ml_prefix_list[mlib].append(arch)
+                    else:
+                        ml_prefix_list[mlib].append(mlib + "_" + arch)
+
+        return (ml_prefix_list, target_os)
+
     def write_index(self):
         sdk_pkg_archs = (self.d.getVar('SDK_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
-        mlb_prefix_list = (self.d.getVar('MULTILIB_PREFIX_LIST', True) or "").replace('-', '_').split()
         all_mlb_pkg_archs = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
 
+        mlb_prefix_list = self.get_ml_prefix_and_os_list()[0]
+
         archs = set()
         for item in mlb_prefix_list:
-            archs = archs.union(set(item.split(':')[1:]))
+            archs = archs.union(set(i.replace('-', '_') for i in mlb_prefix_list[item]))
 
         if len(archs) == 0:
             archs = archs.union(set(all_mlb_pkg_archs))
@@ -303,56 +353,7 @@ class RpmPM(PackageManager):
 
         self.indexer = RpmIndexer(self.d, self.deploy_dir)
 
-        self.ml_prefix_list, self.ml_os_list = self._get_prefix_and_os_list(arch_var, os_var)
-
-    def _get_prefix_and_os_list(self, arch_var, os_var):
-        package_archs = {
-            'default': [],
-        }
-
-        target_os = {
-            'default': "",
-        }
-
-        if arch_var is not None and os_var is not None:
-            package_archs['default'] = self.d.getVar(arch_var, True).split()
-            package_archs['default'].reverse()
-            target_os['default'] = self.d.getVar(os_var, True).strip()
-        else:
-            package_archs['default'] = self.d.getVar("PACKAGE_ARCHS", True).split()
-            # arch order is reversed.  This ensures the -best- match is
-            # listed first!
-            package_archs['default'].reverse()
-            target_os['default'] = self.d.getVar("TARGET_OS", True).strip()
-            multilibs = self.d.getVar('MULTILIBS', True) or ""
-            for ext in multilibs.split():
-                eext = ext.split(':')
-                if len(eext) > 1 and eext[0] == 'multilib':
-                    localdata = bb.data.createCopy(self.d)
-                    default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
-                    default_tune = localdata.getVar(default_tune_key, False)
-                    if default_tune:
-                        localdata.setVar("DEFAULTTUNE", default_tune)
-                        bb.data.update_data(localdata)
-                        package_archs[eext[1]] = localdata.getVar('PACKAGE_ARCHS',
-                                                                  True).split()
-                        package_archs[eext[1]].reverse()
-                        target_os[eext[1]] = localdata.getVar("TARGET_OS",
-                                                              True).strip()
-
-        ml_prefix_list = dict()
-        for mlib in package_archs:
-            if mlib == 'default':
-                ml_prefix_list[mlib] = package_archs[mlib]
-            else:
-                ml_prefix_list[mlib] = list()
-                for arch in package_archs[mlib]:
-                    if arch in ['all', 'noarch', 'any']:
-                        ml_prefix_list[mlib].append(arch)
-                    else:
-                        ml_prefix_list[mlib].append(mlib + "_" + arch)
-
-        return (ml_prefix_list, target_os)
+        self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
 
     '''
     Create configs for rpm and smart, and multilib is supported
-- 
1.7.9.5



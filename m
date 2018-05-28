Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 925AC74808
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 10:05:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2018 03:05:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,451,1520924400"; d="scan'208";a="232488599"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 28 May 2018 03:05:36 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2018 13:05:37 +0300
Message-Id: <20180528100537.3827-7-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528100537.3827-1-alexander.kanavin@linux.intel.com>
References: <20180528100537.3827-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/7] package_manager.py: rework postinst_intercept failures
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
X-List-Received-Date: Mon, 28 May 2018 10:05:35 -0000

Previously a warning was printed regardless of context and nature
of the failure, and because it was only a warning, it was mostly ignored.

Now, the following is considered when a failure happens:
1) whether we are installing packages into a target image, or populating
a SDK with host or target packages.
2) whether the failure was due to qemu not supporting the target machine.

Accordingly, warnings, notes, and failures are printed, and postponing
to first boot happens if possible.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py                | 19 ++++++++++++++++---
 meta/lib/oe/sdk.py                            | 12 ++++++------
 .../qemu/qemuwrapper-cross_1.0.bb             |  5 +++++
 3 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 516630b5cfb..f87f76fec99 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -370,7 +370,7 @@ class PackageManager(object, metaclass=ABCMeta):
                 self._handle_intercept_failure(registered_pkgs)
 
 
-    def run_intercepts(self):
+    def run_intercepts(self, populate_sdk=None):
         intercepts_dir = self.intercepts_dir
 
         bb.note("Running intercept scripts:")
@@ -392,9 +392,22 @@ class PackageManager(object, metaclass=ABCMeta):
                 output = subprocess.check_output(script_full, stderr=subprocess.STDOUT)
                 if output: bb.note(output.decode("utf-8"))
             except subprocess.CalledProcessError as e:
-                bb.warn("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
                 bb.note("Exit code %d. Output:\n%s" % (e.returncode, e.output.decode("utf-8")))
-                self._postpone_to_first_boot(script_full)
+                if populate_sdk == 'host':
+                    bb.warn("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
+                elif populate_sdk == 'target':
+                    if "qemuwrapper: qemu usermode is not supported" in e.output.decode("utf-8"):
+                        bb.warn("The postinstall intercept hook '%s' could not be executed due to missing qemu usermode support, details in %s/log.do_%s"
+                                % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
+                    else:
+                        bb.fatal("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
+                else:
+                    if "qemuwrapper: qemu usermode is not supported" in e.output.decode("utf-8"):
+                        bb.note("The postinstall intercept hook '%s' could not be executed due to missing qemu usermode support, details in %s/log.do_%s"
+                                % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
+                        self._postpone_to_first_boot(script_full)
+                    else:
+                        bb.fatal("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
 
     @abstractmethod
     def update(self):
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index d6a503372a3..0d39ea8a91e 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -209,7 +209,7 @@ class RpmSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
-        self.target_pm.run_intercepts()
+        self.target_pm.run_intercepts(populate_sdk='target')
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
@@ -220,7 +220,7 @@ class RpmSdk(Sdk):
         self._populate_sysroot(self.host_pm, self.host_manifest)
         self.install_locales(self.host_pm)
 
-        self.host_pm.run_intercepts()
+        self.host_pm.run_intercepts(populate_sdk='host')
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
@@ -297,7 +297,7 @@ class OpkgSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
-        self.target_pm.run_intercepts()
+        self.target_pm.run_intercepts(populate_sdk='target')
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
@@ -308,7 +308,7 @@ class OpkgSdk(Sdk):
         self._populate_sysroot(self.host_pm, self.host_manifest)
         self.install_locales(self.host_pm)
 
-        self.host_pm.run_intercepts()
+        self.host_pm.run_intercepts(populate_sdk='host')
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
@@ -386,7 +386,7 @@ class DpkgSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
-        self.target_pm.run_intercepts()
+        self.target_pm.run_intercepts(populate_sdk='target')
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
@@ -399,7 +399,7 @@ class DpkgSdk(Sdk):
         self._populate_sysroot(self.host_pm, self.host_manifest)
         self.install_locales(self.host_pm)
 
-        self.host_pm.run_intercepts()
+        self.host_pm.run_intercepts(populate_sdk='host')
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 4b1b46d0bb3..4aada5232d8 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -20,6 +20,11 @@ do_install () {
 #!/bin/sh
 set -x
 
+if [ ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)} = False ]; then
+        echo "qemuwrapper: qemu usermode is not supported"
+fi
+
+
 $qemu_binary $qemu_options "\$@"
 EOF
 
-- 
2.17.0



Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 496427482C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 09:36:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 02:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,436,1520924400"; d="scan'208";a="42455579"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 24 May 2018 02:36:53 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 12:36:46 +0300
Message-Id: <20180524093649.6911-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180524093649.6911-1-alexander.kanavin@linux.intel.com>
References: <20180524093649.6911-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/6] lib/oe/package_manager: turn postinst failure warnings into bitbake failures
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
X-List-Received-Date: Thu, 24 May 2018 09:36:53 -0000

Sumo release provides a transition period so that deferrals to first boot
via 'exit 1' can be converted to pkg_postinst_ontarget(). For the next release
however, postinst script failures should be treated as such.

[YOCTO #12607]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py               | 22 +++++++-------------
 meta/lib/oeqa/selftest/cases/runtime_test.py |  4 ++--
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 5ac729455e9..516630b5cfb 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -84,10 +84,10 @@ def opkg_query(cmd_output):
 
     return output
 
-# Note: this should be bb.fatal in the future.
-def failed_postinsts_warn(pkgs, log_path):
-    bb.warn("""Intentionally failing postinstall scriptlets of %s to defer them to first boot is deprecated. Please place them into pkg_postinst_ontarget_${PN} ().
-If deferring to first boot wasn't the intent, then scriptlet failure may mean an issue in the recipe, or a regression elsewhere.
+def failed_postinsts_abort(pkgs, log_path):
+    bb.fatal("""Postinstall scriptlets of %s have failed. If the intention is to defer them to first boot,
+then please place them into pkg_postinst_ontarget_${PN} ().
+Deferring to first boot via 'exit 1' is no longer supported.
 Details of the failure are in %s.""" %(pkgs, log_path))
 
 class Indexer(object, metaclass=ABCMeta):
@@ -789,9 +789,7 @@ class RpmPM(PackageManager):
                 failed_scriptlets_pkgnames[line.split()[-1]] = True
 
         if len(failed_scriptlets_pkgnames) > 0:
-            failed_postinsts_warn(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
-        for pkg in failed_scriptlets_pkgnames.keys():
-            self.save_rpmpostinst(pkg)
+            failed_postinsts_abort(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
 
     def remove(self, pkgs, with_dependencies = True):
         if len(pkgs) == 0:
@@ -1269,7 +1267,7 @@ class OpkgPM(OpkgDpkgPM):
                     bb.warn(line)
                     failed_pkgs.append(line.split(".")[0])
             if failed_pkgs:
-                failed_postinsts_warn(failed_pkgs, self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
+                failed_postinsts_abort(failed_pkgs, self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
@@ -1519,7 +1517,6 @@ class DpkgPM(OpkgDpkgPM):
         os.environ['INTERCEPT_DIR'] = self.intercepts_dir
         os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
-        failed_pkgs = []
         for pkg_name in installed_pkgs:
             for control_script in control_scripts:
                 p_full = os.path.join(info_dir, pkg_name + control_script.suffix)
@@ -1534,12 +1531,7 @@ class DpkgPM(OpkgDpkgPM):
                         bb.warn("%s for package %s failed with %d:\n%s" %
                                 (control_script.name, pkg_name, e.returncode,
                                     e.output.decode("utf-8")))
-                        failed_postinsts_warn([pkg_name], self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
-                        failed_pkgs.append(pkg_name)
-                        break
-
-        if len(failed_pkgs):
-            self.mark_packages("unpacked", failed_pkgs)
+                        failed_postinsts_abort([pkg_name], self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
 
     def update(self):
         os.environ['APT_CONFIG'] = self.apt_conf_file
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 9c9b4b34111..21e2c405df1 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -249,8 +249,8 @@ class Postinst(OESelftestTestCase):
                 features = 'CORE_IMAGE_EXTRA_INSTALL = "postinst-rootfs-failing"\n'
                 features += 'PACKAGE_CLASSES = "%s"\n' % classes
                 self.write_config(features)
-                bb_result = bitbake('core-image-minimal')
-                self.assertGreaterEqual(bb_result.output.find("Intentionally failing postinstall scriptlets of ['postinst-rootfs-failing'] to defer them to first boot is deprecated."), 0,
+                bb_result = bitbake('core-image-minimal', ignore_status=True)
+                self.assertGreaterEqual(bb_result.output.find("Postinstall scriptlets of ['postinst-rootfs-failing'] have failed."), 0,
                     "Warning about a failed scriptlet not found in bitbake output: %s" %(bb_result.output))
 
                 self.assertTrue(os.path.isfile(os.path.join(hosttestdir, "rootfs-before-failure")),
-- 
2.17.0



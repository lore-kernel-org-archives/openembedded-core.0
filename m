Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D9F0878872
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 16:56:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 09:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,462,1515484800"; d="scan'208";a="23835525"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 12 Mar 2018 09:56:20 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2018 18:49:42 +0200
Message-Id: <20180312164944.39923-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180312164944.39923-1-alexander.kanavin@linux.intel.com>
References: <20180312164944.39923-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/4] meta/lib/oe/package_manager.py: warn about failing scriptlets for all package types
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
X-List-Received-Date: Mon, 12 Mar 2018 16:56:20 -0000

Previously this was done only for rpm packages; now also ipk/deb scriptlet
failures are reported.

In the future this will become a hard error, but it can't yet happen
due to the legacy 'exit 1' way of deferring scriptlet execution to first boot which
needs a deprecation period.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c10efb8df4c..0c5cf3cf7f3 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -83,6 +83,11 @@ def opkg_query(cmd_output):
 
     return output
 
+# Note: this should be bb.fatal in the future.
+def failed_postinsts_warn(pkgs, log_path):
+    bb.warn("""Intentionally failing postinstall scriptlets of %s to defer them to first boot is deprecated. Please place them into pkg_postinst_ontarget_${PN} ().
+If deferring to first boot wasn't the intent, then scriptlet failure may mean an issue in the recipe, or a regression elsewhere.
+Details of the failure are in %s.""" %(pkgs, log_path))
 
 class Indexer(object, metaclass=ABCMeta):
     def __init__(self, d, deploy_dir):
@@ -709,8 +714,7 @@ class RpmPM(PackageManager):
                 failed_scriptlets_pkgnames[line.split()[-1]] = True
 
         if len(failed_scriptlets_pkgnames) > 0:
-            bb.warn("Intentionally failing postinstall scriptlets of %s to defer them to first boot is deprecated. Please place them into pkg_postinst_ontarget_${PN} ()." %(list(failed_scriptlets_pkgnames.keys())))
-            bb.warn("If deferring to first boot wasn't the intent, then scriptlet failure may mean an issue in the recipe, or a regression elsewhere.")
+            failed_postinsts_warn(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_rootfs"))
         for pkg in failed_scriptlets_pkgnames.keys():
             self.save_rpmpostinst(pkg)
 
@@ -1172,6 +1176,13 @@ class OpkgPM(OpkgDpkgPM):
             bb.note(cmd)
             output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
+            failed_pkgs = []
+            for line in output.split('\n'):
+                if line.endswith("configuration required on target."):
+                    bb.warn(line)
+                    failed_pkgs.append(line.split(".")[0])
+            if failed_pkgs:
+                failed_postinsts_warn(failed_pkgs, self.d.expand("${T}/log.do_rootfs"))
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
@@ -1435,9 +1446,10 @@ class DpkgPM(OpkgDpkgPM):
                                 stderr=subprocess.STDOUT).decode("utf-8")
                         bb.note(output)
                     except subprocess.CalledProcessError as e:
-                        bb.note("%s for package %s failed with %d:\n%s" %
+                        bb.warn("%s for package %s failed with %d:\n%s" %
                                 (control_script.name, pkg_name, e.returncode,
                                     e.output.decode("utf-8")))
+                        failed_postinsts_warn([pkg_name], self.d.expand("${T}/log.do_rootfs"))
                         failed_pkgs.append(pkg_name)
                         break
 
-- 
2.16.1



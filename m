Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0510F74928
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 15:51:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 08:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,401,1517904000"; d="scan'208";a="39069223"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2018 08:51:55 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 18:45:21 +0300
Message-Id: <20180403154524.31588-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
References: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/8] package_manager.py: do not hardcode the task name when referring to log files
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
X-List-Received-Date: Tue, 03 Apr 2018 15:51:55 -0000

This can be do_rootfs or do_populate_sdk, or anything else.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6c85a6d2c78..840a7bc34c5 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -392,7 +392,7 @@ class PackageManager(object, metaclass=ABCMeta):
                 output = subprocess.check_output(script_full, stderr=subprocess.STDOUT)
                 if output: bb.note(output.decode("utf-8"))
             except subprocess.CalledProcessError as e:
-                bb.warn("The postinstall intercept hook '%s' failed, details in log.do_rootfs" % script)
+                bb.warn("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
                 bb.note("Exit code %d. Output:\n%s" % (e.returncode, e.output.decode("utf-8")))
                 self._postpone_to_first_boot(script_full)
 
@@ -789,7 +789,7 @@ class RpmPM(PackageManager):
                 failed_scriptlets_pkgnames[line.split()[-1]] = True
 
         if len(failed_scriptlets_pkgnames) > 0:
-            failed_postinsts_warn(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_rootfs"))
+            failed_postinsts_warn(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
         for pkg in failed_scriptlets_pkgnames.keys():
             self.save_rpmpostinst(pkg)
 
@@ -1265,7 +1265,7 @@ class OpkgPM(OpkgDpkgPM):
                     bb.warn(line)
                     failed_pkgs.append(line.split(".")[0])
             if failed_pkgs:
-                failed_postinsts_warn(failed_pkgs, self.d.expand("${T}/log.do_rootfs"))
+                failed_postinsts_warn(failed_pkgs, self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
@@ -1530,7 +1530,7 @@ class DpkgPM(OpkgDpkgPM):
                         bb.warn("%s for package %s failed with %d:\n%s" %
                                 (control_script.name, pkg_name, e.returncode,
                                     e.output.decode("utf-8")))
-                        failed_postinsts_warn([pkg_name], self.d.expand("${T}/log.do_rootfs"))
+                        failed_postinsts_warn([pkg_name], self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
                         failed_pkgs.append(pkg_name)
                         break
 
-- 
2.16.1



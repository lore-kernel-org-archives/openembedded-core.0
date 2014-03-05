Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A419D6BFA9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 12:39:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2014 04:39:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,592,1389772800"; d="scan'208";a="494441764"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2014 04:39:45 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 14:39:40 +0200
Message-Id: <81c080b0f74e7195514d45554767eb52d3036080.1394023121.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394023121.git.laurentiu.palcu@intel.com>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1394023121.git.laurentiu.palcu@intel.com>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/3] package_manager.py: make list_installed() list pkg dependencies too
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
X-List-Received-Date: Wed, 05 Mar 2014 12:39:48 -0000

list_installed("deps") will now return the package dependencies.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/package_manager.py |   31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index ff4f1de..f2c88bb 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -765,7 +765,22 @@ class RpmPM(PackageManager):
                             self.image_rpmlib,
                             symlinks=True)
 
+    def _list_pkg_deps(self):
+        cmd = [bb.utils.which(os.getenv('PATH'), "rpmresolve"),
+               "-t", self.image_rpmlib]
+
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the package dependencies. Command '%s' "
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
+
+        return output
+
     def list_installed(self, format=None):
+        if format == "deps":
+            return self._list_pkg_deps()
+
         cmd = self.rpm_cmd + ' --root ' + self.target_rootfs
         cmd += ' -D "_dbpath /var/lib/rpm" -qa'
         cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
@@ -1131,6 +1146,9 @@ class OpkgPM(PackageManager):
         elif format == "ver":
             cmd = "%s %s status | %s -v" % \
                 (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
+        elif format == "deps":
+            cmd = "%s %s status | %s" % \
+                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
         else:
             cmd = "%s %s list_installed | cut -d' ' -f1" % \
                 (self.opkg_cmd, self.opkg_args)
@@ -1494,6 +1512,8 @@ class DpkgPM(PackageManager):
             cmd.append("-f=${Package} ${Package}_${Version}_${Architecture}.deb ${PackageArch}\n")
         elif format == "ver":
             cmd.append("-f=${Package} ${PackageArch} ${Version}\n")
+        elif format == "deps":
+            cmd.append("-f=Package: ${Package}\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n")
         else:
             cmd.append("-f=${Package}\n")
 
@@ -1514,6 +1534,17 @@ class DpkgPM(PackageManager):
                     tmp_output += "%s %s %s\n" % (pkg, pkg_file, pkg_arch)
 
             output = tmp_output
+        elif format == "deps":
+            opkg_query_cmd = bb.utils.which(os.getenv('PATH'), "opkg-query-helper.py")
+
+            try:
+                output = subprocess.check_output("echo -e '%s' | %s" %
+                                                 (output, opkg_query_cmd),
+                                                 stderr=subprocess.STDOUT,
+                                                 shell=True)
+            except subprocess.CalledProcessError as e:
+                bb.fatal("Cannot compute packages dependencies. Command '%s' "
+                         "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
 
         return output
 
-- 
1.7.9.5



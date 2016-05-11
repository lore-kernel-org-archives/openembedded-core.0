Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 75C0C72DC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 20:36:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2016 13:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="951263734"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 11 May 2016 13:36:20 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 12:31:58 +0000
Message-Id: <1c3ceaa93f95993002acd3ce3e1a07bea1ffd6b1.1462969737.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1462969737.git.mariano.lopez@linux.intel.com>
References: <cover.1462969737.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1462969737.git.mariano.lopez@linux.intel.com>
References: <cover.1462969737.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 3/3] package_manager.py: Add extract() method for RPM package manager
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
X-List-Received-Date: Wed, 11 May 2016 20:36:19 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This new method extract the content of RPM file to a tmpdir,
without actually installing the package.

[YOCTO #9569]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 80 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 0830da9..d95564a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1404,6 +1404,86 @@ class RpmPM(PackageManager):
         for f in rpm_db_locks:
             bb.utils.remove(f, True)
 
+    """
+    Returns a dictionary with the package info.
+    """
+    def package_info(self, pkg):
+        cmd = "%s %s info --urls %s" % (self.smart_cmd, self.smart_opt, pkg)
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to list available packages. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        #Parse output
+        for line in output.splitlines():
+            line = line.rstrip()
+            if line.startswith("Name:"):
+                pkg = line.split(": ")[1]
+            elif line.startswith("Version:"):
+                tmp_str = line.split(": ")[1]
+                ver, arch = tmp_str.split("@")
+                break
+
+        # Get filename
+        index = re.search("^URLs", output, re.MULTILINE)
+        tmp_str = output[index.end():]
+        for line in tmp_str.splitlines():
+            if "/" in line:
+                line = line.lstrip()
+                filename = line.split(" ")[0]
+                break
+
+        # To have the same data type than other package_info methods
+        pkg_dict = {}
+        pkg_dict[pkg] = {"arch":arch, "ver":ver, "filename":filename}
+
+        return pkg_dict
+
+    """
+    Returns the path to a tmpdir where resides the contents of a package.
+
+    Deleting the tmpdir is responsability of the caller.
+
+    """
+    def extract(self, pkg):
+        pkg_info = self.package_info(pkg)
+        if not pkg_info:
+            bb.fatal("Unable to get information for package '%s' while "
+                     "trying to extract the package."  % pkg)
+
+        pkg_arch = pkg_info[pkg]["arch"]
+        pkg_filename = pkg_info[pkg]["filename"]
+        pkg_path = os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
+
+        cpio_cmd = bb.utils.which(os.getenv("PATH"), "cpio")
+        rpm2cpio_cmd = bb.utils.which(os.getenv("PATH"), "rpm2cpio")
+
+        if not os.path.isfile(pkg_path):
+            bb.fatal("Unable to extract package for '%s'."
+                     "File %s doesn't exists" % (pkg, pkg_path))
+
+        tmp_dir = tempfile.mkdtemp()
+        current_dir = os.getcwd()
+        os.chdir(tmp_dir)
+
+        try:
+            cmd = "%s %s | %s -idmv" % (rpm2cpio_cmd, pkg_path, cpio_cmd)
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s" % (pkg_path, cmd, e.returncode, e.output))
+        except OSError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s at %s" % (pkg_path, cmd, e.errno, e.strerror, e.filename))
+
+        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
+        os.chdir(current_dir)
+
+        return tmp_dir
+
 
 class OpkgDpkgPM(PackageManager):
     """
-- 
2.6.6



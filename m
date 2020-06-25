Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.7634.1593080526167583199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=bOvTWazA;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7823; q=dns/txt; s=axis-central1;
  t=1593080531; x=1624616531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7xpMeIJ/IebwEo6Z1fY8ve0OXZQ+rlFNHYh15gLWxqw=;
  b=bOvTWazA7PoWQQ8+jB/mHSRiPdTOBlKpbpbUqp6kI/nZ8YQIulx6iFhA
   +xbTYOz6ByiL6fBhsANnpcz3m2DxRA5Xq3jVHJU+3PpVpUUM5FKU13p/r
   K3Y2ph8bh1owKtEA1Qm8FpYrHx3ZuYsypwKHa8Juf7vFWV9Y+vv1eA59Z
   MlCDYkj3kgCXKoM+s0c4ngnWU+ReIGzDa2RICVHAh8IhdQrwqx4wZSoRB
   LiuigpMxiqB2RiOprOoJ5dQyZlpfWkpTe3QwG5UL5IXo1FeUIEdzU6tqJ
   a3/HMn9QSMpTfXdjWZ0Yh3rDo9DBnfIrr+a1W31bnyWakyIlp+DHOZ4ot
   Q==;
IronPort-SDR: kLnyD4LggNdLXNIXmNEH+IP9kvZJcu65s50aisos2zzbzdmhHpW8MAW8ghiW6EJxkhND+BJmWB
 FuOrt6HFCnHJ6JJpBzb8urmnfCji3EShMaiS9+Uxaz5dFeZnmjxDoNDZ5uMJZ6Mf183CYUZIzK
 JufF4GgZFQ3gheta3/QLwX/UlfW0J6ZSvQg7fgQoBq3oipCa9aJ/Qs6MWU6auVz34FVn9u/hxu
 nBFamDTN3kfw1H+jInUEUKPCsOwbSR+gXL9+Q2wobH+WjCLsN2g4KA34bSl1bsgqP+c8TlF2Se
 mCI=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893890"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 25/26] package_manager.py: Move DpkgPkgsList
Date: Thu, 25 Jun 2020 12:21:44 +0200
Message-ID: <20200625102145.7139-26-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the code that is only used by dpkg package manager live in that
package manager owned directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager.py                | 79 -------------------
 .../package_managers/deb/package_manager.py   | 79 +++++++++++++++++++
 meta/lib/oe/rootfs.py                         |  1 +
 meta/lib/oe/sdk.py                            |  1 +
 4 files changed, 81 insertions(+), 79 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e4528144b6..437bbf1115 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -27,67 +27,6 @@ def create_index(arg):
     if result:
         bb.note(result)
 
-def opkg_query(cmd_output):
-    """
-    This method parse the output from the package managerand return
-    a dictionary with the information of the packages. This is used
-    when the packages are in deb or ipk format.
-    """
-    verregex = re.compile(r' \([=<>]* [^ )]*\)')
-    output = dict()
-    pkg = ""
-    arch = ""
-    ver = ""
-    filename = ""
-    dep = []
-    prov = []
-    pkgarch = ""
-    for line in cmd_output.splitlines()+['']:
-        line = line.rstrip()
-        if ':' in line:
-            if line.startswith("Package: "):
-                pkg = line.split(": ")[1]
-            elif line.startswith("Architecture: "):
-                arch = line.split(": ")[1]
-            elif line.startswith("Version: "):
-                ver = line.split(": ")[1]
-            elif line.startswith("File: ") or line.startswith("Filename:"):
-                filename = line.split(": ")[1]
-                if "/" in filename:
-                    filename = os.path.basename(filename)
-            elif line.startswith("Depends: "):
-                depends = verregex.sub('', line.split(": ")[1])
-                for depend in depends.split(", "):
-                    dep.append(depend)
-            elif line.startswith("Recommends: "):
-                recommends = verregex.sub('', line.split(": ")[1])
-                for recommend in recommends.split(", "):
-                    dep.append("%s [REC]" % recommend)
-            elif line.startswith("PackageArch: "):
-                pkgarch = line.split(": ")[1]
-            elif line.startswith("Provides: "):
-                provides = verregex.sub('', line.split(": ")[1])
-                for provide in provides.split(", "):
-                    prov.append(provide)
-
-        # When there is a blank line save the package information
-        elif not line:
-            # IPK doesn't include the filename
-            if not filename:
-                filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
-            if pkg:
-                output[pkg] = {"arch":arch, "ver":ver,
-                        "filename":filename, "deps": dep, "pkgarch":pkgarch, "provs": prov}
-            pkg = ""
-            arch = ""
-            ver = ""
-            filename = ""
-            dep = []
-            prov = []
-            pkgarch = ""
-
-    return output
-
 def failed_postinsts_abort(pkgs, log_path):
     bb.fatal("""Postinstall scriptlets of %s have failed. If the intention is to defer them to first boot,
 then please place them into pkg_postinst_ontarget_${PN} ().
@@ -158,24 +97,6 @@ class PkgsList(object, metaclass=ABCMeta):
     def list_pkgs(self):
         pass
 
-class DpkgPkgsList(PkgsList):
-
-    def list_pkgs(self):
-        cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
-               "--admindir=%s/var/lib/dpkg" % self.rootfs_dir,
-               "-W"]
-
-        cmd.append("-f=Package: ${Package}\nArchitecture: ${PackageArch}\nVersion: ${Version}\nFile: ${Package}_${Version}_${Architecture}.deb\nDepends: ${Depends}\nRecommends: ${Recommends}\nProvides: ${Provides}\n\n")
-
-        try:
-            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-
-        return opkg_query(cmd_output)
-
-
 class PackageManager(object, metaclass=ABCMeta):
     """
     This is an abstract class. Do not instantiate this directly.
diff --git a/meta/lib/oe/package_managers/deb/package_manager.py b/meta/lib/oe/package_managers/deb/package_manager.py
index 0dc4004f66..0ef8e91eea 100644
--- a/meta/lib/oe/package_managers/deb/package_manager.py
+++ b/meta/lib/oe/package_managers/deb/package_manager.py
@@ -477,4 +477,83 @@ class PkgIndexer(Indexer):
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             raise NotImplementedError('Package feed signing not implementd for dpkg')
 
+def opkg_query(cmd_output):
+    """
+    This method parse the output from the package managerand return
+    a dictionary with the information of the packages. This is used
+    when the packages are in deb or ipk format.
+    """
+    verregex = re.compile(r' \([=<>]* [^ )]*\)')
+    output = dict()
+    pkg = ""
+    arch = ""
+    ver = ""
+    filename = ""
+    dep = []
+    prov = []
+    pkgarch = ""
+    for line in cmd_output.splitlines()+['']:
+        line = line.rstrip()
+        if ':' in line:
+            if line.startswith("Package: "):
+                pkg = line.split(": ")[1]
+            elif line.startswith("Architecture: "):
+                arch = line.split(": ")[1]
+            elif line.startswith("Version: "):
+                ver = line.split(": ")[1]
+            elif line.startswith("File: ") or line.startswith("Filename:"):
+                filename = line.split(": ")[1]
+                if "/" in filename:
+                    filename = os.path.basename(filename)
+            elif line.startswith("Depends: "):
+                depends = verregex.sub('', line.split(": ")[1])
+                for depend in depends.split(", "):
+                    dep.append(depend)
+            elif line.startswith("Recommends: "):
+                recommends = verregex.sub('', line.split(": ")[1])
+                for recommend in recommends.split(", "):
+                    dep.append("%s [REC]" % recommend)
+            elif line.startswith("PackageArch: "):
+                pkgarch = line.split(": ")[1]
+            elif line.startswith("Provides: "):
+                provides = verregex.sub('', line.split(": ")[1])
+                for provide in provides.split(", "):
+                    prov.append(provide)
+
+        # When there is a blank line save the package information
+        elif not line:
+            # IPK doesn't include the filename
+            if not filename:
+                filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
+            if pkg:
+                output[pkg] = {"arch":arch, "ver":ver,
+                        "filename":filename, "deps": dep, "pkgarch":pkgarch, "provs": prov}
+            pkg = ""
+            arch = ""
+            ver = ""
+            filename = ""
+            dep = []
+            prov = []
+            pkgarch = ""
+
+    return output
+
+class DpkgPkgsList(PkgsList):
+
+    def list_pkgs(self):
+        cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
+               "--admindir=%s/var/lib/dpkg" % self.rootfs_dir,
+               "-W"]
+
+        cmd.append("-f=Package: ${Package}\nArchitecture: ${PackageArch}\nVersion: ${Version}\nFile: ${Package}_${Version}_${Architecture}.deb\nDepends: ${Depends}\nRecommends: ${Recommends}\nProvides: ${Provides}\n\n")
+
+        try:
+            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the installed packages list. Command '%s' "
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+
+        return opkg_query(cmd_output)
+
+
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 739471657a..b71c93cf54 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -373,6 +373,7 @@ def image_list_installed_packages(d, rootfs_dir=None):
     img_type = d.getVar('IMAGE_PKGTYPE')
     from oe.package_managers.rpm.package_manager import RpmPkgsList
     from oe.package_managers.ipk.package_manager import OpkgPkgsList
+    from oe.package_managers.deb.package_manager import DpkgPkgsList
     if img_type == "rpm":
         return RpmPkgsList(d, rootfs_dir).list_pkgs()
     elif img_type == "ipk":
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index e7f7f3f87c..1fac0bed5b 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -118,6 +118,7 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
 
     from oe.package_managers.rpm.package_manager import RpmPkgsList
     from oe.package_managers.ipk.package_manager import OpkgPkgsList
+    from oe.package_managers.deb.package_manager import DpkgPkgsList
     img_type = d.getVar('IMAGE_PKGTYPE')
     if img_type == "rpm":
         arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
-- 
2.20.1


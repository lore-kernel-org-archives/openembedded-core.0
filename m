Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.7635.1593080531229462406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=oybeRtMF;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=6313; q=dns/txt; s=axis-central1;
  t=1593080533; x=1624616533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tuU7vmGlT9IKUNSaiEbizyb5yG1yI2qs1A4CQZx8LR0=;
  b=oybeRtMFMSDQsEXOHTBblPfSyyBHMp5Z0wDfOfo61I9dq6v7kU5ie0dv
   PZYY/0via+WmiKUqgFAsNyCTkqAf4pk7t1NxoCz/v6z2iZ8JJVxJ3mwKb
   SiO/L9wtS7vG0h9YsgYRX5leWjo/qvItyoYplGn3/vL4RxTEQLX4PE+sT
   yvMPVuFIfTSMFglcw75FbxZ4TwXXXBrfcFL3UKT2wvLp7yJEuk8zmnYsi
   mj8pok59cVJOcZJy9Xz1g59lct3+AfT0i6xWe9cs8keQ/upAii3Lrw0NB
   rE8G/J3NiCWuYx5N+xQR3WBwqY004K4QTEcdcXDCbrr5cDcLDbpyjii1M
   A==;
IronPort-SDR: 4kJ67/p6rKhjzWNQPqLl1NqvSSdA8PvCd7/0u1zFTh5H7aaFkYJmso22SlrI8jsFyC4obuxHeu
 mOuFaDJY6pH/VYOJAvvT4QCo2gUg2+KPV/m7uMx9f382VFNBPM8VfODMxhP0VM3WvyTFlXZvh3
 ynzYk5n5lVakI/DaNeOTnO2vvJGIhHKnLqOEit/xWAYtM4NK8Mxr2R5V4o4VSuW3Gd2o2ei0L3
 6Ciz+oZvZpRKS9fYP855/qJkC0OqGd9vfQtv3qKEDqykoBHoS71etA5UagvGHSMXQ9WswNSe6q
 5UY=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185341"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, "Fredrik
 Gustafsson" <fredrigu@axis.com>
Subject: [PATCH v2 24/26] package_manager.py: Move OpkgPkgsList
Date: Thu, 25 Jun 2020 12:21:43 +0200
Message-ID: <20200625102145.7139-25-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the code that is only used by opkg package manager live in that
package manager owned directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager.py                | 27 ------
 .../package_managers/ipk/package_manager.py   | 85 +++++++++++++++++++
 meta/lib/oe/rootfs.py                         |  1 +
 meta/lib/oe/sdk.py                            |  1 +
 4 files changed, 87 insertions(+), 27 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 20c3400def..e4528144b6 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -158,33 +158,6 @@ class PkgsList(object, metaclass=ABCMeta):
     def list_pkgs(self):
         pass
 
-class OpkgPkgsList(PkgsList):
-    def __init__(self, d, rootfs_dir, config_file):
-        super(OpkgPkgsList, self).__init__(d, rootfs_dir)
-
-        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
-        self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
-        self.opkg_args += self.d.getVar("OPKG_ARGS")
-
-    def list_pkgs(self, format=None):
-        cmd = "%s %s status" % (self.opkg_cmd, self.opkg_args)
-
-        # opkg returns success even when it printed some
-        # "Collected errors:" report to stderr. Mixing stderr into
-        # stdout then leads to random failures later on when
-        # parsing the output. To avoid this we need to collect both
-        # output streams separately and check for empty stderr.
-        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
-        cmd_output, cmd_stderr = p.communicate()
-        cmd_output = cmd_output.decode("utf-8")
-        cmd_stderr = cmd_stderr.decode("utf-8")
-        if p.returncode or cmd_stderr:
-            bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d and stderr:\n%s" % (cmd, p.returncode, cmd_stderr))
-
-        return opkg_query(cmd_output)
-
-
 class DpkgPkgsList(PkgsList):
 
     def list_pkgs(self):
diff --git a/meta/lib/oe/package_managers/ipk/package_manager.py b/meta/lib/oe/package_managers/ipk/package_manager.py
index 133af27182..8e47003c93 100644
--- a/meta/lib/oe/package_managers/ipk/package_manager.py
+++ b/meta/lib/oe/package_managers/ipk/package_manager.py
@@ -478,4 +478,89 @@ class PkgIndexer(Indexer):
                                    self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
                                    armor=is_ascii_sig)
 
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
+class OpkgPkgsList(PkgsList):
+    def __init__(self, d, rootfs_dir, config_file):
+        super(OpkgPkgsList, self).__init__(d, rootfs_dir)
 
+        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
+        self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
+        self.opkg_args += self.d.getVar("OPKG_ARGS")
+
+    def list_pkgs(self, format=None):
+        cmd = "%s %s status" % (self.opkg_cmd, self.opkg_args)
+
+        # opkg returns success even when it printed some
+        # "Collected errors:" report to stderr. Mixing stderr into
+        # stdout then leads to random failures later on when
+        # parsing the output. To avoid this we need to collect both
+        # output streams separately and check for empty stderr.
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
+        cmd_output, cmd_stderr = p.communicate()
+        cmd_output = cmd_output.decode("utf-8")
+        cmd_stderr = cmd_stderr.decode("utf-8")
+        if p.returncode or cmd_stderr:
+            bb.fatal("Cannot get the installed packages list. Command '%s' "
+                     "returned %d and stderr:\n%s" % (cmd, p.returncode, cmd_stderr))
+
+        return opkg_query(cmd_output)
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b9891455fb..739471657a 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -372,6 +372,7 @@ def image_list_installed_packages(d, rootfs_dir=None):
 
     img_type = d.getVar('IMAGE_PKGTYPE')
     from oe.package_managers.rpm.package_manager import RpmPkgsList
+    from oe.package_managers.ipk.package_manager import OpkgPkgsList
     if img_type == "rpm":
         return RpmPkgsList(d, rootfs_dir).list_pkgs()
     elif img_type == "ipk":
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 619ab57caf..e7f7f3f87c 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -117,6 +117,7 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
         rootfs_dir = [sdk_output, os.path.join(sdk_output, target_path)][target is True]
 
     from oe.package_managers.rpm.package_manager import RpmPkgsList
+    from oe.package_managers.ipk.package_manager import OpkgPkgsList
     img_type = d.getVar('IMAGE_PKGTYPE')
     if img_type == "rpm":
         arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
-- 
2.20.1


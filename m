Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.17474.1599562400059578026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 03:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kN1VcYRL;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=17912; q=dns/txt; s=axis-central1;
  t=1599562400; x=1631098400;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PNwuRqFsku5EfhrmuUpO9L07YGTVxMXChS33/81STvQ=;
  b=kN1VcYRLS9lLe7jC3IqYzDYUWNqpJCjf5YX0JYsPcPS8ER1inmStfUOW
   y2eFbw0TaD5gPBVMkWW6n5NqKZk38vYcdRKEiuJnYoOjo/NJTB6CTevY8
   WQPU6XSn7fbSe8i5ZITrf7WYoWJ7djUUscuh/6s0zAjkF4q8IZdP5stzZ
   wT+sHTsvFWWNuhlLEddcfmye7SMbpkMCttlV8M4sAa2u2UTNm8MRWym7z
   h9xa9lumWSL9F5WF2dSRjsOtal5WqixjYUkvYSULiXypwYSrwNphDLyXy
   OpDmCMeqV2C7pivOVHThZENDHfEcf8N4ylOx4o8q7sPEMo2l1LW1fjwOM
   g==;
IronPort-SDR: EEtSrCTzoYV105iYPUf/iygloQ4pYogDbTeJohkU2U0bpOs91oETTIWsqCfkgLMwMp4BPEKtUD
 QV2mta/N8aZwPVnEXN1+7U2DGTAcfWKrNPuMOE8M+CeA4RSoamp/7m2joKs3fSJTurnxIjVBqn
 saZ0S5EthHrPNIqGfJ6jBhWFRrmg9a83hymzU9sUfTVQXCSg5uJgAGHs75kRHODUBtptAprhQA
 h4diKAK1BrZ0PjrkyP+dWy+d6771yFYS+K+FEFwjh6G9KeiF0avLEY/+R83XhcieM+JcGwnGm5
 xPo=
X-IronPort-AV: E=Sophos;i="5.76,405,1592863200"; 
   d="scan'208";a="12658661"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <fredrigu@axis.com>
CC: <openembedded-core@lists.openembedded.org>,
	<tools-cfpbuild-internal@axis.com>
Subject: [PATCH] package management: Allow dynamic loading of PM
Date: Tue, 8 Sep 2020 12:53:07 +0200
Message-ID: <20200908105307.5033-1-fredrigu@axis.com>
X-Mailer: git-send-email 2.28.0.394.ge197136389
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Dynamic loading of package managers will allow other layers to simply
add their package manager code in package_manager/ and have bitbake find
it according to the package manager configuration. This is useful for
adding new (faster) package managers to Open Embedded while not increasing the
test scope or require Open Embedded to support more package managers.

How this is tested:
* Build core-image-minimal with all three package managers
* Build the sdk with all three package managers. dpkg fails, but
  it fails on master as well.
* Run the complete test suite, all tests passed except 16
* Run those 16 tests on master and verify that they fail there as well
* Fix errors making tests works on master but not with this patch.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/manifest.py                     | 10 ++----
 meta/lib/oe/package_manager/deb/__init__.py |  4 +--
 meta/lib/oe/package_manager/deb/manifest.py |  2 +-
 meta/lib/oe/package_manager/deb/rootfs.py   |  8 ++---
 meta/lib/oe/package_manager/deb/sdk.py      | 10 +++---
 meta/lib/oe/package_manager/ipk/__init__.py |  9 +++---
 meta/lib/oe/package_manager/ipk/manifest.py |  2 +-
 meta/lib/oe/package_manager/ipk/rootfs.py   |  8 ++---
 meta/lib/oe/package_manager/ipk/sdk.py      | 10 +++---
 meta/lib/oe/package_manager/rpm/__init__.py |  2 +-
 meta/lib/oe/package_manager/rpm/manifest.py |  2 +-
 meta/lib/oe/package_manager/rpm/rootfs.py   |  8 ++---
 meta/lib/oe/package_manager/rpm/sdk.py      | 10 +++---
 meta/lib/oe/rootfs.py                       | 36 ++++++---------------
 meta/lib/oe/sdk.py                          | 27 ++++------------
 15 files changed, 55 insertions(+), 93 deletions(-)

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 47bd622412..1a058dcd73 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -191,14 +191,8 @@ class Manifest(object, metaclass=ABCMeta):
 
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
-    from oe.package_manager.rpm.manifest import RpmManifest
-    from oe.package_manager.ipk.manifest import OpkgManifest
-    from oe.package_manager.deb.manifest import DpkgManifest
-    manifest_map = {'rpm': RpmManifest,
-                    'ipk': OpkgManifest,
-                    'deb': DpkgManifest}
-
-    manifest = manifest_map[d.getVar('IMAGE_PKGTYPE')](d, manifest_dir, manifest_type)
+    import importlib
+    manifest = importlib.import_module('oe.package_manager.' + d.getVar('IMAGE_PKGTYPE') + '.manifest').PkgManifest(d, manifest_dir, manifest_type)
 
     if final_manifest:
         manifest.create_final()
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 72155b178c..67c241a6f6 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -79,7 +79,7 @@ class DpkgIndexer(Indexer):
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             raise NotImplementedError('Package feed signing not implementd for dpkg')
 
-class DpkgPkgsList(PkgsList):
+class PMPkgsList(PkgsList):
 
     def list_pkgs(self):
         cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
@@ -459,7 +459,7 @@ class DpkgPM(OpkgDpkgPM):
                      "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
     def list_installed(self):
-        return DpkgPkgsList(self.d, self.target_rootfs).list_pkgs()
+        return PMPkgsList(self.d, self.target_rootfs).list_pkgs()
 
     def package_info(self, pkg):
         """
diff --git a/meta/lib/oe/package_manager/deb/manifest.py b/meta/lib/oe/package_manager/deb/manifest.py
index 0b12036644..d8eab24a06 100644
--- a/meta/lib/oe/package_manager/deb/manifest.py
+++ b/meta/lib/oe/package_manager/deb/manifest.py
@@ -4,7 +4,7 @@
 
 from oe.manifest import Manifest
 
-class DpkgManifest(Manifest):
+class PkgManifest(Manifest):
     def create_initial(self):
         with open(self.initial_manifest, "w+") as manifest:
             manifest.write(self.initial_manifest_file_header)
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index 819f67eda5..8fbaca11d6 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -7,7 +7,7 @@ import shutil
 from oe.rootfs import Rootfs
 from oe.manifest import Manifest
 from oe.utils import execute_pre_post_process
-from oe.package_manager.deb.manifest import DpkgManifest
+from oe.package_manager.deb.manifest import PkgManifest
 from oe.package_manager.deb import DpkgPM
 
 class DpkgOpkgRootfs(Rootfs):
@@ -120,9 +120,9 @@ class DpkgOpkgRootfs(Rootfs):
 
             num += 1
 
-class DpkgRootfs(DpkgOpkgRootfs):
+class PkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(DpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '^E:'
         self.log_check_expected_regexes = \
         [
@@ -131,7 +131,7 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
         bb.utils.remove(self.image_rootfs, True)
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
-        self.manifest = DpkgManifest(d, manifest_dir)
+        self.manifest = PkgManifest(d, manifest_dir)
         self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
                          d.getVar('PACKAGE_ARCHS'),
                          d.getVar('DPKG_ARCH'))
diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index b25eb70b00..9859d8f32d 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -8,19 +8,19 @@ from oe.utils import execute_pre_post_process
 from oe.sdk import Sdk
 from oe.manifest import Manifest
 from oe.package_manager.deb import DpkgPM
+from oe.package_manager.deb.manifest import PkgManifest
 
-class DpkgSdk(Sdk):
+class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
-        super(DpkgSdk, self).__init__(d, manifest_dir)
+        super(PkgSdk, self).__init__(d, manifest_dir)
 
         self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
         self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
 
-        from oe.package_manager.deb.manifest import DpkgManifest
 
-        self.target_manifest = DpkgManifest(d, self.manifest_dir,
+        self.target_manifest = PkgManifest(d, self.manifest_dir,
                                             Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = DpkgManifest(d, self.manifest_dir,
+        self.host_manifest = PkgManifest(d, self.manifest_dir,
                                           Manifest.MANIFEST_TYPE_SDK_HOST)
 
         deb_repo_workdir = "oe-sdk-repo"
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 9603993a59..416ed23d47 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -59,9 +59,10 @@ class OpkgIndexer(Indexer):
                                    self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
                                    armor=is_ascii_sig)
 
-class OpkgPkgsList(PkgsList):
-    def __init__(self, d, rootfs_dir, config_file):
-        super(OpkgPkgsList, self).__init__(d, rootfs_dir)
+class PMPkgsList(PkgsList):
+    def __init__(self, d, rootfs_dir):
+        super(PMPkgsList, self).__init__(d, rootfs_dir)
+        config_file = d.getVar("IPKGCONF_TARGET")
 
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
         self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
@@ -416,7 +417,7 @@ class OpkgPM(OpkgDpkgPM):
             bb.utils.remove(os.path.join(self.opkg_dir, "lists"), True)
 
     def list_installed(self):
-        return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
+        return PMPkgsList(self.d, self.target_rootfs).list_pkgs()
 
     def dummy_install(self, pkgs):
         """
diff --git a/meta/lib/oe/package_manager/ipk/manifest.py b/meta/lib/oe/package_manager/ipk/manifest.py
index 69676903ab..ee4b57bcb0 100644
--- a/meta/lib/oe/package_manager/ipk/manifest.py
+++ b/meta/lib/oe/package_manager/ipk/manifest.py
@@ -4,7 +4,7 @@
 
 from oe.manifest import Manifest
 
-class OpkgManifest(Manifest):
+class PkgManifest(Manifest):
     """
     Returns a dictionary object with mip and mlp packages.
     """
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index 63b4a59c40..26dbee6f6a 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -8,7 +8,7 @@ import shutil
 from oe.rootfs import Rootfs
 from oe.manifest import Manifest
 from oe.utils import execute_pre_post_process
-from oe.package_manager.ipk.manifest import OpkgManifest
+from oe.package_manager.ipk.manifest import PkgManifest
 from oe.package_manager.ipk import OpkgPM
 
 class DpkgOpkgRootfs(Rootfs):
@@ -121,12 +121,12 @@ class DpkgOpkgRootfs(Rootfs):
 
             num += 1
 
-class OpkgRootfs(DpkgOpkgRootfs):
+class PkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '(exit 1|Collected errors)'
 
-        self.manifest = OpkgManifest(d, manifest_dir)
+        self.manifest = PkgManifest(d, manifest_dir)
         self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
         self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
 
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index 47c0a92c1b..37af0344eb 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -6,20 +6,20 @@ import glob
 import shutil
 from oe.utils import execute_pre_post_process
 from oe.sdk import Sdk
+from oe.package_manager.ipk.manifest import PkgManifest
 from oe.manifest import Manifest
 from oe.package_manager.ipk import OpkgPM
 
-class OpkgSdk(Sdk):
+class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
-        super(OpkgSdk, self).__init__(d, manifest_dir)
+        super(PkgSdk, self).__init__(d, manifest_dir)
 
         self.target_conf = self.d.getVar("IPKGCONF_TARGET")
         self.host_conf = self.d.getVar("IPKGCONF_SDK")
 
-        from oe.package_manager.ipk.manifest import OpkgManifest
-        self.target_manifest = OpkgManifest(d, self.manifest_dir,
+        self.target_manifest = PkgManifest(d, self.manifest_dir,
                                             Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = OpkgManifest(d, self.manifest_dir,
+        self.host_manifest = PkgManifest(d, self.manifest_dir,
                                           Manifest.MANIFEST_TYPE_SDK_HOST)
 
         ipk_repo_workdir = "oe-sdk-repo"
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index c91f61ae5c..898184442f 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -43,7 +43,7 @@ class RpmSubdirIndexer(RpmIndexer):
                         self.do_write_index(dir_path)
 
 
-class RpmPkgsList(PkgsList):
+class PMPkgsList(PkgsList):
     def list_pkgs(self):
         return RpmPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
 
diff --git a/meta/lib/oe/package_manager/rpm/manifest.py b/meta/lib/oe/package_manager/rpm/manifest.py
index a75f6bdabf..e6604b301f 100644
--- a/meta/lib/oe/package_manager/rpm/manifest.py
+++ b/meta/lib/oe/package_manager/rpm/manifest.py
@@ -4,7 +4,7 @@
 
 from oe.manifest import Manifest
 
-class RpmManifest(Manifest):
+class PkgManifest(Manifest):
     """
     Returns a dictionary object with mip and mlp packages.
     """
diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index 2de5752b91..00d07cd9cc 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -5,17 +5,17 @@
 from oe.rootfs import Rootfs
 from oe.manifest import Manifest
 from oe.utils import execute_pre_post_process
-from oe.package_manager.rpm.manifest import RpmManifest
+from oe.package_manager.rpm.manifest import PkgManifest
 from oe.package_manager.rpm import RpmPM
 
-class RpmRootfs(Rootfs):
+class PkgRootfs(Rootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
                                r'|exit 1|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
 
-        self.manifest = RpmManifest(d, manifest_dir)
+        self.manifest = PkgManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
                         d.getVar('IMAGE_ROOTFS'),
diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index b14b155a85..c5f232431f 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -6,16 +6,16 @@ import glob
 from oe.utils import execute_pre_post_process
 from oe.sdk import Sdk
 from oe.manifest import Manifest
+from oe.package_manager.rpm.manifest import PkgManifest
 from oe.package_manager.rpm import RpmPM
 
-class RpmSdk(Sdk):
+class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
-        super(RpmSdk, self).__init__(d, manifest_dir)
+        super(PkgSdk, self).__init__(d, manifest_dir)
 
-        from oe.package_manager.rpm.manifest import RpmManifest
-        self.target_manifest = RpmManifest(d, self.manifest_dir,
+        self.target_manifest = PkgManifest(d, self.manifest_dir,
                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = RpmManifest(d, self.manifest_dir,
+        self.host_manifest = PkgManifest(d, self.manifest_dir,
                                          Manifest.MANIFEST_TYPE_SDK_HOST)
 
         rpm_repo_workdir = "oe-sdk-repo"
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 3813f68e8b..ac300828a1 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -10,12 +10,6 @@ import shutil
 import os
 import subprocess
 import re
-from oe.package_manager.rpm.manifest import RpmManifest
-from oe.package_manager.ipk.manifest import OpkgManifest
-from oe.package_manager.deb.manifest import DpkgManifest
-from oe.package_manager.rpm import RpmPkgsList
-from oe.package_manager.ipk import OpkgPkgsList
-from oe.package_manager.deb import DpkgPkgsList
 
 class Rootfs(object, metaclass=ABCMeta):
     """
@@ -358,12 +352,9 @@ class Rootfs(object, metaclass=ABCMeta):
 
 
 def get_class_for_type(imgtype):
-    from oe.package_manager.rpm.rootfs import RpmRootfs
-    from oe.package_manager.ipk.rootfs import OpkgRootfs
-    from oe.package_manager.deb.rootfs import DpkgRootfs
-    return {"rpm": RpmRootfs,
-            "ipk": OpkgRootfs,
-            "deb": DpkgRootfs}[imgtype]
+    import importlib
+    mod = importlib.import_module('oe.package_manager.' + imgtype + '.rootfs')
+    return mod.PkgRootfs
 
 def variable_depends(d, manifest_dir=None):
     img_type = d.getVar('IMAGE_PKGTYPE')
@@ -373,17 +364,10 @@ def variable_depends(d, manifest_dir=None):
 def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None):
     env_bkp = os.environ.copy()
 
-    from oe.package_manager.rpm.rootfs import RpmRootfs
-    from oe.package_manager.ipk.rootfs import OpkgRootfs
-    from oe.package_manager.deb.rootfs import DpkgRootfs
     img_type = d.getVar('IMAGE_PKGTYPE')
-    if img_type == "rpm":
-        RpmRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
-    elif img_type == "ipk":
-        OpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
-    elif img_type == "deb":
-        DpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
 
+    cls = get_class_for_type(img_type)
+    cls(d, manifest_dir, progress_reporter, logcatcher).create()
     os.environ.clear()
     os.environ.update(env_bkp)
 
@@ -393,12 +377,10 @@ def image_list_installed_packages(d, rootfs_dir=None):
         rootfs_dir = d.getVar('IMAGE_ROOTFS')
 
     img_type = d.getVar('IMAGE_PKGTYPE')
-    if img_type == "rpm":
-        return RpmPkgsList(d, rootfs_dir).list_pkgs()
-    elif img_type == "ipk":
-        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET")).list_pkgs()
-    elif img_type == "deb":
-        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
+
+    import importlib
+    cls = importlib.import_module('oe.package_manager.' + img_type)
+    return cls.PMPkgsList(d, rootfs_dir).list_pkgs()
 
 if __name__ == "__main__":
     """
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index fdcadcb8de..37b59afd1a 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -115,33 +115,18 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
 
         rootfs_dir = [sdk_output, os.path.join(sdk_output, target_path)][target is True]
 
-    from oe.package_manager.rpm import RpmPkgsList
-    from oe.package_manager.ipk import OpkgPkgsList
-    from oe.package_manager.deb import DpkgPkgsList
     img_type = d.getVar('IMAGE_PKGTYPE')
-    if img_type == "rpm":
-        arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
-        os_var = ["SDK_OS", None][target is True]
-        return RpmPkgsList(d, rootfs_dir).list_pkgs()
-    elif img_type == "ipk":
-        conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is True]
-        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var)).list_pkgs()
-    elif img_type == "deb":
-        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
+    import importlib
+    cls = importlib.import_module('oe.package_manager.' + img_type)
+    return cls.PMPkgsList(d, rootfs_dir).list_pkgs()
 
 def populate_sdk(d, manifest_dir=None):
     env_bkp = os.environ.copy()
 
     img_type = d.getVar('IMAGE_PKGTYPE')
-    from oe.package_manager.rpm.sdk import RpmSdk
-    from oe.package_manager.ipk.sdk import OpkgSdk
-    from oe.package_manager.deb.sdk import DpkgSdk
-    if img_type == "rpm":
-        RpmSdk(d, manifest_dir).populate()
-    elif img_type == "ipk":
-        OpkgSdk(d, manifest_dir).populate()
-    elif img_type == "deb":
-        DpkgSdk(d, manifest_dir).populate()
+    import importlib
+    cls = importlib.import_module('oe.package_manager.' + img_type + '.sdk')
+    cls.PkgSdk(d, manifest_dir).populate()
 
     os.environ.clear()
     os.environ.update(env_bkp)
-- 
2.20.1


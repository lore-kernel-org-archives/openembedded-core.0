Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE4836EE8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 07:07:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1K776PG023686
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Feb 2014 23:07:06 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 19 Feb 2014 23:07:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2014 15:06:51 +0800
Message-ID: <754f90d6ffc10d27c5a9249837f2527f8bb44b68.1392877826.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392877826.git.hongxu.jia@windriver.com>
References: <cover.1392877826.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/5] manifest.py: add create_full for OpkgManifest class
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
X-List-Received-Date: Thu, 20 Feb 2014 07:07:07 -0000
Content-Type: text/plain

The function create_full creates the manifest after the package in
initial manifest has been dummy installed. It lists all *to be
installed* packages. There is no real installation, just a test.

[YOCTO #1894]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/manifest.py | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index a4bc04b..6e40a9f 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -1,6 +1,8 @@
 from abc import ABCMeta, abstractmethod
+from oe.package_manager import *
 import os
 import re
+import bb
 
 
 class Manifest(object):
@@ -69,6 +71,7 @@ class Manifest(object):
 
         self.initial_manifest = os.path.join(self.manifest_dir, "%s_initial_manifest" % manifest_type)
         self.final_manifest = os.path.join(self.manifest_dir, "%s_final_manifest" % manifest_type)
+        self.full_manifest = os.path.join(self.manifest_dir, "%s_full_manifest" % manifest_type)
 
         # packages in the following vars will be split in 'must install' and
         # 'multilib'
@@ -128,6 +131,15 @@ class Manifest(object):
         pass
 
     """
+    This creates the manifest after the package in initial manifest has been
+    dummy installed. It lists all *to be installed* packages. There is no real
+    installation, just a test.
+    """
+    @abstractmethod
+    def create_full(self):
+        pass
+
+    """
     The following function parses an initial manifest and returns a dictionary
     object with the must install, attempt only, multilib and language packages.
     """
@@ -158,6 +170,22 @@ class Manifest(object):
 
         return pkgs
 
+    '''
+    This following function parses a full manifest and return a list
+    object with packages.
+    '''
+    def parse_full_manifest(self):
+        installed_pkgs = list()
+        if not os.path.exists(self.full_manifest):
+            bb.note('full manifest not exist')
+            return installed_pkgs
+
+        with open(self.full_manifest, 'r') as manifest:
+            for pkg in manifest.read().split('\n'):
+                installed_pkgs.append(pkg.strip())
+
+        return installed_pkgs
+
 
 class RpmManifest(Manifest):
     """
@@ -202,10 +230,12 @@ class RpmManifest(Manifest):
                 for pkg in pkgs[pkg_type].split():
                     manifest.write("%s,%s\n" % (pkg_type, pkg))
 
-
     def create_final(self):
         pass
 
+    def create_full(self):
+        pass
+
 
 class OpkgManifest(Manifest):
     """
@@ -253,6 +283,36 @@ class OpkgManifest(Manifest):
     def create_final(self):
         pass
 
+    def create_full(self):
+        if not os.path.exists(self.initial_manifest):
+            self.create_initial()
+
+        initial_manifest = self.parse_initial_manifest()
+        pkgs_to_install = list()
+        for pkg_type in initial_manifest:
+            pkgs_to_install += initial_manifest[pkg_type]
+        if len(pkgs_to_install) == 0:
+            return
+
+        image_rootfs = self.d.expand("${T}/opkg")
+        opkg_conf = self.d.getVar("IPKGCONF_TARGET", True)
+        pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True)
+        pm = OpkgPM(self.d, image_rootfs, opkg_conf, pkg_archs)
+
+        pm.update()
+        pm.handle_bad_recommendations()
+        output = pm.dummy_install(pkgs_to_install)
+
+        with open(self.full_manifest, 'w+') as manifest:
+            pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
+            for line in set(output.split('\n')):
+                m = pkg_re.match(line)
+                if m:
+                    manifest.write(m.group(1) + '\n')
+
+        bb.utils.remove(image_rootfs, True)
+        return
+
 
 class DpkgManifest(Manifest):
     def create_initial(self):
@@ -272,6 +332,9 @@ class DpkgManifest(Manifest):
     def create_final(self):
         pass
 
+    def create_full(self):
+        pass
+
 
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
-- 
1.8.1.2



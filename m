Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C605A75794
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 21:57:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 14:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,418,1437462000"; d="scan'208";a="632871976"
Received: from afshjern.zpn.intel.com ([10.219.17.7])
	by orsmga003.jf.intel.com with ESMTP; 26 Aug 2015 14:57:04 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 16:57:34 -0500
Message-Id: <1440626255-29614-3-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 2/3] Empty image: package list splitting and iteration
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
X-List-Received-Date: Wed, 26 Aug 2015 21:57:06 -0000

A few short fixes to splitting/iteration done over package lists
in license.bbclass, package_manager.py and rootfs.py.

[YOCTO #7664]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/license.bbclass   | 2 +-
 meta/lib/oe/package_manager.py | 5 +++--
 meta/lib/oe/rootfs.py          | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 32e172a..c616a20 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -39,7 +39,7 @@ python license_create_manifest() {
         return 0
 
     pkg_dic = {}
-    for pkg in image_list_installed_packages(d).split("\n"):
+    for pkg in image_list_installed_packages(d).splitlines():
         pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
                                 'runtime-reverse', pkg)
         pkg_name = os.path.basename(os.readlink(pkg_info))
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2ab1d78..ef917f1 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -995,9 +995,10 @@ class RpmPM(PackageManager):
     '''
     def install(self, pkgs, attempt_only=False):
 
-        bb.note("Installing the following packages: %s" % ' '.join(pkgs))
-        if attempt_only and len(pkgs) == 0:
+        if not pkgs:
+            bb.note("There are no packages to install")
             return
+        bb.note("Installing the following packages: %s" % ' '.join(pkgs))
         pkgs = self._pkg_translate_oe_to_smart(pkgs, attempt_only)
 
         if not attempt_only:
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index f8cc6eb..0bfc217 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -235,7 +235,7 @@ class Rootfs(object):
                 installed_pkgs_dir = self.d.expand('${WORKDIR}/installed_pkgs.txt')
                 pkgs_to_remove = list()
                 with open(installed_pkgs_dir, "r+") as installed_pkgs:
-                    pkgs_installed = installed_pkgs.read().split('\n')
+                    pkgs_installed = installed_pkgs.read().splitlines()
                     for pkg_installed in pkgs_installed[:]:
                         pkg = pkg_installed.split()[0]
                         if pkg in ["update-rc.d",
-- 
2.5.0



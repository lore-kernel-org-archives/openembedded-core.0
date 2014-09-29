Return-Path: <anibal.ezau.limon.belmares@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 40209605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 19:28:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Sep 2014 12:28:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,622,1406617200"; d="scan'208";a="598428186"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.59])
	by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2014 12:27:47 -0700
From: Anibal Limon <anibal.ezau.limon.belmares@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Sep 2014 14:28:17 -0500
Message-Id: <1412018897-7327-1-git-send-email-anibal.ezau.limon.belmares@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] deb_packaging: Added support for multilib
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
X-List-Received-Date: Mon, 29 Sep 2014 19:28:12 -0000

The Package Manager implementation for deb didn't
take a look about multilib enabled variants.

Changes are made for generate apt.conf, sources.list and
debian repo index Release and Packages files.

[YOCTO #1502]

Signed-off-by: Anibal Limon <anibal.ezau.limon.belmares@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b3b3b2d..27fdf26 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -167,6 +167,9 @@ class DpkgIndexer(Indexer):
                 if a not in pkg_archs:
                     arch_list.append(a)
 
+        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
+        arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in arch_list)
+
         apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
         gzip = bb.utils.which(os.getenv('PATH'), "gzip")
 
@@ -1474,6 +1477,10 @@ class DpkgPM(PackageManager):
 
         self.apt_args = d.getVar("APT_ARGS", True)
 
+        self.all_arch_list = self.d.getVar('PACKAGE_ARCHS', True).split()
+        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
+        self.all_arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in self.all_arch_list)
+
         self._create_configs(archs, base_archs)
 
         self.indexer = DpkgIndexer(self.d, self.deploy_dir)
@@ -1631,8 +1638,8 @@ class DpkgPM(PackageManager):
         sources_conf = os.path.join("%s/etc/apt/sources.list"
                                     % self.target_rootfs)
         arch_list = []
-        archs = self.d.getVar('PACKAGE_ARCHS', True)
-        for arch in archs.split():
+
+        for arch in self.all_arch_list:
             if not os.path.exists(os.path.join(self.deploy_dir, arch)):
                 continue
             arch_list.append(arch)
@@ -1655,7 +1662,7 @@ class DpkgPM(PackageManager):
         bb.utils.mkdirhier(self.apt_conf_dir + "/apt.conf.d/")
 
         arch_list = []
-        for arch in archs.split():
+        for arch in self.all_arch_list:
             if not os.path.exists(os.path.join(self.deploy_dir, arch)):
                 continue
             arch_list.append(arch)
@@ -1684,15 +1691,25 @@ class DpkgPM(PackageManager):
                 sources_file.write("deb file:%s/ ./\n" %
                                    os.path.join(self.deploy_dir, arch))
 
+        base_arch_list = base_archs.split()
+        multilib_variants = self.d.getVar("MULTILIB_VARIANTS", True);
+        for variant in multilib_variants.split():
+            if variant == "lib32":
+                base_arch_list.append("i386")
+            elif variant == "lib64":
+                base_arch_list.append("amd64")
+
         with open(self.apt_conf_file, "w+") as apt_conf:
             with open(self.d.expand("${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample")) as apt_conf_sample:
                 for line in apt_conf_sample.read().split("\n"):
-                    line = re.sub("Architecture \".*\";",
-                                  "Architecture \"%s\";" % base_archs, line)
-                    line = re.sub("#ROOTFS#", self.target_rootfs, line)
-                    line = re.sub("#APTCONF#", self.apt_conf_dir, line)
-
-                    apt_conf.write(line + "\n")
+                    match_arch = re.match("  Architecture \".*\";$", line)
+                    if match_arch:
+                        for base_arch in base_arch_list:
+                            apt_conf.write("  Architecture \"%s\";\n" % base_arch)
+                    else:
+                        line = re.sub("#ROOTFS#", self.target_rootfs, line)
+                        line = re.sub("#APTCONF#", self.apt_conf_dir, line)
+                        apt_conf.write(line + "\n")
 
         target_dpkg_dir = "%s/var/lib/dpkg" % self.target_rootfs
         bb.utils.mkdirhier(os.path.join(target_dpkg_dir, "info"))
-- 
1.9.1



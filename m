Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D79BD78844
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 17:16:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6PHGY1T022552
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2018 10:16:34 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 25 Jul 2018 10:16:33 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <mark.hatle@windriver.com>
Date: Thu, 26 Jul 2018 00:41:07 +0800
Message-ID: <20180725164107.8891-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180725164107.8891-1-kai.kang@windriver.com>
References: <20180725164107.8891-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 2/2] WIP: install rdependent packages of allarch packages according to image rootfs
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
X-List-Received-Date: Wed, 25 Jul 2018 17:16:35 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add interface is_leaf to package managers. If any multilib variant of
package from 'ALLARCH_RDEP_PKGS' is installed to image rootfs, then
install the packages with 'BBEXTENDVARIANT' of current image and remove
the already installed package if not required by others and not add to
image intentionally.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/lib/oe/package_manager.py | 51 ++++++++++++++++++++++++++++++++--
 meta/lib/oe/rootfs.py          | 28 +++++++++++++++++++
 2 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 9aa5847c8a..eeaf297432 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -249,7 +249,7 @@ class DpkgIndexer(Indexer):
                 release.write("Label: %s\n" % arch)
 
             cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
-            
+
             index_cmds.append(cmd)
 
             deb_dirs_found = True
@@ -448,6 +448,13 @@ class PackageManager(object, metaclass=ABCMeta):
     def list_installed(self):
         pass
 
+    @abstractmethod
+    def is_leaf(self, pkg):
+        """
+        Whether pkg is required by other packages
+        """
+        pass
+
     @abstractmethod
     def extract(self, pkg):
         """
@@ -587,7 +594,7 @@ def create_packages_dir(d, rpm_repo_dir, deploydir, taskname, filterbydependenci
     pn = d.getVar("PN")
     seendirs = set()
     multilibs = {}
-   
+
     rpm_subrepo_dir = oe.path.join(rpm_repo_dir, "rpm")
 
     bb.utils.remove(rpm_subrepo_dir, recurse=True)
@@ -895,6 +902,20 @@ class RpmPM(PackageManager):
 
         return packages
 
+    def is_leaf(self, pkg):
+        if not pkg:
+            return False
+
+        cmd = bb.utils.which(os.getenv('PATH'), "rpm")
+        args = ["-q", "--whatrequires", "--root=%s" % self.target_rootfs]
+
+        bb.note("Running %s" % ' '.join([cmd] + args + [pkg]))
+        # return value 0 stands for other(s) require(s) pkg
+        if subprocess.call([cmd] + args + [pkg], shell=True):
+            return True
+        else:
+            return False
+
     def update(self):
         self._invoke_dnf(["makecache", "--refresh"])
 
@@ -1327,6 +1348,12 @@ class OpkgPM(OpkgDpkgPM):
     def list_installed(self):
         return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
 
+    def is_leaf(self, pkg):
+        if not pkg:
+            return False
+
+
+
     def handle_bad_recommendations(self):
         bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS") or ""
         if bad_recommendations.strip() == "":
@@ -1753,6 +1780,26 @@ class DpkgPM(OpkgDpkgPM):
     def list_installed(self):
         return DpkgPkgsList(self.d, self.target_rootfs).list_pkgs()
 
+    def is_leaf(self, pkg):
+        bb.warn("=====================in dpkg is_leaf()\n")
+        if not pkg:
+            return False
+
+        cmd = "%s rdepends %s" % (self.apt_cache_cmd, pkg)
+
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to list rdepends packages. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+
+        bb.warn(output)
+        bb.warn(len(output.split()))
+        if len(output.split()) > 2:
+            return False
+        else:
+            return True
+
     def package_info(self, pkg):
         """
         Returns a dictionary with the package info.
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 28642abbd9..54bde6798b 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -170,6 +170,7 @@ class Rootfs(object, metaclass=ABCMeta):
 
     def create(self):
         bb.note("###### Generate rootfs #######")
+        bb.warn(" in create ###### Generate rootfs #######")
         pre_process_cmds = self.d.getVar("ROOTFS_PREPROCESS_COMMAND")
         post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND")
         rootfs_post_install_cmds = self.d.getVar('ROOTFS_POSTINSTALL_COMMAND')
@@ -213,6 +214,9 @@ class Rootfs(object, metaclass=ABCMeta):
 
         self._uninstall_unneeded()
 
+        bb.warn("========= in rootfs() before self._fix_allarch_ml_rdeps\n")
+        self._fix_allarch_ml_rdeps()
+
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
@@ -279,6 +283,30 @@ class Rootfs(object, metaclass=ABCMeta):
             # Remove the package manager data files
             self.pm.remove_packaging_data()
 
+    def _fix_allarch_ml_rdeps(self):
+        variant = self.d.getVar("BBEXTENDVARIANT") or ""
+        ml_variants = self.d.getVar("MULTILIB_VARIANTS") or ""
+
+        packages = self.pm.list_installed()
+
+        pkg_to_remove = list()
+        bb.warn("======= in _fix_allarch_ml_rdeps \n")
+        for var in ml_variants.split():
+            for pkg in (self.d.getVar("ALLARCH_RDEP_PKGS") or "").split():
+                ml_pkg = pkg if var == variant else var + "-" + pkg
+                if ml_pkg in packages:
+                    cur_pkg = variant + "-" + pkg if variant else pkg
+                    if not cur_pkg in packages:
+                        self.pm.install([cur_pkg])
+                    if self.pm.is_leaf(ml_pkg) \
+                        and ml_pkg not in (self.d.getVar("IMAGE_INSTALL") or "").split():
+                        pkg_to_remove.append(ml_pkg)
+
+        bb.note("Following duplicated packages required by all arch packages \
+                will be removed: %s" % " ".join(pkg_to_remove))
+        self.pm.update()
+        self.pm.remove(pkg_to_remove)
+
     def _run_ldconfig(self):
         if self.d.getVar('LDCONFIGDEPEND'):
             bb.note("Executing: ldconfig -r" + self.image_rootfs + "-c new -v")
-- 
2.17.1



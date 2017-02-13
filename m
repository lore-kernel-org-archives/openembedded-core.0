Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB0B731CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:57 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546691"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:49 +0200
Message-Id: <d25c4bde8ce67e907848b8d09a199a2d041cbf5c.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/36] package_manager.py: improve the API for insert_feed_uris()
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:57 -0000

No need to store the configuration as class members,
just pass it directly into the method.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 41 ++++++++++++++++++++++-------------------
 meta/lib/oe/rootfs.py          |  5 ++++-
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f92f2b3304b..c5a9b3955a4 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -514,9 +514,6 @@ class PackageManager(object, metaclass=ABCMeta):
         self.d = d
         self.deploy_dir = None
         self.deploy_lock = None
-        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS') or ""
-        self.feed_base_paths = self.d.getVar('PACKAGE_FEED_BASE_PATHS') or ""
-        self.feed_archs = self.d.getVar('PACKAGE_FEED_ARCHS')
 
     """
     Update the package manager package database.
@@ -556,8 +553,14 @@ class PackageManager(object, metaclass=ABCMeta):
     def list_installed(self):
         pass
 
+    """
+    Add remote package feeds into repository manager configuration. The parameters
+    for the feeds are set by feed_uris, feed_base_paths and feed_archs.
+    See http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGE_FEED_URIS
+    for their description.
+    """
     @abstractmethod
-    def insert_feeds_uris(self):
+    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
         pass
 
     """
@@ -692,14 +695,14 @@ class RpmPM(PackageManager):
 
         self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
 
-    def insert_feeds_uris(self):
-        if self.feed_uris == "":
+    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
+        if feed_uris == "":
             return
 
         arch_list = []
-        if self.feed_archs is not None:
+        if feed_archs is not None:
             # User define feed architectures
-            arch_list = self.feed_archs.split()
+            arch_list = feed_archs.split()
         else:
             # List must be prefered to least preferred order
             default_platform_extra = list()
@@ -722,7 +725,7 @@ class RpmPM(PackageManager):
                     continue
                 arch_list.append(arch)
 
-        feed_uris = self.construct_uris(self.feed_uris.split(), self.feed_base_paths.split())
+        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
 
         uri_iterator = 0
         channel_priority = 10 + 5 * len(feed_uris) * (len(arch_list) if arch_list else 1)
@@ -1708,22 +1711,22 @@ class OpkgPM(OpkgDpkgPM):
                 config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
                 config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
 
-    def insert_feeds_uris(self):
-        if self.feed_uris == "":
+    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
+        if feed_uris == "":
             return
 
         rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
                                   % self.target_rootfs)
 
-        feed_uris = self.construct_uris(self.feed_uris.split(), self.feed_base_paths.split())
-        archs = self.pkg_archs.split() if self.feed_archs is None else self.feed_archs.split()
+        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
+        archs = self.pkg_archs.split() if feed_archs is None else feed_archs.split()
 
         with open(rootfs_config, "w+") as config_file:
             uri_iterator = 0
             for uri in feed_uris:
                 if archs:
                     for arch in archs:
-                        if (self.feed_archs is None) and (not os.path.exists(os.path.join(self.deploy_dir, arch))):
+                        if (feed_archs is None) and (not os.path.exists(os.path.join(self.deploy_dir, arch))):
                             continue
                         bb.note('Adding opkg feed url-%s-%d (%s)' %
                             (arch, uri_iterator, uri))
@@ -2112,23 +2115,23 @@ class DpkgPM(OpkgDpkgPM):
         if result is not None:
             bb.fatal(result)
 
-    def insert_feeds_uris(self):
-        if self.feed_uris == "":
+    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
+        if feed_uris == "":
             return
 
         sources_conf = os.path.join("%s/etc/apt/sources.list"
                                     % self.target_rootfs)
         arch_list = []
 
-        if self.feed_archs is None:
+        if feed_archs is None:
             for arch in self.all_arch_list:
                 if not os.path.exists(os.path.join(self.deploy_dir, arch)):
                     continue
                 arch_list.append(arch)
         else:
-            arch_list = self.feed_archs.split()
+            arch_list = feed_archs.split()
 
-        feed_uris = self.construct_uris(self.feed_uris.split(), self.feed_base_paths.split())
+        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
 
         with open(sources_conf, "w+") as sources_file:
             for uri in feed_uris:
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9c8a0ebb7e3..c8ab421fe21 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -87,7 +87,10 @@ class Rootfs(object, metaclass=ABCMeta):
     def _insert_feed_uris(self):
         if bb.utils.contains("IMAGE_FEATURES", "package-management",
                          True, False, self.d):
-            self.pm.insert_feeds_uris()
+            self.pm.insert_feeds_uris(self.d.getVar('PACKAGE_FEED_URIS') or "",
+                self.d.getVar('PACKAGE_FEED_BASE_PATHS') or "",
+                self.d.getVar('PACKAGE_FEED_ARCHS'))
+
 
     @abstractmethod
     def _handle_intercept_failure(self, failed_script):
-- 
2.11.0



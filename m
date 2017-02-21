Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE0D572F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 06:48:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875729"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:46 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:35 +0200
Message-Id: <fd8c1591a43b9ec1bed058656c740d209c62f014.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 18/39] package_manager.py: improve the API for insert_feed_uris()
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
X-List-Received-Date: Tue, 21 Feb 2017 14:48:55 -0000

No need to store the configuration as class members,
just pass it directly into the method.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 41 ++++++++++++++++++++++-------------------
 meta/lib/oe/rootfs.py          |  5 ++++-
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 79f0a8b9f1b..725997ce334 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -513,9 +513,6 @@ class PackageManager(object, metaclass=ABCMeta):
         self.d = d
         self.deploy_dir = None
         self.deploy_lock = None
-        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS') or ""
-        self.feed_base_paths = self.d.getVar('PACKAGE_FEED_BASE_PATHS') or ""
-        self.feed_archs = self.d.getVar('PACKAGE_FEED_ARCHS')
 
     """
     Update the package manager package database.
@@ -555,8 +552,14 @@ class PackageManager(object, metaclass=ABCMeta):
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
@@ -691,14 +694,14 @@ class RpmPM(PackageManager):
 
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
@@ -721,7 +724,7 @@ class RpmPM(PackageManager):
                     continue
                 arch_list.append(arch)
 
-        feed_uris = self.construct_uris(self.feed_uris.split(), self.feed_base_paths.split())
+        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
 
         uri_iterator = 0
         channel_priority = 10 + 5 * len(feed_uris) * (len(arch_list) if arch_list else 1)
@@ -1707,22 +1710,22 @@ class OpkgPM(OpkgDpkgPM):
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
@@ -2111,23 +2114,23 @@ class DpkgPM(OpkgDpkgPM):
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



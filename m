Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 962FE762A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 21:20:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 05 Oct 2015 14:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,640,1437462000"; d="scan'208";a="574693629"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Oct 2015 14:20:13 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 13:12:23 +0000
Message-Id: <1444050743-6411-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: paul.eggleton@linux.intel.com, srifenbark@gmail.com
Subject: [PATCH] lib/oe/package_manager: Introducing PACKAGE_FEED_BASE_PATHS/PACKAGE_FEED_ARCHS
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
X-List-Received-Date: Mon, 05 Oct 2015 21:20:16 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The recently introduced PACKAGE_FEED_PREFIX is not flexible enough for
constructing URIs, because the same PREFIX is used for all PACKAGE_FEED_URIS.
Also, the string 'PREFIX' is confusing because it is not at the beginning of
the URI. The variable PACKAGE_FEED_BASE_PATHS replaces PACKAGE_FEED_PREFIX,
allowing multiple base paths to be appended on each PACKAGE_FEED_URIS. In the
other hand, a new variable called PACKAGE_FEED_ARCHS, similar in concept to
PACKAGE_BASE_PATHS, defines package architectures defined by the user.

To demonstrate the usage of the PACKAGE_FEED_URIS, PACKAGE_FEED_BASE_PATHS and
PACKAGE_FEED_ARCHS, let's assume these variables are set on local.conf

    PACKAGE_FEED_URIS = "https://example.com/packagerepos/release \
                         https://example.com/packagerepos/updates"
    PACKAGE_FEED_BASE_PATHS = "rpm rpm-dev"
    PACKAGE_FEED_ARCHS = "all core2-64"

the resulting feeds would be

    https://example.com/packagerepos/release/rpm/all
    https://example.com/packagerepos/release/rpm/core2-64
    https://example.com/packagerepos/release/rpm-dev/all
    https://example.com/packagerepos/release/rpm-dev/core2-64
    https://example.com/packagerepos/updates/rpm/all
    https://example.com/packagerepos/updates/rpm/core2-64
    https://example.com/packagerepos/updates/rpm-dev/all
    https://example.com/packagerepos/updates/rpm-dev/core2-64

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 154 ++++++++++++++++++++++++++---------------
 1 file changed, 99 insertions(+), 55 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 630b957..e182027 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -8,7 +8,7 @@ import re
 import bb
 import tempfile
 import oe.utils
-
+import string
 
 # this can be used by all PM backends to create the index files in parallel
 def create_index(arg):
@@ -522,7 +522,8 @@ class PackageManager(object):
         self.deploy_dir = None
         self.deploy_lock = None
         self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True) or ""
-        self.feed_prefix = self.d.getVar('PACKAGE_FEED_PREFIX', True) or ""
+        self.feed_base_paths = self.d.getVar('PACKAGE_FEED_BASE_PATHS', True) or ""
+        self.feed_archs = self.d.getVar('PACKAGE_FEED_ARCHS', True)
 
     """
     Update the package manager package database.
@@ -629,6 +630,25 @@ class PackageManager(object):
 
         self.deploy_lock = None
 
+    """
+    Construct URIs based on the following pattern: uri/base_path where 'uri'
+    and 'base_path' correspond to each element of the corresponding array
+    argument leading to len(uris) x len(base_paths) elements on the returned
+    array
+    """
+    def construct_uris(self, uris, base_paths):
+        def _append(arr1, arr2, sep='/'):
+            res = []
+            narr1 = map(lambda a: string.rstrip(a, sep), arr1)
+            narr2 = map(lambda a: string.lstrip(string.rstrip(a, sep), sep), arr2)
+            for a1 in narr1:
+                if arr2:
+                    for a2 in narr2:
+                        res.append("%s%s%s" % (a1, sep, a2))
+                else:
+                    res.append(a1)
+            return res
+        return _append(uris, base_paths)
 
 class RpmPM(PackageManager):
     def __init__(self,
@@ -672,42 +692,55 @@ class RpmPM(PackageManager):
         if self.feed_uris == "":
             return
 
-        # List must be prefered to least preferred order
-        default_platform_extra = set()
-        platform_extra = set()
-        bbextendvariant = self.d.getVar('BBEXTENDVARIANT', True) or ""
-        for mlib in self.ml_os_list:
-            for arch in self.ml_prefix_list[mlib]:
-                plt = arch.replace('-', '_') + '-.*-' + self.ml_os_list[mlib]
-                if mlib == bbextendvariant:
-                        default_platform_extra.add(plt)
-                else:
-                        platform_extra.add(plt)
+        arch_list = []
+        if self.feed_archs is not None:
+            # User define feed architectures
+            arch_list = self.feed_archs.split()
+        else:
+            # List must be prefered to least preferred order
+            default_platform_extra = set()
+            platform_extra = set()
+            bbextendvariant = self.d.getVar('BBEXTENDVARIANT', True) or ""
+            for mlib in self.ml_os_list:
+                for arch in self.ml_prefix_list[mlib]:
+                    plt = arch.replace('-', '_') + '-.*-' + self.ml_os_list[mlib]
+                    if mlib == bbextendvariant:
+                            default_platform_extra.add(plt)
+                    else:
+                            platform_extra.add(plt)
 
-        platform_extra = platform_extra.union(default_platform_extra)
+            platform_extra = platform_extra.union(default_platform_extra)
 
-        arch_list = []
-        for canonical_arch in platform_extra:
-            arch = canonical_arch.split('-')[0]
-            if not os.path.exists(os.path.join(self.deploy_dir, arch)):
-                continue
-            arch_list.append(arch)
+            for canonical_arch in platform_extra:
+                arch = canonical_arch.split('-')[0]
+                if not os.path.exists(os.path.join(self.deploy_dir, arch)):
+                    continue
+                arch_list.append(arch)
+
+        feed_uris = self.construct_uris(self.feed_uris.split(), self.feed_base_paths.split())
 
         uri_iterator = 0
-        channel_priority = 10 + 5 * len(self.feed_uris.split()) * len(arch_list)
+        channel_priority = 10 + 5 * len(feed_uris) * (len(arch_list) if arch_list else 1)
 
-        for uri in self.feed_uris.split():
-            full_uri = uri
-            if self.feed_prefix:
-                full_uri = os.path.join(uri, self.feed_prefix)
-            for arch in arch_list:
-                bb.note('Note: adding Smart channel url%d%s (%s)' %
-                        (uri_iterator, arch, channel_priority))
-                self._invoke_smart('channel --add url%d-%s type=rpm-md baseurl=%s/%s -y'
-                                   % (uri_iterator, arch, full_uri, arch))
-                self._invoke_smart('channel --set url%d-%s priority=%d' %
-                                   (uri_iterator, arch, channel_priority))
+        for uri in feed_uris:
+            if arch_list:
+                for arch in arch_list:
+                    bb.note('Note: adding Smart channel url%d%s (%s)' %
+                            (uri_iterator, arch, channel_priority))
+                    self._invoke_smart('channel --add url%d-%s type=rpm-md baseurl=%s/%s -y'
+                                       % (uri_iterator, arch, uri, arch))
+                    self._invoke_smart('channel --set url%d-%s priority=%d' %
+                                       (uri_iterator, arch, channel_priority))
+                    channel_priority -= 5
+            else:
+                bb.note('Note: adding Smart channel url%d (%s)' %
+                        (uri_iterator, channel_priority))
+                self._invoke_smart('channel --add url%d type=rpm-md baseurl=%s -y'
+                                   % (uri_iterator, uri))
+                self._invoke_smart('channel --set url%d priority=%d' %
+                                   (uri_iterator, channel_priority))
                 channel_priority -= 5
+
             uri_iterator += 1
 
     '''
@@ -1480,21 +1513,26 @@ class OpkgPM(PackageManager):
         rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
                                   % self.target_rootfs)
 
+        feed_uris = self.construct_uris(self.feed_uris.split(), self.feed_base_paths.split())
+        archs = self.pkg_archs.split() if self.feed_archs is None else self.feed_archs.split()
+
         with open(rootfs_config, "w+") as config_file:
             uri_iterator = 0
-            for uri in self.feed_uris.split():
-                full_uri = uri
-                if self.feed_prefix:
-                    full_uri = os.path.join(uri, self.feed_prefix)
-
-                for arch in self.pkg_archs.split():
-                    if not os.path.exists(os.path.join(self.deploy_dir, arch)):
-                        continue
-                    bb.note('Note: adding opkg feed url-%s-%d (%s)' %
-                        (arch, uri_iterator, full_uri))
+            for uri in feed_uris:
+                if archs:
+                    for arch in archs:
+                        if (self.feed_archs is None) and (not os.path.exists(os.path.join(self.deploy_dir, arch))):
+                            continue
+                        bb.note('Note: adding opkg feed url-%s-%d (%s)' %
+                            (arch, uri_iterator, uri))
+                        config_file.write("src/gz uri-%s-%d %s/%s\n" %
+                                          (arch, uri_iterator, uri, arch))
+                else:
+                    bb.note('Note: adding opkg feed url-%d (%s)' %
+                        (uri_iterator, uri))
+                    config_file.write("src/gz uri-%d %s\n" %
+                                      (uri_iterator, uri))
 
-                    config_file.write("src/gz uri-%s-%d %s/%s\n" %
-                                      (arch, uri_iterator, full_uri, arch))
                 uri_iterator += 1
 
     def update(self):
@@ -1840,20 +1878,26 @@ class DpkgPM(PackageManager):
                                     % self.target_rootfs)
         arch_list = []
 
-        for arch in self.all_arch_list:
-            if not os.path.exists(os.path.join(self.deploy_dir, arch)):
-                continue
-            arch_list.append(arch)
+        if self.feed_archs is None:
+            for arch in self.all_arch_list:
+                if not os.path.exists(os.path.join(self.deploy_dir, arch)):
+                    continue
+                arch_list.append(arch)
+        else:
+            arch_list = self.feed_archs.split()
+
+        feed_uris = self.construct_uris(self.feed_uris.split(), self.feed_base_paths.split())
 
         with open(sources_conf, "w+") as sources_file:
-            for uri in self.feed_uris.split():
-                full_uri = uri
-                if self.feed_prefix:
-                    full_uri = os.path.join(uri, self.feed_prefix)
-                for arch in arch_list:
+            for uri in feed_uris:
+                if arch_list:
+                    for arch in arch_list:
+                        bb.note('Note: adding dpkg channel at (%s)' % uri)
+                        sources_file.write("deb %s/%s ./\n" %
+                                           (uri, arch))
+                else:
                     bb.note('Note: adding dpkg channel at (%s)' % uri)
-                    sources_file.write("deb %s/%s ./\n" %
-                                       (full_uri, arch))
+                    sources_file.write("deb %s ./\n" % uri)
 
     def _create_configs(self, archs, base_archs):
         base_archs = re.sub("_", "-", base_archs)
-- 
1.8.4.5



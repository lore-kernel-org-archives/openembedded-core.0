Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8902276978
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 21:09:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Aug 2015 14:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,655,1432623600"; d="scan'208";a="782222796"
Received: from lsandov1-mobl-linux.zpn.intel.com ([10.219.5.141])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2015 14:08:30 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 16:09:28 -0500
Message-Id: <1439327368-2796-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] lib/oe/package_manager: Include PACKAGE_FEED_PREFIX instead of hardcode paths
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
X-List-Received-Date: Tue, 11 Aug 2015 21:09:09 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Instead of hardcode paths (/rpm/, /ipk/, /deb/), use a user-defined prefix
when creating the URI feeds. URIs now will have the following syntax:

    PACKAGE_FEED_URIS_1/PACKAGE_FEED_PREFIX
    PACKAGE_FEED_URIS_2/PACKAGE_FEED_PREFIX
    .

where PACKAGE_FEED_URIS = "PACKAGE_FEED_URIS_1 PACKAGE_FEED_URIS_2 ...."

[YOCTO #5407]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oe/package_manager.py |   28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 55b8ab0..7a85816 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -488,6 +488,7 @@ class PackageManager(object):
         self.deploy_dir = None
         self.deploy_lock = None
         self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True) or ""
+        self.feed_prefix = self.d.getVar('PACKAGE_FEED_PREFIX', True) or ""
 
     """
     Update the package manager package database.
@@ -662,11 +663,14 @@ class RpmPM(PackageManager):
         channel_priority = 10 + 5 * len(self.feed_uris.split()) * len(arch_list)
 
         for uri in self.feed_uris.split():
+            full_uri = uri
+            if self.feed_prefix:
+                full_uri = os.path.join(uri, self.feed_prefix)
             for arch in arch_list:
                 bb.note('Note: adding Smart channel url%d%s (%s)' %
                         (uri_iterator, arch, channel_priority))
-                self._invoke_smart('channel --add url%d-%s type=rpm-md baseurl=%s/rpm/%s -y'
-                                   % (uri_iterator, arch, uri, arch))
+                self._invoke_smart('channel --add url%d-%s type=rpm-md baseurl=%s/%s -y'
+                                   % (uri_iterator, arch, full_uri, arch))
                 self._invoke_smart('channel --set url%d-%s priority=%d' %
                                    (uri_iterator, arch, channel_priority))
                 channel_priority -= 5
@@ -1343,17 +1347,20 @@ class OpkgPM(PackageManager):
         with open(rootfs_config, "w+") as config_file:
             uri_iterator = 0
             for uri in self.feed_uris.split():
-                config_file.write("src/gz url-%d %s/ipk\n" %
-                                  (uri_iterator, uri))
+                full_uri = uri
+                if self.feed_prefix:
+                    full_uri = os.path.join(uri, self.feed_prefix)
+                config_file.write("src/gz url-%d %s\n" %
+                                  (uri_iterator, full_uri))
 
                 for arch in self.pkg_archs.split():
                     if not os.path.exists(os.path.join(self.deploy_dir, arch)):
                         continue
                     bb.note('Note: adding opkg channel url-%s-%d (%s)' %
-                        (arch, uri_iterator, uri))
+                            (arch, uri_iterator, full_uri))
 
-                    config_file.write("src/gz uri-%s-%d %s/ipk/%s\n" %
-                                      (arch, uri_iterator, uri, arch))
+                    config_file.write("src/gz uri-%s-%d %s/%s\n" %
+                                      (arch, uri_iterator, full_uri, arch))
                 uri_iterator += 1
 
     def update(self):
@@ -1706,10 +1713,13 @@ class DpkgPM(PackageManager):
 
         with open(sources_conf, "w+") as sources_file:
             for uri in self.feed_uris.split():
+                full_uri = uri
+                if self.feed_prefix:
+                    full_uri = os.path.join(uri, self.feed_prefix)
                 for arch in arch_list:
                     bb.note('Note: adding dpkg channel at (%s)' % uri)
-                    sources_file.write("deb %s/deb/%s ./\n" %
-                                       (uri, arch))
+                    sources_file.write("deb %s/%s ./\n" %
+                                       (full_uri, arch))
 
     def _create_configs(self, archs, base_archs):
         base_archs = re.sub("_", "-", base_archs)
-- 
1.7.10.4



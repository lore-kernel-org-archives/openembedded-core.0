Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 06F9A6F17C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:05:07 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id n15so1672587lbi.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 06:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=PmNnacn36dapT6qzKO5ORfKcxlm/8+kZxfKVBuHJUwQ=;
	b=gcyMKjwQCK1QOGQmtKRx2a+9Rd1dASUcv+ZpUfvbD7+knI9+GiqcY95Slh4F/2+qID
	QHb1P2g/3JOWuJwHgQNNxM9sIdCyau74/4UKyO+hD4zRc8VSHQeQ49GnQEeSI5jl6rIB
	titWuxnZfqz5hw3rqnJhUH7piYvCxKZpgE1hbj18Q4cI//61TG7RgIHR5dWvdhyiyYYU
	fKOU05MP+rOn5GdC2GKOpRAK9OySaGiInyZbF+Jq8lxFWq463IlklH2O5sNTR0mvHUz/
	2oRe7Z7qXTVsG3AVg3b6cX+vwX1wqPNxhej5mojyDZtpGqWmgMikNiu6TYwjRVKjcIn/
	qr3g==
X-Received: by 10.152.234.3 with SMTP id ua3mr1537173lac.63.1393509908257;
	Thu, 27 Feb 2014 06:05:08 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id q6sm7823555lal.3.2014.02.27.06.05.06
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 06:05:07 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 8B8ED1C6043; Thu, 27 Feb 2014 15:05:00 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 15:04:55 +0100
Message-Id: <1393509895-6236-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [RFC][PATCH] Attempt to unify predefined package feed handling
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
X-List-Received-Date: Thu, 27 Feb 2014 14:05:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

local.conf defines 
PACKAGE_FEED_URIS = "http://www.feed_repo.org/repo/"

should we do it this way or some other way ?

[Bug 5407]



Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/lib/oe/package_manager.py | 76 +++++++++++++++++++++++++++++++++++++++++-
 meta/lib/oe/rootfs.py          | 15 +++++++--
 2 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index d29adac..d4050c6 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -223,6 +223,7 @@ class PackageManager(object):
         self.d = d
         self.deploy_dir = None
         self.deploy_lock = None
+        self.feed_uris = None
 
     """
     Update the package manager package database.
@@ -262,6 +263,10 @@ class PackageManager(object):
     def list_installed(self, format=None):
         pass
 
+    @abstractmethod
+    def insert_feeds_uris(self):
+        pass
+
     """
     Install complementary packages based upon the list of currently installed
     packages e.g. locales, *-dev, *-dbg, etc. This will only attempt to install
@@ -339,6 +344,7 @@ class RpmPM(PackageManager):
         self.providename = providename
         self.fullpkglist = list()
         self.deploy_dir = self.d.getVar('DEPLOY_DIR_RPM', True)
+        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True)
         self.etcrpm_dir = os.path.join(self.target_rootfs, "etc/rpm")
         self.install_dir = os.path.join(self.target_rootfs, "install")
         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
@@ -358,6 +364,41 @@ class RpmPM(PackageManager):
 
         self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
 
+
+    def insert_feeds_uris(self):
+        # List must be prefered to least preferred order
+        channel_priority = 5
+        default_platform_extra = set()
+        platform_extra = set()
+        bbextendvariant = self.d.getVar('BBEXTENDVARIANT', True) or ""
+        for mlib in self.ml_os_list:
+            for arch in self.ml_prefix_list[mlib]:
+                plt = arch.replace('-', '_') + '-.*-' + self.ml_os_list[mlib]
+                if mlib == bbextendvariant:
+                        default_platform_extra.add(plt)
+                else:
+                        platform_extra.add(plt)
+                channel_priority += 5
+
+        platform_extra = platform_extra.union(default_platform_extra)
+
+        for uri in self.feed_uris.split():
+            channel_priority *= 2
+            uri_iterator = 0
+            for canonical_arch in platform_extra:
+                arch = canonical_arch.split('-')[0]
+                if arch == "noarch" or arch == "any":
+                    continue
+
+                bb.note('Note: adding Smart channel url%d%s (%s)' %
+                        (uri_iterator, arch, channel_priority))
+                self._invoke_smart('channel --add url%d-%s type=rpm-md baseurl=%s/rpm/%s -y'
+                                   % (uri_iterator, arch, uri, arch))
+                self._invoke_smart('channel --set url%d-%s priority=%d' %
+                                   (uri_iterator, arch, channel_priority))
+                channel_priority -= 5
+            uri_iterator += 1
+
     '''
     Create configs for rpm and smart, and multilib is supported
     '''
@@ -944,7 +985,7 @@ class OpkgPM(PackageManager):
 
         self.deploy_dir = self.d.getVar("DEPLOY_DIR_IPK", True)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
-
+        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True)
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg-cl")
         self.opkg_args = "-f %s -o %s " % (self.config_file, target_rootfs)
         self.opkg_args += self.d.getVar("OPKG_ARGS", True)
@@ -1050,6 +1091,24 @@ class OpkgPM(PackageManager):
                     config_file.write("src oe-%s file:%s\n" %
                                       (arch, pkgs_dir))
 
+    def insert_feeds_uris(self):
+        rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
+                                  % self.target_rootfs)
+
+        with open(rootfs_config, "w+") as config_file:
+            priority = 5
+            uri_iterator = 0
+            for uri in self.feed_uris.split():
+                config_file.write("src/gz url-%d %s/ipk\n" %
+                                  (uri_iterator, uri))
+
+                for arch in self.pkg_archs.split():
+                    if arch == "noarch" or arch == "any":
+                        continue
+                    config_file.write("src/gz uri-%s-%d %s/ipk/%s\n" %
+                                      (arch, uri_iterator, uri, arch))
+                uri_iterator += 1
+
     def update(self):
         self.deploy_dir_lock()
 
@@ -1250,6 +1309,7 @@ class DpkgPM(PackageManager):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None):
         super(DpkgPM, self).__init__(d)
         self.target_rootfs = target_rootfs
+        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True)
         self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB', True)
         if apt_conf_dir is None:
             self.apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt")
@@ -1410,6 +1470,20 @@ class DpkgPM(PackageManager):
         if result is not None:
             bb.fatal(result)
 
+    def insert_feeds_uris(self):
+        sources_conf = os.path.join("%s/etc/apt/sources.list"
+                                    % self.target_rootfs)
+        arch_list = []
+        archs = self.d.getVar('PACKAGE_ARCHS', True)
+        arch_list = archs.split()
+        with open(sources_conf, "w+") as sources_file:
+            for uri in self.feed_uris.split():
+                for arch in arch_list:
+                    if arch == "noarch" or arch == "any":
+                        continue
+                    sources_file.write("deb %s/deb/%s ./\n" %
+                                       (uri, arch))
+
     def _create_configs(self, archs, base_archs):
         base_archs = re.sub("_", "-", base_archs)
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index be0afa6..7be2a18 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -350,7 +350,10 @@ class RpmRootfs(Rootfs):
                     bb.fatal(message)
 
     def _insert_feed_uris(self):
-        pass
+        if base_contains("IMAGE_FEATURES", "package-management",
+                         False, True, self.d):
+            return
+        self.pm.insert_feeds_uris()
 
     def _handle_intercept_failure(self, registered_pkgs):
         rpm_postinsts_dir = self.image_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/')
@@ -433,7 +436,10 @@ class DpkgRootfs(Rootfs):
         pass
 
     def _insert_feed_uris(self):
-        pass
+        if base_contains("IMAGE_FEATURES", "package-management",
+                         False, True, self.d):
+            return
+        self.pm.insert_feeds_uris()
 
 
 class OpkgRootfs(Rootfs):
@@ -699,8 +705,11 @@ class OpkgRootfs(Rootfs):
         pass
 
     def _insert_feed_uris(self):
-        pass
+        if base_contains("IMAGE_FEATURES", "package-management",
+                         False, True, self.d):
+            return
 
+        self.pm.insert_feeds_uris()
 
 def create_rootfs(d, manifest_dir=None):
     env_bkp = os.environ.copy()
-- 
1.8.3.2



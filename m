Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.7635.1593080531229462406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=NbP+2I23;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=6202; q=dns/txt; s=axis-central1;
  t=1593080532; x=1624616532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AAqNxVrRP9hw7EEt3XnN99lYJ9GvxGKDXcRF4RWrvKA=;
  b=NbP+2I23e51eY7EwQTkU6JMlHQKbDbbJijkWAkWoG5/fDXW4Bg6xu6PR
   QHC4ZrMrVP7LLC3rabtPuK7jQhHPqh/i6eSp9IkeUH7Q9r48pLkUF2vl9
   SjxkeV4PusQVrWddvtuVAMo5Xxyqm3y5qrEamjGcPXEZSMTMvieGU8tjk
   4b9GG0Mi+qJWJEY4yMVoi7+ONxkP+IFZpvb/mTapxOnO07z9pd1R8j0a8
   p320mholwaVPnoLssrnfVI4BUYe0QpKLVrP9kPY9wUTiZpj7OoaIB8I4b
   v2E2CTYjr6wO+uSpoXzB8CXcNqZ8GWQoo+XZ8VQO5X1ybW77OtU3EM/sa
   Q==;
IronPort-SDR: L+HpjgQg4V5GauZDWF38Mk1OnQmjSF8kiuQq3gd5/S75MeZgALsIBIljIAbfM7PwEe3N4aHGv+
 6kXzFecrQVTw9GxwG9AxXcQZMXfBhg2ByLXb0MtOhB3N07VUaejbwYmTTngU6ri1CrKr6MOZVx
 uXtGr30T9wyJrFEBGR948Sjt6QEs1Yn8iKxR8/Oloj5u0LxC9cn4heKZM0Umnwe39j/58KL+CW
 U7mOXsz9VggmdYr8v4gI1BGfRDQx9jZzt2OziVzQIWE/cvtsAJIOh6LY2JmujLHrV8ejRxg7C5
 v4c=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185339"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 21/26] package_manager.py: Move DpkgIndexer
Date: Thu, 25 Jun 2020 12:21:40 +0200
Message-ID: <20200625102145.7139-22-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the code that is only used by opkg package manager live in that
package manager owned directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager.py                | 74 -------------------
 .../package_managers/deb/package_manager.py   | 74 +++++++++++++++++++
 2 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 83b881fb8c..111845d903 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -150,80 +150,6 @@ class Indexer(object, metaclass=ABCMeta):
         pass
 
 
-class DpkgIndexer(Indexer):
-    def _create_configs(self):
-        bb.utils.mkdirhier(self.apt_conf_dir)
-        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "lists", "partial"))
-        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "apt.conf.d"))
-        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "preferences.d"))
-
-        with open(os.path.join(self.apt_conf_dir, "preferences"),
-                "w") as prefs_file:
-            pass
-        with open(os.path.join(self.apt_conf_dir, "sources.list"),
-                "w+") as sources_file:
-            pass
-
-        with open(self.apt_conf_file, "w") as apt_conf:
-            with open(os.path.join(self.d.expand("${STAGING_ETCDIR_NATIVE}"),
-                "apt", "apt.conf.sample")) as apt_conf_sample:
-                for line in apt_conf_sample.read().split("\n"):
-                    line = re.sub(r"#ROOTFS#", "/dev/null", line)
-                    line = re.sub(r"#APTCONF#", self.apt_conf_dir, line)
-                    apt_conf.write(line + "\n")
-
-    def write_index(self):
-        self.apt_conf_dir = os.path.join(self.d.expand("${APTCONF_TARGET}"),
-                "apt-ftparchive")
-        self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
-        self._create_configs()
-
-        os.environ['APT_CONFIG'] = self.apt_conf_file
-
-        pkg_archs = self.d.getVar('PACKAGE_ARCHS')
-        if pkg_archs is not None:
-            arch_list = pkg_archs.split()
-        sdk_pkg_archs = self.d.getVar('SDK_PACKAGE_ARCHS')
-        if sdk_pkg_archs is not None:
-            for a in sdk_pkg_archs.split():
-                if a not in pkg_archs:
-                    arch_list.append(a)
-
-        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").split()
-        arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in arch_list)
-
-        apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
-        gzip = bb.utils.which(os.getenv('PATH'), "gzip")
-
-        index_cmds = []
-        deb_dirs_found = False
-        for arch in arch_list:
-            arch_dir = os.path.join(self.deploy_dir, arch)
-            if not os.path.isdir(arch_dir):
-                continue
-
-            cmd = "cd %s; PSEUDO_UNLOAD=1 %s packages . > Packages;" % (arch_dir, apt_ftparchive)
-
-            cmd += "%s -fcn Packages > Packages.gz;" % gzip
-
-            with open(os.path.join(arch_dir, "Release"), "w+") as release:
-                release.write("Label: %s\n" % arch)
-
-            cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
-
-            index_cmds.append(cmd)
-
-            deb_dirs_found = True
-
-        if not deb_dirs_found:
-            bb.note("There are no packages in %s" % self.deploy_dir)
-            return
-
-        oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
-        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            raise NotImplementedError('Package feed signing not implementd for dpkg')
-
-
 
 class PkgsList(object, metaclass=ABCMeta):
     def __init__(self, d, rootfs_dir):
diff --git a/meta/lib/oe/package_managers/deb/package_manager.py b/meta/lib/oe/package_managers/deb/package_manager.py
index c38821587b..5d3c300700 100644
--- a/meta/lib/oe/package_managers/deb/package_manager.py
+++ b/meta/lib/oe/package_managers/deb/package_manager.py
@@ -400,3 +400,77 @@ class PkgPM(OpkgDpkgPM):
         return tmp_dir
 
 
+class DpkgIndexer(Indexer):
+    def _create_configs(self):
+        bb.utils.mkdirhier(self.apt_conf_dir)
+        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "lists", "partial"))
+        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "apt.conf.d"))
+        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "preferences.d"))
+
+        with open(os.path.join(self.apt_conf_dir, "preferences"),
+                "w") as prefs_file:
+            pass
+        with open(os.path.join(self.apt_conf_dir, "sources.list"),
+                "w+") as sources_file:
+            pass
+
+        with open(self.apt_conf_file, "w") as apt_conf:
+            with open(os.path.join(self.d.expand("${STAGING_ETCDIR_NATIVE}"),
+                "apt", "apt.conf.sample")) as apt_conf_sample:
+                for line in apt_conf_sample.read().split("\n"):
+                    line = re.sub(r"#ROOTFS#", "/dev/null", line)
+                    line = re.sub(r"#APTCONF#", self.apt_conf_dir, line)
+                    apt_conf.write(line + "\n")
+
+    def write_index(self):
+        self.apt_conf_dir = os.path.join(self.d.expand("${APTCONF_TARGET}"),
+                "apt-ftparchive")
+        self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
+        self._create_configs()
+
+        os.environ['APT_CONFIG'] = self.apt_conf_file
+
+        pkg_archs = self.d.getVar('PACKAGE_ARCHS')
+        if pkg_archs is not None:
+            arch_list = pkg_archs.split()
+        sdk_pkg_archs = self.d.getVar('SDK_PACKAGE_ARCHS')
+        if sdk_pkg_archs is not None:
+            for a in sdk_pkg_archs.split():
+                if a not in pkg_archs:
+                    arch_list.append(a)
+
+        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").split()
+        arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in arch_list)
+
+        apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
+        gzip = bb.utils.which(os.getenv('PATH'), "gzip")
+
+        index_cmds = []
+        deb_dirs_found = False
+        for arch in arch_list:
+            arch_dir = os.path.join(self.deploy_dir, arch)
+            if not os.path.isdir(arch_dir):
+                continue
+
+            cmd = "cd %s; PSEUDO_UNLOAD=1 %s packages . > Packages;" % (arch_dir, apt_ftparchive)
+
+            cmd += "%s -fcn Packages > Packages.gz;" % gzip
+
+            with open(os.path.join(arch_dir, "Release"), "w+") as release:
+                release.write("Label: %s\n" % arch)
+
+            cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
+
+            index_cmds.append(cmd)
+
+            deb_dirs_found = True
+
+        if not deb_dirs_found:
+            bb.note("There are no packages in %s" % self.deploy_dir)
+            return
+
+        oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            raise NotImplementedError('Package feed signing not implementd for dpkg')
+
+
-- 
2.20.1


Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5A7D70AC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Aug 2014 15:01:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="585501008"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2014 15:06:52 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:50 -0500
Message-Id: <0758a38b987982075f96e380b8d9d3089146007e.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 25/35] wic: Remove unused conf support
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:55 -0000

Also fix up users such as imager functions.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/config/wic.conf               |  1 -
 scripts/lib/mic/conf.py                         | 39 --------------------
 scripts/lib/mic/imager/baseimager.py            | 13 ++-----
 scripts/lib/mic/imager/direct.py                |  6 ++--
 scripts/lib/mic/plugins/imager/direct_plugin.py |  4 +--
 scripts/lib/mic/utils/misc.py                   | 48 +------------------------
 6 files changed, 8 insertions(+), 103 deletions(-)

diff --git a/scripts/lib/image/config/wic.conf b/scripts/lib/image/config/wic.conf
index e96d6ae..a51bcb5 100644
--- a/scripts/lib/image/config/wic.conf
+++ b/scripts/lib/image/config/wic.conf
@@ -4,4 +4,3 @@ distro_name = OpenEmbedded
 
 [create]
 ; settings for create subcommand
-runtime=native
diff --git a/scripts/lib/mic/conf.py b/scripts/lib/mic/conf.py
index 1fe6edd..a686e9c 100644
--- a/scripts/lib/mic/conf.py
+++ b/scripts/lib/mic/conf.py
@@ -31,45 +31,18 @@ def get_siteconf():
     return scripts_path + "/lib/image/config/wic.conf"
 
 class ConfigMgr(object):
-    prefer_backends = ["zypp", "yum"]
-
     DEFAULTS = {'common': {
                     "distro_name": "Default Distribution",
                     "plugin_dir": "/usr/lib/wic/plugins", # TODO use prefix also?
                 },
                 'create': {
                     "tmpdir": '/var/tmp/wic',
-                    "cachedir": '/var/tmp/wic/cache',
                     "outdir": './wic-output',
 
-                    "arch": None, # None means auto-detect
-                    "pkgmgr": "auto",
-                    "name": "output",
-                    "ksfile": None,
-                    "ks": None,
-                    "repomd": None,
-                    "local_pkgs_path": None,
                     "release": None,
                     "logfile": None,
-                    "record_pkgs": [],
-                    "pack_to": None,
                     "name_prefix": None,
                     "name_suffix": None,
-                    "copy_kernel": False,
-                    "install_pkgs": None,
-                    "repourl": {},
-                    "localrepos": [],  # save localrepos
-                    "runtime": "bootstrap",
-                },
-                'chroot': {
-                    "saveto": None,
-                },
-                'convert': {
-                    "shell": False,
-                },
-                'bootstrap': {
-                    "rootdir": '/var/tmp/wic-bootstrap',
-                    "packages": [],
                 },
                }
 
@@ -116,10 +89,6 @@ class ConfigMgr(object):
         if not ksconf:
             return
 
-        ksconf = misc.normalize_ksfile(ksconf,
-                                       self.create['release'],
-                                       self.create['arch'])
-
         ks = kickstart.read_kickstart(ksconf)
 
         self.create['ks'] = ks
@@ -130,12 +99,4 @@ class ConfigMgr(object):
                                               self.create['name_prefix'],
                                               self.create['name_suffix'])
 
-    def set_runtime(self, runtime):
-        if runtime not in ("bootstrap", "native"):
-            msger.error("Invalid runtime mode: %s" % runtime)
-
-        if misc.get_distro()[0] in ("tizen", "Tizen"):
-            runtime = "native"
-        self.create['runtime'] = runtime
-
 configmgr = ConfigMgr()
diff --git a/scripts/lib/mic/imager/baseimager.py b/scripts/lib/mic/imager/baseimager.py
index 55f2dea..0d591ea 100644
--- a/scripts/lib/mic/imager/baseimager.py
+++ b/scripts/lib/mic/imager/baseimager.py
@@ -176,7 +176,7 @@ class BaseImageCreator(object):
 
         runner.show('umount -l %s' % self.workdir)
 
-    def mount(self, base_on = None, cachedir = None):
+    def mount(self):
         """Setup the target filesystem in preparation for an install.
 
         This function sets up the filesystem which the ImageCreator will
@@ -184,20 +184,11 @@ class BaseImageCreator(object):
         install root directory, bind mounts some system directories (e.g. /dev)
         and writes out /etc/fstab. Other subclasses may also e.g. create a
         sparse file, format it and loopback mount it to the install root.
-
-        base_on -- a previous install on which to base this install; defaults
-                   to None, causing a new image to be created
-
-        cachedir -- a directory in which to store the Yum cache; defaults to
-                    None, causing a new cache to be created; by setting this
-                    to another directory, the same cache can be reused across
-                    multiple installs.
-
         """
         self.__setup_tmpdir()
         self.__ensure_builddir()
 
-        self._mount_instroot(base_on)
+        self._mount_instroot()
 
     def unmount(self):
         """Unmounts the target filesystem.
diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index 92473b5..2e6914b 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -217,7 +217,7 @@ class DirectImageCreator(BaseImageCreator):
     #
     # Actual implemention
     #
-    def _mount_instroot(self, base_on = None):
+    def _mount_instroot(self):
         """
         For 'wic', we already have our build artifacts and don't want
         to loop mount anything to install into, we just create
@@ -296,7 +296,7 @@ class DirectImageCreator(BaseImageCreator):
 
         self.__instimage.mount()
 
-    def install(self, repo_urls=None):
+    def install(self):
         """
         Install fs images into partitions
         """
@@ -306,7 +306,7 @@ class DirectImageCreator(BaseImageCreator):
                         % (disk_name, full_path, disk['min_size']))
             self.__instimage.install(full_path)
 
-    def configure(self, repodata = None):
+    def configure(self):
         """
         Configure the system image according to kickstart.
 
diff --git a/scripts/lib/mic/plugins/imager/direct_plugin.py b/scripts/lib/mic/plugins/imager/direct_plugin.py
index 877aaf6..793a736 100644
--- a/scripts/lib/mic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/mic/plugins/imager/direct_plugin.py
@@ -91,9 +91,9 @@ class DirectPlugin(ImagerPlugin):
                                             creatoropts)
 
         try:
-            creator.mount(None, creatoropts["cachedir"])
+            creator.mount()
             creator.install()
-            creator.configure(creatoropts["repomd"])
+            creator.configure()
             creator.print_outimage_info()
 
         except errors.CreatorError:
diff --git a/scripts/lib/mic/utils/misc.py b/scripts/lib/mic/utils/misc.py
index 010b16c..194b88f 100644
--- a/scripts/lib/mic/utils/misc.py
+++ b/scripts/lib/mic/utils/misc.py
@@ -19,11 +19,6 @@ import os
 import sys
 import time
 
-from mic import msger
-from mic.utils.errors import CreatorError
-from mic.utils.fs_related import find_binary_path, makedirs
-from mic.utils import runner
-
 def build_name(kscfg, release=None, prefix = None, suffix = None):
     """Construct and return an image name string.
 
@@ -60,46 +55,5 @@ def build_name(kscfg, release=None, prefix = None, suffix = None):
     suffix = "-%s" % suffix if suffix else ""
 
     ret = prefix + name + suffix
-    return ret
-
-def normalize_ksfile(ksconf, release, arch):
-    '''
-    Return the name of a normalized ks file in which macro variables
-    @BUILD_ID@ and @ARCH@ are replace with real values.
-
-    The original ks file is returned if no special macro is used, otherwise
-    a temp file is created and returned, which will be deleted when program
-    exits normally.
-    '''
-
-    if not release:
-        release = "latest"
-    if not arch or re.match(r'i.86', arch):
-        arch = "ia32"
-
-    with open(ksconf) as f:
-        ksc = f.read()
-
-    if "@ARCH@" not in ksc and "@BUILD_ID@" not in ksc:
-        return ksconf
 
-    msger.info("Substitute macro variable @BUILD_ID@/@ARCH@ in ks: %s" % ksconf)
-    ksc = ksc.replace("@ARCH@", arch)
-    ksc = ksc.replace("@BUILD_ID@", release)
-
-    fd, ksconf = tempfile.mkstemp(prefix=os.path.basename(ksconf))
-    os.write(fd, ksc)
-    os.close(fd)
-
-    msger.debug('normalized ks file:%s' % ksconf)
-
-    def remove_temp_ks():
-        try:
-            os.unlink(ksconf)
-        except OSError, err:
-            msger.warning('Failed to remove temp ks file:%s:%s' % (ksconf, err))
-
-    import atexit
-    atexit.register(remove_temp_ks)
-
-    return ksconf
+    return ret
-- 
1.8.3.1



Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id C34BE7713B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 310DC600F80
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:45 +0100
Message-Id: <2e81dbdce6f92908c4d4c980af032516581178de.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 24/52] populate SDK: prepare calling of bb.utils for exceptions
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:24 -0000

From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>

bb.utils.remove, bb.utils.movefile and bb.utils.mkdirhier can throw
exceptions that need handling and proper error messages
more work is required for these methods to handle properly the
exceptions that can be raised within the various OS calls they make
but this is a start to at least not hide the errors in the requested
operations

[YOCTO#8213]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/sdk.py | 76 +++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 24 deletions(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 53da0f0..3103f48 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -5,6 +5,7 @@ from oe.package_manager import *
 import os
 import shutil
 import glob
+import traceback
 
 
 class Sdk(object):
@@ -25,7 +26,7 @@ class Sdk(object):
         else:
             self.manifest_dir = manifest_dir
 
-        bb.utils.remove(self.sdk_output, True)
+        self.remove(self.sdk_output, True)
 
         self.install_order = Manifest.INSTALL_ORDER
 
@@ -34,29 +35,56 @@ class Sdk(object):
         pass
 
     def populate(self):
-        bb.utils.mkdirhier(self.sdk_output)
+        self.mkdirhier(self.sdk_output)
 
         # call backend dependent implementation
         self._populate()
 
         # Don't ship any libGL in the SDK
-        bb.utils.remove(os.path.join(self.sdk_output, self.sdk_native_path,
-                                     self.d.getVar('libdir_nativesdk', True).strip('/'),
-                                     "libGL*"))
+        self.remove(os.path.join(self.sdk_output, self.sdk_native_path,
+                         self.d.getVar('libdir_nativesdk', True).strip('/'),
+                         "libGL*"))
 
         # Fix or remove broken .la files
-        bb.utils.remove(os.path.join(self.sdk_output, self.sdk_native_path,
-                                     self.d.getVar('libdir_nativesdk', True).strip('/'),
-                                     "*.la"))
+        self.remove(os.path.join(self.sdk_output, self.sdk_native_path,
+                         self.d.getVar('libdir_nativesdk', True).strip('/'),
+                         "*.la"))
 
         # Link the ld.so.cache file into the hosts filesystem
         link_name = os.path.join(self.sdk_output, self.sdk_native_path,
                                  self.sysconfdir, "ld.so.cache")
-        bb.utils.mkdirhier(os.path.dirname(link_name))
+        self.mkdirhier(os.path.dirname(link_name))
         os.symlink("/etc/ld.so.cache", link_name)
 
         execute_pre_post_process(self.d, self.d.getVar('SDK_POSTPROCESS_COMMAND', True))
 
+    def movefile(self, sourcefile, destdir):
+        try:
+            # FIXME: this check of movefile's return code to None should be
+            # fixed within the function to use only exceptions to signal when
+            # something goes wrong
+            if (bb.utils.movefile(sourcefile, destdir) == None):
+                raise OSError("moving %s to %s failed"
+                        %(sourcefile, destdir))
+        #FIXME: using umbrella exc catching because bb.utils method raises it
+        except Exception as e:
+            bb.debug(1, "printing the stack trace\n %s" %traceback.format_exc())
+            bb.error("unable to place %s in final SDK location" % sourcefile)
+
+    def mkdirhier(self, dirpath):
+        try:
+            bb.utils.mkdirhier(dirpath)
+        except OSError as e:
+            bb.debug(1, "printing the stack trace\n %s" %traceback.format_exc())
+            bb.fatal("cannot make dir for SDK: %s" % dirpath)
+
+    def remove(self, path, recurse=False):
+        try:
+            bb.utils.remove(path, recurse)
+        #FIXME: using umbrella exc catching because bb.utils method raises it
+        except Exception as e:
+            bb.debug(1, "printing the stack trace\n %s" %traceback.format_exc())
+            bb.warn("cannot remove SDK dir: %s" % path)
 
 class RpmSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
@@ -143,15 +171,15 @@ class RpmSdk(Sdk):
                                             "lib",
                                             "rpm"
                                             )
-        bb.utils.mkdirhier(native_rpm_state_dir)
+        self.mkdirhier(native_rpm_state_dir)
         for f in glob.glob(os.path.join(self.sdk_output,
                                         "var",
                                         "lib",
                                         "rpm",
                                         "*")):
-            bb.utils.movefile(f, native_rpm_state_dir)
+            self.movefile(f, native_rpm_state_dir)
 
-        bb.utils.remove(os.path.join(self.sdk_output, "var"), True)
+        self.remove(os.path.join(self.sdk_output, "var"), True)
 
         # Move host sysconfig data
         native_sysconf_dir = os.path.join(self.sdk_output,
@@ -159,10 +187,10 @@ class RpmSdk(Sdk):
                                           self.d.getVar('sysconfdir',
                                                         True).strip('/'),
                                           )
-        bb.utils.mkdirhier(native_sysconf_dir)
+        self.mkdirhier(native_sysconf_dir)
         for f in glob.glob(os.path.join(self.sdk_output, "etc", "*")):
-            bb.utils.movefile(f, native_sysconf_dir)
-        bb.utils.remove(os.path.join(self.sdk_output, "etc"), True)
+            self.movefile(f, native_sysconf_dir)
+        self.remove(os.path.join(self.sdk_output, "etc"), True)
 
 
 class OpkgSdk(Sdk):
@@ -219,12 +247,12 @@ class OpkgSdk(Sdk):
         target_sysconfdir = os.path.join(self.sdk_target_sysroot, self.sysconfdir)
         host_sysconfdir = os.path.join(self.sdk_host_sysroot, self.sysconfdir)
 
-        bb.utils.mkdirhier(target_sysconfdir)
+        self.mkdirhier(target_sysconfdir)
         shutil.copy(self.target_conf, target_sysconfdir)
         os.chmod(os.path.join(target_sysconfdir,
                               os.path.basename(self.target_conf)), 0644)
 
-        bb.utils.mkdirhier(host_sysconfdir)
+        self.mkdirhier(host_sysconfdir)
         shutil.copy(self.host_conf, host_sysconfdir)
         os.chmod(os.path.join(host_sysconfdir,
                               os.path.basename(self.host_conf)), 0644)
@@ -232,11 +260,11 @@ class OpkgSdk(Sdk):
         native_opkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
                                              self.d.getVar('localstatedir_nativesdk', True).strip('/'),
                                              "lib", "opkg")
-        bb.utils.mkdirhier(native_opkg_state_dir)
+        self.mkdirhier(native_opkg_state_dir)
         for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "opkg", "*")):
-            bb.utils.movefile(f, native_opkg_state_dir)
+            self.movefile(f, native_opkg_state_dir)
 
-        bb.utils.remove(os.path.join(self.sdk_output, "var"), True)
+        self.remove(os.path.join(self.sdk_output, "var"), True)
 
 
 class DpkgSdk(Sdk):
@@ -264,7 +292,7 @@ class DpkgSdk(Sdk):
     def _copy_apt_dir_to(self, dst_dir):
         staging_etcdir_native = self.d.getVar("STAGING_ETCDIR_NATIVE", True)
 
-        bb.utils.remove(dst_dir, True)
+        self.remove(dst_dir, True)
 
         shutil.copytree(os.path.join(staging_etcdir_native, "apt"), dst_dir)
 
@@ -306,11 +334,11 @@ class DpkgSdk(Sdk):
 
         native_dpkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
                                              "var", "lib", "dpkg")
-        bb.utils.mkdirhier(native_dpkg_state_dir)
+        self.mkdirhier(native_dpkg_state_dir)
         for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "dpkg", "*")):
-            bb.utils.movefile(f, native_dpkg_state_dir)
+            self.movefile(f, native_dpkg_state_dir)
+        self.remove(os.path.join(self.sdk_output, "var"), True)
 
-        bb.utils.remove(os.path.join(self.sdk_output, "var"), True)
 
 
 def sdk_list_installed_packages(d, target, format=None, rootfs_dir=None):
-- 
2.1.4



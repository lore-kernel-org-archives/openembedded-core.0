Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F145077046
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 02 Sep 2015 04:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="637005727"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 02 Sep 2015 04:00:30 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 708B66A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:39 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:13 +0300
Message-Id: <f0408e078469592b0c167026528ccb3f044f7d0b.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 13/17] wic: fix pylint warning unused-variable
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:31 -0000

Removed or reworked code with unused variables.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py                     | 4 +---
 scripts/lib/wic/imager/baseimager.py          | 4 ++--
 scripts/lib/wic/imager/direct.py              | 2 +-
 scripts/lib/wic/plugin.py                     | 7 +------
 scripts/lib/wic/plugins/source/bootimg-efi.py | 6 ------
 scripts/wic                                   | 2 +-
 6 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index a034841..30c4fa3 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -43,9 +43,7 @@ def verify_build_env():
 
     Returns True if it is, false otherwise
     """
-    try:
-        builddir = os.environ["BUILDDIR"]
-    except KeyError:
+    if not os.environ.get("BUILDDIR"):
         print "BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)"
         sys.exit(1)
 
diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
index 67a2d01..4abcabc 100644
--- a/scripts/lib/wic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -132,9 +132,9 @@ class BaseImageCreator(object):
                 os.makedirs(self.workdir)
             self.__builddir = tempfile.mkdtemp(dir=self.workdir,
                                                prefix="imgcreate-")
-        except OSError, (err, msg):
+        except OSError as err:
             raise CreatorError("Failed create build directory in %s: %s" %
-                               (self.tmpdir, msg))
+                               (self.tmpdir, err))
 
     def __setup_tmpdir(self):
         if not self.enabletmpfs:
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index d68fd2a..74ebbe7 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -327,7 +327,7 @@ class DirectImageCreator(BaseImageCreator):
 
         parts = self._get_parts()
 
-        for disk_name, disk in self.__image.disks.items():
+        for disk_name in self.__image.disks:
             extension = "direct" + {"gzip": ".gz",
                                     "bzip2": ".bz2",
                                     "xz": ".xz",
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index e901f80..7244989 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -124,12 +124,7 @@ class PluginMgr(object):
 
         self.append_dirs(plugins_dir)
 
-        plugins = []
-
-        for _source_name, klass in self.get_plugins('source').iteritems():
-            plugins.append(_source_name)
-
-        return plugins
+        return self.get_plugins('source')
 
 
     def get_source_plugin_methods(self, source_name, methods):
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 49d5c8a..b48cc83 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -45,12 +45,6 @@ class BootimgEFIPlugin(SourcePlugin):
         """
         Create loader-specific (grub-efi) config
         """
-        splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
-        if os.path.exists(splash):
-            splashline = "menu background splash.jpg"
-        else:
-            splashline = ""
-
         options = cr.ks.handler.bootloader.appendLine
 
         grubefi_conf = ""
diff --git a/scripts/wic b/scripts/wic
index 94028e2..c99c504 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -308,7 +308,7 @@ def main(argv):
 
     parser.disable_interspersed_args()
 
-    (options, args) = parser.parse_args(argv)
+    args = parser.parse_args(argv)[1]
 
     if len(args):
         if args[0] == "help":
-- 
2.1.4



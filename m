Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0AAB071A19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 22:05:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 12 Dec 2016 14:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,338,1477983600"; d="scan'208";a="1080938904"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2016 14:05:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 11:05:06 +1300
Message-Id: <70e5dd48c0b764bfe3c59833725dce6cbaac23c0.1481579713.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481579713.git.paul.eggleton@linux.intel.com>
References: <cover.1481579713.git.paul.eggleton@linux.intel.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH 2/2] classes/image: suppress log_check mechanism for warnings/errors logged through BitBake
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
X-List-Received-Date: Mon, 12 Dec 2016 22:05:29 -0000

If you printed a warning through bb.warn() / bbwarn or an error through
bb.error() / bberror, this was also being picked up by our log_check
mechanism that was designed to pick up warnings and errors printed by
other programs used during do_rootfs. This meant you saw not only the
warning or error itself, you saw it a second time through log_check,
which is a bit ugly. Use the just-added BB_TASK_LOGGER to access the
logger and add a handler that we can use to find out if any warning or
error we find in the logs is one we should ignore as it has already been
printed.

Fixes [YOCTO #8223].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass | 10 +++++++++-
 meta/lib/oe/rootfs.py      | 29 ++++++++++++++++-------------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b10272a..e63f6a3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -208,6 +208,14 @@ PACKAGE_EXCLUDE[type] = "list"
 fakeroot python do_rootfs () {
     from oe.rootfs import create_rootfs
     from oe.manifest import create_manifest
+    import logging
+
+    logger = d.getVar('BB_TASK_LOGGER', False)
+    if logger:
+        logcatcher = bb.utils.LogCatcher()
+        logger.addHandler(logcatcher)
+    else:
+        logcatcher = None
 
     # NOTE: if you add, remove or significantly refactor the stages of this
     # process then you should recalculate the weightings here. This is quite
@@ -255,7 +263,7 @@ fakeroot python do_rootfs () {
     progress_reporter.next_stage()
 
     # generate rootfs
-    create_rootfs(d, progress_reporter=progress_reporter)
+    create_rootfs(d, progress_reporter=progress_reporter, logcatcher=logcatcher)
 
     progress_reporter.finish()
 }
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ed40b23..74fc3bd 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -15,12 +15,13 @@ class Rootfs(object, metaclass=ABCMeta):
     This is an abstract class. Do not instantiate this directly.
     """
 
-    def __init__(self, d, progress_reporter=None):
+    def __init__(self, d, progress_reporter=None, logcatcher=None):
         self.d = d
         self.pm = None
         self.image_rootfs = self.d.getVar('IMAGE_ROOTFS', True)
         self.deploydir = self.d.getVar('IMGDEPLOYDIR', True)
         self.progress_reporter = progress_reporter
+        self.logcatcher = logcatcher
 
         self.install_order = Manifest.INSTALL_ORDER
 
@@ -53,6 +54,8 @@ class Rootfs(object, metaclass=ABCMeta):
         messages = []
         with open(log_path, 'r') as log:
             for line in log:
+                if self.logcatcher and self.logcatcher.contains(line.rstrip()):
+                    continue
                 for ee in excludes:
                     m = ee.search(line)
                     if m:
@@ -375,8 +378,8 @@ class Rootfs(object, metaclass=ABCMeta):
 
 
 class RpmRootfs(Rootfs):
-    def __init__(self, d, manifest_dir, progress_reporter=None):
-        super(RpmRootfs, self).__init__(d, progress_reporter)
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '(unpacking of archive failed|Cannot find package'\
                                '|exit 1|ERROR: |Error: |Error |ERROR '\
                                '|Failed |Failed: |Failed$|Failed\(\d+\):)'
@@ -530,8 +533,8 @@ class RpmRootfs(Rootfs):
            bb.utils.remove(self.pm.install_dir_path, True)
 
 class DpkgOpkgRootfs(Rootfs):
-    def __init__(self, d, progress_reporter=None):
-        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter)
+    def __init__(self, d, progress_reporter=None, logcatcher=None):
+        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
 
     def _get_pkgs_postinsts(self, status_file):
         def _get_pkg_depends_list(pkg_depends):
@@ -625,8 +628,8 @@ class DpkgOpkgRootfs(Rootfs):
             num += 1
 
 class DpkgRootfs(DpkgOpkgRootfs):
-    def __init__(self, d, manifest_dir, progress_reporter=None):
-        super(DpkgRootfs, self).__init__(d, progress_reporter)
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(DpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '^E:'
         self.log_check_expected_regexes = \
         [
@@ -717,8 +720,8 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
 
 class OpkgRootfs(DpkgOpkgRootfs):
-    def __init__(self, d, manifest_dir, progress_reporter=None):
-        super(OpkgRootfs, self).__init__(d, progress_reporter)
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '(exit 1|Collected errors)'
 
         self.manifest = OpkgManifest(d, manifest_dir)
@@ -994,16 +997,16 @@ def variable_depends(d, manifest_dir=None):
     cls = get_class_for_type(img_type)
     return cls._depends_list()
 
-def create_rootfs(d, manifest_dir=None, progress_reporter=None):
+def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None):
     env_bkp = os.environ.copy()
 
     img_type = d.getVar('IMAGE_PKGTYPE', True)
     if img_type == "rpm":
-        RpmRootfs(d, manifest_dir, progress_reporter).create()
+        RpmRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
     elif img_type == "ipk":
-        OpkgRootfs(d, manifest_dir, progress_reporter).create()
+        OpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
     elif img_type == "deb":
-        DpkgRootfs(d, manifest_dir, progress_reporter).create()
+        DpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
 
     os.environ.clear()
     os.environ.update(env_bkp)
-- 
2.5.5



Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C8A8970A65
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2014 15:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="369966269"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2014 15:03:33 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:43 -0500
Message-Id: <8a8bd16104d4ce6f51253c615485057af4250187.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 18/35] wic: Remove unused plugin and error code
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:36 -0000

wic doesn't use it, so remove it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/plugin.py                  |  2 +-
 scripts/lib/mic/pluginbase.py              | 45 ++----------------------------
 scripts/lib/mic/plugins/hook/.py           |  0
 scripts/lib/mic/plugins/hook/empty_hook.py |  3 --
 scripts/lib/mic/utils/errors.py            | 21 --------------
 5 files changed, 3 insertions(+), 68 deletions(-)
 delete mode 100644 scripts/lib/mic/plugins/hook/.py
 delete mode 100644 scripts/lib/mic/plugins/hook/empty_hook.py

diff --git a/scripts/lib/mic/plugin.py b/scripts/lib/mic/plugin.py
index f836950..43afdbc 100644
--- a/scripts/lib/mic/plugin.py
+++ b/scripts/lib/mic/plugin.py
@@ -24,7 +24,7 @@ from mic.utils.oe.misc import *
 
 __ALL__ = ['PluginMgr', 'pluginmgr']
 
-PLUGIN_TYPES = ["imager", "source"] # TODO  "hook"
+PLUGIN_TYPES = ["imager", "source"]
 
 PLUGIN_DIR = "/lib/mic/plugins" # relative to scripts
 SCRIPTS_PLUGIN_DIR = "scripts" + PLUGIN_DIR
diff --git a/scripts/lib/mic/pluginbase.py b/scripts/lib/mic/pluginbase.py
index 9cf4c62..46a4f4a 100644
--- a/scripts/lib/mic/pluginbase.py
+++ b/scripts/lib/mic/pluginbase.py
@@ -40,45 +40,10 @@ class _Plugin(object):
         def get_plugins(cls):
             return cls.plugins
 
+
 class ImagerPlugin(_Plugin):
     mic_plugin_type = "imager"
 
-    @classmethod
-    def check_image_exists(self, destdir, apacking=None,
-                                          images=(),
-                                          release=None):
-
-        # if it's a packing file, reset images
-        if apacking:
-            images = [apacking]
-
-        # release option will override images
-        if release is not None:
-            images = [os.path.basename(destdir.rstrip('/'))]
-            destdir = os.path.dirname(destdir.rstrip('/'))
-
-        for name in images:
-            if not name:
-                continue
-
-            image = os.path.join(destdir, name)
-            if not os.path.exists(image):
-                continue
-
-            if msger.ask("Target image/dir: %s already exists, "
-                         "clean up and continue?" % image):
-                if os.path.isdir(image):
-                    shutil.rmtree(image)
-                else:
-                    os.unlink(image)
-            else:
-                raise errors.Abort("Cancled")
-
-    def do_create(self):
-        pass
-
-    def do_chroot(self):
-        pass
 
 class SourcePlugin(_Plugin):
     mic_plugin_type = "source"
@@ -133,12 +98,6 @@ class SourcePlugin(_Plugin):
         """
         msger.debug("SourcePlugin: do_prepare_partition: part: %s" % part)
 
-class BackendPlugin(_Plugin):
-    mic_plugin_type="backend"
-
-    def addRepository(self):
-        pass
-
 def get_plugins(typen):
     ps = ImagerPlugin.get_plugins()
     if typen in ps:
@@ -146,4 +105,4 @@ def get_plugins(typen):
     else:
         return None
 
-__all__ = ['ImagerPlugin', 'BackendPlugin', 'SourcePlugin', 'get_plugins']
+__all__ = ['ImagerPlugin', 'SourcePlugin', 'get_plugins']
diff --git a/scripts/lib/mic/plugins/hook/.py b/scripts/lib/mic/plugins/hook/.py
deleted file mode 100644
index e69de29..0000000
diff --git a/scripts/lib/mic/plugins/hook/empty_hook.py b/scripts/lib/mic/plugins/hook/empty_hook.py
deleted file mode 100644
index 397585d..0000000
--- a/scripts/lib/mic/plugins/hook/empty_hook.py
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/usr/bin/python
-
-# TODO: plugin base for hooks
diff --git a/scripts/lib/mic/utils/errors.py b/scripts/lib/mic/utils/errors.py
index 8d720f9..38fda30 100644
--- a/scripts/lib/mic/utils/errors.py
+++ b/scripts/lib/mic/utils/errors.py
@@ -43,29 +43,8 @@ class Usage(CreatorError):
 class Abort(CreatorError):
     keyword = ''
 
-class ConfigError(CreatorError):
-    keyword = '<config>'
-
 class KsError(CreatorError):
     keyword = '<kickstart>'
 
-class RepoError(CreatorError):
-    keyword = '<repo>'
-
-class RpmError(CreatorError):
-    keyword = '<rpm>'
-
 class MountError(CreatorError):
     keyword = '<mount>'
-
-class SnapshotError(CreatorError):
-    keyword = '<snapshot>'
-
-class SquashfsError(CreatorError):
-    keyword = '<squashfs>'
-
-class BootstrapError(CreatorError):
-    keyword = '<bootstrap>'
-
-class RuntimeError(CreatorError):
-    keyword = '<runtime>'
-- 
1.8.3.1



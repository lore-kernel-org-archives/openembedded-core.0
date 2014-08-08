Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DCFB570AB4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:07:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Aug 2014 15:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="555928303"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2014 15:06:57 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:53 -0500
Message-Id: <7ef93504d33e54f693f3a59070b2944804425d82.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 28/35] wic: Update cleanup/unmount-related code
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
X-List-Received-Date: Fri, 08 Aug 2014 22:07:24 -0000

The wic code inherited a basic image-creation flow based on mounting
loop devices, but wic doesn't actually mount or unmount anything, so
get rid of unmount() and consolidate whatever it did do with
cleanup().

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/imager/baseimager.py | 28 ++++++----------------------
 scripts/lib/mic/imager/direct.py     |  2 +-
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/scripts/lib/mic/imager/baseimager.py b/scripts/lib/mic/imager/baseimager.py
index 7f32dd5..23919d4 100644
--- a/scripts/lib/mic/imager/baseimager.py
+++ b/scripts/lib/mic/imager/baseimager.py
@@ -109,12 +109,11 @@ class BaseImageCreator(object):
         """
         pass
 
-    def _unmount_instroot(self):
-        """Undo anything performed in _mount_instroot().
+    def _cleanup(self):
+        """Undo anything performed in _create().
 
-        This is the hook where subclasses must undo anything which was done
-        in _mount_instroot(). For example, if a filesystem image was mounted
-        onto _instroot, it should be unmounted here.
+        This is the hook where subclasses must undo anything which was
+        done in _create().
 
         There is no default implementation.
 
@@ -161,23 +160,8 @@ class BaseImageCreator(object):
 
         self._create()
 
-    def unmount(self):
-        """Unmounts the target filesystem.
-
-        The ImageCreator class detaches the system from the install root, but
-        other subclasses may also detach the loopback mounted filesystem image
-        from the install root.
-
-        """
-        self._unmount_instroot()
-
-
     def cleanup(self):
-        """Unmounts the target filesystem and deletes temporary files.
-
-        This method calls unmount() and then deletes any temporary files and
-        directories that were created on the host system while building the
-        image.
+        """Undo anything performed in create().
 
         Note, make sure to call this method once finished with the creator
         instance in order to ensure no stale files are left on the host e.g.:
@@ -192,7 +176,7 @@ class BaseImageCreator(object):
         if not self.__builddir:
             return
 
-        self.unmount()
+        self._cleanup()
 
         shutil.rmtree(self.__builddir, ignore_errors = True)
         self.__builddir = None
diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index b96740d..91f64d5 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -354,7 +354,7 @@ class DirectImageCreator(BaseImageCreator):
 
         return (rootdev, root_part_uuid)
 
-    def _unmount_instroot(self):
+    def _cleanup(self):
         if not self.__instimage is None:
             try:
                 self.__instimage.cleanup()
-- 
1.8.3.1



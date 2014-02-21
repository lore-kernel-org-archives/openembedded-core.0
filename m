Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B57F6B206
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 06:38:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1L6chcp006591
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Feb 2014 22:38:43 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 20 Feb 2014 22:38:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Feb 2014 14:38:21 +0800
Message-ID: <24ba83ec6b0e366533a6c1e4b78437bf262b7f05.1392963956.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392963956.git.hongxu.jia@windriver.com>
References: <cover.1392963956.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 5/5] rootfs.py: tweak _multilib_sanity_test for ipk incremental image generation
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
X-List-Received-Date: Fri, 21 Feb 2014 06:38:43 -0000
Content-Type: text/plain

The _multilib_sanity_test installs multilib packages in a temporary
root fs, and compare with the current image to figure out duplicated
files that come from different packages.

While incremental image generation enabled and the previous image
was existed, there was an Multilib check error:
...
ERROR: Multilib check error: duplicate files tmp/work/qemux86_64-poky-
linux/core-image-minimal/1.0-r0/multilib/lib32/lib/libc.so.6 tmp/work/
qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/lib/libc.so.6
is not the same
...

The reason is the file in the existing image has been prelinked by
previous image generation and the file in a temporary root fs is not
prelinked, even though both of them came from the same package, the
Multilib check failed.

[YOCTO #1894]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/rootfs.py | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 78e9627..2b2915e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -3,6 +3,8 @@ from oe.utils import execute_pre_post_process
 from oe.utils import contains as base_contains
 from oe.package_manager import *
 from oe.manifest import *
+import oe.path
+import filecmp
 import shutil
 import os
 import subprocess
@@ -458,13 +460,58 @@ class OpkgRootfs(Rootfs):
 
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
 
+    def _prelink_file(self, root_dir, filename):
+        bb.note('prelink %s in %s' % (filename, root_dir))
+        prelink_cfg = oe.path.join(root_dir,
+                                   self.d.expand('${sysconfdir}/prelink.conf'))
+        if not os.path.exists(prelink_cfg):
+            shutil.copy(self.d.expand('${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf'),
+                        prelink_cfg)
+
+        cmd_prelink = self.d.expand('${STAGING_DIR_NATIVE}${sbindir_native}/prelink')
+        self._exec_shell_cmd([cmd_prelink,
+                              '--root',
+                              root_dir,
+                              '-amR',
+                              '-N',
+                              '-c',
+                              self.d.expand('${sysconfdir}/prelink.conf')])
+
+    '''
+    Compare two files with the same key twice to see if they are equal.
+    If they are not equal, it means they are duplicated and come from
+    different packages.
+    1st: Comapre them directly;
+    2nd: While incremental image creation is enabled, one of the
+         files could be probaly prelinked in the previous image
+         creation and the file has been changed, so we need to
+         prelink the other one and compare them.
+    '''
+    def _file_equal(self, key, f1, f2):
+
+        # Both of them are not prelinked
+        if filecmp.cmp(f1, f2):
+            return True
+
+        if self.image_rootfs not in f1:
+            self._prelink_file(f1.replace(key, ''), f1)
+
+        if self.image_rootfs not in f2:
+            self._prelink_file(f2.replace(key, ''), f2)
+
+        # Both of them are prelinked
+        if filecmp.cmp(f1, f2):
+            return True
+
+        # Not equal
+        return False
+
     """
     This function was reused from the old implementation.
     See commit: "image.bbclass: Added variables for multilib support." by
     Lianhao Lu.
     """
     def _multilib_sanity_test(self, dirs):
-        import filecmp
 
         allow_replace = self.d.getVar("MULTILIBRE_ALLOW_REP", True)
         if allow_replace is None:
@@ -488,7 +535,7 @@ class OpkgRootfs(Rootfs):
                         else:
                             if os.path.exists(files[key]) and \
                                os.path.exists(item) and \
-                               not filecmp.cmp(files[key], item):
+                               not self._file_equal(key, files[key], item):
                                 valid = False
                                 bb.fatal("%s duplicate files %s %s is not the same\n" %
                                          (error_prompt, item, files[key]))
-- 
1.8.1.2



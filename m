Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE29E6EE3A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:42:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1I9gpHA023353
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Feb 2014 01:42:51 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 18 Feb 2014 01:42:51 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2014 17:42:28 +0800
Message-ID: <8581ec40c107111a8001742d8b636a76910f5f5f.1392716065.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392716065.git.hongxu.jia@windriver.com>
References: <cover.1392716065.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Tue, 18 Feb 2014 09:42:51 -0000
Content-Type: text/plain

The _multilib_sanity_test installs multilib packages in a temporary
root fs, and compare with the current image to figure out duplicated
file that comes from different packages.

While incremental image generation enabled and the previous image
existed, there was a Multilib check error:
...
ERROR: Multilib check error: duplicate files tmp/work/qemux86_64-poky-
linux/core-image-minimal/1.0-r0/multilib/lib32/lib/libc.so.6 tmp/work/
qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/lib/libc.so.6
is not the same
...

The reason is the file in current image has been prelinked in previous
image generation and the file in a temporary root fs is not prelinked,
even though the files come from the same package, the Multilib check
considers they are different.

[YOCTO #1894]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/rootfs.py | 56 +++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 3d7adf9..5054d1e 100644
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
@@ -458,13 +460,61 @@ class OpkgRootfs(Rootfs):
 
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
+    Compare two files with the same key twice to see if they came
+    from the same package. If they are not same, they are duplicated
+    and come from different packages.
+    1st: Comapre them directly;
+    2nd: While incremental image creation is enabled, one of the
+         files could be probaly prelinked in the previous image
+         creation and the file has been changed, so we need to
+         prelink the other one and compare them.
+    '''
+    def _file_duplicate(self, key, f1, f2):
+
+        if not os.path.exists(f1) or not os.path.exists(f2):
+            return False
+
+        # f1 is the same with f2, both of them were not prelinked
+        if filecmp.cmp(f1, f2):
+            return False
+
+        if self.image_rootfs not in f1:
+            self._prelink_file(f1.replace(key, ''), f1)
+
+        if self.image_rootfs not in f2:
+            self._prelink_file(f2.replace(key, ''), f2)
+
+        # f1 is the same with f2, both of them were prelinked
+        if filecmp.cmp(f1, f2):
+            return False
+
+        # Duplicated
+        return True
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
@@ -486,9 +536,7 @@ class OpkgRootfs(Rootfs):
                         if allow_rep.match(key):
                             valid = True
                         else:
-                            if os.path.exists(files[key]) and \
-                               os.path.exists(item) and \
-                               not filecmp.cmp(files[key], item):
+                            if self._file_duplicate(key, files[key], item):
                                 valid = False
                                 bb.fatal("%s duplicate files %s %s is not the same\n" %
                                          (error_prompt, item, files[key]))
-- 
1.8.1.2



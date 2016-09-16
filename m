Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFE66FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 12:52:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 16 Sep 2016 05:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,344,1470726000"; d="scan'208";a="1031537878"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.30.107])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2016 05:52:52 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 13:52:32 +0100
Message-Id: <97cc9b5ba54f6dc1e8fa9b7938ebf220ac5fe95b.1474030160.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
Subject: [PATCH 5/6] runqemu: try symlinks when kernel or rootfs can't be found
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
X-List-Received-Date: Fri, 16 Sep 2016 12:52:52 -0000

If the kernel or rootfs names written to the qemuboot.conf can't
be found, try and find the symlinked variant of the filename.

This will help usability of runqemu, for example where a user
downloads an image and associated files as the symlinked names
yet the qemuboot.conf variables point to the full, non-linked,
file names.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6aaae44..38f9b30 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -451,7 +451,12 @@ class BaseConfig(object):
             if all_files:
                 self.rootfs = all_files[0]
             else:
-                raise Exception("Failed to find rootfs: %s" % cmd)
+                cmd = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'), self.fstype)
+                all_files = glob.glob(cmd)
+                if all_files:
+                    self.rootfs = all_files[0]
+                else:
+                    raise Exception("Failed to find rootfs: %s" % cmd)
 
         if not os.path.exists(self.rootfs):
             raise Exception("Can't find rootfs: %s" % self.rootfs)
@@ -462,13 +467,18 @@ class BaseConfig(object):
         if self.fstype in self.vmtypes:
             return
         kernel = self.kernel
+        deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
         if not kernel:
-            kernel = "%s/%s" % (self.get('DEPLOY_DIR_IMAGE'), self.get('QB_DEFAULT_KERNEL'))
+            kernel = "%s/%s" % (deploy_dir_image, self.get('QB_DEFAULT_KERNEL'))
 
         if os.path.exists(kernel):
             self.kernel = kernel
         else:
-            raise Exception("KERNEL %s not found" % kernel)
+            kernel = "%s/%s" % (deploy_dir_image, self.get('KERNEL_IMAGETYPE'))
+            if kernel != deploy_dir_image and os.path.exists(kernel):
+                self.kernel = kernel
+            else:
+                raise Exception("KERNEL %s not found" % kernel)
 
         dtb = self.get('QB_DTB')
         if dtb:
-- 
2.7.4



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6C075E80
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 07:39:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8I7dZpv029973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 00:39:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Sep 2016 00:39:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Sep 2016 00:39:27 -0700
Message-ID: <5622e73f9ee3f3c95351555fb96c731beee4123d.1474183984.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474183984.git.liezhi.yang@windriver.com>
References: <cover.1474183984.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 5/8] runqemu: try symlinks when kernel or rootfs can't be found
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
X-List-Received-Date: Sun, 18 Sep 2016 07:39:34 -0000
Content-Type: text/plain

From: Joshua Lock <joshua.g.lock@intel.com>

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
2.9.0



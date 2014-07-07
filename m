Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38CA76FF24
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 09:33:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s679Y18I021722
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 02:34:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Jul 2014 02:34:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Jul 2014 02:33:58 -0700
Message-ID: <97d978ed0f49da7c881046486badffdf6a44f139.1404725000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404725000.git.liezhi.yang@windriver.com>
References: <cover.1404725000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] lib/oe/image.py: check the rootfs size against IMAGE_ROOTFS_MAXSIZE
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
X-List-Received-Date: Mon, 07 Jul 2014 09:34:00 -0000
Content-Type: text/plain

* Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (if set)
* Add comments for IMAGE_ROOTFS_SIZE to not confuse with IMAGE_ROOTFS_MAXSIZE

[YOCTO #2610]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/bitbake.conf |    4 ++++
 meta/lib/oe/image.py   |    8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 311e9a0..f4870d5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -688,6 +688,10 @@ IMAGE_FSTYPES ?= "tar.gz"
 INITRAMFS_FSTYPES ?= "cpio.gz"
 DEFAULT_TASK_PROVIDER ?= "packagegroup-base"
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
+
+# The size in Kbytes for the generated image if it is larger than
+# the required size (du -ks IMAGE_ROOTFS * IMAGE_OVERHEAD_FACTOR),
+# and no effect if less than it.
 IMAGE_ROOTFS_SIZE ?= "65536"
 
 # Forcefully set CACHE now so future changes to things like 
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index c9b9033..354a676 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -144,6 +144,7 @@ class Image(ImageDepGraph):
         overhead_factor = float(self.d.getVar('IMAGE_OVERHEAD_FACTOR', True))
         rootfs_req_size = int(self.d.getVar('IMAGE_ROOTFS_SIZE', True))
         rootfs_extra_space = eval(self.d.getVar('IMAGE_ROOTFS_EXTRA_SPACE', True))
+        rootfs_maxsize = self.d.getVar('IMAGE_ROOTFS_MAXSIZE', True)
 
         output = subprocess.check_output(['du', '-ks',
                                           self.d.getVar('IMAGE_ROOTFS', True)])
@@ -158,6 +159,13 @@ class Image(ImageDepGraph):
         base_size += rootfs_alignment - 1
         base_size -= base_size % rootfs_alignment
 
+        # Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (if set)
+        if rootfs_maxsize:
+            rootfs_maxsize_int = int(rootfs_maxsize)
+            if base_size > rootfs_maxsize_int:
+                bb.fatal("The rootfs size %d(K) overrides the max size %d(K)" % \
+                    (base_size, rootfs_maxsize_int))
+
         return base_size
 
     def _create_symlinks(self, subimages):
-- 
1.7.9.5



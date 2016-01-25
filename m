Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF1976647
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 08:46:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0P8k1ID026707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 00:46:01 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jan 2016 00:46:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jan 2016 00:45:59 -0800
Message-ID: <23b13a29380ef5ce43dac44f683d1d48e9734ed4.1453711529.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453711529.git.liezhi.yang@windriver.com>
References: <cover.1453711529.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: check INITRAMFS_MAXSIZE
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
X-List-Received-Date: Mon, 25 Jan 2016 08:46:02 -0000
Content-Type: text/plain

Usually, the initramfs' maxsize can be 1/2 of ram size since modern
kernel uses tmpfs as initramfs by dafault, and tmpfs allocates 1/2 of
ram by default at boot time, which will be used to locate the initramfs.

Set INITRAMFS_MAXSIZE to 131072K (128M) by default (ram 256M), the
initramfs is small usually, for example, core-image-minimal-initramfs is
about 21M (uncompressed, 17M * 1.3) by default, but if the user add a
lot pkgs to initramfs, we can error and stop to let the user know ealier
rather than fail to boot (e.g., OOM-killer) at boot time.

Please see the bug for more info:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5963

[YOCTO #5963]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image.bbclass |   14 +++++++++++++-
 meta/conf/bitbake.conf     |    6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3870516..30d1173 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -423,6 +423,9 @@ def get_rootfs_size(d):
     rootfs_req_size = int(d.getVar('IMAGE_ROOTFS_SIZE', True))
     rootfs_extra_space = eval(d.getVar('IMAGE_ROOTFS_EXTRA_SPACE', True))
     rootfs_maxsize = d.getVar('IMAGE_ROOTFS_MAXSIZE', True)
+    image_fstypes = d.getVar('IMAGE_FSTYPES', True) or ''
+    initramfs_fstypes = d.getVar('INITRAMFS_FSTYPES', True) or ''
+    initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE', True)
 
     output = subprocess.check_output(['du', '-ks',
                                       d.getVar('IMAGE_ROOTFS', True)])
@@ -443,8 +446,17 @@ def get_rootfs_size(d):
     if rootfs_maxsize:
         rootfs_maxsize_int = int(rootfs_maxsize)
         if base_size > rootfs_maxsize_int:
-            bb.fatal("The rootfs size %d(K) overrides the max size %d(K)" % \
+            bb.fatal("The rootfs size %d(K) overrides IMAGE_ROOTFS_MAXSIZE: %d(K)" % \
                 (base_size, rootfs_maxsize_int))
+
+    # Check the initramfs size against INITRAMFS_MAXSIZE (if set)
+    if image_fstypes == initramfs_fstypes != ''  and initramfs_maxsize:
+        initramfs_maxsize_int = int(initramfs_maxsize)
+        if base_size > initramfs_maxsize_int:
+            bb.error("The initramfs size %d(K) overrides INITRAMFS_MAXSIZE: %d(K)" % \
+                (base_size, initramfs_maxsize_int))
+            bb.error("You can set INITRAMFS_MAXSIZE a larger value. Usually, it should")
+            bb.fatal("be less than 1/2 of ram size, or you may fail to boot it.\n")
     return base_size
 
 python set_image_size () {
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7451eb8..e80ee18 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -712,7 +712,13 @@ require conf/sanity.conf
 DL_DIR ?= "${TOPDIR}/downloads"
 SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
 IMAGE_FSTYPES ?= "tar.gz"
+
 INITRAMFS_FSTYPES ?= "cpio.gz"
+# The maximum size in Kbytes for the generated initramfs image size.
+# Usually, it should be less than 1/2 of ram size, or you may fail to
+# boot it.
+INITRAMFS_MAXSIZE ??= "131072"
+
 DEFAULT_TASK_PROVIDER ?= "packagegroup-base"
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 
-- 
1.7.9.5



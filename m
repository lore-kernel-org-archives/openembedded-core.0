Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 088E560234
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 04:28:35 +0000 (UTC)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Dec 2017 20:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,371,1508828400"; 
   d="scan'208";a="538260"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.34.148])
	by fmsmga007.fm.intel.com with ESMTP; 06 Dec 2017 20:28:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed,  6 Dec 2017 20:28:34 -0800
Message-Id: <20171207042834.12487-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] image.bbclass: Add additional bb.debug to help track 12304
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
X-List-Received-Date: Thu, 07 Dec 2017 04:28:36 -0000

We actually caught the ext4 size issue in the wild with the debug
output in the oe_mkext234fs() code, but it did not help.  What that
showed was that the get_rootfs_size was returning a default size of
8192, where as the actual rootfs was more like 10572, thus too large
to fit in the created sparse file.

This additional temporary debug code should help us determine where
the failure might be. 

More debug for
[YOCTO #12304]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image.bbclass | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d93de02b759..9964393e211 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -519,7 +519,7 @@ python () {
 #
 # Compute the rootfs size
 #
-def get_rootfs_size(d):
+def get_rootfs_size(d, force_size=0):
     import subprocess
 
     rootfs_alignment = int(d.getVar('IMAGE_ROOTFS_ALIGNMENT'))
@@ -531,24 +531,35 @@ def get_rootfs_size(d):
     initramfs_fstypes = d.getVar('INITRAMFS_FSTYPES') or ''
     initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE')
 
-    output = subprocess.check_output(['du', '-ks',
+    if (force_size != 0):
+        size_kb = force_size
+    else:
+        output = subprocess.check_output(['du', '-ks',
                                       d.getVar('IMAGE_ROOTFS')])
-    size_kb = int(output.split()[0])
+        size_kb = int(output.split()[0])
+
     base_size = size_kb * overhead_factor
-    base_size = max(base_size, rootfs_req_size) + rootfs_extra_space
+    bb.debug(1, '%f = %d * %f' % (base_size, size_kb, overhead_factor))
+    base_size2 = max(base_size, rootfs_req_size) + rootfs_extra_space
+    bb.debug(1, '%f = max(%f, %d)[%f] + %d' % (base_size2, base_size, rootfs_req_size, max(base_size, rootfs_req_size), overhead_factor))
 
+    base_size = base_size2
     if base_size != int(base_size):
         base_size = int(base_size + 1)
     else:
         base_size = int(base_size)
+    bb.debug(1, '%f = int(%f)' % (base_size, base_size2))
 
+    base_size_saved = base_size
     base_size += rootfs_alignment - 1
     base_size -= base_size % rootfs_alignment
+    bb.debug(1, '%d = aligned(%d)' % (base_size, base_size_saved))
 
     # Do not check image size of the debugfs image. This is not supposed
     # to be deployed, etc. so it doesn't make sense to limit the size
     # of the debug.
     if (d.getVar('IMAGE_BUILDING_DEBUGFS') or "") == "true":
+        bb.debug(1, 'returning debugfs size %d' % (base_size))
         return base_size
 
     # Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (if set)
@@ -566,6 +577,8 @@ def get_rootfs_size(d):
                 (base_size, initramfs_maxsize_int))
             bb.error("You can set INITRAMFS_MAXSIZE a larger value. Usually, it should")
             bb.fatal("be less than 1/2 of ram size, or you may fail to boot it.\n")
+
+    bb.debug(1, 'returning %d' % (base_size))
     return base_size
 
 python set_image_size () {
@@ -574,6 +587,13 @@ python set_image_size () {
         d.setVarFlag('ROOTFS_SIZE', 'export', '1')
 }
 
+do_testsize[nostamp] = "1"
+python do_testsize() {
+    sz = get_rootfs_size(d, 10572)
+    bb.warn('size is %d' % sz)
+}
+addtask do_testsize
+
 #
 # Create symlinks to the newly created image
 #
-- 
2.13.6



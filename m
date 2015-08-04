Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66996757A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 05:08:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7458G25013045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Aug 2015 22:08:17 -0700 (PDT)
Received: from brucehead.corp.ad.wrs.com (128.224.56.8) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 3 Aug 2015 22:08:16 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Aug 2015 01:07:55 -0400
Message-ID: <1438664875-148195-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.8.2.3
MIME-Version: 1.0
Cc: Damien Lespiau <damien.lespiau@intel.com>,
	Neil Roberts <neil@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH] xf86-video-intel: fix yocto/oe-core wreckage from libdrm upgrade
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
X-List-Received-Date: Tue, 04 Aug 2015 05:08:41 -0000
Content-Type: text/plain

In commit a117fd5ecdd9973c7e4d772d1785f1f4e9b162c2,
from OE-Core rev: 88d60e70da0890184922056cef1f20171f716ace
"libdrm: Upgrade to 2.4.62" we managed to break X like this:

[3602662.736] (--) intel(0): Integrated Graphics Chipset: Intel(R) HD Graphics 4600
[3602662.736] (--) intel(0): CPU: x86-64, sse2, sse3, ssse3, sse4.1, sse4.2, avx, avx2
[3602662.736] (II) intel(0): Creating default Display subsection in Screen section
        "Default Screen Section" for depth/fbbpp 24/32
[3602662.736] (==) intel(0): Depth 24, (--) framebuffer bpp 32
[3602662.736] (==) intel(0): RGB weight 888
[3602662.736] (==) intel(0): Default visual is TrueColor
[3602662.736] (EE)
[3602662.736] (EE) Backtrace:
[3602662.736] (EE) 0: /usr/bin/X (xorg_backtrace+0x49) [0x56ae09]
[3602662.736] (EE) 1: /usr/bin/X (0x400000+0x16ecd9) [0x56ecd9]
[3602662.736] (EE) 2: /lib64/libpthread.so.0 (0x3330600000+0x105e0) [0x33306105e0]
[3602662.736] (EE)
[3602662.736] (EE) Segmentation fault at address 0x0
[3602662.736] (EE)
Fatal server error:
[3602662.736] (EE) Caught signal 11 (Segmentation fault). Server aborting

A mix of a ~1 month old (working) image and the failing image led me
to determine /usr/lib64/xorg/modules/drivers/intel_drv.so was bad.
However nothing changed the parent package xf86-video-intel in
yocto for months.

So brute force bisecting yocto leads to the above commit.  Inserting
libdrm as git and then bisecting the 2.4.59 --> 2.4.62 uprev content
leads to libdrm commit 8576527cfacaf42af8316e1030c192193e94225a
("intel: Merge latest i915_drm.h") -- specifically, the part of that
commit that adds __u64 flags to drm_i915_gem_mmap lands in our sysroot
and is used by the compile of xf86-video-intel.

With the specific trigger finally pinpointed, the final leap was to
correlate that trigger to the upstream xf86-video-intel commit that
accounts for the fallout of this libdrm header change, that we did
not yet have here.  Fun times.  Hopefully this complete description
here will ensure nobody else has to retrace these steps again.

Cc: Damien Lespiau <damien.lespiau@intel.com>
Cc: Neil Roberts <neil@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Steffen Pankratz <steffen.pankratz@elektrobit.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/sna-Protect-against-ABI-breakage-in-recent-versions-.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/sna-Protect-against-ABI-breakage-in-recent-versions-.patch
new file mode 100644
index 000000000000..589d52e0f091
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/sna-Protect-against-ABI-breakage-in-recent-versions-.patch
@@ -0,0 +1,70 @@
+From 7fe2b2948652443ff43d907855bd7a051d54d309 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Thu, 19 Mar 2015 23:14:17 +0000
+Subject: [PATCH] sna: Protect against ABI breakage in recent versions of
+ libdrm
+
+commit 7fe2b2948652443ff43d907855bd7a051d54d309 upstream.
+
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+Upstream-Status: Backport
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+
+diff --git a/src/sna/kgem.c b/src/sna/kgem.c
+index 11f0828f2bbc..6f16cbac87f2 100644
+--- a/src/sna/kgem.c
++++ b/src/sna/kgem.c
+@@ -182,6 +182,15 @@ struct local_i915_gem_caching {
+ #define LOCAL_IOCTL_I915_GEM_SET_CACHING DRM_IOW(DRM_COMMAND_BASE + LOCAL_I915_GEM_SET_CACHING, struct local_i915_gem_caching)
+ #define LOCAL_IOCTL_I915_GEM_GET_CACHING DRM_IOW(DRM_COMMAND_BASE + LOCAL_I915_GEM_GET_CACHING, struct local_i915_gem_caching)
+ 
++struct local_i915_gem_mmap {
++	uint32_t handle;
++	uint32_t pad;
++	uint64_t offset;
++	uint64_t size;
++	uint64_t addr_ptr;
++};
++#define LOCAL_IOCTL_I915_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP, struct local_i915_gem_mmap)
++
+ struct local_i915_gem_mmap2 {
+ 	uint32_t handle;
+ 	uint32_t pad;
+@@ -514,15 +523,15 @@ retry_wc:
+ 
+ static void *__kgem_bo_map__cpu(struct kgem *kgem, struct kgem_bo *bo)
+ {
+-	struct drm_i915_gem_mmap mmap_arg;
++	struct local_i915_gem_mmap arg;
+ 	int err;
+ 
+ retry:
+-	VG_CLEAR(mmap_arg);
+-	mmap_arg.handle = bo->handle;
+-	mmap_arg.offset = 0;
+-	mmap_arg.size = bytes(bo);
+-	if ((err = do_ioctl(kgem->fd, DRM_IOCTL_I915_GEM_MMAP, &mmap_arg))) {
++	VG_CLEAR(arg);
++	arg.handle = bo->handle;
++	arg.offset = 0;
++	arg.size = bytes(bo);
++	if ((err = do_ioctl(kgem->fd, LOCAL_IOCTL_I915_GEM_MMAP, &arg))) {
+ 		assert(err != EINVAL);
+ 
+ 		if (__kgem_throttle_retire(kgem, 0))
+@@ -536,10 +545,10 @@ retry:
+ 		return NULL;
+ 	}
+ 
+-	VG(VALGRIND_MAKE_MEM_DEFINED(mmap_arg.addr_ptr, bytes(bo)));
++	VG(VALGRIND_MAKE_MEM_DEFINED(arg.addr_ptr, bytes(bo)));
+ 
+ 	DBG(("%s: caching CPU vma for %d\n", __FUNCTION__, bo->handle));
+-	return bo->map__cpu = (void *)(uintptr_t)mmap_arg.addr_ptr;
++	return bo->map__cpu = (void *)(uintptr_t)arg.addr_ptr;
+ }
+ 
+ static int gem_write(int fd, uint32_t handle,
+-- 
+2.4.4
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
index 26b68b461cba..0ab738050611 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
 SRC_URI += "file://disable-x11-dri3.patch \
             file://always_include_xorg_server.h.patch \
+            file://sna-Protect-against-ABI-breakage-in-recent-versions-.patch \
            "
 
 SRC_URI[md5sum] = "fa196a66e52c0c624fe5d350af7a5e7b"
-- 
1.8.2.3



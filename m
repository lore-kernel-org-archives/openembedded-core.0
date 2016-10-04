Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6745C6FF5D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 07:17:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 04 Oct 2016 00:17:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,442,1473145200"; d="scan'208";a="1060148224"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 04 Oct 2016 00:17:32 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 10:17:27 +0300
Message-Id: <9ad13291600d5d0d1845de7f36f36a40533d88a6.1475565233.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475565233.git.jussi.kukkonen@intel.com>
References: <cover.1475565233.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 1/2] xf86-video-intel: Upgrade to recent git
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
X-List-Received-Date: Tue, 04 Oct 2016 07:17:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade from the latest snapshot to a recent git revision.
Without this xvideo does not work on skylake: Backporting the
specific fixes turned out to be too complex.

Remove patches that are in upstream already, rebase
disable-x11-dri3.patch.

Fixes [YOCTO #10041]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-gen8-Fix-the-YUV-RGB-shader.patch         | 65 --------------------
 ...-call-to-PixmapSyncDirtyHelper-broken-by-.patch | 30 ----------
 .../xf86-video-intel/disable-x11-dri3.patch        |  6 +-
 ...-against-ABI-breakage-in-recent-versions-.patch | 70 ----------------------
 .../xorg-driver/xf86-video-intel/udev-fstat.patch  | 59 ------------------
 ...o-intel_2.99.917.bb => xf86-video-intel_git.bb} | 13 ++--
 6 files changed, 10 insertions(+), 233 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-gen8-Fix-the-YUV-RGB-shader.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/sna-Protect-against-ABI-breakage-in-recent-versions-.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/udev-fstat.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.99.917.bb => xf86-video-intel_git.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-gen8-Fix-the-YUV-RGB-shader.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-gen8-Fix-the-YUV-RGB-shader.patch
deleted file mode 100644
index 3576219..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-gen8-Fix-the-YUV-RGB-shader.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From c43617b739e358064396912c7a7a8028ca91d201 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
-Date: Thu, 16 Apr 2015 20:40:39 +0300
-Subject: [PATCH] gen8: Fix the YUV->RGB shader
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Use the correct register (Yn_01) with first half of the
-Y samples instead of using the register (Yn_23) with the
-second half twice when computing the green channel.
-
-Also use the Yn_01 register name instead of Yn for the red
-channel as well, just for a bit of extra consistency.
-
-Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=89807
-Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
-Tested-by: Chris Wilson <chris@chris-wilson.co.uk>
-
-Upstream-Status: Backport
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
----
- src/render_program/exa_wm_yuv_rgb.g8a | 4 ++--
- src/render_program/exa_wm_yuv_rgb.g8b | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/render_program/exa_wm_yuv_rgb.g8a b/src/render_program/exa_wm_yuv_rgb.g8a
-index 7def093..34973ba 100644
---- a/src/render_program/exa_wm_yuv_rgb.g8a
-+++ b/src/render_program/exa_wm_yuv_rgb.g8a
-@@ -76,7 +76,7 @@ add (16)    Cbn<1>F		Cb<8,8,1>F	-0.501961F  { compr align1 };
-     /* 
-      * R = Y + Cr * 1.596
-      */
--mov (8)    acc0<1>F		Yn<8,8,1>F		    { compr align1 };
-+mov (8)    acc0<1>F		Yn_01<8,8,1>F		    { compr align1 };
- mac.sat(8) src_sample_r_01<1>F	Crn_01<8,8,1>F	1.596F	    { compr align1 };
-      
- mov (8)    acc0<1>F		Yn_23<8,8,1>F		    { compr align1 };
-@@ -84,7 +84,7 @@ mac.sat(8) src_sample_r_23<1>F	Crn_23<8,8,1>F	1.596F	    { compr align1 };
-     /*
-      * G = Crn * -0.813 + Cbn * -0.392 + Y
-      */
--mov (8)    acc0<1>F		Yn_23<8,8,1>F		    { compr align1 };
-+mov (8)    acc0<1>F		Yn_01<8,8,1>F		    { compr align1 };
- mac (8)    acc0<1>F		Crn_01<8,8,1>F    	-0.813F	    { compr align1 };
- mac.sat(8) src_sample_g_01<1>F	Cbn_01<8,8,1>F    	-0.392F	    { compr align1 };
- 
-diff --git a/src/render_program/exa_wm_yuv_rgb.g8b b/src/render_program/exa_wm_yuv_rgb.g8b
-index 4494953..2cd6fc4 100644
---- a/src/render_program/exa_wm_yuv_rgb.g8b
-+++ b/src/render_program/exa_wm_yuv_rgb.g8b
-@@ -6,7 +6,7 @@
-    { 0x80600048, 0x21c03ae8, 0x3e8d02c0, 0x3fcc49ba },
-    { 0x00600001, 0x24003ae0, 0x008d0320, 0x00000000 },
-    { 0x80600048, 0x21e03ae8, 0x3e8d02e0, 0x3fcc49ba },
--   { 0x00600001, 0x24003ae0, 0x008d0320, 0x00000000 },
-+   { 0x00600001, 0x24003ae0, 0x008d0300, 0x00000000 },
-    { 0x00600048, 0x24003ae0, 0x3e8d02c0, 0xbf5020c5 },
-    { 0x80600048, 0x22003ae8, 0x3e8d0340, 0xbec8b439 },
-    { 0x00600001, 0x24003ae0, 0x008d0320, 0x00000000 },
--- 
-2.5.0
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch
deleted file mode 100644
index 29924bb..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2c5063938cc809f624e56efd4673041fa8141e81 Mon Sep 17 00:00:00 2001
-From: Martin Peres <martin.peres@linux.intel.com>
-Date: Thu, 9 Jul 2015 11:26:38 +0300
-Subject: [PATCH] uxa: fix the call to PixmapSyncDirtyHelper, broken by
- xserver's 90db5ed
-
-[ickle: switch to HAS_DIRTYTRACKING_ROTATION as suggested by Dave Airlie]
-Signed-off-by: Martin Peres <martin.peres@linux.intel.com>
-
-Upstream-Status: Backport
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- src/compat-api.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/compat-api.h b/src/compat-api.h
-index aa93bee..293e9d7 100644
---- a/src/compat-api.h
-+++ b/src/compat-api.h
-@@ -247,3 +247,7 @@ static inline void FreePixmap(PixmapPtr pixmap)
- #endif
- 
- #endif
-+
-+#if HAS_DIRTYTRACKING_ROTATION
-+#define PixmapSyncDirtyHelper(d, dd) PixmapSyncDirtyHelper(d)
-+#endif
--- 
-2.5.0
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch
index dda508d..3dddd33 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch
@@ -12,6 +12,6 @@ diff --git a/configure.ac b/configure.ac
 index bd654f3..78a0e0d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -251 +251 @@ fi
--PKG_CHECK_MODULES(X11_DRI3, [xcb-dri3 xcb-sync xcb-present x11-xcb xshmfence x11 xrender xext libdrm], [x11_dri3="yes"], [x11_dri3="no"])
-+#PKG_CHECK_MODULES(X11_DRI3, [xcb-dri3 xcb-sync xcb-present x11-xcb xshmfence x11 xrender xext libdrm], [x11_dri3="yes"], [x11_dri3="no"])
+@@ -279 +279 @@ fi
+-PKG_CHECK_MODULES(X11_DRI3, [xcb-dri3 xcb-sync xcb-xfixes xcb-present x11-xcb xshmfence x11 xcomposite xdamage xrender xrandr xxf86vm xext libdrm], [x11_dri3="yes"], [x11_dri3="no"])
++#PKG_CHECK_MODULES(X11_DRI3, [xcb-dri3 xcb-sync xcb-xfixes xcb-present x11-xcb xshmfence x11 xcomposite xdamage xrender xrandr xxf86vm xext libdrm], [x11_dri3="yes"], [x11_dri3="no"])
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/sna-Protect-against-ABI-breakage-in-recent-versions-.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/sna-Protect-against-ABI-breakage-in-recent-versions-.patch
deleted file mode 100644
index 589d52e..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/sna-Protect-against-ABI-breakage-in-recent-versions-.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 7fe2b2948652443ff43d907855bd7a051d54d309 Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Thu, 19 Mar 2015 23:14:17 +0000
-Subject: [PATCH] sna: Protect against ABI breakage in recent versions of
- libdrm
-
-commit 7fe2b2948652443ff43d907855bd7a051d54d309 upstream.
-
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-Upstream-Status: Backport
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
-diff --git a/src/sna/kgem.c b/src/sna/kgem.c
-index 11f0828f2bbc..6f16cbac87f2 100644
---- a/src/sna/kgem.c
-+++ b/src/sna/kgem.c
-@@ -182,6 +182,15 @@ struct local_i915_gem_caching {
- #define LOCAL_IOCTL_I915_GEM_SET_CACHING DRM_IOW(DRM_COMMAND_BASE + LOCAL_I915_GEM_SET_CACHING, struct local_i915_gem_caching)
- #define LOCAL_IOCTL_I915_GEM_GET_CACHING DRM_IOW(DRM_COMMAND_BASE + LOCAL_I915_GEM_GET_CACHING, struct local_i915_gem_caching)
- 
-+struct local_i915_gem_mmap {
-+	uint32_t handle;
-+	uint32_t pad;
-+	uint64_t offset;
-+	uint64_t size;
-+	uint64_t addr_ptr;
-+};
-+#define LOCAL_IOCTL_I915_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP, struct local_i915_gem_mmap)
-+
- struct local_i915_gem_mmap2 {
- 	uint32_t handle;
- 	uint32_t pad;
-@@ -514,15 +523,15 @@ retry_wc:
- 
- static void *__kgem_bo_map__cpu(struct kgem *kgem, struct kgem_bo *bo)
- {
--	struct drm_i915_gem_mmap mmap_arg;
-+	struct local_i915_gem_mmap arg;
- 	int err;
- 
- retry:
--	VG_CLEAR(mmap_arg);
--	mmap_arg.handle = bo->handle;
--	mmap_arg.offset = 0;
--	mmap_arg.size = bytes(bo);
--	if ((err = do_ioctl(kgem->fd, DRM_IOCTL_I915_GEM_MMAP, &mmap_arg))) {
-+	VG_CLEAR(arg);
-+	arg.handle = bo->handle;
-+	arg.offset = 0;
-+	arg.size = bytes(bo);
-+	if ((err = do_ioctl(kgem->fd, LOCAL_IOCTL_I915_GEM_MMAP, &arg))) {
- 		assert(err != EINVAL);
- 
- 		if (__kgem_throttle_retire(kgem, 0))
-@@ -536,10 +545,10 @@ retry:
- 		return NULL;
- 	}
- 
--	VG(VALGRIND_MAKE_MEM_DEFINED(mmap_arg.addr_ptr, bytes(bo)));
-+	VG(VALGRIND_MAKE_MEM_DEFINED(arg.addr_ptr, bytes(bo)));
- 
- 	DBG(("%s: caching CPU vma for %d\n", __FUNCTION__, bo->handle));
--	return bo->map__cpu = (void *)(uintptr_t)mmap_arg.addr_ptr;
-+	return bo->map__cpu = (void *)(uintptr_t)arg.addr_ptr;
- }
- 
- static int gem_write(int fd, uint32_t handle,
--- 
-2.4.4
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/udev-fstat.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/udev-fstat.patch
deleted file mode 100644
index 0e675ee..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/udev-fstat.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 12af8a575d1518d40416f83195049157c3a062a5 Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Tue, 24 Feb 2015 15:25:40 +0000
-Subject: sna: udev integration depends on fstat and sys/stat.h
-
-src/sna/sna_driver.c: In function 'sna_handle_uevents':
-src/sna/sna_driver.c:759:2: error: implicit declaration of function 'fstat' [-Werror=implicit-function-declaration]
-
-Also take the opportunity to include udev support in the configure
-summary.
-
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-
-diff --git a/configure.ac b/configure.ac
-index 7476e2b..de3a4b3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -197,11 +197,15 @@ AC_ARG_ENABLE(udev,
- 
- if test "x$UDEV" != "xno"; then
- 	PKG_CHECK_MODULES(UDEV, [libudev], [udev="yes"], [udev="no"])
-+	AC_CHECK_HEADERS([sys/stat.h], [], [udev="no"])
- 	if test "x$UDEV" = "xyes" -a "x$udev" != "xyes"; then
- 		AC_MSG_ERROR([udev support requested but not found (libudev)])
- 	fi
- 	if test "x$udev" = "xyes"; then
- 		AC_DEFINE(HAVE_UDEV,1,[Enable udev-based monitor hotplug detection])
-+		udev_msg=" yes"
-+	else
-+		udev_msg=" no"
- 	fi
- fi
- 
-@@ -911,6 +915,7 @@ echo "  Support for Kernel Mode Setting? $KMS"
- echo "  Support for legacy User Mode Setting (for i810)? $UMS"
- echo "  Support for Direct Rendering Infrastructure:$dri_msg"
- echo "  Support for Xv motion compensation (XvMC and libXvMC):$xvmc_msg"
-+echo "  Support for display hotplug notifications (udev):$udev_msg"
- echo "  Build additional tools and utilities?$tools_msg"
- if test -n "$xp_msg"; then
- echo "  Experimental support:$xp_msg"
-diff --git a/src/sna/sna_driver.c b/src/sna/sna_driver.c
-index 8c0d0b5..bc20ef0 100644
---- a/src/sna/sna_driver.c
-+++ b/src/sna/sna_driver.c
-@@ -740,6 +740,8 @@ sna_wakeup_handler(WAKEUPHANDLER_ARGS_DECL)
- }
- 
- #if HAVE_UDEV
-+#include <sys/stat.h>
-+
- static void
- sna_handle_uevents(int fd, void *closure)
- {
--- 
-cgit v0.10.2
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index d75b44f..06cc730 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -9,12 +9,13 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-SRC_URI += "file://disable-x11-dri3.patch \
-            file://always_include_xorg_server.h.patch \
-            file://sna-Protect-against-ABI-breakage-in-recent-versions-.patch \
-            file://udev-fstat.patch \
-            file://0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch \
-            file://0001-gen8-Fix-the-YUV-RGB-shader.patch \
+SRCREV = "8f33f80100096f7790c7b819ce37a3ed8ce8b5fa"
+PV = "2.99.917+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
+           file://disable-x11-dri3.patch \
+           file://always_include_xorg_server.h.patch \
            "
 
 SRC_URI[md5sum] = "fa196a66e52c0c624fe5d350af7a5e7b"
-- 
2.1.4



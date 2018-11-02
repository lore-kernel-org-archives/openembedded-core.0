Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id F2E6E79F16
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 06:58:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2018 23:58:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,454,1534834800"; d="scan'208";a="277731264"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.114])
	by fmsmga006.fm.intel.com with ESMTP; 01 Nov 2018 23:58:53 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Nov 2018 14:58:52 +0800
Message-Id: <20181102065852.19903-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] xf86-video-intel: update to latest
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
X-List-Received-Date: Fri, 02 Nov 2018 06:58:54 -0000

For changes, please see:

https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/log/?qt=range&q=e4fe79cf0d9a05ee3f3a027148ef0aeb2b1b34e1...0932a6b37ba6d5c9e916a1cb6ab89c3205b81a0c

Enable sna by default and remove upstreamed patches.

Also include a patch from fedora to fix compile issues when using
qemux86 which doesn't enable sse2 leading to gcc refusing to
inline vertex_emit_2s in emit_vertex because they are defined as:

  static __attribute__((always_inline)) void
  vertex_emit_2s(struct sna *sna, int16_t x, int16_t y)

  __attribute__((target("sse2,fpmath=sse"))) __attribute__((always_inline))
  static void emit_vertex(/* omitted */)

leading to errors like:

| In file included from ../../../git/src/sna/gen4_vertex.c:34:
| ../../../git/src/sna/gen4_vertex.c: In function 'emit_vertex':
| ../../../git/src/sna/sna_render_inline.h:40:26: error: inlining failed in call to always_inline 'vertex_emit_2s': target specific option mismatch
|  static force_inline void vertex_emit_2s(struct sna *sna, int16_t x, int16_t y)
|                           ^~~~~~~~~~~~~~
| ../../../git/src/sna/gen4_vertex.c:308:25: note: called from here
|  #define OUT_VERTEX(x,y) vertex_emit_2s(sna, x,y) /* XXX assert(!too_large(x, y)); */
|                          ^~~~~~~~~~~~~~~~~~~~~~~~
| ../../../git/src/sna/gen4_vertex.c:360:2: note: in expansion of macro 'OUT_VERTEX'
|   OUT_VERTEX(dstX, dstY);
|   ^~~~~~~~~~

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...01-Add-Coffeelake-PCI-IDs-for-S-Skus.patch | 116 ------------------
 .../01_Fix-build-on-i686.patch                |  55 +++++++++
 .../xorg-driver/xf86-video-intel/glibc.patch  |  25 ----
 .../xorg-driver/xf86-video-intel_git.bb       |   8 +-
 4 files changed, 59 insertions(+), 145 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/01_Fix-build-on-i686.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch
deleted file mode 100644
index 06ef10501a..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 96d4e8e7b8a699f0ef77fa7b210d4de5f1c703d0 Mon Sep 17 00:00:00 2001
-From: Liwei Song <liwei.song@windriver.com>
-Date: Wed, 22 Nov 2017 08:59:03 +0000
-Subject: [PATCH] Add Coffeelake PCI IDs for S Skus
-
-Add the Coffeelake PCI IDs based on the following kernel patches:
-
-commit b056f8f3d6b900e8afd19f312719160346d263b4
-Author: Anusha Srivatsa <anusha.srivatsa@intel.com>
-Date:   Thu Jun 8 16:41:05 2017 -0700
-
-    drm/i915/cfl: Add Coffee Lake PCI IDs for S Skus.
-
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10139905]
-
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- src/i915_pciids.h     |  7 +++++++
- src/intel_module.c    | 13 +++++++++++++
- src/sna/gen9_render.c | 12 ++++++++++++
- 3 files changed, 32 insertions(+)
-
-diff --git a/src/i915_pciids.h b/src/i915_pciids.h
-index 0370f830c541..11ccfa9c047a 100644
---- a/src/i915_pciids.h
-+++ b/src/i915_pciids.h
-@@ -340,4 +340,11 @@
- 	INTEL_VGA_DEVICE(0x3184, info), \
- 	INTEL_VGA_DEVICE(0x3185, info)
- 
-+#define INTEL_CFL_S_IDS(info) \
-+	INTEL_VGA_DEVICE(0x3E90, info), /* SRV GT1 */ \
-+	INTEL_VGA_DEVICE(0x3E93, info), /* SRV GT1 */ \
-+	INTEL_VGA_DEVICE(0x3E91, info), /* SRV GT2 */ \
-+	INTEL_VGA_DEVICE(0x3E92, info), /* SRV GT2 */ \
-+	INTEL_VGA_DEVICE(0x3E96, info)  /* SRV GT2 */
-+
- #endif /* _I915_PCIIDS_H */
-diff --git a/src/intel_module.c b/src/intel_module.c
-index 6b04857e2853..4827a67255f0 100644
---- a/src/intel_module.c
-+++ b/src/intel_module.c
-@@ -138,6 +138,10 @@ static const struct intel_device_info intel_geminilake_info = {
- 	.gen = 0113,
- };
- 
-+static const struct intel_device_info intel_coffeelake_info = {
-+	.gen = 0114,
-+};
-+
- static const SymTabRec intel_chipsets[] = {
- 	{PCI_CHIP_I810,				"i810"},
- 	{PCI_CHIP_I810_DC100,			"i810-dc100"},
-@@ -303,6 +307,13 @@ static const SymTabRec intel_chipsets[] = {
- 	{0x5916, "HD Graphics 620"},
- 	{0x591E, "HD Graphics 615"},
- 
-+	/*Coffeelake*/
-+	{0x3E90, "HD Graphics"},
-+	{0x3E93, "HD Graphics"},
-+	{0x3E91, "HD Graphics"},
-+	{0x3E92, "HD Graphics"},
-+	{0x3E96, "HD Graphics"},
-+
- 	/* When adding new identifiers, also update:
- 	 * 1. intel_identify()
- 	 * 2. man/intel.man
-@@ -368,6 +379,8 @@ static const struct pci_id_match intel_device_match[] = {
- 
- 	INTEL_GLK_IDS(&intel_geminilake_info),
- 
-+	INTEL_CFL_S_IDS(&intel_coffeelake_info),
-+
- 	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
- #endif
- 
-diff --git a/src/sna/gen9_render.c b/src/sna/gen9_render.c
-index e5f12c723956..7f49052c5ec1 100644
---- a/src/sna/gen9_render.c
-+++ b/src/sna/gen9_render.c
-@@ -245,6 +245,11 @@ static const struct gt_info glk_gt_info = {
- 	.urb = { .max_vs_entries = 320 },
- };
- 
-+static const struct gt_info cfl_gt_info = {
-+	.name = "Coffeelake (gen9)",
-+	.urb = { .max_vs_entries = 960 },
-+};
-+
- static bool is_skl(struct sna *sna)
- {
- 	return sna->kgem.gen == 0110;
-@@ -265,6 +270,11 @@ static bool is_glk(struct sna *sna)
- 	return sna->kgem.gen == 0113;
- }
- 
-+static bool is_cfl(struct sna *sna)
-+{
-+	return sna->kgem.gen == 0114;
-+}
-+
- 
- static inline bool too_large(int width, int height)
- {
-@@ -4040,6 +4050,8 @@ static bool gen9_render_setup(struct sna *sna)
- 		state->info = &kbl_gt_info;
- 	if (is_glk(sna))
- 		state->info = &glk_gt_info;
-+	if (is_cfl(sna))
-+		state->info = &cfl_gt_info;
- 
- 	sna_static_stream_init(&general);
- 
--- 
-2.13.3
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/01_Fix-build-on-i686.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/01_Fix-build-on-i686.patch
new file mode 100644
index 0000000000..52916f8b4a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/01_Fix-build-on-i686.patch
@@ -0,0 +1,55 @@
+From a414d4e24461da1cb4cef8ee910bc57bab360ceb Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 6 Mar 2018 12:07:46 -0500
+Subject: [PATCH] Fix build on i686
+
+Presumably this only matters for i686 because amd64 implies sse2, but:
+
+BUILDSTDERR: In file included from gen4_vertex.c:34:
+BUILDSTDERR: gen4_vertex.c: In function 'emit_vertex':
+BUILDSTDERR: sna_render_inline.h:40:26: error: inlining failed in call to always_inline 'vertex_emit_2s': target specific option mismatch
+BUILDSTDERR:  static force_inline void vertex_emit_2s(struct sna *sna, int16_t x, int16_t y)
+BUILDSTDERR:                           ^~~~~~~~~~~~~~
+BUILDSTDERR: gen4_vertex.c:308:25: note: called from here
+BUILDSTDERR:  #define OUT_VERTEX(x,y) vertex_emit_2s(sna, x,y) /* XXX assert(!too_large(x, y)); */
+BUILDSTDERR:                          ^~~~~~~~~~~~~~~~~~~~~~~~
+BUILDSTDERR: gen4_vertex.c:360:2: note: in expansion of macro 'OUT_VERTEX'
+BUILDSTDERR:   OUT_VERTEX(dstX, dstY);
+BUILDSTDERR:   ^~~~~~~~~~
+
+The bug here appears to be that emit_vertex() is declared 'sse2' but
+vertex_emit_2s is merely always_inline. gcc8 decides that since you said
+always_inline you need to have explicitly cloned it for every
+permutation of targets. Merely saying inline seems to do the job of
+cloning vertex_emit_2s as much as necessary.
+
+So to reiterate: if you say always-inline, it won't, but if you just say
+maybe inline, it will. Thanks gcc, that's helpful.
+
+- ajax
+
+Patch taken from Fedora.
+
+Upstream-Status: Pending
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ src/sna/compiler.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sna/compiler.h b/src/sna/compiler.h
+index 3c176a16..bc447c7a 100644
+--- a/src/sna/compiler.h
++++ b/src/sna/compiler.h
+@@ -32,7 +32,7 @@
+ #define likely(expr) (__builtin_expect (!!(expr), 1))
+ #define unlikely(expr) (__builtin_expect (!!(expr), 0))
+ #define noinline __attribute__((noinline))
+-#define force_inline inline __attribute__((always_inline))
++#define force_inline inline
+ #define fastcall __attribute__((regparm(3)))
+ #define must_check __attribute__((warn_unused_result))
+ #define constant __attribute__((const))
+-- 
+2.16.2
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch
deleted file mode 100644
index ada9eb5e52..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Add a missing include needed for glibc 2.28 to avoid:
-
-| ../../git/tools/backlight_helper.c: In function 'main':
-| ../../git/tools/backlight_helper.c:54:34: error: implicit declaration of function 'major' [-Werror=implicit-function-declaration]
-|   if (fd < 0 || fstat(fd, &st) || major(st.st_dev))
-|                                   ^~~~~
-| ../../git/tools/backlight_helper.c:54:34: warning: nested extern declaration of 'major' [-Wnested-externs]
-| cc1: some warnings being treated as errors
-| Makefile:666: recipe for target 'backlight_helper.o' failed
-
-Upstream-Status: Pending
-RP 2018/8/12
-
-Index: git/tools/backlight_helper.c
-===================================================================
---- git.orig/tools/backlight_helper.c
-+++ git/tools/backlight_helper.c
-@@ -8,6 +8,7 @@
- 
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- 
- #if MAJOR_IN_MKDEV
- #include <sys/mkdev.h>
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 655fd4dc69..3d435e8b31 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -9,20 +9,20 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-SRCREV = "e4fe79cf0d9a05ee3f3a027148ef0aeb2b1b34e1"
+SRCREV = "0932a6b37ba6d5c9e916a1cb6ab89c3205b81a0c"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
-           file://0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch \
-           file://glibc.patch \
            "
 
+SRC_URI_append_qemux86 = "file://01_Fix-build-on-i686.patch"
+
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
-PACKAGECONFIG ??= "xvmc uxa udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 dri3', '', d)}"
+PACKAGECONFIG ??= "sna xvmc uxa udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 dri3', '', d)}"
 
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri"
 PACKAGECONFIG[dri1] = "--enable-dri1,--disable-dri1"
-- 
2.17.1



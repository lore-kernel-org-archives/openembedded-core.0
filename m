Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 15BE37459B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:19:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2018 01:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,443,1534834800"; d="scan'208";a="86683880"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.149])
	by orsmga006.jf.intel.com with ESMTP; 30 Oct 2018 01:19:44 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Oct 2018 16:19:42 +0800
Message-Id: <20181030081942.20787-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] xf86-video-intel: update to latest
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
X-List-Received-Date: Tue, 30 Oct 2018 08:19:44 -0000

For changes, please see:

https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/log/?qt=range&q=e4fe79cf0d9a05ee3f3a027148ef0aeb2b1b34e1...0932a6b37ba6d5c9e916a1cb6ab89c3205b81a0c

Enable sna by default and remove upstreamed patches.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...01-Add-Coffeelake-PCI-IDs-for-S-Skus.patch | 116 ------------------
 .../xorg-driver/xf86-video-intel/glibc.patch  |  25 ----
 .../xorg-driver/xf86-video-intel_git.bb       |   6 +-
 3 files changed, 2 insertions(+), 145 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch
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
index 655fd4dc69..82b016f1c8 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -9,20 +9,18 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-SRCREV = "e4fe79cf0d9a05ee3f3a027148ef0aeb2b1b34e1"
+SRCREV = "0932a6b37ba6d5c9e916a1cb6ab89c3205b81a0c"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
-           file://0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch \
-           file://glibc.patch \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
-PACKAGECONFIG ??= "xvmc uxa udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 dri3', '', d)}"
+PACKAGECONFIG ??= "sna xvmc uxa udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 dri3', '', d)}"
 
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri"
 PACKAGECONFIG[dri1] = "--enable-dri1,--disable-dri1"
-- 
2.17.1



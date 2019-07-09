Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D08637E1FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 02:04:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jul 2019 19:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,468,1557212400"; d="scan'208";a="159308139"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Jul 2019 19:03:43 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 10:03:34 +0800
Message-Id: <1562637818-76884-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562637818-76884-1-git-send-email-anuj.mittal@intel.com>
References: <1562637818-76884-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH v2 2/6] vulkan-loader: add recipe
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
X-List-Received-Date: Tue, 09 Jul 2019 02:04:46 -0000

From: Tim Orling <timothy.t.orling@linux.intel.com>

Khronos official Vulkan ICD desktop loader for Windows, Linux, and MacOS.

Adapted from vulkan recipe with the changes done to remove obsolete options.
Needs either of X11 or Wayland to be enabled.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../vulkan/vulkan-loader_1.1.108.bb                | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5f3bef5..7c4b8a4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -720,6 +720,7 @@ RECIPE_MAINTAINER_pn-vte = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-demos = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-headers = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-vulkan-loader = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-waffle = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb
new file mode 100644
index 0000000..2fd6c44
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.1.108.bb
@@ -0,0 +1,37 @@
+SUMMARY = "3D graphics and compute API common loader"
+DESCRIPTION = "Vulkan is a new generation graphics and compute API \
+that provides efficient access to modern GPUs. These packages \
+provide only the common vendor-agnostic library loader, headers and \
+the vulkaninfo utility."
+HOMEPAGE = "https://www.khronos.org/vulkan/"
+BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Loader"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-${PV}"
+SRCREV = "ecb0b1e69fb2f4d3cae262e6da24c170ce62ae13"
+
+S = "${WORKDIR}/git"
+
+REQUIRED_DISTRO_FEATURES = "vulkan"
+
+inherit cmake distro_features_check
+ANY_OF_DISTRO_FEATURES = "x11 wayland"
+
+DEPENDS += "vulkan-headers"
+
+EXTRA_OECMAKE = "\
+                 -DBUILD_TESTS=OFF \
+                 -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
+                 "
+
+# must choose x11 or wayland or both
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
+
+PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
+PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
+
+RRECOMMENDS_${PN} = "mesa-vulkan-drivers"
+
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.7.4



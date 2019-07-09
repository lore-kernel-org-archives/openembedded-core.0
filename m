Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 091EB7DE3D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 02:04:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jul 2019 19:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,468,1557212400"; d="scan'208";a="159308143"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Jul 2019 19:03:44 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 10:03:35 +0800
Message-Id: <1562637818-76884-3-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562637818-76884-1-git-send-email-anuj.mittal@intel.com>
References: <1562637818-76884-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH v2 3/6] vulkan-tools: add recipe
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

Vulkan tools and utilities that can assist development by enabling
developers to verify their applications correct use of the Vulkan API.

DEPENDS on vulkan-headers and vulkan-loader.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../vulkan/vulkan-tools_1.1.108.bb                 | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7c4b8a4..4556c79 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -721,6 +721,7 @@ RECIPE_MAINTAINER_pn-vulkan = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-demos = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-headers = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-loader = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-waffle = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb
new file mode 100644
index 0000000..26cdee3
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Vulkan Utilities and Tools"
+HOMEPAGE = "https://www.khronos.org/vulkan/"
+BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Tools"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-${PV}"
+SRCREV = "3ccd7f6ebae3e1919adf837718c04feb6c2acc61"
+
+S = "${WORKDIR}/git"
+
+inherit cmake distro_features_check
+ANY_OF_DISTRO_FEATURES = "x11 wayland"
+REQUIRED_DISTRO_FEATURES = "vulkan"
+
+DEPENDS += "vulkan-headers vulkan-loader"
+
+EXTRA_OECMAKE = "\
+                 -DBUILD_TESTS=OFF \
+                 -DBUILD_CUBE=OFF \
+                 -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
+                 "
+
+# must choose x11 or wayland or both
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
+
+PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
+PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
+
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.7.4



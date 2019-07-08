Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 28CA97D391
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 07:31:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jul 2019 00:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,465,1557212400"; d="scan'208";a="363721378"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.181.245])
	by fmsmga005.fm.intel.com with ESMTP; 08 Jul 2019 00:31:14 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2019 15:30:58 +0800
Message-Id: <20190708073101.7529-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708073101.7529-1-anuj.mittal@intel.com>
References: <20190708073101.7529-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] vulkan-tools: add recipe
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
X-List-Received-Date: Mon, 08 Jul 2019 07:31:14 -0000
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Vulkan tools and utilities that can assist development by enabling
developers to verify their applications correct use of the Vulkan API.

DEPENDS on vulkan-headers and vulkan-loader.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../vulkan/vulkan-tools_1.1.108.bb            | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7c4b8a4a67..4556c793d5 100644
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
index 0000000000..33c66b4714
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.108.bb
@@ -0,0 +1,34 @@
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
+PACKAGECONFIG ??= "\
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '' ,d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '' ,d)} \
+                   "
+
+PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
+PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
+
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.20.1



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 798AB7C046
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:01:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI71isQ016607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 23:01:44 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:01:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 15:18:09 +0800
Message-ID: <d39e51ec4cf51d606524e6780ec3d66b6d7da3f8.1545102457.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545102457.git.liezhi.yang@windriver.com>
References: <cover.1545102457.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 09/11] cmake.bbclass: Make it work with ccache
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
X-List-Received-Date: Tue, 18 Dec 2018 07:01:43 -0000
Content-Type: text/plain

This can make the following recipes work with cmake:
cmake libdnf libcomps librepo createrepo-c llvm dnf libsolv assimp waffle
libjpeg-turbo taglib libproxy libical

And the following 3 recipes don't:
webkitgtk vulkan piglit
Now cmake.bbclass doesn't disble ccache any more, disable it in the recipes if
needed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/cmake.bbclass                      | 21 +++++++++++++++------
 meta/recipes-graphics/piglit/piglit_git.bb      |  3 +++
 meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb |  3 +++
 meta/recipes-sato/webkit/webkitgtk_2.22.4.bb    |  3 +++
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index f22d90a..fa7f68c 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -4,9 +4,6 @@ OECMAKE_SOURCEPATH ??= "${S}"
 DEPENDS_prepend = "cmake-native "
 B = "${WORKDIR}/build"
 
-# We need to unset CCACHE otherwise cmake gets too confused
-CCACHE = ""
-
 # What CMake generator to use.
 # The supported options are "Unix Makefiles" or "Ninja".
 OECMAKE_GENERATOR ?= "Ninja"
@@ -23,10 +20,22 @@ python() {
         d.setVarFlag("do_compile", "progress", r"outof:^\[(\d+)/(\d+)\]\s+")
     else:
         bb.fatal("Unknown CMake Generator %s" % generator)
+
+    # C/C++ Compiler (without cpu arch/tune arguments)
+    if not d.getVar('OECMAKE_C_COMPILER'):
+        cc_list = d.getVar('CC').split()
+        if cc_list[0] == 'ccache':
+            d.setVar('OECMAKE_C_COMPILER', '%s %s' % (cc_list[0], cc_list[1]))
+        else:
+            d.setVar('OECMAKE_C_COMPILER', cc_list[0])
+
+    if not d.getVar('OECMAKE_CXX_COMPILER'):
+        cxx_list = d.getVar('CXX').split()
+        if cxx_list[0] == 'ccache':
+            d.setVar('OECMAKE_CXX_COMPILER', '%s %s' % (cxx_list[0], cxx_list[1]))
+        else:
+            d.setVar('OECMAKE_CXX_COMPILER', cxx_list[0])
 }
-# C/C++ Compiler (without cpu arch/tune arguments)
-OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
-OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
 OECMAKE_AR ?= "${AR}"
 
 # Compiler flags
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 622e046..59d1348 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -52,3 +52,6 @@ RDEPENDS_${PN} = "waffle waffle-bin python3 python3-mako python3-json \
 	"
 
 INSANE_SKIP_${PN} += "dev-so already-stripped"
+
+# Can't be built with ccache
+CCACHE_DISABLE = "1"
diff --git a/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb b/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
index dd3adee..02e4330 100644
--- a/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
@@ -35,3 +35,6 @@ PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SU
 
 RRECOMMENDS_${PN} = "mesa-vulkan-drivers"
 INSANE_SKIP_${PN}-dev += "dev-elf"
+
+# Can't be built with ccache
+CCACHE_DISABLE = "1"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
index 1961220..0f2635c 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
@@ -121,3 +121,6 @@ ARM_INSTRUCTION_SET_armv7ve = "thumb"
 # Segmentation fault
 GI_DATA_ENABLED_armv7a = "False"
 GI_DATA_ENABLED_armv7ve = "False"
+
+# Can't be built with ccache
+CCACHE_DISABLE = "1"
-- 
2.7.4



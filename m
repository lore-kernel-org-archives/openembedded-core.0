Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9073A73097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 08:19:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9B8JTkE013471
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Oct 2017 01:19:29 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 11 Oct 2017 01:19:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 11 Oct 2017 04:19:27 -0400
Message-ID: <1507709967-118313-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] mesa: explictly add lib expat to intel libvulkan's lib depends
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
X-List-Received-Date: Wed, 11 Oct 2017 08:19:29 -0000
Content-Type: text/plain

While built with "-fvisibility=default"
...
|i586-oe-linux-gcc ... -fvisibility=default ... -o ommon/.libs/
common_libintel_common_la-gen_decoder.o
...

It triggered the failure
...
|i586-oe-linux-g++  ... common/.libs/libintel_common.a ... -o
vulkan/.libs/libvulkan_intel.so
|common/.libs/libintel_common.a(common_libintel_common_la-gen_decoder.o):
|In function `start_element':
|/usr/src/debug/mesa/2_17.1.7-r0/mesa-17.1.7/src/intel/common/gen_decoder.c:371:
undefined reference to `XML_GetCurrentLineNumber'
...

explictly add EXPAT_LIBS to intel's VULKAN_LIB_DEPS

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...lkan.am-explictly-add-lib-expat-to-intel-.patch | 44 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_17.1.7.bb          |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
new file mode 100644
index 0000000..bd1e863
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
@@ -0,0 +1,44 @@
+From 342311dbb190735b7b32ab20f81c1d8dbcfe717a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 11 Oct 2017 15:40:42 +0800
+Subject: [PATCH] Makefile.vulkan.am: explictly add lib expat to intel
+ libvulkan's lib depends
+
+While built with "-fvisibility=default"
+...
+|i586-oe-linux-gcc ... -fvisibility=default ... -o common/.libs/common_libintel_common_la-gen_decoder.o
+...
+
+It triggered the failure
+...
+|i586-oe-linux-g++  ... common/.libs/libintel_common.a ... -o vulkan/.libs/libvulkan_intel.so
+|common/.libs/libintel_common.a(common_libintel_common_la-gen_decoder.o):
+|In function `start_element':
+|/usr/src/debug/mesa/2_17.1.7-r0/mesa-17.1.7/src/intel/common/gen_decoder.c:371:
+undefined reference to `XML_GetCurrentLineNumber'
+...
+
+explictly add EXPAT_LIBS to intel's VULKAN_LIB_DEPS
+
+Upstream-Status: Submitted [mesa-dev@lists.freedesktop.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/intel/Makefile.vulkan.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/intel/Makefile.vulkan.am b/src/intel/Makefile.vulkan.am
+index 271b0a5..8fbe2c8 100644
+--- a/src/intel/Makefile.vulkan.am
++++ b/src/intel/Makefile.vulkan.am
+@@ -144,6 +144,7 @@ VULKAN_LIB_DEPS = \
+ 	$(LIBDRM_LIBS) \
+ 	$(PTHREAD_LIBS) \
+ 	$(DLOPEN_LIBS) \
++	$(EXPAT_LIBS) \
+ 	-lm
+ 
+ if HAVE_PLATFORM_X11
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.7.bb b/meta/recipes-graphics/mesa/mesa_17.1.7.bb
index a50f32c..39cfce9 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.7.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-configure.ac-Always-check-for-expat.patch \
+           file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
            "
 SRC_URI[md5sum] = "e40bb428a263bd28cbf6478dae45b207"
 SRC_URI[sha256sum] = "69f472a874b1122404fa0bd13e2d6bf87eb3b9ad9c21d2f39872a96d83d9e5f5"
-- 
1.8.3.1



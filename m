Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1BA73195
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:55:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 14 Feb 2017 01:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,160,1484035200"; d="scan'208";a="1107172832"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2017 01:55:13 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D925E6A4080;
	Tue, 14 Feb 2017 01:54:10 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 11:54:58 +0200
Message-Id: <741d53dfad8951845bcae6ad8f7dfb75936db620.1487065337.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487065337.git.jussi.kukkonen@intel.com>
References: <cover.1487065337.git.jussi.kukkonen@intel.com>
Subject: [PATCH 01/11] mesa: Upgrade 13.0.4 -> 17.0.0
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
X-List-Received-Date: Tue, 14 Feb 2017 09:55:13 -0000

* New feature release with lots of changes
* Versioning change (17 as in 2017, no longer relates to GL bumps)
* OpenGL 4.5 support on Haswell
* mesa now implements its own sha1 instead of having 5
  configurable sha-providers

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../mesa/{mesa-gl_13.0.4.bb => mesa-gl_17.0.0.bb}                 | 0
 meta/recipes-graphics/mesa/mesa.inc                               | 8 +-------
 meta/recipes-graphics/mesa/{mesa_13.0.4.bb => mesa_17.0.0.bb}     | 7 +++----
 3 files changed, 4 insertions(+), 11 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_13.0.4.bb => mesa-gl_17.0.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_13.0.4.bb => mesa_17.0.0.bb} (74%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb b/meta/recipes-graphics/mesa/mesa-gl_17.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.0.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5d882b1..befb35e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 
 EXTRA_OECONF = "--enable-shared-glapi"
 
-PACKAGECONFIG ??= "gbm egl gles dri ${MESA_CRYPTO} \
+PACKAGECONFIG ??= "gbm egl gles dri \
 		${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
 		${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
 		"
@@ -67,12 +67,6 @@ PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
 OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium-osmesa', 'osmesa', d)}"
 PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
 
-# Mesa requires one of the following crypto implementation, pick one of them
-MESA_CRYPTO ??= "openssl"
-PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
-PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
-PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
-
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
diff --git a/meta/recipes-graphics/mesa/mesa_13.0.4.bb b/meta/recipes-graphics/mesa/mesa_17.0.0.bb
similarity index 74%
rename from meta/recipes-graphics/mesa/mesa_13.0.4.bb
rename to meta/recipes-graphics/mesa/mesa_17.0.0.bb
index 1416c9f..6576e3c 100644
--- a/meta/recipes-graphics/mesa/mesa_13.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.0.0.bb
@@ -1,13 +1,12 @@
 require ${BPN}.inc
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
            file://disable-asm-on-non-gcc.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
 "
-
-SRC_URI[md5sum] = "d088a921e935218833a8071cb672a574"
-SRC_URI[sha256sum] = "a95d7ce8f7bd5f88585e4be3144a341236d8c0fc91f6feaec59bb8ba3120e726"
+SRC_URI[md5sum] = "932e4171a86b14940c06812356486155"
+SRC_URI[sha256sum] = "39db3d59700159add7f977307d12a7dfe016363e760ad82280ac4168ea668481"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.1.4



Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6CE7DB50
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2019 07:43:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Dec 2019 23:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,358,1571727600"; d="scan'208";a="208010810"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007.jf.intel.com with ESMTP; 25 Dec 2019 23:43:39 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Dec 2019 15:43:35 +0800
Message-Id: <1577346215-70009-2-git-send-email-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577346215-70009-1-git-send-email-naveen.kumar.saini@intel.com>
References: <1577346215-70009-1-git-send-email-naveen.kumar.saini@intel.com>
Subject: [PATCH v2 2/2] libva-utils: upgrade 2.5.0 -> 2.6.0
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
X-List-Received-Date: Thu, 26 Dec 2019 07:43:39 -0000

Release details can be found here:
https://github.com/intel/libva-utils/releases/tag/2.6.0

Removed the patch which is not required anymore.
Also switched to meson.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 ...fcsample-only-when-X11-backend-is-enabled.patch | 35 ----------------------
 .../{libva-utils_2.5.0.bb => libva-utils_2.6.0.bb} | 15 ++++------
 2 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch
 rename meta/recipes-graphics/libva/{libva-utils_2.5.0.bb => libva-utils_2.6.0.bb} (63%)

diff --git a/meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch b/meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch
deleted file mode 100644
index 01fb719..0000000
--- a/meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8fc14e4bc81885b80c3072e549c2e6f59533d7ef Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Fri, 8 Feb 2019 11:45:55 +0800
-Subject: [PATCH] Build sfcsample only when X11 backend is enabled
-
-See: https://github.com/intel/libva-utils/pull/149, and
-https://github.com/intel/libva-utils/issues/150
-
-Upstream-Status: Submitted
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d28175a..e294e25 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -24,10 +24,11 @@ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
- 
- AUTOMAKE_OPTIONS = foreign
- 
--SUBDIRS = common decode encode vainfo videoprocess vendor/intel vendor/intel/sfcsample
-+SUBDIRS = common decode encode vainfo videoprocess vendor/intel
- 
- if USE_X11
- SUBDIRS += putsurface
-+SUBDIRS += vendor/intel/sfcsample
- else
- if USE_WAYLAND
- SUBDIRS += putsurface
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/libva/libva-utils_2.5.0.bb b/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
similarity index 63%
rename from meta/recipes-graphics/libva/libva-utils_2.5.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.6.0.bb
index f68d0cf..0037fdf 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.5.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
@@ -14,22 +14,19 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2 \
-           file://0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch \
-           "
-
-SRC_URI[md5sum] = "c1fada26c286654859eff33b2562cb79"
-SRC_URI[sha256sum] = "9238c9d5110d60f935683390b8383fdac3507346384cd5f117a23c6db1d72a17"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.6-branch"
+SRCREV = "8ea1eba433dcbceb0e5dcb54b8e3f984987f7a17"
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 
 DEPENDS = "libva"
 
-inherit autotools pkgconfig features_check
+inherit meson pkgconfig features_check
 
 # depends on libva which requires opengl
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext libxfixes"
-PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland-native wayland"
+PACKAGECONFIG[x11] = "-Dx11=true, -Dx11=false,virtual/libx11 libxext libxfixes"
+PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false,wayland-native wayland"
-- 
2.7.4



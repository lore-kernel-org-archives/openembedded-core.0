Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 20B686FF0E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 06:22:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Feb 2018 22:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,463,1511856000"; d="scan'208";a="24708828"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.239])
	by orsmga003.jf.intel.com with ESMTP; 04 Feb 2018 22:22:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Feb 2018 14:21:31 +0800
Message-Id: <1517811692-28225-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517811692-28225-1-git-send-email-anuj.mittal@intel.com>
References: <1517811692-28225-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 2/3] libva: upgrade to 2.0.0
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
X-List-Received-Date: Mon, 05 Feb 2018 06:22:28 -0000

libva 2.0 bumps the VA-API version to 1.0.0 and deletes egl and
tpi backends. The header files va_egl.h and va_tpi.h are still
packaged in -dev to ensure packages that still use them don't fail.

Major changes:

* Bump VA-API version to 1.0.0
* Add new API for H264 FEI support
* Add definition of VA_FOURCC_I420
* Add functions for converting common enums to strings
* Deprecate H.264 baseline profile and FMO support
* Deprecate packed misc packed header flag
* Delete libva-tpi and libva-egl backends
* Refine VASliceParameterBufferHEVC, VAEncMiscParameterBuffer
* Fix errors in VAConfigAttribValEncROI, VAEncMacroblockParameterBufferH264
* Fix race condition in wayland support
* Rename vaMessageCallback to VAMessageCallback
* Make logging callbacks library-safe

Also, updated the github URLs to point to renamed Intel repository.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libva/{libva_1.8.3.bb => libva_2.0.0.bb}               | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/libva/{libva_1.8.3.bb => libva_2.0.0.bb} (76%)

diff --git a/meta/recipes-graphics/libva/libva_1.8.3.bb b/meta/recipes-graphics/libva/libva_2.0.0.bb
similarity index 76%
rename from meta/recipes-graphics/libva/libva_1.8.3.bb
rename to meta/recipes-graphics/libva/libva_2.0.0.bb
index ceeda84..af4c1e1 100644
--- a/meta/recipes-graphics/libva/libva_1.8.3.bb
+++ b/meta/recipes-graphics/libva/libva_2.0.0.bb
@@ -11,19 +11,19 @@ manufacturers can also freely use this API for hardware accelerated \
 video decoding."
 
 HOMEPAGE = "https://01.org/linuxmedia/vaapi"
-BUGTRACKER = "https://github.com/01org/libva/issues"
+BUGTRACKER = "https://github.com/intel/libva/issues"
 
 SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
-SRC_URI = "git://github.com/01org/libva.git;protocol=http;branch=v1.8-branch "
-SRCREV = "457470987cc9df5976ce8c72ffd4bfbd9baaf0f9"
+SRC_URI = "git://github.com/intel/libva.git;protocol=http"
+SRCREV = "24cbd05c9477ab59cc5665989026b4ad17e06eb6"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>(\d+(\.\d+)+))$"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libdrm virtual/mesa virtual/libgles1 virtual/libgles2 virtual/egl"
+DEPENDS = "libdrm virtual/mesa"
 
 inherit autotools pkgconfig distro_features_check
 
@@ -35,17 +35,13 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext libxfixes"
 PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland-native wayland"
 
-PACKAGES =+ "${PN}-x11 ${PN}-tpi ${PN}-glx ${PN}-egl ${PN}-wayland"
+PACKAGES =+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
 
-RDEPENDS_${PN}-tpi =+ "${PN}"
 RDEPENDS_${PN}-x11 =+ "${PN}"
 RDEPENDS_${PN}-glx =+ "${PN}-x11"
-RDEPENDS_${PN}-egl =+ "${PN}-x11"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug"
 
 FILES_${PN}-x11 =+ "${libdir}/libva-x11*${SOLIBS}"
-FILES_${PN}-tpi =+ "${libdir}/libva-tpi*${SOLIBS}"
 FILES_${PN}-glx =+ "${libdir}/libva-glx*${SOLIBS}"
-FILES_${PN}-egl =+ "${libdir}/libva-egl*${SOLIBS}"
 FILES_${PN}-wayland =+ "${libdir}/libva-wayland*${SOLIBS}"
-- 
2.7.4



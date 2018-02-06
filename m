Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 561 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Feb 2018 02:13:27 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id EF68B60616
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 02:13:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2018 18:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,467,1511856000"; d="scan'208";a="32305003"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.239])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2018 18:04:09 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 10:03:59 +0800
Message-Id: <1517882640-731-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517882640-731-1-git-send-email-anuj.mittal@intel.com>
References: <1517882640-731-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH v2 2/3] libva: upgrade to 2.0.0
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
X-List-Received-Date: Tue, 06 Feb 2018 02:13:28 -0000

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

Updated recipe to point to release tarball instead of git. Also, updated the
github URLs to point to renamed Intel repository.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libva/{libva_1.8.3.bb => libva_2.0.0.bb}        | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/libva/{libva_1.8.3.bb => libva_2.0.0.bb} (70%)

diff --git a/meta/recipes-graphics/libva/libva_1.8.3.bb b/meta/recipes-graphics/libva/libva_2.0.0.bb
similarity index 70%
rename from meta/recipes-graphics/libva/libva_1.8.3.bb
rename to meta/recipes-graphics/libva/libva_2.0.0.bb
index ceeda84..5ccaa76 100644
--- a/meta/recipes-graphics/libva/libva_1.8.3.bb
+++ b/meta/recipes-graphics/libva/libva_2.0.0.bb
@@ -11,19 +11,20 @@ manufacturers can also freely use this API for hardware accelerated \
 video decoding."
 
 HOMEPAGE = "https://01.org/linuxmedia/vaapi"
-BUGTRACKER = "https://github.com/01org/libva/issues"
+BUGTRACKER = "https://github.com/intel/libva/issues"
 
 SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
-SRC_URI = "git://github.com/01org/libva.git;protocol=http;branch=v1.8-branch "
-SRCREV = "457470987cc9df5976ce8c72ffd4bfbd9baaf0f9"
-UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>(\d+(\.\d+)+))$"
+SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.bz2"
 
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "b863f99b7ae41960a0e2e7a4cc959b46"
+SRC_URI[sha256sum] = "bb0601f9a209e60d8d0b867067323661a7816ff429021441b775452b8589e533"
 
-DEPENDS = "libdrm virtual/mesa virtual/libgles1 virtual/libgles2 virtual/egl"
+UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
+
+DEPENDS = "libdrm virtual/mesa"
 
 inherit autotools pkgconfig distro_features_check
 
@@ -35,17 +36,11 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext libxfixes"
 PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland-native wayland"
 
-PACKAGES =+ "${PN}-x11 ${PN}-tpi ${PN}-glx ${PN}-egl ${PN}-wayland"
+PACKAGES =+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
 
-RDEPENDS_${PN}-tpi =+ "${PN}"
 RDEPENDS_${PN}-x11 =+ "${PN}"
 RDEPENDS_${PN}-glx =+ "${PN}-x11"
-RDEPENDS_${PN}-egl =+ "${PN}-x11"
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug"
 
 FILES_${PN}-x11 =+ "${libdir}/libva-x11*${SOLIBS}"
-FILES_${PN}-tpi =+ "${libdir}/libva-tpi*${SOLIBS}"
 FILES_${PN}-glx =+ "${libdir}/libva-glx*${SOLIBS}"
-FILES_${PN}-egl =+ "${libdir}/libva-egl*${SOLIBS}"
 FILES_${PN}-wayland =+ "${libdir}/libva-wayland*${SOLIBS}"
-- 
2.7.4



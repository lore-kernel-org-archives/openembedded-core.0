Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B0DD278467
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 12:07:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 14 Aug 2017 05:07:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,373,1498546800"; d="scan'208";a="123348209"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2017 05:07:38 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 3D2215805B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 05:07:38 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 15:09:06 +0300
Message-Id: <1502712547-30760-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1502712547-30760-1-git-send-email-maxin.john@intel.com>
References: <1502712547-30760-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] libva: upgrade to 1.8.3
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
X-List-Received-Date: Mon, 14 Aug 2017 12:07:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1.7.3 -> 1.8.3

Remove upstreamed patch:
        0001-wayland-Don-t-commit-and-ship-generated-files.patch

Replace following patch by setting ac_cv_prog in EXTRA_OECONF:
        0001-configure.ac-Use-wayland-scanner-in-PATH.patch

The dummy driver was removed in 1.8.3 release.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-configure.ac-Use-wayland-scanner-in-PATH.patch |  37 ---
 ...and-Don-t-commit-and-ship-generated-files.patch | 339 ---------------------
 .../libva/{libva_1.7.3.bb => libva_1.8.3.bb}       |   8 +-
 3 files changed, 3 insertions(+), 381 deletions(-)
 delete mode 100644 meta/recipes-graphics/libva/files/0001-configure.ac-Use-wayland-scanner-in-PATH.patch
 delete mode 100644 meta/recipes-graphics/libva/files/0001-wayland-Don-t-commit-and-ship-generated-files.patch
 rename meta/recipes-graphics/libva/{libva_1.7.3.bb => libva_1.8.3.bb} (88%)

diff --git a/meta/recipes-graphics/libva/files/0001-configure.ac-Use-wayland-scanner-in-PATH.patch b/meta/recipes-graphics/libva/files/0001-configure.ac-Use-wayland-scanner-in-PATH.patch
deleted file mode 100644
index a99c225..0000000
--- a/meta/recipes-graphics/libva/files/0001-configure.ac-Use-wayland-scanner-in-PATH.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 0af30602502035155929dd2a14482b82a9747cf8 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 23 Feb 2017 15:23:15 +0200
-Subject: [PATCH] configure.ac: Use wayland-scanner in PATH
-
-pkg-config will give us the wrong wayland-scanner location.
-Use the one in path instead: it will be from native sysroot.
-
-This is a workaround and should be fixed upstream: preferably
-with the same fix as all the other wayland-scanner users
-(see YOCTO #11100).
-
-Upstream-Status: Inappropriate [workaround]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 64eddf2..5536f35 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -273,10 +273,7 @@ if test "$enable_wayland" = "yes"; then
-     PKG_CHECK_MODULES([WAYLAND], [wayland-client >= wayland_api_version],
-         [USE_WAYLAND="yes"], [:])
-     if test "$USE_WAYLAND" = "yes"; then
--
--        WAYLAND_PREFIX=`$PKG_CONFIG --variable=prefix wayland-client`
--        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner],,
--                     [${WAYLAND_PREFIX}/bin$PATH_SEPARATOR$PATH])
-+        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
- 
-         AC_DEFINE([HAVE_VA_WAYLAND], [1],
-                   [Defined to 1 if VA/Wayland API is built])
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/libva/files/0001-wayland-Don-t-commit-and-ship-generated-files.patch b/meta/recipes-graphics/libva/files/0001-wayland-Don-t-commit-and-ship-generated-files.patch
deleted file mode 100644
index bd97e22..0000000
--- a/meta/recipes-graphics/libva/files/0001-wayland-Don-t-commit-and-ship-generated-files.patch
+++ /dev/null
@@ -1,339 +0,0 @@
-From 5993a7710cc8fd9a392d5015be5109987a42b498 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 23 Feb 2017 16:10:09 +0200
-Subject: [PATCH] wayland: Don't commit and ship generated files
-
-I believe shipping wayland-drm-client-protocol.h is wrong: The header
-should always be generated by the wayland-scanner that matches the
-runtime wayland version. Currently when someone clones the repo and
-builds, the shipped version is used.
-
-Upstream-Status: Submitted [https://github.com/01org/libva/pull/33]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- va/wayland/Makefile.am                   |   5 +-
- va/wayland/wayland-drm-client-protocol.h | 290 -------------------------------
- 2 files changed, 4 insertions(+), 291 deletions(-)
- delete mode 100644 va/wayland/wayland-drm-client-protocol.h
-
-diff --git a/va/wayland/Makefile.am b/va/wayland/Makefile.am
-index 4f8262c..4ab8d07 100644
---- a/va/wayland/Makefile.am
-+++ b/va/wayland/Makefile.am
-@@ -53,7 +53,7 @@ protocol_source_h = \
- noinst_LTLIBRARIES		= libva_wayland.la
- libva_waylandincludedir		= ${includedir}/va
- libva_waylandinclude_HEADERS	= $(source_h)
--libva_wayland_la_SOURCES	= $(source_c) $(protocol_source_h)
-+libva_wayland_la_SOURCES	= $(source_c)
- noinst_HEADERS			= $(source_h_priv)
- 
- # Wayland protocol
-@@ -65,5 +65,8 @@ EXTRA_DIST = \
- 	wayland-drm.xml         \
- 	$(NULL)
- 
-+BUILT_SOURCES = $(protocol_source_h)
-+CLEANFILES = $(BUILT_SOURCES)
-+
- # Extra clean files so that maintainer-clean removes *everything*
- MAINTAINERCLEANFILES = Makefile.in
-diff --git a/va/wayland/wayland-drm-client-protocol.h b/va/wayland/wayland-drm-client-protocol.h
-deleted file mode 100644
-index da267e8..0000000
---- a/va/wayland/wayland-drm-client-protocol.h
-+++ /dev/null
-@@ -1,290 +0,0 @@
--/* Generated by wayland-scanner 1.11.90 */
--
--#ifndef DRM_CLIENT_PROTOCOL_H
--#define DRM_CLIENT_PROTOCOL_H
--
--#include <stdint.h>
--#include <stddef.h>
--#include "wayland-client.h"
--
--#ifdef  __cplusplus
--extern "C" {
--#endif
--
--/**
-- * @page page_drm The drm protocol
-- * @section page_ifaces_drm Interfaces
-- * - @subpage page_iface_wl_drm - 
-- * @section page_copyright_drm Copyright
-- * <pre>
-- *
-- * Copyright © 2008-2011 Kristian Høgsberg
-- * Copyright © 2010-2011 Intel Corporation
-- *
-- * Permission to use, copy, modify, distribute, and sell this
-- * software and its documentation for any purpose is hereby granted
-- * without fee, provided that\n the above copyright notice appear in
-- * all copies and that both that copyright notice and this permission
-- * notice appear in supporting documentation, and that the name of
-- * the copyright holders not be used in advertising or publicity
-- * pertaining to distribution of the software without specific,
-- * written prior permission.  The copyright holders make no
-- * representations about the suitability of this software for any
-- * purpose.  It is provided "as is" without express or implied
-- * warranty.
-- *
-- * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
-- * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
-- * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
-- * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
-- * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
-- * ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
-- * THIS SOFTWARE.
-- * </pre>
-- */
--struct wl_buffer;
--struct wl_drm;
--
--/**
-- * @page page_iface_wl_drm wl_drm
-- * @section page_iface_wl_drm_api API
-- * See @ref iface_wl_drm.
-- */
--/**
-- * @defgroup iface_wl_drm The wl_drm interface
-- */
--extern const struct wl_interface wl_drm_interface;
--
--#ifndef WL_DRM_ERROR_ENUM
--#define WL_DRM_ERROR_ENUM
--enum wl_drm_error {
--	WL_DRM_ERROR_AUTHENTICATE_FAIL = 0,
--	WL_DRM_ERROR_INVALID_FORMAT = 1,
--	WL_DRM_ERROR_INVALID_NAME = 2,
--};
--#endif /* WL_DRM_ERROR_ENUM */
--
--#ifndef WL_DRM_FORMAT_ENUM
--#define WL_DRM_FORMAT_ENUM
--enum wl_drm_format {
--	WL_DRM_FORMAT_C8 = 0x20203843,
--	WL_DRM_FORMAT_RGB332 = 0x38424752,
--	WL_DRM_FORMAT_BGR233 = 0x38524742,
--	WL_DRM_FORMAT_XRGB4444 = 0x32315258,
--	WL_DRM_FORMAT_XBGR4444 = 0x32314258,
--	WL_DRM_FORMAT_RGBX4444 = 0x32315852,
--	WL_DRM_FORMAT_BGRX4444 = 0x32315842,
--	WL_DRM_FORMAT_ARGB4444 = 0x32315241,
--	WL_DRM_FORMAT_ABGR4444 = 0x32314241,
--	WL_DRM_FORMAT_RGBA4444 = 0x32314152,
--	WL_DRM_FORMAT_BGRA4444 = 0x32314142,
--	WL_DRM_FORMAT_XRGB1555 = 0x35315258,
--	WL_DRM_FORMAT_XBGR1555 = 0x35314258,
--	WL_DRM_FORMAT_RGBX5551 = 0x35315852,
--	WL_DRM_FORMAT_BGRX5551 = 0x35315842,
--	WL_DRM_FORMAT_ARGB1555 = 0x35315241,
--	WL_DRM_FORMAT_ABGR1555 = 0x35314241,
--	WL_DRM_FORMAT_RGBA5551 = 0x35314152,
--	WL_DRM_FORMAT_BGRA5551 = 0x35314142,
--	WL_DRM_FORMAT_RGB565 = 0x36314752,
--	WL_DRM_FORMAT_BGR565 = 0x36314742,
--	WL_DRM_FORMAT_RGB888 = 0x34324752,
--	WL_DRM_FORMAT_BGR888 = 0x34324742,
--	WL_DRM_FORMAT_XRGB8888 = 0x34325258,
--	WL_DRM_FORMAT_XBGR8888 = 0x34324258,
--	WL_DRM_FORMAT_RGBX8888 = 0x34325852,
--	WL_DRM_FORMAT_BGRX8888 = 0x34325842,
--	WL_DRM_FORMAT_ARGB8888 = 0x34325241,
--	WL_DRM_FORMAT_ABGR8888 = 0x34324241,
--	WL_DRM_FORMAT_RGBA8888 = 0x34324152,
--	WL_DRM_FORMAT_BGRA8888 = 0x34324142,
--	WL_DRM_FORMAT_XRGB2101010 = 0x30335258,
--	WL_DRM_FORMAT_XBGR2101010 = 0x30334258,
--	WL_DRM_FORMAT_RGBX1010102 = 0x30335852,
--	WL_DRM_FORMAT_BGRX1010102 = 0x30335842,
--	WL_DRM_FORMAT_ARGB2101010 = 0x30335241,
--	WL_DRM_FORMAT_ABGR2101010 = 0x30334241,
--	WL_DRM_FORMAT_RGBA1010102 = 0x30334152,
--	WL_DRM_FORMAT_BGRA1010102 = 0x30334142,
--	WL_DRM_FORMAT_YUYV = 0x56595559,
--	WL_DRM_FORMAT_YVYU = 0x55595659,
--	WL_DRM_FORMAT_UYVY = 0x59565955,
--	WL_DRM_FORMAT_VYUY = 0x59555956,
--	WL_DRM_FORMAT_AYUV = 0x56555941,
--	WL_DRM_FORMAT_NV12 = 0x3231564e,
--	WL_DRM_FORMAT_NV21 = 0x3132564e,
--	WL_DRM_FORMAT_NV16 = 0x3631564e,
--	WL_DRM_FORMAT_NV61 = 0x3136564e,
--	WL_DRM_FORMAT_YUV410 = 0x39565559,
--	WL_DRM_FORMAT_YVU410 = 0x39555659,
--	WL_DRM_FORMAT_YUV411 = 0x31315559,
--	WL_DRM_FORMAT_YVU411 = 0x31315659,
--	WL_DRM_FORMAT_YUV420 = 0x32315559,
--	WL_DRM_FORMAT_YVU420 = 0x32315659,
--	WL_DRM_FORMAT_YUV422 = 0x36315559,
--	WL_DRM_FORMAT_YVU422 = 0x36315659,
--	WL_DRM_FORMAT_YUV444 = 0x34325559,
--	WL_DRM_FORMAT_YVU444 = 0x34325659,
--};
--#endif /* WL_DRM_FORMAT_ENUM */
--
--#ifndef WL_DRM_CAPABILITY_ENUM
--#define WL_DRM_CAPABILITY_ENUM
--/**
-- * @ingroup iface_wl_drm
-- * wl_drm capability bitmask
-- *
-- * Bitmask of capabilities.
-- */
--enum wl_drm_capability {
--	/**
--	 * wl_drm prime available
--	 */
--	WL_DRM_CAPABILITY_PRIME = 1,
--};
--#endif /* WL_DRM_CAPABILITY_ENUM */
--
--/**
-- * @ingroup iface_wl_drm
-- * @struct wl_drm_listener
-- */
--struct wl_drm_listener {
--	/**
--	 */
--	void (*device)(void *data,
--		       struct wl_drm *wl_drm,
--		       const char *name);
--	/**
--	 */
--	void (*format)(void *data,
--		       struct wl_drm *wl_drm,
--		       uint32_t format);
--	/**
--	 */
--	void (*authenticated)(void *data,
--			      struct wl_drm *wl_drm);
--	/**
--	 */
--	void (*capabilities)(void *data,
--			     struct wl_drm *wl_drm,
--			     uint32_t value);
--};
--
--/**
-- * @ingroup wl_drm_iface
-- */
--static inline int
--wl_drm_add_listener(struct wl_drm *wl_drm,
--		    const struct wl_drm_listener *listener, void *data)
--{
--	return wl_proxy_add_listener((struct wl_proxy *) wl_drm,
--				     (void (**)(void)) listener, data);
--}
--
--#define WL_DRM_AUTHENTICATE 0
--#define WL_DRM_CREATE_BUFFER 1
--#define WL_DRM_CREATE_PLANAR_BUFFER 2
--#define WL_DRM_CREATE_PRIME_BUFFER 3
--
--/**
-- * @ingroup iface_wl_drm
-- */
--#define WL_DRM_AUTHENTICATE_SINCE_VERSION 1
--/**
-- * @ingroup iface_wl_drm
-- */
--#define WL_DRM_CREATE_BUFFER_SINCE_VERSION 1
--/**
-- * @ingroup iface_wl_drm
-- */
--#define WL_DRM_CREATE_PLANAR_BUFFER_SINCE_VERSION 1
--/**
-- * @ingroup iface_wl_drm
-- */
--#define WL_DRM_CREATE_PRIME_BUFFER_SINCE_VERSION 2
--
--/** @ingroup iface_wl_drm */
--static inline void
--wl_drm_set_user_data(struct wl_drm *wl_drm, void *user_data)
--{
--	wl_proxy_set_user_data((struct wl_proxy *) wl_drm, user_data);
--}
--
--/** @ingroup iface_wl_drm */
--static inline void *
--wl_drm_get_user_data(struct wl_drm *wl_drm)
--{
--	return wl_proxy_get_user_data((struct wl_proxy *) wl_drm);
--}
--
--static inline uint32_t
--wl_drm_get_version(struct wl_drm *wl_drm)
--{
--	return wl_proxy_get_version((struct wl_proxy *) wl_drm);
--}
--
--/** @ingroup iface_wl_drm */
--static inline void
--wl_drm_destroy(struct wl_drm *wl_drm)
--{
--	wl_proxy_destroy((struct wl_proxy *) wl_drm);
--}
--
--/**
-- * @ingroup iface_wl_drm
-- */
--static inline void
--wl_drm_authenticate(struct wl_drm *wl_drm, uint32_t id)
--{
--	wl_proxy_marshal((struct wl_proxy *) wl_drm,
--			 WL_DRM_AUTHENTICATE, id);
--}
--
--/**
-- * @ingroup iface_wl_drm
-- */
--static inline struct wl_buffer *
--wl_drm_create_buffer(struct wl_drm *wl_drm, uint32_t name, int32_t width, int32_t height, uint32_t stride, uint32_t format)
--{
--	struct wl_proxy *id;
--
--	id = wl_proxy_marshal_constructor((struct wl_proxy *) wl_drm,
--			 WL_DRM_CREATE_BUFFER, &wl_buffer_interface, NULL, name, width, height, stride, format);
--
--	return (struct wl_buffer *) id;
--}
--
--/**
-- * @ingroup iface_wl_drm
-- */
--static inline struct wl_buffer *
--wl_drm_create_planar_buffer(struct wl_drm *wl_drm, uint32_t name, int32_t width, int32_t height, uint32_t format, int32_t offset0, int32_t stride0, int32_t offset1, int32_t stride1, int32_t offset2, int32_t stride2)
--{
--	struct wl_proxy *id;
--
--	id = wl_proxy_marshal_constructor((struct wl_proxy *) wl_drm,
--			 WL_DRM_CREATE_PLANAR_BUFFER, &wl_buffer_interface, NULL, name, width, height, format, offset0, stride0, offset1, stride1, offset2, stride2);
--
--	return (struct wl_buffer *) id;
--}
--
--/**
-- * @ingroup iface_wl_drm
-- */
--static inline struct wl_buffer *
--wl_drm_create_prime_buffer(struct wl_drm *wl_drm, int32_t name, int32_t width, int32_t height, uint32_t format, int32_t offset0, int32_t stride0, int32_t offset1, int32_t stride1, int32_t offset2, int32_t stride2)
--{
--	struct wl_proxy *id;
--
--	id = wl_proxy_marshal_constructor((struct wl_proxy *) wl_drm,
--			 WL_DRM_CREATE_PRIME_BUFFER, &wl_buffer_interface, NULL, name, width, height, format, offset0, stride0, offset1, stride1, offset2, stride2);
--
--	return (struct wl_buffer *) id;
--}
--
--#ifdef  __cplusplus
--}
--#endif
--
--#endif
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/libva/libva_1.7.3.bb b/meta/recipes-graphics/libva/libva_1.8.3.bb
similarity index 88%
rename from meta/recipes-graphics/libva/libva_1.7.3.bb
rename to meta/recipes-graphics/libva/libva_1.8.3.bb
index 6c0b90f..bb5f829 100644
--- a/meta/recipes-graphics/libva/libva_1.7.3.bb
+++ b/meta/recipes-graphics/libva/libva_1.8.3.bb
@@ -17,10 +17,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
-SRC_URI = "git://github.com/01org/libva.git;protocol=http;branch=v1.7-branch \
-           file://0001-configure.ac-Use-wayland-scanner-in-PATH.patch \
-           file://0001-wayland-Don-t-commit-and-ship-generated-files.patch"
-SRCREV = "dbf9f7e33349c3cee8d131e93a6a4f91255635cb"
+SRC_URI = "git://github.com/01org/libva.git;protocol=http;branch=v1.8-branch "
+SRCREV = "457470987cc9df5976ce8c72ffd4bfbd9baaf0f9"
 UPSTREAM_CHECK_GITTAGREGEX = "libva-(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
@@ -31,7 +29,7 @@ inherit autotools pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-EXTRA_OECONF = "--disable-dummy-driver"
+EXTRA_OECONF = "ac_cv_prog_WAYLAND_SCANNER=wayland-scanner"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext libxfixes"
-- 
2.4.0



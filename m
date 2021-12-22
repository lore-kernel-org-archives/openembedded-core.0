Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA627C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 21:16:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.24933.1640207808033435570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 13:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8B2DF40C2B
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 21:16:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rwc8K-7cAUzc
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Dec 2021 21:16:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 77ACC40429
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 21:16:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3498F174718;
	Wed, 22 Dec 2021 16:16:46 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH v3] wayland: upgrade 1.19.0 -> 1.20.0
Date: Wed, 22 Dec 2021 16:16:44 -0500
Message-Id: <1640207804-2190-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 21:16:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159964

Wayland 1.20.0 is released!

This release contains the following major changes:

- FreeBSD support has been entirely upstreamed and has been added to
  our continuous integration system.
- The autotools build system has been dropped. Meson has replaced it.
- A few protocol additions: wl_surface.offset allows clients to update
  a surface's buffer offset independently from the buffer,
  wl_output.name and description allow clients to identify outputs
  without depending on xdg-output-unstable-v1.
- In protocol definitions, events have a new "type" attribute and can
  now be marked as destructors.
- A number of bug fixes, including a race condition when destroying
  proxies in multi-threaded clients.

Also backport libsdl2 patch to fix building against wayland-1.20.0

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
v3 - update the patch to fix strndup detection on MinGW - still required

 .../0001-Fix-build-against-wayland-1.20.patch      | 45 ++++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb    |  1 +
 ...0001-build-Fix-strndup-detection-on-MinGW.patch | 20 ++++++----
 .../{wayland_1.19.0.bb => wayland_1.20.0.bb}       |  2 +-
 4 files changed, 59 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-build-against-wayland-1.20.patch
 rename meta/recipes-graphics/wayland/{wayland_1.19.0.bb => wayland_1.20.0.bb} (96%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-build-against-wayland-1.20.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-build-against-wayland-1.20.patch
new file mode 100644
index 0000000..8923334
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-build-against-wayland-1.20.patch
@@ -0,0 +1,45 @@
+From e2ade2bfc46d915cd306c63c830b81d800b2575f Mon Sep 17 00:00:00 2001
+From: David Redondo <kde@david-redondo.de>
+Date: Fri, 10 Dec 2021 16:22:34 +0100
+Subject: [PATCH] Fix build against wayland 1.20
+
+Fixes #5088
+
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL/pull/5092]
+
+---
+ src/video/wayland/SDL_waylanddyn.h | 2 ++
+ src/video/wayland/SDL_waylandsym.h | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/video/wayland/SDL_waylanddyn.h b/src/video/wayland/SDL_waylanddyn.h
+index 13b0884..2268555 100644
+--- a/src/video/wayland/SDL_waylanddyn.h
++++ b/src/video/wayland/SDL_waylanddyn.h
+@@ -95,6 +95,8 @@ void SDL_WAYLAND_UnloadSymbols(void);
+ #define wl_proxy_marshal_constructor_versioned (*WAYLAND_wl_proxy_marshal_constructor_versioned)
+ #define wl_proxy_set_tag (*WAYLAND_wl_proxy_set_tag)
+ #define wl_proxy_get_tag (*WAYLAND_wl_proxy_get_tag)
++#define wl_proxy_marshal_flags (*WAYLAND_wl_proxy_marshal_flags)
++#define wl_proxy_marshal_array_flags (*WAYLAND_wl_proxy_marshal_array_flags)
+ 
+ #define wl_seat_interface (*WAYLAND_wl_seat_interface)
+ #define wl_surface_interface (*WAYLAND_wl_surface_interface)
+diff --git a/src/video/wayland/SDL_waylandsym.h b/src/video/wayland/SDL_waylandsym.h
+index d6e6a76..32e47d2 100644
+--- a/src/video/wayland/SDL_waylandsym.h
++++ b/src/video/wayland/SDL_waylandsym.h
+@@ -84,6 +84,10 @@ SDL_WAYLAND_MODULE(WAYLAND_CLIENT_1_18)
+ SDL_WAYLAND_SYM(void, wl_proxy_set_tag, (struct wl_proxy *, const char * const *))
+ SDL_WAYLAND_SYM(const char * const *, wl_proxy_get_tag, (struct wl_proxy *))
+ 
++SDL_WAYLAND_MODULE(WAYLAND_CLIENT_1_20)
++SDL_WAYLAND_SYM(struct wl_proxy*, wl_proxy_marshal_flags, (struct wl_proxy *proxy, uint32_t opcode, const struct wl_interface *interfac, uint32_t version, uint32_t flags, ...))
++SDL_WAYLAND_SYM(struct wl_proxy*, wl_proxy_marshal_array_flags, (struct wl_proxy *proxy, uint32_t opcode, const struct wl_interface *interface, uint32_t version,  uint32_t flags, union wl_argument *args))
++
+ SDL_WAYLAND_INTERFACE(wl_seat_interface)
+ SDL_WAYLAND_INTERFACE(wl_surface_interface)
+ SDL_WAYLAND_INTERFACE(wl_shm_pool_interface)
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
index 5e645b4..0b42d58 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
@@ -18,6 +18,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
+           file://0001-Fix-build-against-wayland-1.20.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
index ad1063b..bc753de 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
@@ -1,4 +1,4 @@
-From 6a6223a8e217664a348835e92d5a602f50e18b2c Mon Sep 17 00:00:00 2001
+From b4c64b6f07743e3fb63ce52359bc664ab7d60df0 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Thu, 20 Feb 2020 15:20:45 -0600
 Subject: [PATCH] build: Fix strndup detection on MinGW
@@ -11,27 +11,31 @@ for strndup().
 
 See: https://github.com/mesonbuild/meson/issues/3672
 
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayland/merge_requests/63]
 
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Signed-off-by: Denys Dmytriyenko <denis@denix.org>
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 11c35fa..80729d0 100644
+index 3bc25c9..adde7b9 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -36,11 +36,11 @@ have_funcs = [
- 	'posix_fallocate',
+@@ -38,11 +38,11 @@ have_funcs = [
  	'prctl',
  	'memfd_create',
+ 	'mremap',
 -	'strndup',
  ]
  foreach f: have_funcs
  	config_h.set('HAVE_' + f.underscorify().to_upper(), cc.has_function(f))
  endforeach
 +config_h.set('HAVE_STRNDUP', cc.has_function('strndup') and cc.has_header_symbol('string.h', 'strndup'))
- 
- if get_option('libraries')
- 	ffi_dep = dependency('libffi')
+ config_h.set10('HAVE_XUCRED_CR_PID', cc.has_member('struct xucred', 'cr_pid', prefix : '#include <sys/ucred.h>'))
+ have_broken_msg_cmsg_cloexec = false
+ if host_machine.system() == 'freebsd'
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/wayland/wayland_1.19.0.bb b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/wayland_1.19.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.20.0.bb
index 4c9ae0f..e8636eb 100644
--- a/meta/recipes-graphics/wayland/wayland_1.19.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-SRC_URI[sha256sum] = "baccd902300d354581cd5ad3cc49daa4921d55fb416a5883e218750fef166d15"
+SRC_URI[sha256sum] = "b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4



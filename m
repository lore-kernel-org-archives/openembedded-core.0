Return-Path: <denis@denix.org>
X-Greylist: delayed 3601 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Jan 2016 03:49:31 UTC
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 926566011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 03:49:31 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O18009X0D63I550@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 19 Jan 2016 20:49:15 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8	a=1Mo1Ge4T6OwGOiJerrcA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E1A93161E02;	Tue,
	19 Jan 2016 21:49:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:49:06 -0500
Message-id: <1453258146-7654-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1453258146-7654-1-git-send-email-denis@denix.org>
References: <1453258146-7654-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] weston: upgrade 1.8.0 -> 1.9.0
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
X-List-Received-Date: Wed, 20 Jan 2016 03:49:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

* The license was updated from MIT X11 to MIT Expat
* parallelmake.patch was accepted upstream.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/weston/parallelmake.patch              | 40 ----------------------
 .../wayland/{weston_1.8.0.bb => weston_1.9.0.bb}   |  9 +++--
 2 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/parallelmake.patch
 rename meta/recipes-graphics/wayland/{weston_1.8.0.bb => weston_1.9.0.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/weston/parallelmake.patch b/meta/recipes-graphics/wayland/weston/parallelmake.patch
deleted file mode 100644
index 42b5efb..0000000
--- a/meta/recipes-graphics/wayland/weston/parallelmake.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Backport two patches from upstream to fix parallel builds
-
-- mkdir races (2eff22b8e6f6e5255a1915c33dfd91cecf02cbbc)
-- weston.desktop race (315476fa7b1f1c44c1b35116036df54ac5cb9a03)
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/Makefile.am b/Makefile.am
-index 5819b19..ff13b19 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -20,7 +20,7 @@ weston.ini : $(srcdir)/weston.ini.in
- 		$< > $@
- 
- ivi-shell/weston.ini : $(srcdir)/ivi-shell/weston.ini.in
--	$(AM_V_GEN)$(SED) \
-+	$(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
- 		-e 's|@bindir[@]|$(bindir)|g' \
- 		-e 's|@abs_top_builddir[@]|$(abs_top_builddir)|g' \
- 		-e 's|@abs_top_srcdir[@]|$(abs_top_srcdir)|g' \
-@@ -29,7 +29,7 @@ ivi-shell/weston.ini : $(srcdir)/ivi-shell/weston.ini.in
- 		$< > $@
- 
- tests/weston-ivi.ini : $(srcdir)/ivi-shell/weston.ini.in
--	$(AM_V_GEN)$(SED) \
-+	$(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
- 		-e 's|@bindir[@]|$(bindir)|g' \
- 		-e 's|@abs_top_builddir[@]|$(abs_top_builddir)|g' \
- 		-e 's|@abs_top_srcdir[@]|$(abs_top_srcdir)|g' \
-@@ -179,8 +179,7 @@ pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = src/weston.pc
- 
- wayland_sessiondir = $(datadir)/wayland-sessions
--wayland_session_DATA = src/weston.desktop
--dist_wayland_session_DATA = $(wayland_session_DATA)
-+dist_wayland_session_DATA = src/weston.desktop
- 
- westonincludedir = $(includedir)/weston
- westoninclude_HEADERS =				\
diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/weston_1.8.0.bb
rename to meta/recipes-graphics/wayland/weston_1.9.0.bb
index aff9a12..e14ea9d 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Weston, a Wayland compositor"
 DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
-                    file://src/compositor.c;endline=23;md5=a9793f1edc8d1a4c344ca8ae252352fb"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
+                    file://src/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
@@ -11,12 +11,11 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://make-lcms-explicitly-configurable.patch \
            file://make-libwebp-explicitly-configurable.patch \
            file://0001-make-error-portable.patch \
-           file://parallelmake.patch \
            file://libsystemd.patch \
            file://explicit-enable-disable-systemd.patch \
 "
-SRC_URI[md5sum] = "24cb8a7ed0535b4fc3642643988dab36"
-SRC_URI[sha256sum] = "8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312"
+SRC_URI[md5sum] = "66bbba12f546570b4d97f676bc79a28e"
+SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf"
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
-- 
2.2.0



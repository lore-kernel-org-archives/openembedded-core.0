Return-Path: <rah@fern.h.settrans.net>
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	by mail.openembedded.org (Postfix) with ESMTP id 06BDE6011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 18:21:01 +0000 (UTC)
Received: from rah-1-pt.tunnel.tserv10.par1.ipv6.he.net
	([2001:470:1f12:e23::2] helo=myrtle.6gnip.net ident=Debian-exim)
	by verain.settrans.net with esmtps (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <rah@fern.h.settrans.net>)
	id 1aJQ2X-0002oG-Tk for openembedded-core@lists.openembedded.org;
	Wed, 13 Jan 2016 18:21:02 +0000
Received: from fern.arb.net ([172.18.111.33] helo=fern.h.settrans.net)
	by myrtle.6gnip.net with esmtp (Exim 4.84)
	(envelope-from <rah@fern.h.settrans.net>) id 1aJQ2X-000868-4R
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jan 2016 18:21:01 +0000
Received: by fern.h.settrans.net (Postfix, from userid 1000)
	id 2D9D2B40E59; Wed, 13 Jan 2016 18:21:01 +0000 (GMT)
From: Bob Ham <bob.ham@collabora.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 18:21:01 +0000
Message-Id: <1452709261-26162-1-git-send-email-bob.ham@collabora.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libinput: Upgrade 0.21.0 -> 1.1.4
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
X-List-Received-Date: Wed, 13 Jan 2016 18:21:07 -0000

yocto/jethro provides the version 0.21 from August 2015 while the
current version is 1.1.4.

The patch libinput-configure.ac-add-arg-with-libunwind.patch has been
merged to upstream and was removed from the recipe.  The patch
touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
has not been merged to upstream and is still included in the recipe.

Co-Authored-By: Joshua Lock <joshua.lock@collabora.co.uk>
Signed-off-by: Bob Ham <bob.ham@collabora.com>
---
 ...input-configure.ac-add-arg-with-libunwind.patch | 50 ----------------------
 meta/recipes-graphics/wayland/libinput_0.21.0.bb   | 24 -----------
 meta/recipes-graphics/wayland/libinput_1.1.4.bb    | 23 ++++++++++
 3 files changed, 23 insertions(+), 74 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch
 delete mode 100644 meta/recipes-graphics/wayland/libinput_0.21.0.bb
 create mode 100644 meta/recipes-graphics/wayland/libinput_1.1.4.bb

diff --git a/meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch b/meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch
deleted file mode 100644
index df5ebcc..0000000
--- a/meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cc6fce587f2628c8b342764e06fb0fc27c1e8274 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 3 Aug 2015 20:33:44 -0700
-Subject: [PATCH] configure.ac: add arg --with-libunwind
-
-Add arg --with-libunwind for configure so it's optional to check
-libunwind, which is helpfull to make deterministic builds.
-
-Upstream-Status: Submitted [wayland-devel]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- configure.ac | 19 ++++++++++++++-----
- 1 file changed, 14 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 314b0d4..242d251 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -60,13 +60,22 @@ PKG_PROG_PKG_CONFIG()
- PKG_CHECK_MODULES(MTDEV, [mtdev >= 1.1.0])
- PKG_CHECK_MODULES(LIBUDEV, [libudev])
- PKG_CHECK_MODULES(LIBEVDEV, [libevdev >= 0.4])
--PKG_CHECK_MODULES(LIBUNWIND,
-+
-+AC_ARG_WITH(libunwind,
-+            AS_HELP_STRING([--without-libunwind],[Do not use libunwind]))
-+
-+AS_IF([test "x$with_libunwind" != "xno"],
-+	[PKG_CHECK_MODULES(LIBUNWIND,
- 		  [libunwind],
- 		  [HAVE_LIBUNWIND=yes],
--		  [HAVE_LIBUNWIND=no])
--if test "x$HAVE_LIBUNWIND" = "xyes"; then
--	AC_DEFINE(HAVE_LIBUNWIND, 1, [Have libunwind support])
--fi
-+		  [HAVE_LIBUNWIND=no])],
-+	[HAVE_LIBUNWIND=no])
-+
-+AS_IF([test "x$HAVE_LIBUNWIND" = "xyes"],
-+	[AC_DEFINE(HAVE_LIBUNWIND, 1, [Have libunwind support])],
-+	[AS_IF([test "x$with_libunwind" = "xyes"],
-+		[AC_MSG_ERROR([libunwind requested but not found])])])
-+
- AM_CONDITIONAL(HAVE_LIBUNWIND, [test "x$HAVE_LIBUNWIND" = xyes])
- AC_PATH_PROG(ADDR2LINE, [addr2line])
- if test "x$ADDR2LINE" != "x"; then
--- 
-2.3.5
-
diff --git a/meta/recipes-graphics/wayland/libinput_0.21.0.bb b/meta/recipes-graphics/wayland/libinput_0.21.0.bb
deleted file mode 100644
index ac5a249..0000000
--- a/meta/recipes-graphics/wayland/libinput_0.21.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Library to handle input devices in Wayland compositors"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
-SECTION = "libs"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
-
-DEPENDS = "libevdev udev mtdev"
-
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
-           file://libinput-configure.ac-add-arg-with-libunwind.patch \
-           file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
-"
-SRC_URI[md5sum] = "f91d8f4ced986f1ae16d52ea02bc7837"
-SRC_URI[sha256sum] = "7cce7a9e510dfe5c4a19ad00e9350808d4f59f8611fd2b5e87213c507283f550"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
-PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
-
-FILES_${PN} += "${libdir}/udev/"
-FILES_${PN}-dbg += "${libdir}/udev/.debug"
diff --git a/meta/recipes-graphics/wayland/libinput_1.1.4.bb b/meta/recipes-graphics/wayland/libinput_1.1.4.bb
new file mode 100644
index 0000000..635b36a
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput_1.1.4.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Library to handle input devices in Wayland compositors"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
+
+DEPENDS = "libevdev udev mtdev"
+
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
+           file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
+"
+SRC_URI[md5sum] = "0945318141c1a9f52857bbf65d175f32"
+SRC_URI[sha256sum] = "302cb76209b9c57a5a318e178f9bc446eede8ea79386103b5291cbfaa5fab5b6"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
+PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
+
+FILES_${PN} += "${libdir}/udev/"
+FILES_${PN}-dbg += "${libdir}/udev/.debug"
-- 
2.1.4



Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F0EB06E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 04:18:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t754Ixm8022193
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Aug 2015 21:18:59 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 4 Aug 2015 21:18:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Aug 2015 12:19:00 +0800
Message-ID: <1438748340-11354-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] libinput: add configure arg and PACKAGECONFIG for libunwind
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
X-List-Received-Date: Wed, 05 Aug 2015 04:19:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

libinput uses pkg-config to check and decide whether to build
with libunwind, which causes undeterministic builds or error:

| tmp/work/core2-64-wrs-linux/libinput/0.18.0-r0/libinput-0.18.0/test/litest.c:77:23:
| fatal error: libunwind.h: No such file or directory

So add configure arg and PACKAGECONFIG for libunwind to make
deterministic build, but libunwind is disabled by default.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...input-configure.ac-add-arg-with-libunwind.patch | 50 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/libinput_0.18.0.bb   |  7 ++-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch

diff --git a/meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch b/meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch
new file mode 100644
index 0000000..df5ebcc
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch
@@ -0,0 +1,50 @@
+From cc6fce587f2628c8b342764e06fb0fc27c1e8274 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 3 Aug 2015 20:33:44 -0700
+Subject: [PATCH] configure.ac: add arg --with-libunwind
+
+Add arg --with-libunwind for configure so it's optional to check
+libunwind, which is helpfull to make deterministic builds.
+
+Upstream-Status: Submitted [wayland-devel]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 314b0d4..242d251 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -60,13 +60,22 @@ PKG_PROG_PKG_CONFIG()
+ PKG_CHECK_MODULES(MTDEV, [mtdev >= 1.1.0])
+ PKG_CHECK_MODULES(LIBUDEV, [libudev])
+ PKG_CHECK_MODULES(LIBEVDEV, [libevdev >= 0.4])
+-PKG_CHECK_MODULES(LIBUNWIND,
++
++AC_ARG_WITH(libunwind,
++            AS_HELP_STRING([--without-libunwind],[Do not use libunwind]))
++
++AS_IF([test "x$with_libunwind" != "xno"],
++	[PKG_CHECK_MODULES(LIBUNWIND,
+ 		  [libunwind],
+ 		  [HAVE_LIBUNWIND=yes],
+-		  [HAVE_LIBUNWIND=no])
+-if test "x$HAVE_LIBUNWIND" = "xyes"; then
+-	AC_DEFINE(HAVE_LIBUNWIND, 1, [Have libunwind support])
+-fi
++		  [HAVE_LIBUNWIND=no])],
++	[HAVE_LIBUNWIND=no])
++
++AS_IF([test "x$HAVE_LIBUNWIND" = "xyes"],
++	[AC_DEFINE(HAVE_LIBUNWIND, 1, [Have libunwind support])],
++	[AS_IF([test "x$with_libunwind" = "xyes"],
++		[AC_MSG_ERROR([libunwind requested but not found])])])
++
+ AM_CONDITIONAL(HAVE_LIBUNWIND, [test "x$HAVE_LIBUNWIND" = xyes])
+ AC_PATH_PROG(ADDR2LINE, [addr2line])
+ if test "x$ADDR2LINE" != "x"; then
+-- 
+2.3.5
+
diff --git a/meta/recipes-graphics/wayland/libinput_0.18.0.bb b/meta/recipes-graphics/wayland/libinput_0.18.0.bb
index 0fe1c6c..8e8e6a7 100644
--- a/meta/recipes-graphics/wayland/libinput_0.18.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_0.18.0.bb
@@ -7,11 +7,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
+           file://libinput-configure.ac-add-arg-with-libunwind.patch \
+"
 SRC_URI[md5sum] = "0ddbb0d53d58dec0a86de6791560011a"
 SRC_URI[sha256sum] = "64a70f96bab17a22eaf2fd7af17cf83def3388374096c7623be9448f62808cda"
 
 inherit autotools pkgconfig
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
+
 FILES_${PN} += "${libdir}/udev/"
 FILES_${PN}-dbg += "${libdir}/udev/.debug"
-- 
1.9.1



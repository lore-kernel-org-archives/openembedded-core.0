Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E9B98757A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 23:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t73N4xE1015180 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Aug 2015 00:04:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aWk-LGxl_F-1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 00:04:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t73N4eog015173
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Aug 2015 00:04:54 +0100
Message-ID: <1438620451.4796.67.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 03 Aug 2015 17:47:31 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Subject: [PATCH] weston: Fix parallel make race
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
X-List-Received-Date: Mon, 03 Aug 2015 23:05:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The current approach used by the Makefile ends up installing
weston.desktop twice and can give build failures when using
parallel make flags. Change to just have one DATA reference.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wayland/weston/parallelmake.patch              | 22 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/parallelmake.patch

diff --git a/meta/recipes-graphics/wayland/weston/parallelmake.patch b/meta/recipes-graphics/wayland/weston/parallelmake.patch
new file mode 100644
index 0000000..34d7512
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/parallelmake.patch
@@ -0,0 +1,22 @@
+The current approach used by the Makefile ends up installing 
+weston.desktop twice and can give build failures when using 
+parallel make flags. Change to just have one DATA reference.
+
+RP
+2015/8/3
+Upstream-Status: Pending
+
+Index: weston-1.8.0/Makefile.am
+===================================================================
+--- weston-1.8.0.orig/Makefile.am
++++ weston-1.8.0/Makefile.am
+@@ -179,8 +179,7 @@ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = src/weston.pc
+ 
+ wayland_sessiondir = $(datadir)/wayland-sessions
+-wayland_session_DATA = src/weston.desktop
+-dist_wayland_session_DATA = $(wayland_session_DATA)
++dist_wayland_session_DATA = src/weston.desktop
+ 
+ westonincludedir = $(includedir)/weston
+ westoninclude_HEADERS =				\
diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index ac6bd97..342c604 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://make-lcms-explicitly-configurable.patch \
            file://make-libwebp-explicitly-configurable.patch \
            file://0001-make-error-portable.patch \
+           file://parallelmake.patch \
 "
 SRC_URI[md5sum] = "24cb8a7ed0535b4fc3642643988dab36"
 SRC_URI[sha256sum] = "8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312"




Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3496013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 01:19:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6G1J8Qe013415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 18:19:08 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 15 Jul 2015 18:19:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 09:17:44 +0800
Message-ID: <1437009464-31315-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston: fix two building issue
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
X-List-Received-Date: Thu, 16 Jul 2015 01:19:11 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. duplicate makefile rule leads to race, so remove one:
   "/usr/bin/install: cannot create regular file `bitbake_build/tmp/work/
   core2-64-wrs-linux/weston/1.8.0-r0/image/usr/share/wayland-sessions/
   weston.desktop': File exists"
2. create tests dir and ivi-shell to fix the building rule dependency issue.
   sed "..." ivi-shell/weston.ini.in > ivi-shell/weston.ini
   ivi-shell/weston.ini: No such file or directory

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../wayland/weston/0001-remove-duplicate.patch     | 33 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |  5 ++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-remove-duplicate.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-remove-duplicate.patch b/meta/recipes-graphics/wayland/weston/0001-remove-duplicate.patch
new file mode 100644
index 0000000..a6eaf85
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-remove-duplicate.patch
@@ -0,0 +1,33 @@
+From 5cbb8b06e88ebcbf3669a51b8dae955c58a0ca1d Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Wed, 15 Jul 2015 15:44:25 +0800
+Subject: [PATCH] remove the unnecessory rule from Makefile.am
+
+Upstream-Statue: Pending
+
+dist_wayland_session_DATA will distributes and installs src/weston.desktop,
+and the definition of wayland_session_DATA, which installs src/weston.desktop
+too, is duplicated, and lead to race issue, remove it to fix the problem.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5819b19..ee5fbbb 100644
+--- a/Makefile.am
++++ b/Makefile.am
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
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index ac6bd97..3bba03f 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://make-lcms-explicitly-configurable.patch \
            file://make-libwebp-explicitly-configurable.patch \
            file://0001-make-error-portable.patch \
+           file://0001-remove-duplicate.patch \
 "
 SRC_URI[md5sum] = "24cb8a7ed0535b4fc3642643988dab36"
 SRC_URI[sha256sum] = "8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312"
@@ -67,6 +68,10 @@ PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 # Weston with unwinding support
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 
+do_compile_prepend() {
+	mkdir ${B}/tests ${B}/ivi-shell
+}
+
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
 	rm -f ${D}/${libdir}/weston/*.la
-- 
1.9.1



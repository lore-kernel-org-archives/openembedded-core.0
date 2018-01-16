Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DFCEB7867E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 00:34:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0G0YP7Y018204
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 16:34:25 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 15 Jan 2018 16:34:25 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jan 2018 08:32:33 +0800
Message-ID: <1516062753-13689-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [PATCH] json-glib: update to 1.4.2
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
X-List-Received-Date: Tue, 16 Jan 2018 00:34:25 -0000
Content-Type: text/plain

Drop 0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
since it has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ble-gobject-introspection-when-cross-comp.patch | 32 ----------------------
 .../{json-glib_1.2.8.bb => json-glib_1.4.2.bb}     |  7 ++---
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
 rename meta/recipes-gnome/json-glib/{json-glib_1.2.8.bb => json-glib_1.4.2.bb} (84%)

diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch b/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
deleted file mode 100644
index 849bb9d..0000000
--- a/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 293452c963188666dae99521294f09a0cf9582e2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 4 Aug 2017 16:01:11 +0300
-Subject: [PATCH] Do not disable gobject introspection when cross-compiling.
-
-Introspection does work fine for instance in Open Embedded,
-one of the most prominent cross-compilation frameworks
-(through qemu emulating target hardware), so let the user
-decide if he wants the feature or not.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 43cbfd9..8a32f26 100644
---- a/meson.build
-+++ b/meson.build
-@@ -147,7 +147,7 @@ root_dir = include_directories('.')
- 
- gnome = import('gnome')
- gir = find_program('g-ir-scanner', required: false)
--build_gir = gir.found() and not meson.is_cross_build() and not get_option('disable_introspection')
-+build_gir = gir.found() and not get_option('disable_introspection')
- 
- subdir('json-glib')
- 
--- 
-2.13.2
-
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
similarity index 84%
rename from meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
index 31912d1..fad0a2d 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
@@ -10,11 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "glib-2.0"
 
-SRC_URI_append = " \
-           file://0001-Do-not-disable-gobject-introspection-when-cross-comp.patch \
-           "
-SRC_URI[archive.md5sum] = "ff31e7d0594df44318e12facda3d086e"
-SRC_URI[archive.sha256sum] = "fd55a9037d39e7a10f0db64309f5f0265fa32ec962bf85066087b83a2807f40a"
+SRC_URI[archive.md5sum] = "35107e23a7bbbc70f31c34f7b9adf1c3"
+SRC_URI[archive.sha256sum] = "2d7709a44749c7318599a6829322e081915bdc73f5be5045882ed120bb686dc8"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase lib_package gobject-introspection gtk-doc manpages gettext
-- 
2.7.4



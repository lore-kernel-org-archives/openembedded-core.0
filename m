Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 70D6D605BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 03:33:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,278,1549900800"; d="scan'208";a="57886559"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Mar 2019 11:33:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 536194CD5D2C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 11:33:04 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Mar 2019 11:33:08 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 11:33:40 +0800
Message-ID: <20190328033340.18022-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 536194CD5D2C.A96B8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gdk-pixbuf:upgrade 2.38.0 -> 2.38.1
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
X-List-Received-Date: Thu, 28 Mar 2019 03:33:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from gdk-pixbuf_2.38.0.bb to gdk-pixbuf_2.38.1.bb.

-Delete gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch beacuse this patch has been fixed.

-Delete gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch beacuse this patch has been fixed.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...f-decisions-around-cross-compilation.patch | 46 -----------------
 ...-depend-on-loaders-being-fully-build.patch | 51 -------------------
 ...-pixbuf_2.38.0.bb => gdk-pixbuf_2.38.1.bb} |  6 +--
 3 files changed, 2 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.38.0.bb => gdk-pixbuf_2.38.1.bb} (94%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
deleted file mode 100644
index e638fd3b6f..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From bf71999b6e64d1f1919b0351b27c1c417e2b8856 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 14 Feb 2019 18:06:25 +0100
-Subject: [PATCH] Generate loaders.cache using a native tool when
- cross-compiling
-
-Otherwise meson would attempt to run a target binary.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- gdk-pixbuf/meson.build | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
-index 1995ffd..d692cb7 100644
---- a/gdk-pixbuf/meson.build
-+++ b/gdk-pixbuf/meson.build
-@@ -291,6 +291,7 @@ foreach bin: gdkpixbuf_bin
-   set_variable(bin_name.underscorify(), bin)
- endforeach
- 
-+if not meson.is_cross_build()
- # The 'loaders.cache' used for testing, so we don't accidentally
- # load the installed cache; we always build it by default
- loaders_cache = custom_target('loaders.cache',
-@@ -302,6 +303,18 @@ loaders_cache = custom_target('loaders.cache',
-                               ],
-                               build_by_default: true)
- loaders_dep = declare_dependency(sources: [ loaders_cache ])
-+else
-+loaders_cache = custom_target('loaders.cache',
-+                              output: 'loaders.cache',
-+                              capture: true,
-+                              depends: [ dynamic_loaders_dep ],
-+                              command: [
-+                                'gdk-pixbuf-query-loaders',
-+                                dynamic_loaders,
-+                              ],
-+                              build_by_default: true)
-+loaders_dep = declare_dependency(sources: [ loaders_cache ])
-+endif
- 
- pkgconfig = import('pkgconfig')
- pkgconfig.generate(
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch
deleted file mode 100644
index 2a7751511b..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 116bc8f7a6034ce43053876a72a132fcd4e1e472 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 20 Feb 2019 19:53:07 +0100
-Subject: [PATCH] loaders.cache: depend on loaders being fully build
-
-Otherwise, races have been observed:
-https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/310/steps/7/logs/step1b
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- gdk-pixbuf/meson.build | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
-index fc3eb33..4e7ed20 100644
---- a/gdk-pixbuf/meson.build
-+++ b/gdk-pixbuf/meson.build
-@@ -171,6 +171,7 @@ gdkpixbuf_dep = declare_dependency(link_with: gdkpixbuf,
- # Now check if we are building loaders as installed shared modules
- # We do this here because shared modules depend on libgdk-pixbuf
- dynamic_loaders = []
-+dynamic_loaders_dep = []
- 
- foreach l: loaders
-   name = l[0]
-@@ -189,6 +190,7 @@ foreach l: loaders
- 
-     # We need the path to build loaders.cache for tests
-     dynamic_loaders += mod.full_path()
-+    dynamic_loaders_dep += mod
-   endif
- endforeach
- 
-@@ -206,6 +208,7 @@ if enable_native_windows_loaders
-                           install: true,
-                           install_dir: gdk_pixbuf_loaderdir)
-       dynamic_loaders += mod.full_path()
-+      dynamic_loaders_dep += mod
-     endforeach
-   endif
- endif
-@@ -236,6 +239,7 @@ if not meson.is_cross_build()
- loaders_cache = custom_target('loaders.cache',
-                               output: 'loaders.cache',
-                               capture: true,
-+                              depends: [ dynamic_loaders_dep ],
-                               command: [
-                                 gdk_pixbuf_query_loaders,
-                                 dynamic_loaders,
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
similarity index 94%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
index c5de7a92a5..7da069731d 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
@@ -17,8 +17,6 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
-           file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
-           file://0001-loaders.cache-depend-on-loaders-being-fully-build.patch \
            file://0004-Do-not-run-tests-when-building.patch \
            "
 
@@ -29,8 +27,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
            "
 
-SRC_URI[md5sum] = "77765f24496dc8c90c6e0cbe10fd8f0e"
-SRC_URI[sha256sum] = "dd50973c7757bcde15de6bcd3a6d462a445efd552604ae6435a0532fbbadae47"
+SRC_URI[md5sum] = "f6ba2195acd18c5c9555421f30c31cc1"
+SRC_URI[sha256sum] = "f19ff836ba991031610dcc53774e8ca436160f7d981867c8c3a37acfe493ab3a"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
-- 
2.20.1





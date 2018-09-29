Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C82897999F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 09:34:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T9YnOK020478
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 02:34:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 02:34:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 17:39:56 +0800
Message-ID: <f12369511c63689b4fb363d6c49907c8593d4608.1538212391.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1538212391.git.Qi.Chen@windriver.com>
References: <cover.1538212391.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] webkitgtk: fix to build without opengl
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
X-List-Received-Date: Sat, 29 Sep 2018 09:34:47 -0000
Content-Type: text/plain

Currently, webkitgtk cannot be built if 'opengl' is not in distro
feature. The error message is like below:

  OpenGLShims.h:23:10: fatal error: GL/gl.h: No such file or directory

The required distro feature for webkitgtk is only 'x11'.

From its source codes, libepoxy is an alternative option to build webkitgtk.
So fix to use it. In this way, we can successfully build out
webkitgtk if 'opengl' is not in distro features.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-fix-to-build-with-libepoxy.patch          | 35 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.20.5.bb       |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-fix-to-build-with-libepoxy.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-fix-to-build-with-libepoxy.patch b/meta/recipes-sato/webkit/webkitgtk/0001-fix-to-build-with-libepoxy.patch
new file mode 100644
index 0000000..72ccef4
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-fix-to-build-with-libepoxy.patch
@@ -0,0 +1,35 @@
+From 59c04daa31f8083bf4eff8304b13f34dd79d00a3 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Sat, 29 Sep 2018 16:32:57 +0800
+Subject: [PATCH] fix to build with libepoxy
+
+In source codes, there are places checking USE(LIBEPOXY), but
+in cmake files, there's nowhere to handle it.
+
+Fix to define USE_LIBEPOXY to 1 if ENABLE_LIBEPOXY is turned on.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Source/cmake/OptionsGTK.cmake | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
+index 386fa1d..6e86257 100644
+--- a/Source/cmake/OptionsGTK.cmake
++++ b/Source/cmake/OptionsGTK.cmake
+@@ -240,6 +240,10 @@ endif ()
+ 
+ SET_AND_EXPOSE_TO_BUILD(USE_TEXTURE_MAPPER TRUE)
+ 
++if (ENABLE_LIBEPOXY)
++    SET_AND_EXPOSE_TO_BUILD(USE_LIBEPOXY TRUE)
++endif ()
++
+ if (ENABLE_OPENGL)
+     # ENABLE_OPENGL is true if either USE_OPENGL or ENABLE_GLES2 is true.
+     # But USE_OPENGL is the opposite of ENABLE_GLES2.
+-- 
+2.7.4
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
index c8d4f94..24d10a2 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0012-soup-Forward-declare-URL-class.patch \
            file://0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch \
            file://0001-webkitgtk-fix-CVE-2017-17821.patch \
+           file://0001-fix-to-build-with-libepoxy.patch \
            "
 
 SRC_URI[md5sum] = "72a05f6a4dc1c78b079590a8fd280401"
@@ -42,7 +43,7 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', 'libepoxy' ,d)} \
                    enchant \
                    libsecret \
                   "
@@ -52,6 +53,7 @@ PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/lib
 PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
 PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant"
 PACKAGECONFIG[gtk2] = "-DENABLE_PLUGIN_PROCESS_GTK2=ON,-DENABLE_PLUGIN_PROCESS_GTK2=OFF,gtk+"
+PACKAGECONFIG[libepoxy] = "-DENABLE_LIBEPOXY=ON,-DENABLE_LIBEPOXY=OFF,libepoxy"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
 PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"
-- 
1.9.1



Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD1BD58E4D
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 07:24:42 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13027.1772609079320177262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 23:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I1UZ9/oA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772609080; x=1804145080;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6Je/sJUcnVJt18U6dgnOMKwPtC95Srd/kOSLU1+fkiw=;
  b=I1UZ9/oALGJkbREJKPQjAj0MjA/G9NG3DRJeNon/G5aYcdIufJuUlOje
   kOp92KkyUlB3RRnHihFnbm5C/d9bhFo7GkuoDCn73yb81eoUJV2C6SSpI
   hsVgXzudnH1mPHk75DSf6/tIjMV01VDCGIKi2Y09wehJaGj09qr1sWy5M
   alzSMybrsnyME0WF7wSmGIGTmv0Y94j2qoRpEksGOZeAjSUl2+tgh5sMw
   VL1LG1PGqjZu3UHNKevi17ls3+Ke8F1SXgP0++SDHH9Q0DAQf5l1MHp+D
   9189OzpBot6ctWiz/MWcOJbY1xiGyLwMNsWLQbtcDXVWUmHQ/idw8kw7K
   g==;
X-CSE-ConnectionGUID: xFvXqdIbS1CP5OLH4g9i0Q==
X-CSE-MsgGUID: XZVjmFBqSfqouwMn7DEkGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="231302405"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="231302405"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id 8B25FC006C0
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 07:24:37 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3704F926750
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 07:24:37 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id C7B6A8212D7
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 07:24:34 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] gstreamer1.0-vaapi: Enable hotdoc to produce doc
Date: Wed,  4 Mar 2026 15:24:29 +0800
Message-ID: <20260304072430.9478-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 07:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232351

1. Add two patches to make generating doc works.
  0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch
  0002-Make-doc-build-in-default-rule.patch

2. Add INSANE_SKIP to fix do_package QA Issue

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...uild-check-to-make-doc-work-in-yocto.patch | 32 +++++++++++++++++++
 .../0002-Make-doc-build-in-default-rule.patch | 28 ++++++++++++++++
 .../gstreamer/gstreamer1.0-vaapi_1.26.9.bb    | 27 ++++++++++++++--
 3 files changed, 85 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0002-Make-doc-build-in-default-rule.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch
new file mode 100644
index 0000000000..e628e3f61e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch
@@ -0,0 +1,32 @@
+Subject: [PATCH] Disable cross_build check to make doc work in yocto.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ docs/meson.build | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/docs/meson.build b/docs/meson.build
+index ad5f785..1e7a808 100644
+--- a/docs/meson.build
++++ b/docs/meson.build
+@@ -4,15 +4,6 @@ if get_option('doc').disabled()
+   subdir_done()
+ endif
+ 
+-if meson.is_cross_build()
+-    if get_option('doc').enabled()
+-        error('Documentation enabled but building the doc while cross building is not supported yet.')
+-    endif
+-
+-    message('Documentation not built as building it while cross building is not supported yet.')
+-    subdir_done()
+-endif
+-
+ if static_build
+     if get_option('doc').enabled()
+         error('Documentation enabled but not supported when building statically.')
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0002-Make-doc-build-in-default-rule.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0002-Make-doc-build-in-default-rule.patch
new file mode 100644
index 0000000000..0e6801b858
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0002-Make-doc-build-in-default-rule.patch
@@ -0,0 +1,28 @@
+From 2c83bc5af6ada0e297bebb43e0e39a21d1914f75 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Wed, 4 Mar 2026 06:43:30 +0000
+Subject: [PATCH] Make doc build in default rule.
+
+Set docs/vaapi-doc as default build rule, so it can be build automaticallye.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ docs/meson.build | 2 +
+ 1 file changed, 2 insertion(+)
+
+diff --git a/docs/meson.build b/docs/meson.build
+index 1e7a808..19b5e86 100644
+--- a/docs/meson.build
++++ b/docs/meson.build
+@@ -76,4 +76,6 @@ plugins_doc = [hotdoc.generate_doc('vaapi',
+     gst_plugin_name: 'vaapi',
+     dependencies: [gstbase_dep, gstvideo_dep, gstallocators_dep, gstpbutils_dep,
+     libva_dep, gstlibvaapi_dep, gstgl_dep, libm] + plugins,
++    build_by_default: true,
++    install: true
+ )]
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
index dc5055bb0c..ef6525ba2f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
@@ -9,7 +9,13 @@ REALPN = "gstreamer-vaapi"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
+          ${@bb.utils.contains('PACKAGECONFIG', 'hotdoc', d.getVar('SRC_URI_DOC'), '', d)} \
+          "
+
+SRC_URI_DOC = "file://0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch \
+               file://0002-Make-doc-build-in-default-rule.patch \
+"
 
 SRC_URI[sha256sum] = "bf989040404515dc9b042f4fdc49ff33a6dccf49d544736150e967b42665598e"
 
@@ -21,7 +27,6 @@ inherit meson pkgconfig features_check upstream-version-is-even
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 EXTRA_OEMESON += " \
-    -Ddoc=disabled \
     -Dexamples=disabled \
     -Dtests=enabled \
 "
@@ -44,10 +49,28 @@ PACKAGECONFIG[drm] = "-Ddrm=enabled,-Ddrm=disabled,udev libdrm"
 PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
 PACKAGECONFIG[encoders] = "-Dencoders=enabled,-Dencoders=disabled"
 PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,virtual/libgl"
+PACKAGECONFIG[hotdoc] = "-Ddoc=enabled,-Ddoc=disabled,hotdoc-native"
 PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols"
 PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libxrandr libxrender"
 
+set_llvm_env() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'hotdoc', 'true', 'false', d)}; then
+        export LLVM_CONFIG=${STAGING_BINDIR_NATIVE}/llvm-config
+    fi
+}
+
+do_compile:prepend:class-target () {
+    set_llvm_env
+}
+
+do_install:prepend:class-target () {
+    set_llvm_env
+}
+
 FILES:${PN} += "${libdir}/gstreamer-*/*.so"
 FILES:${PN}-dbg += "${libdir}/gstreamer-*/.debug"
 FILES:${PN}-dev += "${libdir}/gstreamer-*/*.a"
 FILES:${PN}-tests = "${bindir}/*"
+
+# Fix do_package_qa: QA Issue: non -staticdev package contains static .a library: gstreamer1.0-vaapi-doc path '/usr/share/doc/gstreamer1.0-vaapi/html/assets/js/search/annex.a' [staticdev], annex.a is a text file
+INSANE_SKIP:${PN}-doc += "staticdev"
-- 
2.43.0



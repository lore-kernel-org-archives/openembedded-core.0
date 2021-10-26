Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5E0C4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:06 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.14227.1635263944386033352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783272"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783272"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:01 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786317"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:00 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/37] gstreamer1.0-plugins-base: 1.18.4 -> 1.18.5
Date: Tue, 26 Oct 2021 23:57:34 +0800
Message-Id: 
 <d38a5626f20ed964d79e64f237aa2e3bdb5c7d69.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157406

From: Jose Quaresma <quaresma.jose@gmail.com>

Drop backport patches:
    * 4ef5c91697a141fea7317aff7f0f28e5a861db99.patch

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit de0ee4323a19a27b6bcef7cc791d0373c311ef22)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...c91697a141fea7317aff7f0f28e5a861db99.patch | 50 -------------------
 ...bb => gstreamer1.0-plugins-base_1.18.5.bb} |  3 +-
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.4.bb => gstreamer1.0-plugins-base_1.18.5.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch
deleted file mode 100644
index a2f5dff5e9..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 4ef5c91697a141fea7317aff7f0f28e5a861db99 Mon Sep 17 00:00:00 2001
-From: Xavier Claessens <xavier.claessens@collabora.com>
-Date: Mon, 26 Apr 2021 14:25:03 -0400
-Subject: [PATCH] gstgl: Fix build when Meson >= 0.58.0rc1
-
-"implicit_include_directories: false" now also means that current build
-directory is not added to include paths by default any more. We have to
-add it manually because we have some custom_target() that generate
-headers in current build directory.
-
-See https://github.com/mesonbuild/meson/issues/8700.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/1125>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gst-libs/gst/gl/meson.build | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/gst-libs/gst/gl/meson.build b/gst-libs/gst/gl/meson.build
-index 66668644e..53891625a 100644
---- a/gst-libs/gst/gl/meson.build
-+++ b/gst-libs/gst/gl/meson.build
-@@ -1004,11 +1004,20 @@ if build_gstgl
-     command : [mkenums, glib_mkenums, '@OUTPUT@', '@INPUT@'])
-   gen_sources = [gl_enumtypes_h]
- 
-+  common_args = gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL']
-+
-+  # We have custom_target() that generate headers in the current build dir,
-+  # but with implicit_include_directories: false, meson >= 0.58.0 won't include
-+  # it by default. We cannot use include_directories('.') here because it would
-+  # also include current source dir which is what we want to avoid because
-+  # case-insensitive FS would include gst-libs/gl/egl/egl.h as EGL/egl.h.
-+  common_args += '-I@0@'.format(meson.current_build_dir())
-+
-   gstgl = library('gstgl-' + api_version,
-     gl_sources, gl_egl_sources, gl_x11_sources, gl_wayland_sources, gl_priv_sources, gl_enumtypes_c, gl_enumtypes_h,
--    c_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
--    cpp_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
--    objc_args : gst_plugins_base_args + gl_cpp_args + gl_objc_args + ['-DBUILDING_GST_GL'],
-+    c_args : common_args,
-+    cpp_args : common_args,
-+    objc_args : common_args + gl_objc_args,
-     include_directories : [configinc, libsinc, gl_includes],
-     version : libversion,
-     soversion : soversion,
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
index 90a8d7dfbb..5e2cca3864 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
@@ -11,9 +11,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
-           file://4ef5c91697a141fea7317aff7f0f28e5a861db99.patch \
            "
-SRC_URI[sha256sum] = "29e53229a84d01d722f6f6db13087231cdf6113dd85c25746b9b58c3d68e8323"
+SRC_URI[sha256sum] = "960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.31.1



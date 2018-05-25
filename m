Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CA59F60110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 06:20:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 23:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,439,1520924400"; d="scan'208";a="61569640"
Received: from anmitta2-mobl1.png.intel.com ([10.221.23.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2018 23:20:41 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 14:20:14 +0800
Message-Id: <20180525062014.22022-12-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180525062014.22022-1-anuj.mittal@intel.com>
References: <20180525062014.22022-1-anuj.mittal@intel.com>
Subject: [PATCH 12/12] gst-validate: upgrade 1.14.0 -> 1.14.1
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
X-List-Received-Date: Fri, 25 May 2018 06:20:40 -0000

Bugfixes only. Please see:

https://gstreamer.freedesktop.org/releases/1.14/#1.14.1

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...plate-paths-when-buildir-is-differen.patch | 41 -------------------
 ...idate_1.14.0.bb => gst-validate_1.14.1.bb} |  5 +--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-validate/0001-validate-fix-template-paths-when-buildir-is-differen.patch
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.14.0.bb => gst-validate_1.14.1.bb} (80%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate/0001-validate-fix-template-paths-when-buildir-is-differen.patch b/meta/recipes-multimedia/gstreamer/gst-validate/0001-validate-fix-template-paths-when-buildir-is-differen.patch
deleted file mode 100644
index 400b8b0fea..0000000000
--- a/meta/recipes-multimedia/gstreamer/gst-validate/0001-validate-fix-template-paths-when-buildir-is-differen.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From ac9d7d230effdb97870c2f317b3b45449bde1769 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <am.devel@gmail.com>
-Date: Wed, 11 Apr 2018 15:40:02 +0800
-Subject: [PATCH] validate: fix template paths when buildir is different
-
-Compilation just fails otherwise because it's not able to locate the files.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=795149]
-Signed-off-by: Anuj Mittal <am.devel@gmail.com>
-
----
- gst/validate/Makefile.am | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/gst/validate/Makefile.am b/gst/validate/Makefile.am
-index 342730a..3fcc3e5 100644
---- a/gst/validate/Makefile.am
-+++ b/gst/validate/Makefile.am
-@@ -48,14 +48,17 @@ source_h = \
- nodist_libgstvalidate_@GST_API_VERSION@_la_SOURCES = $(built_source_make)
- nodist_libgstvalidate_@GST_API_VERSION@include_HEADERS = $(built_header_make)
- 
-+template_h = $(patsubst %,$(srcdir)/%, gst-validate-enum-types.h.template)
-+template_c = $(patsubst %,$(srcdir)/%, gst-validate-enum-types.c.template)
-+
- gst-validate-enum-types.h: $(source_h)
- 	$(AM_V_GEN)$(GLIB_MKENUMS) \
--	--template gst-validate-enum-types.h.template \
-+	--template $(template_h) \
- 	$^ > gst-validate-enum-types.h
- 
- gst-validate-enum-types.c: $(source_h)
- 	$(AM_V_GEN)$(GLIB_MKENUMS) \
--	--template gst-validate-enum-types.c.template \
-+	--template $(template_c) \
- 	$^ > gst-validate-enum-types.c
- 
- EXTRA_DIST= \
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.1.bb
similarity index 80%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.14.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.14.1.bb
index d12b8f6a0f..7517580a8d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.1.bb
@@ -7,10 +7,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
-           file://0001-validate-fix-template-paths-when-buildir-is-differen.patch \
            "
-SRC_URI[md5sum] = "deb8654c912b189388fe585b0fc5bc8f"
-SRC_URI[sha256sum] = "33df08bf77f2895d64b7e8a957de3b930b4da0a8edabfbefcff2eab027eeffdf"
+SRC_URI[md5sum] = "293262badee41357e029e5f2664354d7"
+SRC_URI[sha256sum] = "68e3f38f66e0d04837b60090fe5d9ca1127f5df124669f34ca82e241209171e4"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.17.0



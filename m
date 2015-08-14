Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC4C766FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:55:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2015 03:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="768726374"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2015 03:55:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:55:30 +0300
Message-Id: <e1eb4c478f97f1b7f183f5c44cf9b5eb41c3fed0.1439549437.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/22] webkitgtk: add a new recipe for latest upstream version
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
X-List-Received-Date: Fri, 14 Aug 2015 10:55:09 -0000

Recipe for the obsolete webkit-gtk 1.8.3 is removed in a separate commit

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb | 56 +++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
new file mode 100644
index 0000000..84e9619
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -0,0 +1,56 @@
+SUMMARY = "WebKit web rendering engine for the GTK+ platform"
+HOMEPAGE = "http://www.webkitgtk.org/"
+BUGTRACKER = "http://bugs.webkit.org/"
+
+LICENSE = "BSD & LGPLv2+"
+LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
+                    file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
+                    file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
+		    file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
+		    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
+		   "
+
+SRC_URI = "\
+  http://www.webkitgtk.org/releases/${PN}-${PV}.tar.xz \
+  "
+SRC_URI[md5sum] = "df79991848a5096d3a75289ebce547ae"
+SRC_URI[sha256sum] = "3d1f0c534935f43fd74df90f2648fcee672d60f1f57a30fa557a77891ae04d20"
+
+inherit cmake lib_package pkgconfig perlnative pythonnative
+
+DEPENDS = "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
+           gtk+ gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
+	   pango icu bison-native gnome-common gawk intltool-native libwebp \
+	   atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora libvorbis libxcomposite libxtst \
+	   ruby-native libsecret libnotify gstreamer1.0-plugins-bad \
+          "
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
+
+EXTRA_OECMAKE = " \
+		-DPORT=GTK \
+		-DCMAKE_BUILD_TYPE=Release \
+		-DENABLE_INTROSPECTION=False \
+		-DENABLE_MINIBROWSER=True \
+	        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '-DENABLE_WEBGL=True', '-DENABLE_WEBGL=False', d)} \
+		"
+
+# Javascript JIT is not supported on powerpc
+# FIXME: This might be needed on powerpc64 as well, but can't be easily tested in poky.
+EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=False "
+
+# ARM JIT code does not build on ARMv5/6 anymore, apparently they test only on v7 onwards
+EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=False "
+EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=False "
+
+# binutils 2.25.1 has a bug on aarch64:
+# https://sourceware.org/bugzilla/show_bug.cgi?id=18430
+EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=False "
+
+# JIT not supported on MIPS either
+EXTRA_OECMAKE_append_mips = " -DENABLE_JIT=False "
+EXTRA_OECMAKE_append_mips64 = " -DENABLE_JIT=False "
+
+FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
+FILES_${PN}-dbg += "${libdir}/webkit2gtk-4.0/injected-bundle/.debug/libwebkit2gtkinjectedbundle.so"
+FILES_${PN}-dbg += "${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
+
-- 
2.1.4



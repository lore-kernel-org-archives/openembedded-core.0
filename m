Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC8AD796C5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 16:31:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w86GV8YL015014
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 09:31:09 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 09:31:07 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 6 Sep 2018 23:52:29 +0800
Message-ID: <daa5eda99a0a87cd55e79dd68d7aca71c2cde746.1536248856.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1536248856.git.kai.kang@windriver.com>
References: <cover.1536248856.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] multilib: fix install file conflicts
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
X-List-Received-Date: Thu, 06 Sep 2018 16:31:08 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix install files conflicts between multlib packages:

| Error: Transaction check error:
|   file /usr/bin/g-ir-annotation-tool conflicts between attempted installs of lib32-gobject-introspection-1.56.1-r0.x86 and gobject-introspection-1.56.1-r0.core2_64
|   file /usr/bin/g-ir-scanner conflicts between attempted installs of lib32-gobject-introspection-1.56.1-r0.x86 and gobject-introspection-1.56.1-r0.core2_64
|   file /usr/bin/cairo-trace conflicts between attempted installs of lib32-libcairo-perf-utils-1.14.12-r0.x86 and libcairo-perf-utils-1.14.12-r0.core2_64
|   file /usr/bin/icu-config conflicts between attempted installs of lib32-icu-dev-62.1-r0.x86 and icu-dev-62.1-r0.core2_64
|   file /usr/share/gir-1.0/GLib-2.0.gir conflicts between attempted installs of gobject-introspection-dev-1.56.1-r0.core2_64 and lib32-gobject-introspection-dev-1.56.1-r0.x86
|   file /usr/bin/gpgrt-config conflicts between attempted installs of lib32-libgpg-error-dev-1.32-r0.x86 and libgpg-error-dev-1.32-r0.core2_64
|   file /usr/share/pkgconfig/udev.pc conflicts between attempted installs of eudev-dev-3.2.5-r0.core2_64 and lib32-eudev-dev-3.2.5-r0.x86

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/udev/eudev_3.2.5.bb                       | 6 ++++--
 .../gobject-introspection/gobject-introspection_1.56.1.bb   | 6 ++++--
 meta/recipes-graphics/cairo/cairo_1.14.12.bb                | 6 ++++--
 meta/recipes-support/icu/icu.inc                            | 4 +++-
 meta/recipes-support/libgpg-error/libgpg-error_1.32.bb      | 5 ++++-
 5 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.5.bb b/meta/recipes-core/udev/eudev_3.2.5.bb
index 75617c8d4e..75130f03ef 100644
--- a/meta/recipes-core/udev/eudev_3.2.5.bb
+++ b/meta/recipes-core/udev/eudev_3.2.5.bb
@@ -23,7 +23,9 @@ SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "6ca08c0e14380f87df8e8aceac123671"
 SRC_URI[sha256sum] = "49c2d04105cad2526302627e040fa24b1916a9a3e059539bc8bb919b973890af"
 
-inherit autotools update-rc.d qemu pkgconfig distro_features_check
+inherit autotools update-rc.d qemu pkgconfig distro_features_check multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-dev:${datadir}/pkgconfig/udev.pc"
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -65,7 +67,7 @@ PACKAGES =+ "eudev-hwdb"
 
 
 FILES_${PN} += "${libexecdir} ${base_libdir}/udev ${bindir}/udevadm"
-FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
+FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc* \
                    ${includedir}/libudev.h ${libdir}/libudev.so \
                    ${includedir}/udev.h ${libdir}/libudev.la \
                    ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
index f3479565ea..887ff58049 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
@@ -23,7 +23,9 @@ SRC_URI[sha256sum] = "5b2875ccff99ff7baab63a34b67f8c920def240e178ff50add809e267d
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
+inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner ${PN}-dev:${datadir}/gir-1.0/GLib-2.0.gir"
 
 DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native"
 
@@ -177,7 +179,7 @@ FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
 
 # .gir files go to dev package, as they're needed for developing (but not for running)
 # things that depends on introspection.
-FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir*"
 FILES_${PN}-dev_append = " ${datadir}/gir-*/*.rnc"
 
 # These are used by gobject-based packages
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.12.bb b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
index a902c26879..18b947948a 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.12.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
@@ -30,7 +30,9 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
 SRC_URI[md5sum] = "9f0db9dbfca0966be8acd682e636d165"
 SRC_URI[sha256sum] = "8c90f00c500b2299c0a323dd9beead2a00353752b2092ead558139bd67f7bf16"
 
-inherit autotools pkgconfig upstream-version-is-even gtk-doc
+inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-perf-utils:${bindir}/cairo-trace"
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 
@@ -79,7 +81,7 @@ DESCRIPTION_cairo-perf-utils = "The Cairo library performance utilities"
 FILES_${PN} = "${libdir}/libcairo.so.*"
 FILES_${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES_${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
-FILES_${PN}-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so.*"
+FILES_${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so.*"
 FILES_${PN}-dev += "${libdir}/cairo/*.so"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index f0786baa03..e20085fbf5 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -19,7 +19,9 @@ BINCONFIG = "${bindir}/icu-config"
 
 ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
 
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
index 098242ea10..a4c720be9d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
@@ -20,7 +20,10 @@ SRC_URI[sha256sum] = "c345c5e73cc2332f8d50db84a2280abfb1d8f6d4f1858b9daa30404db4
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-inherit autotools binconfig-disabled pkgconfig gettext multilib_header
+inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/gpgrt-config"
+
 CPPFLAGS += "-P"
 do_compile_prepend() {
 	TARGET_FILE=linux-gnu
-- 
2.18.0



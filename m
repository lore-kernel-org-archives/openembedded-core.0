Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C9CBE78FC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 05:27:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7S5RREp001974
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:27:28 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 27 Aug 2018 22:27:26 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2018 13:27:25 +0800
Message-ID: <1535434045-243085-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libjpeg-turbo: Upgrade 1.5.3 -> 2.0.0
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
X-List-Received-Date: Tue, 28 Aug 2018 05:27:26 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: Copyright Year Update

1. Upgrade from 1.5.3 -> 2.0.0, change from autools to cmake
2. Add a patch for fix package qa error
3. remove --with-build-date since 2.0.0 not support config build date

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-libjpeg-turbo-fix-package_qa-error.patch  | 32 ++++++++++++++++++++++
 ...bjpeg-turbo_1.5.3.bb => libjpeg-turbo_2.0.0.bb} | 29 ++++++++------------
 2 files changed, 43 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_1.5.3.bb => libjpeg-turbo_2.0.0.bb} (61%)

diff --git a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
new file mode 100644
index 0000000..44c2c76
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
@@ -0,0 +1,32 @@
+From 0a24f03a67425a7b58b3fd40d965c0c9801ae7a1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 27 Aug 2018 16:10:55 +0800
+Subject: [PATCH] libjpeg-turbo: fix package_qa error
+
+Fix package qa errors like below:
+libjpeg.so.62.3.0 contains probably-redundant RPATH /usr/lib [useless-rpaths]
+usr/bin/cjpeg contains probably-redundant RPATH /usr/lib
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1719522..682cef1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -109,8 +109,6 @@ endif()
+ 
+ include(cmakescripts/GNUInstallDirs.cmake)
+ 
+-set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
+-
+ macro(report_directory var)
+   if(CMAKE_INSTALL_${var} STREQUAL CMAKE_INSTALL_FULL_${var})
+     message(STATUS "CMAKE_INSTALL_${var} = ${CMAKE_INSTALL_${var}}")
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
similarity index 61%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
index 6be6aa5..7737a59 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
@@ -4,16 +4,17 @@ HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=8184bcc7c4ac7b9edc6a7bc00f231d0b \
-                    file://jpeglib.h;endline=16;md5=f67d70e547a2662c079781c72f877f72 \
+                    file://jpeglib.h;endline=16;md5=7ea97dc83b0f59052ee837e61ef0e08f \
                     file://djpeg.c;endline=11;md5=c59e19811c006cb38f82d6477134d314 \
 "
 DEPENDS_append_x86-64_class-target = " nasm-native"
 DEPENDS_append_x86_class-target    = " nasm-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+           file://0001-libjpeg-turbo-fix-package_qa-error.patch"
 
-SRC_URI[md5sum] = "7c82f0f6a3130ec06b8a4d0b321cbca3"
-SRC_URI[sha256sum] = "b24890e2bb46e12e72a79f7e965f409f4e16466d00e1dd15d93d73ee6b592523"
+SRC_URI[md5sum] = "b12a3fcf1d078db38410f27718a91b83"
+SRC_URI[sha256sum] = "778876105d0d316203c928fd2a0374c8c01f755d0a00b12a1c8934aeccff8868"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
@@ -25,32 +26,24 @@ RPROVIDES_${PN} += "jpeg"
 RREPLACES_${PN} += "jpeg"
 RCONFLICTS_${PN} += "jpeg"
 
-inherit autotools pkgconfig
+inherit cmake pkgconfig
 
 # Add nasm-native dependency consistently for all build arches is hard
-EXTRA_OECONF_append_class-native = " --without-simd"
+EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
 
 # Work around missing x32 ABI support
-EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--without-simd", "", d)}"
+EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-DWITH_SIMD=False", "", d)}"
 
 # Work around missing non-floating point ABI support in MIPS
-EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "--without-simd", "", d)}"
+EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "-DWITH_SIMD=False", "", d)}"
 
 # Provide a workaround if Altivec unit is not present in PPC
-EXTRA_OECONF_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
-EXTRA_OECONF_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
+EXTRA_OECMAKE_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
+EXTRA_OECMAKE_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
 
 DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
-def get_build_time(d):
-    if d.getVar('SOURCE_DATE_EPOCH') != None:
-        import datetime
-        return " --with-build-date="+ datetime.datetime.utcfromtimestamp(float(d.getVar('SOURCE_DATE_EPOCH'))).strftime("%Y%m%d")
-    return ""
-
-EXTRA_OECONF_append_class-target = "${@get_build_time(d)}"
-
 PACKAGES =+ "jpeg-tools libturbojpeg"
 
 DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
-- 
2.7.4



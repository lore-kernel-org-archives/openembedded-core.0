Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D68279498
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 11:50:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8JBo9CU002733
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Sep 2018 04:50:10 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 19 Sep 2018 04:50:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 19 Sep 2018 19:59:30 +0800
Message-ID: <1537358370-3557-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libressl: remove recipe
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
X-List-Received-Date: Wed, 19 Sep 2018 11:50:10 -0000
Content-Type: text/plain

Since openssh support oepnssl 1.1.x, there is no reason
to keep libressl.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 -
 ...c-libraries-with-their-library-dependenci.patch | 73 ----------------------
 .../libressl/libressl_2.8.0.bb                     | 35 -----------
 3 files changed, 109 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
 delete mode 100644 meta/recipes-connectivity/libressl/libressl_2.8.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0c65e8f..af88418 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -344,7 +344,6 @@ RECIPE_MAINTAINER_pn-libpng = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libproxy = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-librepo = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-libressl = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-librsvg = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libsdl = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch b/meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
deleted file mode 100644
index 50b795d..0000000
--- a/meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 0dd486ba596fea07742a9317542bce27e18fd830 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 9 Apr 2018 18:02:56 +0300
-Subject: [PATCH] Link dynamic libraries with their library dependencies.
-
-It does seem like outside of OpenBSD, no one has actually used libressl yet.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- CMakeLists.txt        | 5 +++++
- crypto/CMakeLists.txt | 1 +
- ssl/CMakeLists.txt    | 2 +-
- 3 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 549849f..0f9d8f5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -266,15 +266,19 @@ set(OPENSSL_LIBS tls ssl crypto)
- 
- # Add additional required libs
- if(WIN32)
-+	set(OPENSSL_LIB_LIBS ws2_32)
- 	set(OPENSSL_LIBS ${OPENSSL_LIBS} ws2_32)
- endif()
- if(CMAKE_SYSTEM_NAME MATCHES "Linux")
-+	set(OPENSSL_LIB_LIBS pthread)
- 	set(OPENSSL_LIBS ${OPENSSL_LIBS} pthread)
- endif()
- if(CMAKE_SYSTEM_NAME MATCHES "HP-UX")
-+	set(OPENSSL_LIB_LIBS pthread)
- 	set(OPENSSL_LIBS ${OPENSSL_LIBS} pthread)
- endif()
- if(CMAKE_SYSTEM_NAME MATCHES "SunOS")
-+	set(OPENSSL_LIB_LIBS nsl socket)
- 	set(OPENSSL_LIBS ${OPENSSL_LIBS} nsl socket)
- endif()
- 
-@@ -282,6 +286,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
- 	# Check if we need -lrt to get clock_gettime on Linux
- 	check_library_exists(rt clock_gettime "time.h" HAVE_CLOCK_GETTIME)
- 	if (HAVE_CLOCK_GETTIME)
-+		set(OPENSSL_LIB_LIBS ${OPENSSL_LIB_LIBS} rt)
- 		set(OPENSSL_LIBS ${OPENSSL_LIBS} rt)
- 	endif()
- else()
-diff --git a/crypto/CMakeLists.txt b/crypto/CMakeLists.txt
-index 90e127e..08eceda 100644
---- a/crypto/CMakeLists.txt
-+++ b/crypto/CMakeLists.txt
-@@ -813,6 +813,7 @@ target_include_directories(crypto
- 		../include)
- 
- if (BUILD_SHARED_LIBS)
-+	target_link_libraries(crypto ${OPENSSL_LIB_LIBS})
- 	export_symbol(crypto ${CMAKE_CURRENT_BINARY_DIR}/crypto_p.sym)
- 	if (WIN32)
- 		target_link_libraries(crypto Ws2_32.lib)
-diff --git a/ssl/CMakeLists.txt b/ssl/CMakeLists.txt
-index 1a559e6..ed17223 100644
---- a/ssl/CMakeLists.txt
-+++ b/ssl/CMakeLists.txt
-@@ -51,7 +51,7 @@ target_include_directories(ssl
- 
- if (BUILD_SHARED_LIBS)
- 	export_symbol(ssl ${CMAKE_CURRENT_SOURCE_DIR}/ssl.sym)
--	target_link_libraries(ssl crypto)
-+	target_link_libraries(ssl crypto ${OPENSSL_LIB_LIBS})
- 	if (WIN32)
- 		target_link_libraries(ssl Ws2_32.lib)
- 		set(SSL_POSTFIX -${SSL_MAJOR_VERSION})
diff --git a/meta/recipes-connectivity/libressl/libressl_2.8.0.bb b/meta/recipes-connectivity/libressl/libressl_2.8.0.bb
deleted file mode 100644
index b45f16a..0000000
--- a/meta/recipes-connectivity/libressl/libressl_2.8.0.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Drop-in replacement for openssl 1.0.x, maintained by OpenBSD"
-DESCRIPTION = "LibreSSL is a version of the TLS/crypto stack forked from \
-               OpenSSL in 2014, with goals of modernizing the codebase, \
-               improving security, and applying best practice development processes. "
-HOMEPAGE = "http://www.libressl.org/"
-
-LICENSE = "openssl"
-LIC_FILES_CHKSUM = "file://COPYING;md5=01f9bb4d275f5eeea905377bef3de622"
-
-SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${PV}.tar.gz \
-           file://0001-Link-dynamic-libraries-with-their-library-dependenci.patch \
-           "
-SRC_URI[md5sum] = "d922be6690e7de8949948aaec42a4563"
-SRC_URI[sha256sum] = "af2bba965b06063518eec6f192d411631dfe1d07713760c67c3c29d348789dc3"
-
-inherit cmake
-
-EXTRA_OECMAKE = "-DOPENSSLDIR=${sysconfdir}/libressl -DBUILD_SHARED_LIBS=ON"
-
-PACKAGE_PREPROCESS_FUNCS += "libressl_package_preprocess"
-
-# libressl development files and executable binaries clash with openssl 1.1
-# files when installed into target rootfs. So we don't put them into
-# packages, but they continue to be provided via target sysroot for
-# cross-compilation on the host, if some software needs specifically libressl.
-libressl_package_preprocess () {
-        for file in `find ${PKGD} -name *.h -o -name *.pc -o -name *.so`; do
-                rm $file
-        done
-}
-
-# {standard input}: Assembler messages:
-# {standard input}:303: Error: selected processor does not support `rev r0,r0' in ARM mode
-# {standard input}:303: Error: selected processor does not support `rev ip,ip' in ARM mode
-OECMAKE_C_FLAGS_append_arm = " -D__STRICT_ALIGNMENT"
-- 
2.7.4



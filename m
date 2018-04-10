Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id EBE7A74A21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 12:14:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 05:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,431,1517904000"; d="scan'208";a="32526549"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 10 Apr 2018 05:14:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 15:07:46 +0300
Message-Id: <20180410120747.41814-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
Subject: [RFC][PATCH 4/5] libressl: add a recipe to support openssh
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
X-List-Received-Date: Tue, 10 Apr 2018 12:14:10 -0000

After reading through this:

https://github.com/openssh/openssh-portable/pull/48

and this thread:

https://lists.mindrot.org/pipermail/openssh-unix-dev/2017-October/036344.html

I've concluded that this is the best of the three not-great options. The alternatives:

- bundle libressl inside openssh packages
- keep openssh dependent on openssl 1.0 and wait until upstream does something

are both inferior. Libressl is used with openssh in OpenBSD and in OS X,
so it did get at least some testing in the real world.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...c-libraries-with-their-library-dependenci.patch | 74 ++++++++++++++++++++++
 .../libressl/libressl_2.7.2.bb                     | 31 +++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
 create mode 100644 meta/recipes-connectivity/libressl/libressl_2.7.2.bb

diff --git a/meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch b/meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
new file mode 100644
index 00000000000..977158fb673
--- /dev/null
+++ b/meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
@@ -0,0 +1,74 @@
+From 2e433aa5bb243c608930bdb46fbf55a31231a7bd Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 9 Apr 2018 18:02:56 +0300
+Subject: [PATCH] Link dynamic libraries with their library dependencies.
+
+It does seem like outside of OpenBSD, no one has actually used libressl yet.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ CMakeLists.txt        | 7 ++++++-
+ crypto/CMakeLists.txt | 1 +
+ ssl/CMakeLists.txt    | 2 +-
+ 3 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1c6bd67..2c1078d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -265,6 +265,7 @@ endif()
+ set(OPENSSL_LIBS tls ssl crypto)
+ 
+ if(WIN32)
++	set(OPENSSL_LIB_LIBS ws2_32)
+ 	set(OPENSSL_LIBS ${OPENSSL_LIBS} ws2_32)
+ endif()
+ 
+@@ -274,16 +275,20 @@ if(HAVE_CLOCK_GETTIME)
+ endif()
+ 
+ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
++	set(OPENSSL_LIB_LIBS pthread)
++	set(OPENSSL_LIBS ${OPENSSL_LIBS} pthread)
+ 	check_library_exists(rt clock_gettime "time.h" HAVE_CLOCK_GETTIME)
+ 	if (HAVE_CLOCK_GETTIME)
++		set(OPENSSL_LIB_LIBS ${OPENSSL_LIB_LIBS} rt)
+ 		set(OPENSSL_LIBS ${OPENSSL_LIBS} rt)
+ 	endif()
+-	set(OPENSSL_LIBS ${OPENSSL_LIBS} pthread)
+ endif()
+ if(CMAKE_SYSTEM_NAME MATCHES "HP-UX")
++	set(OPENSSL_LIB_LIBS pthread)
+ 	set(OPENSSL_LIBS ${OPENSSL_LIBS} pthread)
+ endif()
+ if(CMAKE_SYSTEM_NAME MATCHES "SunOS")
++	set(OPENSSL_LIB_LIBS nsl socket)
+ 	set(OPENSSL_LIBS ${OPENSSL_LIBS} nsl socket)
+ endif()
+ 
+diff --git a/crypto/CMakeLists.txt b/crypto/CMakeLists.txt
+index 2fa08a5..32ab649 100644
+--- a/crypto/CMakeLists.txt
++++ b/crypto/CMakeLists.txt
+@@ -811,6 +811,7 @@ endif()
+ 
+ add_library(crypto ${CRYPTO_SRC})
+ if (BUILD_SHARED_LIBS)
++	target_link_libraries(crypto ${OPENSSL_LIB_LIBS})
+ 	export_symbol(crypto ${CMAKE_CURRENT_BINARY_DIR}/crypto_p.sym)
+ 	if (WIN32)
+ 		target_link_libraries(crypto Ws2_32.lib)
+diff --git a/ssl/CMakeLists.txt b/ssl/CMakeLists.txt
+index e87e0f6..e53e5ea 100644
+--- a/ssl/CMakeLists.txt
++++ b/ssl/CMakeLists.txt
+@@ -50,7 +50,7 @@ set(
+ add_library(ssl ${SSL_SRC})
+ if (BUILD_SHARED_LIBS)
+ 	export_symbol(ssl ${CMAKE_CURRENT_SOURCE_DIR}/ssl.sym)
+-	target_link_libraries(ssl crypto)
++	target_link_libraries(ssl crypto ${OPENSSL_LIB_LIBS})
+ 	if (WIN32)
+ 		target_link_libraries(ssl Ws2_32.lib)
+ 		set(SSL_POSTFIX -${SSL_MAJOR_VERSION})
diff --git a/meta/recipes-connectivity/libressl/libressl_2.7.2.bb b/meta/recipes-connectivity/libressl/libressl_2.7.2.bb
new file mode 100644
index 00000000000..375615a7d1c
--- /dev/null
+++ b/meta/recipes-connectivity/libressl/libressl_2.7.2.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Drop-in replacement for openssl 1.0.x, maintained by OpenBSD"
+DESCRIPTION = "LibreSSL is a version of the TLS/crypto stack forked from \
+               OpenSSL in 2014, with goals of modernizing the codebase, \
+               improving security, and applying best practice development processes. "
+HOMEPAGE = "http://www.libressl.org/"
+
+LICENSE = "openssl"
+LIC_FILES_CHKSUM = "file://COPYING;md5=01f9bb4d275f5eeea905377bef3de622"
+
+SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${PV}.tar.gz \
+           file://0001-Link-dynamic-libraries-with-their-library-dependenci.patch \
+           "
+SRC_URI[md5sum] = "97aee636dfce1eb6ec6f38687bee0760"
+SRC_URI[sha256sum] = "917a8779c342177ff3751a2bf955d0262d1d8916a4b408930c45cef326700995"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DOPENSSLDIR=${sysconfdir}/libressl -DBUILD_SHARED_LIBS=ON"
+
+PACKAGE_PREPROCESS_FUNCS += "libressl_package_preprocess"
+
+# libressl development files and executable binaries clash with openssl 1.1
+# files when installed into target rootfs. So we don't put them into
+# packages, but they continue to be provided via target sysroot for
+# cross-compilation on the host, if some software needs specifically libressl.
+libressl_package_preprocess () {
+        for file in `find ${PKGD} -name *.h -o -name *.pc -o -name *.so`; do
+                rm $file
+        done
+}
+
-- 
2.16.1



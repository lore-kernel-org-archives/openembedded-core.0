Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2DA78EFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:23:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n11-v6so1411174wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 03:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=36Dnx71N03MaSm2rKYjBfCB6plY/NitmmZujkwfm/BA=;
	b=hTMzRtkU7igO0ORJhd927f1p0vS4cS7JprtFJsIGB0aG1lA1jNyTwa7ZJp9UzZA0F7
	avi3yjauu4lLezYR49Nnwqtzl43d5eTx4IKuK5X4Ddr0fLurdGANwTbPkPFqxEhv5G0T
	bLR4lFA7DSq18zvKHCGMY+bqP74/AgsvK1xwXVaa04d6zDh+wvomSM8aIH76D25C964D
	e9aJDOsmUfQT/2zMKfX8MXVUoSxles7Wpy0EybxNvzwzSgEvsh1X7qQzdUzTvAMq/QR+
	5dqDDISdDg0fmpQUV4XwRmwGxYobCDk/j9K5AX9dL3I2xo4qpajIPWURptVZ9fI/7nKG
	0FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=36Dnx71N03MaSm2rKYjBfCB6plY/NitmmZujkwfm/BA=;
	b=Ho3t6TJ4l62XsfT1uTAW4PQ2pVPMMDvjZb9IpDld1V2qcUdH4qwu4sLs1+Tmtih6uV
	KTwg/tGUt8Ommy2j75Owo6fqNr8/KPA61q7eb9K+7PRwtx90+MXCN6pLuie3RNntfbka
	MP3ejGIrNO8vYpY4qmqttIffrbuPYuPEdERC9UX6H9nn/cb1Wz06TRMvm9/FEmvzqBCc
	t3cMy3IhEnTqB4ycRjVgfzldorNs/tFKBOVe7jOovyapJQNfPbtQao3+BQxAAPu18GXT
	921R/IulhlY1IEQoCwCVEndeSpppDFW/CbVLFFR2ATvraTIsvt5A9vZ5+pWuZwlKG2tF
	qd8w==
X-Gm-Message-State: APzg51CuoNJV5+ZfUdQ7LWxLDxswj4w/jKP034150ZPkFpnIQLZoz67+
	ZNHUPVWBYZBLsrP6yF6n/Bsp0+rM
X-Google-Smtp-Source: ANB0VdYGtNDoxfPisfNolHcqXqlGHvAnyKtL3IuqH5xybKaLr92SEpp7l46FE0tnAERKNUZgH6PiLQ==
X-Received: by 2002:a1c:1bc2:: with SMTP id
	b185-v6mr1013428wmb.160.1535451806560; 
	Tue, 28 Aug 2018 03:23:26 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	198-v6sm771823wmm.0.2018.08.28.03.23.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 03:23:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 12:23:15 +0200
Message-Id: <467e2d4b5501965f68e413797e85725cc655a3b7.1535451643.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535451643.git.alex.kanavin@gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
Subject: [RFC PATCH 4/6] libressl: add a recipe to support openssh
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
X-List-Received-Date: Tue, 28 Aug 2018 10:23:26 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

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
 meta/conf/distro/include/maintainers.inc           |  1 +
 ...c-libraries-with-their-library-dependenci.patch | 73 ++++++++++++++++++++++
 .../libressl/libressl_2.8.0.bb                     | 35 +++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
 create mode 100644 meta/recipes-connectivity/libressl/libressl_2.8.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c76f81f..de4f9af 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -344,6 +344,7 @@ RECIPE_MAINTAINER_pn-libpng = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libproxy = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-librepo = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-libressl = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-librsvg = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libsdl = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch b/meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
new file mode 100644
index 0000000..50b795d
--- /dev/null
+++ b/meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
@@ -0,0 +1,73 @@
+From 0dd486ba596fea07742a9317542bce27e18fd830 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 9 Apr 2018 18:02:56 +0300
+Subject: [PATCH] Link dynamic libraries with their library dependencies.
+
+It does seem like outside of OpenBSD, no one has actually used libressl yet.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ CMakeLists.txt        | 5 +++++
+ crypto/CMakeLists.txt | 1 +
+ ssl/CMakeLists.txt    | 2 +-
+ 3 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 549849f..0f9d8f5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -266,15 +266,19 @@ set(OPENSSL_LIBS tls ssl crypto)
+ 
+ # Add additional required libs
+ if(WIN32)
++	set(OPENSSL_LIB_LIBS ws2_32)
+ 	set(OPENSSL_LIBS ${OPENSSL_LIBS} ws2_32)
+ endif()
+ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
++	set(OPENSSL_LIB_LIBS pthread)
+ 	set(OPENSSL_LIBS ${OPENSSL_LIBS} pthread)
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
+@@ -282,6 +286,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
+ 	# Check if we need -lrt to get clock_gettime on Linux
+ 	check_library_exists(rt clock_gettime "time.h" HAVE_CLOCK_GETTIME)
+ 	if (HAVE_CLOCK_GETTIME)
++		set(OPENSSL_LIB_LIBS ${OPENSSL_LIB_LIBS} rt)
+ 		set(OPENSSL_LIBS ${OPENSSL_LIBS} rt)
+ 	endif()
+ else()
+diff --git a/crypto/CMakeLists.txt b/crypto/CMakeLists.txt
+index 90e127e..08eceda 100644
+--- a/crypto/CMakeLists.txt
++++ b/crypto/CMakeLists.txt
+@@ -813,6 +813,7 @@ target_include_directories(crypto
+ 		../include)
+ 
+ if (BUILD_SHARED_LIBS)
++	target_link_libraries(crypto ${OPENSSL_LIB_LIBS})
+ 	export_symbol(crypto ${CMAKE_CURRENT_BINARY_DIR}/crypto_p.sym)
+ 	if (WIN32)
+ 		target_link_libraries(crypto Ws2_32.lib)
+diff --git a/ssl/CMakeLists.txt b/ssl/CMakeLists.txt
+index 1a559e6..ed17223 100644
+--- a/ssl/CMakeLists.txt
++++ b/ssl/CMakeLists.txt
+@@ -51,7 +51,7 @@ target_include_directories(ssl
+ 
+ if (BUILD_SHARED_LIBS)
+ 	export_symbol(ssl ${CMAKE_CURRENT_SOURCE_DIR}/ssl.sym)
+-	target_link_libraries(ssl crypto)
++	target_link_libraries(ssl crypto ${OPENSSL_LIB_LIBS})
+ 	if (WIN32)
+ 		target_link_libraries(ssl Ws2_32.lib)
+ 		set(SSL_POSTFIX -${SSL_MAJOR_VERSION})
diff --git a/meta/recipes-connectivity/libressl/libressl_2.8.0.bb b/meta/recipes-connectivity/libressl/libressl_2.8.0.bb
new file mode 100644
index 0000000..b45f16a
--- /dev/null
+++ b/meta/recipes-connectivity/libressl/libressl_2.8.0.bb
@@ -0,0 +1,35 @@
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
+SRC_URI[md5sum] = "d922be6690e7de8949948aaec42a4563"
+SRC_URI[sha256sum] = "af2bba965b06063518eec6f192d411631dfe1d07713760c67c3c29d348789dc3"
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
+# {standard input}: Assembler messages:
+# {standard input}:303: Error: selected processor does not support `rev r0,r0' in ARM mode
+# {standard input}:303: Error: selected processor does not support `rev ip,ip' in ARM mode
+OECMAKE_C_FLAGS_append_arm = " -D__STRICT_ALIGNMENT"
-- 
2.7.4



Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id C196260097
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 01:59:13 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id q108so194176qgd.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 18:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=vJyO0KqYwpy540OzHKtUPMgk56kptpvgy8tKBsmuynY=;
	b=Zz8c5PcxkRphxXF//ya2YPhqDwjc53hPB4JEqDUqlwWpNMKItL0+UC+LzZIq7dTUFJ
	YFDI2L67rr4HGfSoVav3KEOSc6SMn3MlD1GvtAutECBs5Ln7OuYscEdXcEPiHIBwMS/A
	MJeioP01FWg1ru960zzjIdHafmRQCF2EWq8oWYluFAUH/vneNTN6jpmip+Lc3aPziQ48
	K3woJpykJ2kTlGL0FxlGHpW/9JfgdnKKYA6zgHMUj/PcYLveMQWGzYpNjtTm5PoQNFzr
	7UAn4snPvwN1rBDTMqWSrr9C5XlJEzcaL/9LyB3FK6LkCgo7TY9smYsNJk8j2LQr3Ohf
	KbWg==
X-Received: by 10.224.5.130 with SMTP id 2mr41544666qav.77.1413856754148;
	Mon, 20 Oct 2014 18:59:14 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.195.2])
	by mx.google.com with ESMTPSA id w8sm9522438qag.2.2014.10.20.18.59.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 18:59:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Oct 2014 23:58:52 -0200
Message-Id: <1413856732-4702-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] nativesdk-cmake: Adjust toolchain paths dynamically
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
X-List-Received-Date: Tue, 21 Oct 2014 01:59:18 -0000

This patch adds a flexible way to configure the CMake in SDKs. It adds
a toolchain configuration script which supports subscripts for
extensions, as for example Qt5.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../cmake/cmake/OEToolchainConfig.cmake              |   18 ++++++++++++++++++
 .../cmake/cmake/environment.d-cmake.sh               |    1 +
 meta/recipes-devtools/cmake/cmake_2.8.12.2.bb        |   14 ++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
 create mode 100644 meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
new file mode 100644
index 0000000..60014bb
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -0,0 +1,18 @@
+set( CMAKE_SYSTEM_NAME Linux )
+set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
+set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
+set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
+set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
+set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} $ENV{OECORE_NATIVE_SYSROOT} )
+set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
+set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
+
+string(REGEX MATCH "sysroots/([a-zA-Z0-9]+)" CMAKE_SYSTEM_PROCESSOR $ENV{SDKTARGETSYSROOT})
+string(REGEX REPLACE "sysroots/" "" CMAKE_SYSTEM_PROCESSOR ${CMAKE_SYSTEM_PROCESSOR})
+
+# Include the toolchain configuration subscripts
+file( GLOB toolchain_config_files "${CMAKE_TOOLCHAIN_FILE}.d/*.cmake" )
+foreach(config ${toolchain_config_files})
+    include(${config})
+endforeach()
diff --git a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
new file mode 100644
index 0000000..0eb56b6
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
@@ -0,0 +1 @@
+alias cmake="cmake -DCMAKE_TOOLCHAIN_FILE=$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
index de2ac6b..66a6af6 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
@@ -6,6 +6,10 @@ DEPENDS += "curl expat zlib libarchive"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
+SRC_URI_append_class-nativesdk = " \
+    file://OEToolchainConfig.cmake \
+    file://environment.d-cmake.sh"
+
 SRC_URI[md5sum] = "17c6513483d23590cbce6957ec6d1e66"
 SRC_URI[sha256sum] = "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a120e5e"
 
@@ -32,6 +36,16 @@ EXTRA_OECMAKE=" \
     ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
 "
 
+do_install_append_class-nativesdk() {
+    mkdir -p ${D}${datadir}/cmake
+    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
+
+    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+    install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE}/environment-setup.d/cmake.sh
+}
+
+FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}"
+
 FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
 FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
 
-- 
1.7.10.4



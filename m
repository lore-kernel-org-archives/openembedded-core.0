Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJoKv-0007bs-DR
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:55:12 +0200
Received: by gyf1 with SMTP id 1so2359928gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=KsVTWFmjETKS62G6tnP9ZEst41vf2pTvDUu0z16pskc=;
	b=iprdwYJfsC9giJTomIdzWQFEFigpuoAwSE9elyCPVHmnDObXjZvgYa4dzO8FfRT+S9
	GXs1txV90H6uZ5IEBrbXi9RAvIhwBY9uRzG9cnnr8es+p0gpP9qaTxoT+dhzOSZIfatY
	jJGa3/yryKQGW2SbPVj+nONlao4FT2hpjEmiM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=AcMTVCpcb/2qo4PEIB43LD81kluhBYgL8BswfkZHb9Troi9TjU3YN55NmDcMS3Lv3P
	GjqOma3dFYvc0RrYGkj2H78jCSAqFOS+K+8PjorEo2j5zO80EEyTIOGpn3paq8U5dExJ
	jg6D9pqYBG1itZAYXI9Nm3znPpxyUSgvfcJXY=
Received: by 10.150.139.20 with SMTP id m20mr4885781ybd.247.1305039131512;
	Tue, 10 May 2011 07:52:11 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id u20sm3193051yba.15.2011.05.10.07.52.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 07:52:10 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2011 14:51:57 +0000
Message-Id: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/3] cmake.bbclass: fix qmake and rpath issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 14:55:15 -0000

Sync with OE at 3b7d83362027fde4f6850533ab83277d95dda961 however
without changing the way of generating the toolchain file and making
it branding agnostic.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/cmake.bbclass  |   14 ++++++++++++--
 meta/classes/native.bbclass |    4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index a4b0c12..011c232 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -24,15 +24,18 @@ OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${TARGET_CPPFLAGS} -f
 OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
 OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
 
+OECMAKE_RPATH ?= ""
+
 cmake_do_generate_toolchain_file() {
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
 set( CMAKE_SYSTEM_NAME `echo ${SDK_OS} | sed 's/^./\u&/'` )
+set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
-set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "poky CFLAGS" )
-set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "poky CXXFLAGS" )
+set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
+set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
 set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "CFLAGS for release" )
 set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLAGS for release" )
 
@@ -43,6 +46,13 @@ set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
 
+# Use qt.conf settings
+set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
+
+# We need to set the rpath to the correct directory as cmake does not provide any
+# directory as rpath by default
+set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
+
 # Use native cmake modules
 set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
 EOF
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index d9e67f6..e06f02a 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -11,6 +11,10 @@ PACKAGES_DYNAMIC = ""
 PACKAGES_DYNAMIC_virtclass-native = ""
 PACKAGE_ARCH = "${BUILD_ARCH}"
 
+# used by cmake class
+OECMAKE_RPATH = "${libdir}"
+OECMAKE_RPATH_virtclass-native = "${libdir}"
+
 BASE_PACKAGE_ARCH = "${BUILD_ARCH}"
 BASEPKG_HOST_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
 BASEPKG_TARGET_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
-- 
1.7.2.5




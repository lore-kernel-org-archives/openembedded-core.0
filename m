Return-Path: <dev@codyps.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD4965D00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 19:29:50 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id z67so13155880itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 May 2017 12:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=aacg7sYLlz1qvFlC0Xb8N0TZKfy9MGAQDOKwWzHg4zo=;
	b=OyASxUoiad77zP9GBNID1dxnZN3kixvsGFMzcAR0loyATmdcqu8+/3/4Y1dA+xlBup
	d7aRIZResBvPSXUYxCErIOfPUn+tzieqHd1YKdtMmLow+Ix3jogp7auZgOmfe0uAYp9q
	Hm006XtJEKBLf0Q1Ugajoa+HFp+3zOg+YpzwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aacg7sYLlz1qvFlC0Xb8N0TZKfy9MGAQDOKwWzHg4zo=;
	b=cOZgfyMKll3308YGN6NMEj+ONLIi1uTv67uM2MNRALYXpPGsslmjTmXsNeVZdWRonQ
	GyxyFvb8VF8WcDlJ/rzOJNoRxr3AAaeKOm57/aZJAflUjw+nAkCr987xm+f5a1IxUz9t
	SXY2Xk0U+co+VXwRFefbWwlmctjEQ13FSxgr1sNKTM6pqeUXgNj0I0PVEmSNevZieche
	wxLSJdoVCnrWMP/uMCcTqXmRnZ0nBnMnxB5U0rgJsD6/l8WUIk7Q0YyoR4RfqHgQ4cIS
	U4Nkl9iZ9GWe+zYro+e9vXnDMjsZey8k+odR2UZl5cen79wrPiyHBpbiRNaOrRFLgbA1
	GeCQ==
X-Gm-Message-State: AN3rC/7ZEu+fX+/+w+FJzIFVyH3n1B9KGn2zG/vReB9Hn0k5AiM/g4ST
	MWJsmD90kVFELQ==
X-Received: by 10.36.107.201 with SMTP id v192mr152853itc.3.1493666991528;
	Mon, 01 May 2017 12:29:51 -0700 (PDT)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52])
	by smtp.gmail.com with ESMTPSA id n85sm6874515ioi.6.2017.05.01.12.29.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 May 2017 12:29:51 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 15:29:39 -0400
Message-Id: <20170501192939.18046-1-dev@codyps.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] cmake: in SDK use OE env var to set default toolchain
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
X-List-Received-Date: Mon, 01 May 2017 19:29:51 -0000

Patch the location in cmake where the toolchain file is loaded
to use the (new) OE_CMAKE_TOOLCHAIN_FILE variable to select a default
toolchain if no toolchain has been specified. The cmake alias is
removed.

The alternatives:

 - shell alias fails when cmake is called indirectly (ex: a makefile
   managing several projects which calls cmake for some of them)
   because aliases are not inherited

 - wrapper script that unconditionally adds "-D..." breaks cmake's
   build tests and many other things as it causes cmake to believe it
   should be configuring things when it should not be. For example,
   `cmake -DCMAKE_TOOLCHAIN_FILE=... --build .` does not work (note
   that this also breaks people directly using `cmake --build .` with
   the current alias).

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 ...ineSystem-use-oe-environment-vars-to-load.patch | 45 ++++++++++++++++++++++
 .../cmake/cmake/environment.d-cmake.sh             |  2 +-
 meta/recipes-devtools/cmake/cmake_3.7.2.bb         |  4 +-
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch

diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
new file mode 100644
index 0000000000..a2332879cf
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -0,0 +1,45 @@
+From a42cfebcd6c684cccf8ad33e5bd5130f7cdba135 Mon Sep 17 00:00:00 2001
+From: Cody P Schafer <dev@codyps.com>
+Date: Thu, 27 Apr 2017 11:35:05 -0400
+Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
+ toolchain file in sdk
+
+Passing the toolchain by:
+
+ - shell aliases does not work if cmake is called by a script
+ - unconditionally by a wrapper script causes cmake to believe it is
+   configuring things when it is not (for example, `cmake --build` breaks).
+
+The OE_CMAKE_TOOLCHAIN_FILE variable is only used as a default if no
+toolchain is explicitly specified.
+
+Setting the CMAKE_TOOLCHAIN_FILE cmake variable is marked as cached
+because '-D' options are cache entries themselves.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Cody P Schafer <dev@codyps.com>
+---
+ Modules/CMakeDetermineSystem.cmake | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
+index f34ec5d61..bcac3ef16 100644
+--- a/Modules/CMakeDetermineSystem.cmake
++++ b/Modules/CMakeDetermineSystem.cmake
+@@ -74,6 +74,13 @@ else()
+   endif()
+ endif()
+ 
++if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
++  if(DEFINED ENV{OE_CMAKE_TOOLCHAIN_FILE})
++    set(CMAKE_TOOLCHAIN_FILE "$ENV{OE_CMAKE_TOOLCHAIN_FILE}" CACHE FILEPATH "toolchain file")
++    message(STATUS "Toolchain file defaulted to '${CMAKE_TOOLCHAIN_FILE}'")
++  endif()
++endif()
++
+ # if a toolchain file is used, the user wants to cross compile.
+ # in this case read the toolchain file and keep the CMAKE_HOST_SYSTEM_*
+ # variables around so they can be used in CMakeLists.txt.
+-- 
+2.12.2
+
diff --git a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
index 0eb56b66fa..64b6cf3c6a 100644
--- a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
+++ b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
@@ -1 +1 @@
-alias cmake="cmake -DCMAKE_TOOLCHAIN_FILE=$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
+export OE_CMAKE_TOOLCHAIN_FILE="$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
diff --git a/meta/recipes-devtools/cmake/cmake_3.7.2.bb b/meta/recipes-devtools/cmake/cmake_3.7.2.bb
index f566a48cfb..1cb99869e6 100644
--- a/meta/recipes-devtools/cmake/cmake_3.7.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.7.2.bb
@@ -6,7 +6,9 @@ DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
 SRC_URI_append_class-nativesdk = " \
     file://OEToolchainConfig.cmake \
-    file://environment.d-cmake.sh"
+    file://environment.d-cmake.sh \
+    file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
+"
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
2.12.2



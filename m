Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A655C433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 02:46:27 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.2628.1648694786684492553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 19:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VVvpvX+5;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: workjagadeesh@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id bo5so1160337pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 19:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=1QItTibowrmHbcpICvLI5ED0DdUd9hKJXIqg4sPZfXE=;
        b=VVvpvX+5KHuYc14hRmLyq6xBM98GQTrAcSwOavLZ/KhGllHV4dmQNctVhMU3uv3iTw
         a6eOzKfKlIABpDvOOij0ooqjGDrvr9EppV7Amnh1gUtYuMZxJ2FD0p75NNB6vVuCYgAt
         aZTiXwRkuu02rQCoUG2jEuq/ND0i7Z2dcY923xigVQ2wBFfmoDzE1cRDVNACStcQarVx
         q+HvIFL31EXr5Fo/4Wh8eTWiLGBJJ3mscV6I4i37OCu5hseyUMaYnJYmS/8eYBkfKIny
         xAcdtONMfBgAYkuQ1n0AR+LQRPsMtgXn3fXNNY8vr/5EkU3FyhjT8A6/aZxwXOHtoQ3L
         +RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1QItTibowrmHbcpICvLI5ED0DdUd9hKJXIqg4sPZfXE=;
        b=1BHlzIKeQaS6rIAdBgG3P75/pPonX3oCJ04KIkjZZgwCTC7A9WRsncPAGjipSDWc7f
         52IKf3K57ggU2xlYddZO+6WtlEO1BAh4/uNm1BB3FpCGW8hSLT/F4Sw1rHfhh6RMXCRr
         9XssV4zhiMr/aNviWVziZ3nklE1lD3dB8DrkBU6F3EglOAoYRMIVVSADeLC/i9IiI833
         Urp9uLlxSuNtjZLHbasqcUReO7RucK7SbDOugSanBA6piYGGhuirGw95o1K2WDPYkeh1
         REmevlW8vF/OdDPnCOjjtKlhbGIzN4v8EDTcXPHM7FjyxobWSXyqKbUC3/0VYzey3zoE
         0UaA==
X-Gm-Message-State: AOAM531eeHUqU7OYb9soJ0q6TCIvrYULXsTpOcSuyZIuCbVMBibPjQqF
	FJTOApHk5jopVPqVws96vt3B1YSz6BAIZXH0RDQ=
X-Google-Smtp-Source: 
 ABdhPJwgEKU5bCiOJqAJGjLH/wchQInm4+AtsyJwtqZhn7kdHVLVwJMvEzZ636wsHFC54depI0w1yA==
X-Received: by 2002:a63:3489:0:b0:398:7008:bb25 with SMTP id
 b131-20020a633489000000b003987008bb25mr8724081pga.242.1648694785949;
        Wed, 30 Mar 2022 19:46:25 -0700 (PDT)
Received: from localhost.localdomain ([157.45.97.199])
        by smtp.gmail.com with ESMTPSA id
 a32-20020a631a20000000b003756899829csm20280895pga.58.2022.03.30.19.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 19:46:25 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH] cmake: support to create per-toolchain cmake file in
 SDK
Date: Thu, 31 Mar 2022 02:46:45 +0000
Message-Id: <20220331024645.655-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 02:46:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163800

The patch creates ${MULTIMACH_TARGET_SYS}-toolchain.cmake file
at ${SDK_INSTALL_DIR}/sysroots/${SDK_SYS}/usr/share/cmake/, which is
per-toolchain CMake toolchain file containing arch-specific values
and independent of OE environment variables.
The file gets created after installing SDK toolchain installer
ined by running "bitbake -c populate_sdk <image>".

The changes are similar to meson-setup.py which is used to
create arch-specific
${SDK_INSTALL_DIR}/sysroots/${SDK_SYS}/usr/share/meson/*-meson.cross

[YOCTO #14644]

Tested-by: Jan Dorniak <jaskij@gmail.com>
Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 meta/classes/toolchain-scripts.bbclass        |  1 +
 .../cmake/SDKToolchainConfig.cmake.template   | 31 +++++++++++++++++
 .../cmake/cmake/cmake-setup.py                | 33 +++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.22.3.bb   |  7 ++++
 4 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template
 create mode 100755 meta/recipes-devtools/cmake/cmake/cmake-setup.py

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 8f914cce27..1d7c703748 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -109,6 +109,7 @@ toolchain_shared_env_script () {
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export ARCH=${ARCH}' >> $script
 	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
+	echo 'export OECORE_TUNE_CCARGS="${TUNE_CCARGS}"' >> $script
 
     cat >> $script <<EOF
 
diff --git a/meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template b/meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template
new file mode 100644
index 0000000000..c69569a843
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template
@@ -0,0 +1,31 @@
+set(SDK_INSTALL_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../../..")
+set(HOST_SYSROOT    "${SDK_INSTALL_DIR}/sysroots/@OECORE_SDK_SYS")
+set(TARGET_SYSROOT  "${SDK_INSTALL_DIR}/sysroots/@OECORE_TARGET_SYS")
+set(HOST_BIN        "${HOST_SYSROOT}/usr/bin")
+set(TOOLCHAIN_NAME  "@OECORE_TARGET_ALIAS")
+set(GCC_DIR         "${HOST_BIN}/${TOOLCHAIN_NAME}")
+
+set(CMAKE_SYSTEM_NAME       Linux)
+set(CMAKE_SYSTEM_PROCESSOR "@OECORE_TARGET_ARCH")
+
+set(CMAKE_C_COMPILER    "${GCC_DIR}/${TOOLCHAIN_NAME}-gcc")
+set(CMAKE_CXX_COMPILER  "${GCC_DIR}/${TOOLCHAIN_NAME}-g++")
+
+set(ARCH_FLAGS          "@OECORE_TUNE_CCARGS")
+set(CMAKE_C_FLAGS       "${ARCH_FLAGS}" CACHE STRING "" FORCE )
+set(CMAKE_CXX_FLAGS     "${ARCH_FLAGS}" CACHE STRING "" FORCE )
+set(CMAKE_ASM_FLAGS     ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
+set(CMAKE_LDFLAGS_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
+
+set(CMAKE_SYSROOT "${TARGET_SYSROOT}")
+
+set(CMAKE_FIND_ROOT_PATH "${TARGET_SYSROOT}" )
+
+set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
+set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
+set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
+set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
+
+set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "")
+
+set(CMAKE_PROGRAM_PATH "${HOST_SYSROOT}/usr/bin" CACHE STRING "" FORCE)
diff --git a/meta/recipes-devtools/cmake/cmake/cmake-setup.py b/meta/recipes-devtools/cmake/cmake/cmake-setup.py
new file mode 100755
index 0000000000..af587a44cc
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/cmake-setup.py
@@ -0,0 +1,33 @@
+#!/usr/bin/env python3
+
+import os
+import string
+import sys
+
+class Template(string.Template):
+    delimiter = "@"
+
+class Environ():
+    def __getitem__(self, name):
+        if name == "OECORE_SDK_SYS":
+            return  os.path.basename(os.environ["OECORE_NATIVE_SYSROOT"])
+        elif name == "OECORE_TARGET_SYS":
+            return  os.path.basename(os.environ["OECORE_TARGET_SYSROOT"])
+        elif name == "OECORE_TARGET_ALIAS":
+            return  os.path.basename(os.environ["TARGET_PREFIX"].strip("-"))
+        else:
+            return  os.environ[name]
+
+try:
+    sysroot = os.environ['OECORE_NATIVE_SYSROOT']
+except KeyError:
+    print("Not in environment setup, bailing")
+    sys.exit(1)
+
+template_file = os.path.join(sysroot, 'usr/share/cmake/SDKToolchainConfig.cmake.template')
+cross_file = os.path.join(sysroot, 'usr/share/cmake/%s-toolchain.cmake' % (os.path.basename(os.environ["OECORE_TARGET_SYSROOT"])))
+with open(template_file) as in_file:
+    template = in_file.read()
+    output = Template(template).substitute(Environ())
+    with open(cross_file, "w") as out_file:
+        out_file.write(output)
diff --git a/meta/recipes-devtools/cmake/cmake_3.22.3.bb b/meta/recipes-devtools/cmake/cmake_3.22.3.bb
index 36c6357dd8..e111dd3c5a 100644
--- a/meta/recipes-devtools/cmake/cmake_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.22.3.bb
@@ -6,6 +6,8 @@ DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
 SRC_URI:append:class-nativesdk = " \
     file://OEToolchainConfig.cmake \
+    file://SDKToolchainConfig.cmake.template \
+    file://cmake-setup.py \
     file://environment.d-cmake.sh \
     file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
 "
@@ -42,6 +44,11 @@ do_install:append:class-nativesdk() {
 
     mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
     install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE}/environment-setup.d/cmake.sh
+
+    # install cmake-setup.py to create arch-specific toolchain cmake file from template
+    install -m 0644 ${WORKDIR}/SDKToolchainConfig.cmake.template ${D}${datadir}/cmake/
+    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
+    install -m 0755 ${WORKDIR}/cmake-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
 }
 
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}"
-- 
2.17.1



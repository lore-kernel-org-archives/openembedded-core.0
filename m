Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D2B5A7462B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 16:34:09 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id i6so4259922pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Q5qhMGoW1glKbasLq1AhUr73a+7/7c5aoXIH36hzKA=;
	b=EvmdNSR6ULNIsZYuJrBM8Tb4IlXihEvfIGYWYTVhPFh3oKIT96CKFT2D4dQRb+4qFQ
	2To9wi39z8uxClTWF+Evx4N9NbJprib5Eogz0C931I48sPO5jxfAuafRgOcqDAAn674i
	qGBiKrtzXCP6cTDAM6uAVlnmqYzXR0GfUn5fA9uq16lq+5zVV9Zdzs9RDOXWyS+ZEqeV
	yujg7reXMENo5ji2U2Gfct8xQwo/gUWvCo8Abk63fKLd68gyMiAwv+FEaHYt9g3nHTyu
	ruJVfc26RYqMtLTJChQWtEMdLH2BLSbZCcUGI25U2bRTcSuLZOkckK0aXRGD7SfM48r1
	du3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9Q5qhMGoW1glKbasLq1AhUr73a+7/7c5aoXIH36hzKA=;
	b=RE+Wf17DgPZMjMsc5NJK/FezO80wBBD9sI/gx2KNVu3oEi1TgOjTkZ1ivDG0eWDZPC
	jOFc6uHOAgKISDu/qn7NJu3C5W1jXE6QTe6ZWUMSjxgztpaJX3eG02q78XSAD09yDJdw
	uy3FmHoeLNGAaS7ysKAbRQDHuqKghjatt8cxCUo3B3hxyIY5976ldvtJol8FYoh2RWGd
	QW8SLKEnIXdY6ob07akUkxTPtak0fI3sUkNuYkYNntpHwYXVIvExGBFq8/ap/Kx9Ey3+
	LNttgcsA12QcskDDhQFqXudtMk2u1b5cbyEv3+h9M8CRGEc97Fj5sqRSMUFWRSEt7B23
	/ImA==
X-Gm-Message-State: ALQs6tBa5StQRbhoMia+yqp579jUV8mH5SY2fes5kaKF9MdiLNisJFHQ
	HpEjh3sFgZMgOHa3jdEMuMaFgQ==
X-Google-Smtp-Source: AIpwx48ItMMoPStF5UgzPSYUjgLgjjPi4UulqpWKn11RUAsg3W1xC3GcZ7GeCFM/WUUg2mFPyYzM8Q==
X-Received: by 10.167.132.207 with SMTP id x15mr804278pfn.46.1524242050629;
	Fri, 20 Apr 2018 09:34:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	204sm13450925pgf.61.2018.04.20.09.34.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Apr 2018 09:34:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 09:33:54 -0700
Message-Id: <20180420163354.12065-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180420163354.12065-1-raj.khem@gmail.com>
References: <20180420163354.12065-1-raj.khem@gmail.com>
Subject: [PATCH 6/6] llvm: Fix [compile-host-path] QA issue
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
X-List-Received-Date: Fri, 20 Apr 2018 16:34:10 -0000

Its trying to build NATIVE llvm-config which is
already built with llvm-native so we do not need
to rebuild it

Drop setting NINJA_STATUS explicitly, its no longer
needed, on the contrary it hinders the task status
update

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Rebased

 ...able-generating-a-native-llvm-config.patch | 41 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |  7 ++--
 2 files changed, 45 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-Disable-generating-a-native-llvm-config.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0001-Disable-generating-a-native-llvm-config.patch b/meta/recipes-devtools/llvm/llvm/0001-Disable-generating-a-native-llvm-config.patch
new file mode 100644
index 0000000000..2809e4c594
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-Disable-generating-a-native-llvm-config.patch
@@ -0,0 +1,41 @@
+From 7f7743ce233fcd735ec580c75270413493658aa6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Apr 2018 18:08:31 -0700
+Subject: [PATCH] Disable generating a native llvm-config
+
+OpenEmbedded already builds this as part of llvm-native
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/llvm-config/CMakeLists.txt | 16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/tools/llvm-config/CMakeLists.txt b/tools/llvm-config/CMakeLists.txt
+index 25f99cec978..c45e9b642a8 100644
+--- a/tools/llvm-config/CMakeLists.txt
++++ b/tools/llvm-config/CMakeLists.txt
+@@ -63,19 +63,3 @@ endif()
+ 
+ # Add the dependency on the generation step.
+ add_file_dependencies(${CMAKE_CURRENT_SOURCE_DIR}/llvm-config.cpp ${BUILDVARIABLES_OBJPATH})
+-
+-if(CMAKE_CROSSCOMPILING)
+-  set(${project}_LLVM_CONFIG_EXE "${LLVM_NATIVE_BUILD}/bin/llvm-config")
+-  set(${project}_LLVM_CONFIG_EXE ${${project}_LLVM_CONFIG_EXE} PARENT_SCOPE)
+-
+-  add_custom_command(OUTPUT "${${project}_LLVM_CONFIG_EXE}"
+-    COMMAND ${CMAKE_COMMAND} --build . --target llvm-config --config $<CONFIGURATION>
+-    DEPENDS ${LLVM_NATIVE_BUILD}/CMakeCache.txt
+-    WORKING_DIRECTORY ${LLVM_NATIVE_BUILD}
+-    COMMENT "Building native llvm-config..."
+-    USES_TERMINAL)
+-  add_custom_target(${project}NativeLLVMConfig DEPENDS ${${project}_LLVM_CONFIG_EXE})
+-  add_dependencies(${project}NativeLLVMConfig CONFIGURE_LLVM_NATIVE)
+-
+-  add_dependencies(llvm-config ${project}NativeLLVMConfig)
+-endif(CMAKE_CROSSCOMPILING)
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 77c095d9a3..cb3bba6fab 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -26,6 +26,7 @@ PATCH_VERSION = "0"
 SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH};protocol=http \
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
+           file://0001-Disable-generating-a-native-llvm-config.patch \
           "
 UPSTREAM_CHECK_COMMITS = "1"
 S = "${WORKDIR}/git"
@@ -85,15 +86,15 @@ do_configure_prepend() {
 }
 
 do_compile() {
-	NINJA_STATUS="[%p] " ninja -v ${PARALLEL_MAKE}
+	ninja -v ${PARALLEL_MAKE}
 }
 
 do_compile_class-native() {
-	NINJA_STATUS="[%p] " ninja -v ${PARALLEL_MAKE} llvm-config llvm-tblgen
+	ninja -v ${PARALLEL_MAKE} llvm-config llvm-tblgen
 }
 
 do_install() {
-	NINJA_STATUS="[%p] " DESTDIR=${LLVM_INSTALL_DIR} ninja -v install
+	DESTDIR=${LLVM_INSTALL_DIR} ninja -v install
 	install -D -m 0755 ${B}/bin/llvm-config ${D}${libdir}/${LLVM_DIR}/llvm-config
 
 	install -d ${D}${bindir}/${LLVM_DIR}
-- 
2.17.0



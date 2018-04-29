Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id EB802744DA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:22 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i194-v6so4927792pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nAYdMu5LfR9o8kygTwAPuW4irLns4fhZSo0gUVaY5+0=;
	b=Prnli7eOdKvVJeg/RzM7+xAqpL/jOfp7c4YNdbxxTyiHxBZkOfjWi5ZW4edmPtcrbC
	kKEW6fTFQXX8RMz3Xjy4TLzjmrfbOOD23o1yOQYo8dyaCB8AXaWdT29m8BaTMo36LqHd
	FEUdbQAQy8J6pUeYLxw+q7MetJkjmjUqr6ZGAsAcdxswrAvOOuBnHr080D7scv6JrHgw
	EfC0w910Sl9nnL4AU9ULbgs0GdtDqKIe5yXrVu3NZbH0EtbDeBkr9Jd9TvYlknK6nXHC
	yXzzvweEkJxGE1uCdjenHY/4FRETwqDG58tlTGKQI7m1NKM9NiHjE/z7B//DiWNgHe9r
	q9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nAYdMu5LfR9o8kygTwAPuW4irLns4fhZSo0gUVaY5+0=;
	b=Sv4egyhutb0qY1ZWKyHeEfidAB3tAtBAYiThl3AqlPtqgtKcoWSCLCypexUDUyc32t
	eMIjCdbrQWh7QEGkdoqVZ4zGho1SNPnY1Hc3VWMhAoLlCPQIM2+WdkmweXvXpHOIEk3G
	yDmGKmK0xEo1r3rEQYXb4klEITGkbqwzJjvnCh+lkymYYG0SJ4UAxc3UnsgG6lDpMdho
	3HSB93rwNBIvr8cKiLd6kVddnhYrzdFtCJ+NXi+31j8P+jkNF25690L4ipaQDO5j/yNL
	PiyCR74Bi5Q6lUWRurR9HEvILGuRgVv6wbw0WzepicVlHffY6JwpcINi4sl7n+e1dtWM
	mIqQ==
X-Gm-Message-State: ALQs6tCmouHmN4EinKPKOJHxgvQcAFJsRWsXOuGko6LFMY2YjW1NMcr4
	CktSOWbIdx+fuMe4nNSs1sbR1A==
X-Google-Smtp-Source: AB8JxZrHqI6aRVebLeRInk+RvRfmAckdWFtaJDMofAierob+qI/3XvNgkrDW2uZm0s3QsnikeTkvgg==
X-Received: by 2002:a65:42c7:: with SMTP id
	l7-v6mr8270729pgp.335.1525030583612; 
	Sun, 29 Apr 2018 12:36:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:53 -0700
Message-Id: <1b3364fc5d0c8d2748eef12bf713f6cc9aeef11c.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 06/24] llvm: Fix [compile-host-path] QA issue
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:23 -0000

Its trying to build NATIVE llvm-config which is
already built with llvm-native so we do not need
to rebuild it

Drop setting NINJA_STATUS explicitly, its no longer
needed, on the contrary it hinders the task status
update

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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



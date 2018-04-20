Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 061FA74626
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 01:33:15 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id o16so3487131pfk.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nAYdMu5LfR9o8kygTwAPuW4irLns4fhZSo0gUVaY5+0=;
	b=dNG4HtfYPt8CXJW8RmBCf1rFIZ9XeojHbBDtoA/hGjIcdPfIbo6Q6D1qjtqUI+aqYj
	e9oOivd2krV5A/SavDFEPMsGxcoMwzWf8gM3qEjyEHTyhuuyB9JomWB0bjAS0ulA/ruy
	4fz6wLeMIkE6p2vNDcCC2AbNFWhKQLzk/ocQZouYoxN9Gk6GnDd7MRNARn5QM27VB6cr
	KJS3tbZ/RfSUCcIZF0ZTwt74J8PUcpkpWaD8RivFTQCz/B5ixOU8d9T15DHsgHkG6BW+
	0XR6izMs3DFPXy7sBo3cZPoQLB6v0culjRAiv3iNOvEcvMPKX2cazTQ97TcSJDuhNZUB
	kFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nAYdMu5LfR9o8kygTwAPuW4irLns4fhZSo0gUVaY5+0=;
	b=UoyHaXBBq1rHV6j9pcf1PZcr3tiUmHPT+NnK1kFic2MsF6Y+B4dAZ79P2OwNyVNCcj
	EBn1PuHB5MoDAGn0vjd9dtJnagNRFKCwDFPpyARLqAX/zcZdf4nMoUYmv2n2NvcXmuw9
	w9fs0PwLAE6MgqopXq2t92uNnVhTmIKcjLRUtmIuqUrWFIGsM+6G3WNrOwwxeUUe+yUd
	xF3eYRopl3k1iD6pgwqHTB0YF/HGJeeJBxqtDWspsNgo0kmsZL4c3HG29+/5jdnBC5ot
	Mnu7gk5vt98euODqwQeyn611xE8G2Jylr39nZHfqwfYX6mdKfyK2i44LYf+x1bsv9fNB
	Fj0w==
X-Gm-Message-State: ALQs6tAGkYz8U/0sJg/kHJ9BjIn0kLZek+TCEwU58jI4p917iL/glwbj
	GjhmMjEwcjbyVgGtRngBKmTYEA==
X-Google-Smtp-Source: AIpwx4/VbVIMJi5G5fXdqcl1+r9wr81RmoJQWcT8Hiydy2lQ7O0AQJ3PeM5mgqh3PhTr0cq3hfnwoQ==
X-Received: by 10.167.130.209 with SMTP id f17mr7754815pfn.161.1524187996447; 
	Thu, 19 Apr 2018 18:33:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	g10sm8310128pgr.69.2018.04.19.18.33.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Apr 2018 18:33:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Apr 2018 18:33:09 -0700
Message-Id: <20180420013309.19343-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [sumo][master[PATCH] llvm: Fix [compile-host-path] QA issue
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
X-List-Received-Date: Fri, 20 Apr 2018 01:33:16 -0000

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



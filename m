Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9213.1602632736320951317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pTNiybPx;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id g12so1466781wrp.10
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CliKoApzSySZSwxky5VScddvqVFC8M6dlJ7oNzjviuM=;
        b=pTNiybPxlZZLvo/sjr4pXNdTnvntcNA7Vfqgdelm5ywO5wThnRNEzGmIJVfHAX25LC
         fs8qnl45BT6Y7GkydS9EfWfW7g2ZM0lzC7iVhuaKZ9Jq3ywcoF1fMjtUO4iNb5lm9MNs
         5+TqMbdGn2ctNNo9+gY+A6euTCQD6x/v+ExhHYgaiUa+pqIoJFCvLVTs/QMbNNyMxwdo
         kDT5wtp6pb8s8I3agn5fDCUikdeP4IOLatqnpnbw/he6P13vajV1U1VpZksgDD4mI+/0
         oyXp6tiwR84ng27RPghYlXMJL3fIH5xvjufO2cXRnyyUCSaTBrQ7AMeu4Oan+G3xBbwe
         6eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CliKoApzSySZSwxky5VScddvqVFC8M6dlJ7oNzjviuM=;
        b=sZ9uiUzr8yoSPxExFfUWLkynrEFHX1UVzcqXgg14clU2KRFfOQesPzAq1Tpa+WdsMB
         G7OtOU+xHW/iOTzqfL2LU94tMOfcB+WDMNc4wTzCk7PtYa4Ji5bo71/KnapQPElTUd4O
         mjoWgw9mMwdQ4ft0BICBIk7xGheS+sD13gDAwNVpxYWukZfwb59JsFi6Xrn4/proI0Wb
         yD2jinx8/AYLj6sLel+vwMZ302FjEr7Li2uIYqn2FqtKsecpgof6Cc7oF/amhbdmbZMt
         vextf+o30D3IGpud5KNkv9CjPd0korVarQxg4/qrDMK2bhZ4xDBMwCqH0Baj+bCleEv+
         F26g==
X-Gm-Message-State: AOAM531v8/92LssHActhPFz14l8xW8YwGdvt6GeAhDhmzpslhxnDvd/x
	33x5hXSoi8K6KdXbnHv1zxMZ+aLDnGq/Ji5l
X-Google-Smtp-Source: ABdhPJy1ELgAtIRmdmcWvGhOv4Y4/OeN7D7KlmPCu1ns5txeZAexd1E1KyN+/i/Lsd+bBtKHN+PN8g==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr2228990wra.313.1602632734422;
        Tue, 13 Oct 2020 16:45:34 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id o184sm747718wmo.37.2020.10.13.16.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 16:45:33 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 1/4] spirv-tools: import from meta-oe to OE core
Date: Wed, 14 Oct 2020 00:44:49 +0100
Message-Id: <20201013234452.2294860-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This receipe is needed to build the new shaderc

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...0001-Avoid-pessimizing-std-move-3124.patch | 50 +++++++++++++++++++
 ...STALL_LIBDIR-in-installed-CMake-file.patch | 35 +++++++++++++
 meta/recipes-graphics/spir/spirv-tools_git.bb | 35 +++++++++++++
 3 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
 create mode 100644 meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
 create mode 100644 meta/recipes-graphics/spir/spirv-tools_git.bb

diff --git a/meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch b/meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
new file mode 100644
index 0000000000..9b48cdcd09
--- /dev/null
+++ b/meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
@@ -0,0 +1,50 @@
+From 4fffcd275b50d08b54b0411679ead98970651bad Mon Sep 17 00:00:00 2001
+From: David Neto <dneto@google.com>
+Date: Fri, 27 Dec 2019 12:05:58 -0500
+Subject: [PATCH] Avoid pessimizing std::move (#3124)
+
+Should fix a warning
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/commit/8aa423930db37e37086665efcc55944d577c06e5]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/opt/pass_fixture.h | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/test/opt/pass_fixture.h b/test/opt/pass_fixture.h
+index 53fb206f..64c089d8 100644
+--- a/test/opt/pass_fixture.h
++++ b/test/opt/pass_fixture.h
+@@ -60,8 +60,7 @@ class PassTest : public TestT {
+   // from pass Process() function.
+   std::tuple<std::vector<uint32_t>, Pass::Status> OptimizeToBinary(
+       Pass* pass, const std::string& original, bool skip_nop) {
+-    context_ =
+-        std::move(BuildModule(env_, consumer_, original, assemble_options_));
++    context_ = BuildModule(env_, consumer_, original, assemble_options_);
+     EXPECT_NE(nullptr, context()) << "Assembling failed for shader:\n"
+                                   << original << std::endl;
+     if (!context()) {
+@@ -197,8 +196,7 @@ class PassTest : public TestT {
+   // messages.
+   template <typename PassT, typename... Args>
+   void SinglePassRunAndFail(const std::string& original, Args&&... args) {
+-    context_ =
+-        std::move(BuildModule(env_, consumer_, original, assemble_options_));
++    context_ = BuildModule(env_, consumer_, original, assemble_options_);
+     EXPECT_NE(nullptr, context()) << "Assembling failed for shader:\n"
+                                   << original << std::endl;
+     std::ostringstream errs;
+@@ -235,8 +233,7 @@ class PassTest : public TestT {
+   void RunAndCheck(const std::string& original, const std::string& expected) {
+     assert(manager_->NumPasses());
+ 
+-    context_ =
+-        std::move(BuildModule(env_, nullptr, original, assemble_options_));
++    context_ = BuildModule(env_, nullptr, original, assemble_options_);
+     ASSERT_NE(nullptr, context());
+ 
+     context()->set_preserve_bindings(OptimizerOptions()->preserve_bindings_);
+-- 
+2.24.1
+
diff --git a/meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch b/meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
new file mode 100644
index 0000000000..5d37da8fe0
--- /dev/null
+++ b/meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
@@ -0,0 +1,35 @@
+From caf59c46ea5dc49e4dbf756c642b03e52c1b5468 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Dec 2019 07:02:24 -0800
+Subject: [PATCH] Respect CMAKE_INSTALL_LIBDIR in installed CMake files
+
+Upstream-Status: Submitted [https://github.com/google/effcee/pull/36]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt        | 1 +
+ effcee/CMakeLists.txt | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+--- a/external/effcee/CMakeLists.txt
++++ b/external/effcee/CMakeLists.txt
+@@ -27,6 +27,7 @@ endif()
+ 
+ include(cmake/setup_build.cmake)
+ include(cmake/utils.cmake)
++include(GNUInstallDirs)
+ 
+ add_subdirectory(third_party)
+ add_subdirectory(effcee)
+--- a/external/effcee/effcee/CMakeLists.txt
++++ b/external/effcee/effcee/CMakeLists.txt
+@@ -14,8 +14,8 @@ install(
+   DESTINATION
+     include/effcee)
+ install(TARGETS effcee
+-  LIBRARY DESTINATION lib
+-  ARCHIVE DESTINATION lib)
++  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ 
+ if(EFFCEE_BUILD_TESTING)
+   add_executable(effcee-test
diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes-graphics/spir/spirv-tools_git.bb
new file mode 100644
index 0000000000..8e8388e8d4
--- /dev/null
+++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
@@ -0,0 +1,35 @@
+SUMMARY  = "The SPIR-V Tools project provides an API and commands for \
+processing SPIR-V modules"
+DESCRIPTION = "The project includes an assembler, binary module parser, \
+disassembler, validator, and optimizer for SPIR-V."
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SECTION = "graphics"
+
+S = "${WORKDIR}/git"
+DEST_DIR = "${S}/external" 
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
+	git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
+	git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
+	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
+	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
+        file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch \
+        file://0001-Avoid-pessimizing-std-move-3124.patch \
+"
+SRCREV_spirv-tools = "c413b982c316b14e784f50d941814fc737b55b4a"
+SRCREV_spirv-headers = "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
+SRCREV_effcee = "cd25ec17e9382f99a895b9ef53ff3c277464d07d"
+SRCREV_re2 = "5bd613749fd530b576b890283bfb6bc6ea6246cb"
+SRCREV_googletest = "f2fb48c3b3d79a75a88a99fba6576b25d42ec528"
+
+inherit cmake python3native
+
+EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
+
+do_install_append() {
+	install -d ${D}/${includedir}/spirv
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
+}
+
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${libdir}/*.so"
-- 
2.28.0


Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF24AC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 13:00:45 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7303.1786539641357384306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 06:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=bC5Ke7k4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260812130037ba560a38f00002075b-5cgq9c@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260812130037ba560a38f00002075b
        for <openembedded-core@lists.openembedded.org>;
        Wed, 12 Aug 2026 15:00:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=dbBGkvUGR1uz242SJt+ZP+QWe+ScMJ/QPgtYTDFzXR8=;
 b=bC5Ke7k4Yn8JcjlcnTL8QOMw84I1A/hZaYO76Yj6em11WzcosjaXZRKBlx+ociEhpSF3rm
 c7U2dJYDn2bK6P7LqNcALwYy2r5koWFO61Ga/phLuM2BACGkMqhwLfUjRbZtIDjUgxZ8QBxY
 w2hBylUGHzY6gSz8hMaqbQN22WP0vRkoCAZO13LJQu/vIuMSD5iHSnOsuAcqROX8HZpI4HWV
 lrNgecwItc3mSXqcwo9nja6MgI6T0Pbr95ivBY/9jsOAkD2T2Fm7l1ljvC4edtiePebR0+J3
 57oBHjNpuGG24yZrQGkR21KtQgHlUWkGx2cVpq+V74QjgcB/4pLuPELQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] toolchain/clang: prepend target host-sys to HOST_CC_ARCH
Date: Wed, 12 Aug 2026 14:59:54 +0200
Message-ID: <20260812125954.688985-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 13:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243286

From: Peter Marko <peter.marko@siemens.com>

This assignment was present in scarthgap meta-clang.
* commit adding it: [1]
* commit removing it from native case: [2]
* it was removed completely when migrating clang to oe-core

After migration from scarthgap to wrynose (or current master), clang
extra tools like clang-tidy do not work anymore.

Test recipe used for fix validation:

test-recipe.bb:
  SUMMARY = "clang-tidy demonstration program"
  SECTION = "examples"
  HOMEPAGE = "n/a"
  LICENSE = "GPL-2.0-only"
  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
  SRC_URI = "file://CMakeLists.txt file://hello-world.cpp"
  S = "${UNPACKDIR}"
  TOOLCHAIN = "clang"
  inherit cmake

CMakeLists.txt
  project(hello-world)
  cmake_minimum_required(VERSION 3.5)
  find_program(CLANG_TIDY NAMES clang-tidy)
  set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY}" "--checks=*")
  add_executable(${PROJECT_NAME} hello-world.cpp)

hello-world.cpp
  #include <iostream>
  int main() {
    std::cout << "Hello World!";
    return 0;
  }

I have asked AI agent to analyze clang sources for side-effects which
are mentioned in patch removing this with following result:

When a cmake recipe uses CMAKE_CXX_CLANG_TIDY (or runs clang-tidy in any
mode that passes the compile command via -- on the command line), CMake
invokes clang-tidy through its __run_co_compile path. This path
constructs a FixedCompilationDatabase from the arguments following --.
Inside FixedCompilationDatabase::loadFromCommandLine() the original
cross-compiler binary name (e.g. x86_64-poky-linux-clang++) is stripped
by stripPositionalArgs() and replaced with a dummy argv[0]. As a result
the target triple encoded in the cross-compiler name is never seen by
clang-tidy.

JSONCompilationDatabase (used when clang-tidy is run with -p <build_dir>)
wraps its commands with inferTargetAndDriverMode(), which calls
addTargetAndModeForProgramName() and would correctly inject
--target=x86_64-poky-linux. FixedCompilationDatabase has no equivalent
step, so the native clang-tidy falls back to the build-host default
triple and cannot locate C++ headers under the target sysroot:

  hello-world.cpp:1:10: error: 'iostream' file not found

The fix is to make the -target flag explicit in the compile commands.
The cross-compiler already has LLVM_DEFAULT_TARGET_TRIPLE compiled in as
HOST_SYS, so adding -target ${HOST_SYS} to HOST_CC_ARCH is a no-op for
the compiler itself. For clang-tidy and other Clang-based tools that
parse compile commands but do not inherit the binary's baked-in default
triple the flag is the only reliable channel to communicate the intended
target.

On a typical GNU/Linux host the GCC runtime is installed under a
vendor-qualified tuple (e.g. aarch64-linux-gnu/) that clang probes at
runtime. Providing an explicit -target aarch64-linux overrides that
probe and prevents clang-native from finding libgcc and crt objects,
which was the original motivation for removing the assignment.

[1] https://github.com/kraj/meta-clang/commit/503aa977b27be0506fb6ac21fbf9e8b049b82247
[2] https://github.com/kraj/meta-clang/commit/6da0abaa33b458a37b97f42e3755245e3220bf27

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/toolchain/clang.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index 9a3cd0e584..862ecb5e10 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -34,6 +34,9 @@ LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-
 LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
 LDFLAGS:append:class-cross-canadian = " -Wl,-dynamic-linker,${base_libdir}/placeholder/to/be/rewritten/by/sdk/installer"
 
+# helps extra tools like clang-tidy to find arch-specific macros and headers in a cross compile environment
+HOST_CC_ARCH:prepend = "-target ${HOST_SYS} "
+
 # do_populate_sysroot needs STRIP, do_package_qa needs OBJDUMP
 POPULATESYSROOTDEPS:append:class-target = " llvm-native:do_populate_sysroot"
 


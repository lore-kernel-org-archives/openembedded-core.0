Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA90C5DF86
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 20:11:53 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2600.1787256703531691549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 13:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=f5NLfXLX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202608202011407a021cce9f00020786-fehobp@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202608202011407a021cce9f00020786
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 22:11:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=lyLPI8Rd6pNHkh/4vcpUjYTY8q8rMj1jV+aUKtCP8IU=;
 b=f5NLfXLXKTk2rTy8UgZSd1v9YbQYjGi3UDHYWwf6mYLUfbqBy9eTfLSmlV4Cnyd62z0j1r
 IXpTx1K034wjWxvCv19X93CgMe8t/tWuPVXUnmJBtvt3bEDdf3XUE42UnYCfKNV1v2bTddIx
 i5Ld8bEcrFbN3l+Y/5VenCRsXMuo8cxW8/k9HREiV1E2NL87M+QAaAT23L79zckwoXCf3oaO
 bAkeSAlr03jJfhhS6JYcFcO0y8S0lbE+KV/HygW5/DhKxl8f5umhKffngC1S1gcMNOj8WBfx
 yRQZjmKrqJk5Z3ByGtwOp1a1qaxRMVOr5fw2YQYrKDy9130LcfTVwGeg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2] toolchain/clang: prepend target host-sys to HOST_CC_ARCH
Date: Thu, 20 Aug 2026 22:11:20 +0200
Message-ID: <20260820201120.293849-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 20:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243883

From: Peter Marko <peter.marko@siemens.com>

This assignment was present in scarthgap meta-clang.
* commit adding it: [1]
* commit removing it from native case: [2]
* it was removed completely when migrating clang to oe-core

After migration from scarthgap to wrynose (or current master), clang
extra tools like clang-tidy do not work anymore.

This restores the state before migration from meta-clang to oe-core.

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

[1] https://github.com/kraj/meta-clang/commit/503aa977b27be0506fb6ac21fbf9e8b049b82247
[2] https://github.com/kraj/meta-clang/commit/6da0abaa33b458a37b97f42e3755245e3220bf27

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2:
* removed native variant, which will make it equivalent to pre-move mota-clang
* remove unuseful AI explanation from commit message

 meta/classes/toolchain/clang.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index 9a3cd0e584..f6b554d210 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -34,6 +34,10 @@ LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-
 LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
 LDFLAGS:append:class-cross-canadian = " -Wl,-dynamic-linker,${base_libdir}/placeholder/to/be/rewritten/by/sdk/installer"
 
+# helps extra tools like clang-tidy to find arch-specific macros and headers in a cross compile environment
+HOST_CC_ARCH:prepend:class-target = "-target ${HOST_SYS} "
+HOST_CC_ARCH:prepend:class-nativesdk = "-target ${HOST_SYS} "
+
 # do_populate_sysroot needs STRIP, do_package_qa needs OBJDUMP
 POPULATESYSROOTDEPS:append:class-target = " llvm-native:do_populate_sysroot"
 


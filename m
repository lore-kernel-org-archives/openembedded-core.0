Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63411D2B92F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:05:29 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web11.18682.1730815527275632288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=jxAynTeK;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=03293566b=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1730815527; x=1762351527;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cAecWUb7cIMNeltEDkmGVm52F7+S240N6KZSJORV+LU=;
  b=jxAynTeKmdU2bfJvr6qzk5CU/HXtSfmkQ0TEJQ3tHSBGj5VcWhh2kU8k
   Z8xAkN0ESERiyTn/WlTpLcTqmjDnHJQYqL7o9O8qYjfcG1DjT8ntuBuQH
   SBYiuLUM/w0CD2e20Voy7EdogetWSn5GeT1Qz+UZG2Gfk5JVX52Fj5trp
   k=;
X-CSE-ConnectionGUID: lwx3mA7lRbOxbtx1zhSuzw==
X-CSE-MsgGUID: Y7FPEvhMQjiDS9n6I4nApw==
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 05 Nov 2024 15:05:24 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw5.muc with ESMTP/TLS;
 05 Nov 2024 15:05:13 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb6.muc with ESMTP/TLS; 05 Nov 2024 15:05:13 +0100
Received: from localhost.localdomain (10.30.85.201) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Tue, 5 Nov 2024 15:05:12 +0100
X-CSE-ConnectionGUID: +4kyoIxaTbW+t7IWFDPUAA==
X-CSE-MsgGUID: /ehce7s+T86D96VMYbP/FQ==
X-CSE-ConnectionGUID: X/sGWz2dQxaMaLC5o5RzIw==
X-CSE-MsgGUID: yLWkhkhqTwq8IuPNDdrCFA==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH] cmake: Fix sporadic issues when determining compiler internals
Date: Tue, 5 Nov 2024 15:01:07 +0100
Message-ID: <20241105140107.1904114-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp09b.europe.bmw.corp (2a03:1e80:a15:58f::203f) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 14:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206714

When `-pipe` is enabled, GCC passes data between its different
executables using pipes instead of temporary files. This leads to issues
when cmake attempts to infer compiler internals via the `-v` parameter
as each executable will print to `stderr` in parallel.

In turn this may lead to compilation issues down the line as for example
the system include directories could not be determined properly which
may then propagate to issues such as:

    recipe-sysroot/usr/include/c++/11.3.0/cstdlib:75:15: fatal error:
        stdlib.h: No such file or directory
    |    75 | #include_next <stdlib.h>
    |       |               ^~~~~~~~~~
    | compilation terminated.
    | ninja: build stopped: subcommand failed.
    | WARNING: exit code 1 from a shell command.

Fix this stripping `-pipe` from the command line used to determine
compiler internals.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/recipes-devtools/cmake/cmake.inc         |  3 +-
 ...mpilerABI-Strip-pipe-from-compile-fl.patch | 63 +++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 41f169e14c5..1f1d63cad6d 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,7 +17,8 @@ LIC_FILES_CHKSUM = "file://Copyright.txt;md5=718f05155941b33862726348d3cd46ce \
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
-"
+           file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
+           "
 
 SRC_URI[sha256sum] = "9f55e1a40508f2f29b7e065fa08c29f82c402fa0402da839fffe64a25755a86d"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
new file mode 100644
index 00000000000..47373c194e0
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -0,0 +1,63 @@
+From 7fa115171a658d5358e15dcb40b233d049acae2f Mon Sep 17 00:00:00 2001
+From: Philip Lorenz <philip.lorenz@bmw.de>
+Date: Mon, 3 Jun 2024 13:19:24 +0200
+Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
+
+When `-pipe` is enabled, GCC passes data between its different
+executables using pipes instead of temporary files. This leads to issues
+when cmake attempts to infer compiler internals via the `-v` parameter
+as each executable will print to `stderr` in parallel.
+
+For example we have observed the following outputs in our builds which
+sporadically lead to build failures as system include directories were
+not detected reliably:
+
+Parsed CXX implicit include dir info from above output: rv=done
+  found start of include info
+  found start of implicit include info
+    add: [.../usr/bin/x86_64-poky-linux/../../lib/x86_64-poky-linux/gcc/x86_64-poky-linux/11.4.0/include]
+    add: [.../usr/bin/x86_64-poky-linux/../../lib/x86_64-poky-linux/gcc/x86_64-poky-linux/11.4.0/include-fixed]
+    add: [.../usr/include/c++/11.4.0]
+    add: [.../usr/include/c++/11.4.0/x86_64-poky-linux]
+    add: [.../usr/include/c++/11.4.0/backward]
+    add: [.../usr/lib/x86_64-poky-linux/11.4.0/include]
+    add: [...GNU assembler version 2.38 (x86_64-poky-linux) using BFD version (GNU Binutils) 2.38.20220708]
+    add: [/usr/include]
+  end of search list found
+
+Fix this issue by stripping the `-pipe` parameter from the compilation
+flag when determining the toolchain configuration.
+
+Upstream-Status: Backport [3.32.0, 71be059f3f32b6791427893a48ba4815a19e2e78]
+Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
+---
+ Modules/CMakeDetermineCompilerABI.cmake | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Modules/CMakeDetermineCompilerABI.cmake b/Modules/CMakeDetermineCompilerABI.cmake
+index 4a75e25a92..806f0b715d 100644
+--- a/Modules/CMakeDetermineCompilerABI.cmake
++++ b/Modules/CMakeDetermineCompilerABI.cmake
+@@ -52,14 +52,21 @@ function(CMAKE_DETERMINE_COMPILER_ABI lang src)
+ 
+     __TestCompiler_setTryCompileTargetType()
+ 
+-    # Avoid failing ABI detection on warnings.
++    # Avoid failing ABI detection caused by non-functionally relevant
++    # compiler arguments
+     if(CMAKE_TRY_COMPILE_CONFIGURATION)
+       string(TOUPPER "${CMAKE_TRY_COMPILE_CONFIGURATION}" _tc_config)
+     else()
+       set(_tc_config "DEBUG")
+     endif()
+     foreach(v CMAKE_${lang}_FLAGS CMAKE_${lang}_FLAGS_${_tc_config})
++      # Avoid failing ABI detection on warnings.
+       string(REGEX REPLACE "(^| )-Werror([= ][^-][^ ]*)?( |$)" " " ${v} "${${v}}")
++      # Avoid passing of "-pipe" when determining the compiler internals. With
++      # "-pipe" GCC will use pipes to pass data between the involved
++      # executables.  This may lead to issues when their stderr output (which
++      # contains the relevant compiler internals) becomes interweaved.
++      string(REGEX REPLACE "(^| )-pipe( |$)" " " ${v} "${${v}}")
+     endforeach()
+ 
+     # Save the current LC_ALL, LC_MESSAGES, and LANG environment variables


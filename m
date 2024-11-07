Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FD3D5AE72
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 08:02:22 +0000 (UTC)
Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web11.67117.1730966530735748444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 00:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=JTjuShEH;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=0344a29a8=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1730966530; x=1762502530;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nFx6D63ZtIdJpKdtsjZp+8fIMXpQ98C5r1bdZrZf4MQ=;
  b=JTjuShEHd9L4S7ygBruLPyttEQOOILGSAjijg02JmAJKHJzleZY7EZUH
   RE8hK0UcuDqG1sWqdd4JiIs9D2QStNoS4yy4VxN4cXNN7Ac69WgQlwlu+
   IjSKFaksoPmSvVVGNBE0FN54TmVUQkLBRv2f4snmpSZ29BDLxOKeqadVb
   k=;
X-CSE-ConnectionGUID: 7FcpWLIBTT2A5DuGyyMLCw==
X-CSE-MsgGUID: SSy1Aq94ThmQ+E17CHc0uw==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 07 Nov 2024 09:02:08 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw6.muc with ESMTP/TLS;
 07 Nov 2024 09:02:07 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb6.muc with ESMTP/TLS; 07 Nov 2024 09:02:07 +0100
Received: from localhost.localdomain (10.30.85.205) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Thu, 7 Nov 2024 09:02:07 +0100
X-CSE-ConnectionGUID: Il7Vem3aRW6x7mJm+bHmhw==
X-CSE-MsgGUID: f4jtaARNQAuMb7+FQ/1jlA==
X-CSE-ConnectionGUID: xnp53/tQSluETi63vL7Hdw==
X-CSE-MsgGUID: lRNTr9O3SkOhhkGETSzk6A==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, Philip Lorenz <philip.lorenz@bmw.de>
Subject: [scarthgap][PATCH] cmake: Fix sporadic issues when determining compiler internals
Date: Thu, 7 Nov 2024 08:58:01 +0100
Message-ID: <20241107075801.595803-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18c.europe.bmw.corp (2a03:1e80:a15:58f::1:5c) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 08:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206829

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
 ...mpilerABI-Strip-pipe-from-compile-fl.patch | 52 +++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ab9f459c05c..a52506a8eac 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,7 +17,8 @@ LIC_FILES_CHKSUM = "file://Copyright.txt;md5=9d3d12c5f3b4c1f83650adcc65b59c06 \
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
-"
+           file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
+           "
 
 SRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
new file mode 100644
index 00000000000..7ffcc95ac3c
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -0,0 +1,52 @@
+From bd94bbdc35a9da4c73d538e0cc55bc95944f620d Mon Sep 17 00:00:00 2001
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
+ Modules/CMakeDetermineCompilerABI.cmake | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Modules/CMakeDetermineCompilerABI.cmake b/Modules/CMakeDetermineCompilerABI.cmake
+index efc18f93c2..f2e40479b1 100644
+--- a/Modules/CMakeDetermineCompilerABI.cmake
++++ b/Modules/CMakeDetermineCompilerABI.cmake
+@@ -43,6 +43,11 @@ function(CMAKE_DETERMINE_COMPILER_ABI lang src)
+ 
+     # Avoid failing ABI detection on warnings.
+     string(REGEX REPLACE "(^| )-Werror([= ][^-][^ ]*)?( |$)" " " CMAKE_${lang}_FLAGS "${CMAKE_${lang}_FLAGS}")
++    # Avoid passing of "-pipe" when determining the compiler internals. With
++    # "-pipe" GCC will use pipes to pass data between the involved
++    # executables.  This may lead to issues when their stderr output (which
++    # contains the relevant compiler internals) becomes interweaved.
++    string(REGEX REPLACE "(^| )-pipe( |$)" " " CMAKE_${lang}_FLAGS "${CMAKE_${lang}_FLAGS}")
+ 
+     # Save the current LC_ALL, LC_MESSAGES, and LANG environment variables
+     # and set them to "C" that way GCC's "search starts here" text is in


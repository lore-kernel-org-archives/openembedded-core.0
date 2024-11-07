Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBADBD5AE73
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 08:02:52 +0000 (UTC)
Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web11.67132.1730966569857544995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 00:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=IPzDwSr1;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=0344a29a8=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1730966569; x=1762502569;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p5H5Q8Azzn2/7IlB2ZDDEcquc589YpsOEIG/7KhhTas=;
  b=IPzDwSr1cPJIGEb02xGwDW6HWHHKN/0ltO6b1TU766dGEdRSaAzd3xOB
   YhV7RboQRqYarq6qwtzqECvNo3TuxnJc5njufya/lXRs/MEwFaKPrOgS8
   WIy/7Ix9lapnjh6J/3RW7kxCihmF0pFUxLfGOn8fOr8M9F/LagOTU/tOn
   E=;
X-CSE-ConnectionGUID: gGqNAWrDS8iXTvUITvRsCQ==
X-CSE-MsgGUID: /p6HBKh5Ta69j0tbnvv3MQ==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 07 Nov 2024 09:02:47 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
 07 Nov 2024 09:02:47 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb1.muc with ESMTP/TLS; 07 Nov 2024 09:02:47 +0100
Received: from localhost.localdomain (10.30.85.214) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Thu, 7 Nov 2024 09:02:47 +0100
X-CSE-ConnectionGUID: jo9BR6TzSuazXwPl9pkuWQ==
X-CSE-MsgGUID: uaoplqavQ36MjFJeuQSY5A==
X-CSE-ConnectionGUID: ZUEyjAVaQqGFVib6I6y1/w==
X-CSE-MsgGUID: tfpiHP0TTJSxRfN6d/jY0w==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, Philip Lorenz <philip.lorenz@bmw.de>
Subject: [kirkstone][PATCH] cmake: Fix sporadic issues when determining compiler internals
Date: Thu, 7 Nov 2024 08:58:41 +0100
Message-ID: <20241107075841.595839-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP07c.europe.bmw.corp (2a03:1e80:a15:58f::2161) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206830

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
 meta/recipes-devtools/cmake/cmake.inc         |  1 +
 ...mpilerABI-Strip-pipe-from-compile-fl.patch | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d5003211389..3811aae9c4d 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://Copyright.txt;md5=31023e1d3f51ca90a58f55bcee8e2339 \
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+           file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
new file mode 100644
index 00000000000..a30273458f8
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -0,0 +1,52 @@
+From dab7ba34f87be0172f6586325656ee962de0029e Mon Sep 17 00:00:00 2001
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
+index 8191d819bf..ae4c9ee44e 100644
+--- a/Modules/CMakeDetermineCompilerABI.cmake
++++ b/Modules/CMakeDetermineCompilerABI.cmake
+@@ -35,6 +35,11 @@ function(CMAKE_DETERMINE_COMPILER_ABI lang src)
+ 
+     # Avoid failing ABI detection on warnings.
+     string(REGEX REPLACE "(^| )-Werror([= ][^ ]*)?( |$)" " " CMAKE_${lang}_FLAGS "${CMAKE_${lang}_FLAGS}")
++    # Avoid passing of "-pipe" when determining the compiler internals. With
++    # "-pipe" GCC will use pipes to pass data between the involved
++    # executables.  This may lead to issues when their stderr output (which
++    # contains the relevant compiler internals) becomes interweaved.
++    string(REGEX REPLACE "(^| )-pipe( |$)" " " CMAKE_${lang}_FLAGS "${CMAKE_${lang}_FLAGS}")
+ 
+     # Save the current LC_ALL, LC_MESSAGES, and LANG environment variables
+     # and set them to "C" that way GCC's "search starts here" text is in


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CF8D597D1
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:38 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.3468.1731467791066221390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OXzFhpOB;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e5f968230bso2845889b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467790; x=1732072590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yq3RHYZWp+YRN5zN/1y88NYJnubo7PPmTm7xCffOm3Q=;
        b=OXzFhpOBHRWYcs6HFSdNi3JZquUCs+ZgQ0rBIETox9FuAYZJfHoMCK2Yubbr/tzwqr
         kHWldnaTA6mFpGJQK1QplTn4E7GqSyaHHWywusElp3Q+q0kCw781BAzw/g14yA/06rE2
         C3FIiI83S74eFDO0i/TIQYIoJb3wGrccsFonq45j1yG4QgFdb2vblUnAczZzxT1WkFot
         5qiGf79V1E9VJQLaSfR/1hKrSvhZQ+CSYLUGMZ5aqxR3G+sJzwGq4ULeNAxOt4/fDoZF
         ksS+dt+apI1TXFO+w6+s7ATchy28PpIQsbCmfBDiz/CLDTLIBLKAYPu+aTbGHwQ+2Hli
         mK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467790; x=1732072590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yq3RHYZWp+YRN5zN/1y88NYJnubo7PPmTm7xCffOm3Q=;
        b=bQV1LIW8YgZ9iy2sRvaGn+4PAdR09R1+LGdAyAGvaLrzuMiPCSkwP6eZy7LrDR7l+6
         96IQEEbiMVJzSH8ipjEucwuMe8X/zVwftMYE/57j6A5Rnm1+PZRilAxEagjU604iNJqk
         8xQDlGw5nflxu/OL6Mxxddub0dofNY6ksdsHjn9an8PjEH9cMqzMhjnp9YLEb/6hJWqm
         mFjxvUDvV5JS08LUnhiK2MJRdmnchkbJz9EAu0vlSpQRMWH/2f+Ofl5bAqtYDg4iYQFi
         zXW1xcf/RGUX848ITEK3MhTHO2cbhiQdxlfy8fPnBii/GAGPuKoh60G8fSWQcCi9eOlO
         blxw==
X-Gm-Message-State: AOJu0YxQii0E2fhU7VUa1ebeO/3FT2h0m5A+gpmuEng7W/M3cF6I+wMP
	QSk6FvR0o1QQMMMumiRZtzpJQeK2O3bm+Zz4/FwlMi/oOqtpO9fJiytZTaQcwIVBchE+Ch7Y0sb
	j
X-Google-Smtp-Source: AGHT+IF0zpFV74EWMNI+PjsMD6Gh/mjHP0Ig7grg3rqubKLhYhYjVfNtxiTjCKIbzeM4ViA5bGPg2A==
X-Received: by 2002:a05:6808:11ca:b0:3e6:147:6c5 with SMTP id 5614622812f47-3e79469fcc2mr17132283b6e.10.1731467790073;
        Tue, 12 Nov 2024 19:16:30 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/19] cmake: Fix sporadic issues when determining compiler internals
Date: Tue, 12 Nov 2024 19:16:00 -0800
Message-Id: <8e2233fd0509b9f20c19d5006dd7ef0c2260bdba.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207080

From: Philip Lorenz <philip.lorenz@bmw.de>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/cmake/cmake.inc         |  1 +
 ...mpilerABI-Strip-pipe-from-compile-fl.patch | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d500321138..3811aae9c4 100644
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
index 0000000000..a30273458f
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
-- 
2.34.1



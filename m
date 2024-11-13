Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA97D637BF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 20:42:54 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.22183.1731530566371189924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 12:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B7BjxVHi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20cf6eea3c0so71085275ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731530565; x=1732135365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsIzwXLlYgkxlmHXmdhvWJfVpRLgz4I0ZvATreb743k=;
        b=B7BjxVHixN0a8NM/vb07ODR1ZyhhwvrPK/WM2D92yImzzQo5VDi54TNPt99mcDinLD
         o3GCx/IOcOaDQR76lAY+ZhNyB+RAuWqnRGo2W2dpt9RUjJbNOzrnTxrkifxznLjbkpXZ
         Z+NGpQFEfA7qdFbaQ4gazPc4VUFppn6yuZAZENl+ZeAxfaaEYrZKgG938nejycP/THI4
         dSRe9JdJO33EoWWeWJpzxHJeYGiRzcgy5scG4ZS0QznidxlQwus+J1Nfbs8/AK3dkwl1
         1qJK33ZXOWhwSDnF/1Y0trNJPvcCU0UMMhs1FIryca5sgZUpdtG4FvME9163fJtvJ45z
         3sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530565; x=1732135365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsIzwXLlYgkxlmHXmdhvWJfVpRLgz4I0ZvATreb743k=;
        b=MQGNM32fppGNNoC8sUPi/JK8kbVBEh79/p+zVkX7li2S9YFXbl7UADRgDqx3VMnZU8
         a9QhAIzfmxZvZyfkfgOzcjAV4HSKzDVHWsMdZRZqTGWzGhQdw3R4uDgDyGysX3ocglLg
         Ke1I4yVZXJFCd27+8qNC7aprVYOKH0u4eylJWtrDR0856ZjQvZw7+OlBJ5EuEzY3wTxx
         6VjOxU76FG/B00ynY82fsRAPAfxBaRE9P76X5j9MVuZfbgOcqFz0b5tTWtjrviwJc3IS
         O5PSDMQq+TRRPSgpwh9YBmYoK8s2GEsRjlhBqRHwMnRS4thCTqbUnXzQ3EoiM3zVi1te
         LQXg==
X-Gm-Message-State: AOJu0Ywxz8NQndBi7u6tU+qCgeRn1/z9NwfGXxaNE+ykzusItgsRjf2D
	uP6dgu5us7JCeDyhyQu45u+2c3axaqufHCfcAFdpdZdoZZEuEYSgwX3GyCaTUS5UH3SfXk1yX6y
	O
X-Google-Smtp-Source: AGHT+IEeUA/LU+52A0W3NW0IEAgORlvKQsbimRHwjoXqj11oMpI+QsOQJK1eJozlrf3EWUtKa50Uqw==
X-Received: by 2002:a17:903:11c9:b0:20c:cccd:17a3 with SMTP id d9443c01a7336-2118359c11amr295996965ad.46.1731530564561;
        Wed, 13 Nov 2024 12:42:44 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e84ee2sm114545595ad.274.2024.11.13.12.42.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:42:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/9] cmake: Fix sporadic issues when determining compiler internals
Date: Wed, 13 Nov 2024 12:42:20 -0800
Message-Id: <ef5c060a939416b4034be1b8b81f9035b23534b7.1731530398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731530398.git.steve@sakoman.com>
References: <cover.1731530398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 20:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207129

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
 meta/recipes-devtools/cmake/cmake.inc         |  3 +-
 ...mpilerABI-Strip-pipe-from-compile-fl.patch | 52 +++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ab9f459c05..a52506a8ea 100644
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
index 0000000000..7ffcc95ac3
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
-- 
2.34.1



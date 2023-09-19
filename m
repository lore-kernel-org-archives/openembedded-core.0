Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB89ECE79A8
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 21:06:42 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.21643.1695157600933361935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 14:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VcWE4IPk;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68fbd31d9ddso4861443b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 14:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695157600; x=1695762400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+97YLZRc/6acAVuEi7346KkM+DNj70s7gaY6xrCBCg=;
        b=VcWE4IPkZANQ9KytDm3pcD3OnFaB9PtVQXkoRsdwG6YbMTJr32qeKMcR7UnzS93f6o
         aYmkDZ17dREWx3WVJ1b4ArKav601kuB8peQOv6WMAvLhD51U+5qdlG69WAhKyWAazpIU
         3kKo+51PcWDz4uZA1/GdR+5mncZU5axoHbZw5gxHZY/PTK4oqtyo7BL8TDwoHqW9csAl
         4TKFRYg0l6XfUfYqrZHiASxGDE8cjr5J5F9Ha/of8zAq+yvqia6cV3nT1xJO/Rp679yH
         TrRNb4IYrFR895UVL3GgmdFRgLcL5bPWzZqL83ijIy5W20+e39rlUFv5TfujAV1d1keo
         YBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695157600; x=1695762400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+97YLZRc/6acAVuEi7346KkM+DNj70s7gaY6xrCBCg=;
        b=klJJ4+J/31rhe4Q3v3d+nFkxWEyCFPV+7HxoVouKwjuYKJ/vSlfzDXX2vaWtZu9hH+
         fT5sOycr/iH6GUC91uMLpQvs3Rb6mW9kIvg39bXxEL/p2k0ldb+ZHBhQ6iSC0XSgpC6i
         Iux9Hdcrx4WgJn1lPdIhXRVgYlxYLv/VaaAyAoSLjylyKBUoxgL2jJ9wblO88I/letpX
         2ZQ+kPgPiYL3ZrZGVVqcvhhzsg2uPoTDgJ3yUM9hwKz7a3ZXXRutCwL+ghYLco552jwH
         85uZOyzU5OY25tT+hZkokw5waAQf3F4r6r4EaLy6TSY5m8UZudl6xVVENFr0EiYmDpIG
         icSw==
X-Gm-Message-State: AOJu0YxMWo+gqgMzUhKxCXSvVbYTl3xWZ3Ao9TWdu46uN6766n4yMXYV
	L21AVkR0eu7m8ekzD8q+kNR8QkYil08=
X-Google-Smtp-Source: AGHT+IFjnybPXJ7nR5+v/EnWffFepg0gFIJHSBRRVmT0eiJgYukDMaq7wMB7rSjUb0qB9ZRb5PdtlA==
X-Received: by 2002:a05:6a00:2495:b0:68f:b5cb:cecd with SMTP id c21-20020a056a00249500b0068fb5cbcecdmr926801pfv.16.1695157599934;
        Tue, 19 Sep 2023 14:06:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::b7d3])
        by smtp.gmail.com with ESMTPSA id fk7-20020a056a003a8700b006870ed427b2sm9259102pfb.94.2023.09.19.14.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:06:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 17.0.1
Date: Tue, 19 Sep 2023 14:06:37 -0700
Message-ID: <20230919210637.3549365-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187876

This is first release in 17.x major release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc    |  2 +-
 ...7-llvm-allow-env-override-of-exe-path.patch | 18 +++++++++---------
 meta/recipes-devtools/llvm/llvm_git.bb         |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 69280fd2107..a7fe1fc0fa0 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ GLIBCVERSION ?= "2.38%"
 LINUXLIBCVERSION ?= "6.4%"
 QEMUVERSION ?= "8.1%"
 GOVERSION ?= "1.20%"
-LLVMVERSION ?= "16.%"
+LLVMVERSION ?= "17.%"
 RUSTVERSION ?= "1.70%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index b01b8647c91..add38b3bb4d 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,27 +1,26 @@
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From 61b00e1e051e367f5483d7b5253b6c85a9e8a90f Mon Sep 17 00:00:00 2001
+From 588a8694c6540e31140c7e242bfb5e279d6ca08c Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH] llvm: allow env override of exe path
+Subject: [PATCH] llvm: allow env override of exe and libdir path
 
 When using a native llvm-config from inside a sysroot, we need llvm-config to
 return the libraries, include directories, etc. from inside the sysroot rather
 than from the native sysroot. Thus provide an env override for calling
 llvm-config from a target sysroot.
 
+Upstream-Status: Inappropriate [OE-specific]
+
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
+ llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
+ 1 file changed, 19 insertions(+), 6 deletions(-)
 
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index 7ef7c46a262..a4f7ed82c7b 100644
+index e86eb2b44b10..7b2abf318dbe 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -225,6 +225,13 @@ Typical components:\n\
+@@ -246,6 +246,13 @@ Typical components:\n\
  
  /// Compute the path to the main executable.
  std::string GetExecutablePath(const char *Argv0) {
@@ -35,3 +34,4 @@ index 7ef7c46a262..a4f7ed82c7b 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
+ 
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index f3d6f24bd2d..611aacba147 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "16.0.6"
+PV = "17.0.1"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "7cbf1a2591520c2491aa35339f227775f4d3adf6"
+SRCREV = "e19b7dc36bc047b9eb72078d034596be766da350"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.42.0



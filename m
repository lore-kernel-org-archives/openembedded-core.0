Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5660E778A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 18:23:00 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id b5so6938975pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 11:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=emSdK07vP6EzNmXxbuFVFiW+r7z9cXKikGEkwc85d3s=;
	b=MJfW+sG80FgmMLltRYX28JjGkthqvASAk8lZ/Yy5uvVQVKEKNtiXwJntDAjb+Ph+lM
	cVKb0mQDHe1/ynU70+EjcH7pdRtlfeBXa8EF5lpEJJc2jFaQV6jgC7kSEag8YlLWCqS6
	BDTOblpzT1pBNVlTTACyAsZEM/rrgu5mYs1W6/YXonTTwaKiQmeJLuFYCaMjA47hJ4xe
	TkldP+eK1RvVV/8Hsmfzsq9MVWLAI191dUTVzvpiwppsgHFh9KZ0WErApojRbXbIdtFh
	ixN6WGWcW35BJO3eBgiSZKp4iuFD5ypqh1+wK6RogteKK5WbVTShfoBNFfnxKAPUGXiM
	NjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=emSdK07vP6EzNmXxbuFVFiW+r7z9cXKikGEkwc85d3s=;
	b=Oo5pSpMEjL0KMsKJmDIGZSNI4F5E7FonukfIUrwJS8Wzyo3s6meshs8+WxHJnenVLC
	UDrEsMzKhaP1MG1cRCog/OYpFwbtP0v4eVhA7fVxY7hEX3+7V5XszaOXEE1NWjvHYS+y
	bYM6kUHEbqYYs2OXXzJtbolS9uCoNx1c9N+cE7nbQG2X/L/tECM+lFJcx0Kpeb0w4duB
	+CxgySf+cwLbW2TktO9ErLSE1ful88QGJPcAvRJp/lvfIEc2g8GhanM8zjBYdxzwSLqZ
	cLatnz99RV5PeGF6Owk93c1qimGnzvlQxotGNP14y7PKEOBIufaTkYm2Wn4sXJMOqslD
	NZaw==
X-Gm-Message-State: AFeK/H15B4genRwhkd7J5ukIsFt7W9d6FYsOFTiax4BTcY3xi4fWMM99N2opJvFhSKlmFA==
X-Received: by 10.84.231.198 with SMTP id g6mr14365841pln.20.1489688582423;
	Thu, 16 Mar 2017 11:23:02 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s87sm11929003pfa.29.2017.03.16.11.23.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 11:23:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:22:43 -0700
Message-Id: <20170316182243.25875-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] webkitgtk: Fix build on aarch64
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
X-List-Received-Date: Thu, 16 Mar 2017 18:23:01 -0000

Do not try to do runtime tests during cross compile
Fixes

| CMake Error at Source/cmake/OptionsCommon.cmake:73 (math):
|   math cannot parse the expression: "-1": syntax error, unexpected exp_MINUS,
|   expecting exp_OPENPARENT or exp_NUMBER (1)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/files/cross-compile.patch | 23 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.14.5.bb       |  3 +++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/files/cross-compile.patch

diff --git a/meta/recipes-sato/webkit/files/cross-compile.patch b/meta/recipes-sato/webkit/files/cross-compile.patch
new file mode 100644
index 0000000000..4d1de72851
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/cross-compile.patch
@@ -0,0 +1,23 @@
+Disable the tests meant to run when compiling natively
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: webkitgtk-2.14.5/Source/cmake/OptionsCommon.cmake
+===================================================================
+--- webkitgtk-2.14.5.orig/Source/cmake/OptionsCommon.cmake
++++ webkitgtk-2.14.5/Source/cmake/OptionsCommon.cmake
+@@ -67,8 +67,11 @@ endif ()
+ # Detect Cortex-A53 core if CPU is ARM64 and OS is Linux.
+ # Query /proc/cpuinfo for each available core and check reported CPU part number: 0xd03 signals Cortex-A53.
+ # (see Main ID Register in ARM Cortex-A53 MPCore Processor Technical Reference Manual)
+-set(WTF_CPU_ARM64_CORTEXA53_INITIALVALUE OFF)
+-if (WTF_CPU_ARM64 AND (${CMAKE_SYSTEM_NAME} STREQUAL "Linux"))
++if( NOT WTF_CPU_ARM64_CORTEXA53_INITIALVALUE)
++    set(WTF_CPU_ARM64_CORTEXA53_INITIALVALUE OFF)
++endif(WTF_CPU_ARM64_CORTEXA53_INITIALVALUE)
++
++if (WTF_CPU_ARM64 AND NOT CMAKE_CROSSCOMPILING AND (${CMAKE_SYSTEM_NAME} STREQUAL "Linux"))
+     execute_process(COMMAND nproc OUTPUT_VARIABLE PROC_COUNT)
+     math(EXPR PROC_MAX ${PROC_COUNT}-1)
+     foreach (PROC_ID RANGE ${PROC_MAX})
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
index 1eb5b0b6e1..daa17a94da 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://detect_atomics.patch \
            file://x32_support.patch \
+           file://cross-compile.patch \
            "
 
 SRC_URI[md5sum] = "7fe3cb2699e64f969b285823c5ae2516"
@@ -83,6 +84,8 @@ EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 
+EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
+
 # JIT not supported on MIPS either
 EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
 
-- 
2.12.0



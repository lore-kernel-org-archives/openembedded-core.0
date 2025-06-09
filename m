Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F720C61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:59:45 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.55669.1749463178951348091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HjL/Xi4e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so3028479f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463177; x=1750067977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lkm3LIzKDjhR8UV0RQbk+g3MTkgVthoK3TPv0iWIIU0=;
        b=HjL/Xi4exF7d9NZxBkuojWC+77ZXjk9B2tBBEglbm9AjE6GCE3Sx498iCVtsm16Cb6
         aZFDyGhxDqJvDDpGE6D5aDlQVhsjlPw68awFEC9+Q2QhFB3HlIEvQkSmNLzIiXLXtNpj
         U6egkfD17ryGW7nxGY08yEfIGXOX/dsTP0KLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463177; x=1750067977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lkm3LIzKDjhR8UV0RQbk+g3MTkgVthoK3TPv0iWIIU0=;
        b=bQawOnUcwiQ1zYjRX2o3AWr7FilEKtk/CwTjON2AeOckORyGqHaWYLRYRYFGEfDQFq
         RwRcvhBn1IdDuav2xTeNXlQGa+EH989juGcWI5UJ2665Yk7AH2fKlqU9yhyvDo5AJHqo
         EiUY5be/mnIxPEhe8X4YSW02zHigsYWQqaus1wmQ8AXNLBqNUw0CsZ6ooTNXkLEzBJUE
         UclAVZnrt/YN58MWGbQczcZhBQPlM9GB21MWZ4uZS1XWm+xMr3PDg1TtKsOhFPtIYj7v
         JlzKQCI6cxm+FwCDylj3H22T2c8cLdd9ZtvUJsEtAvMltfPiG1ddPY1cuAUtq/WL5PdA
         aU4w==
X-Gm-Message-State: AOJu0YyOaN8IGt5I0lv9McQIi1C0tjwiO6aPCX9scsvY4Uy3B7J7itHw
	TN84KOKuGeyOaMMoHWpN0w+TpUwLHM7cPuCIZTB1cWUJxUfL4qB8GTYRZNrYgk+dmjfj+1iQejy
	0xj6KRXA=
X-Gm-Gg: ASbGncscAz3agOJgSU1naUk24vWVWABKYuxxvkqtFLLu0Ye0ozAkPfgSe6J/rMRGnfh
	x48y/kDPhgI/vwpD2PkvtdDc5rfeSgP+WRv8FFxbR1bqdYlLX4i0NsDI4xquD0WpJfVCWoZnZzi
	zgld5g7aAgsuKI7haqU7CrmOtxFJTzh6MBfUk4Hejv9jOe42CnQ3mMzEeEnKx0MXTL9BZiJ0rhO
	/RxDKuzaFNVsz1xZ/W8dHr54+jCQZD5gb0M+dri3a6dTrHEfo7u+jfWzhAVFVDbh6Qf+6psAhO1
	t/jr+CuO2HGAckyge/qyxKhcl5ps26Q6rgPuaxxc/TafoNZCzUOBHwmoEKsU+AUq/WXsJLBmuNe
	x6TqeCxyPSpHgiLMPVJ8iejsteg==
X-Google-Smtp-Source: AGHT+IGCbBYgWsGyT8fssN4j3bwqPvFxFb81FpRvEbdEWP3AKMt1x1PmRozgEpx2AkgYRqYxyNL01Q==
X-Received: by 2002:a05:6000:3108:b0:3a4:f7e6:284b with SMTP id ffacd0b85a97d-3a53178422amr10250058f8f.10.1749463176882;
        Mon, 09 Jun 2025 02:59:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d6dsm106289785e9.3.2025.06.09.02.59.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:59:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] toolchain: Provide abstraction for recipe specific toolchain selection
Date: Mon,  9 Jun 2025 10:59:31 +0100
Message-ID: <20250609095934.937987-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
References: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218257

This implements a toolchain selection mechanism, defaulting to gcc
as per the existing defaults.

Introduce a variable called TOOLCHAIN, which denotes the familiar
name for toolchain e.g. "gcc" which selects GNU compiler + binutils
as default C/C++ toolchain or "clang" which will use LLVM/Clang Compiler

TOOLCHAIN variable has a global fallback to "gcc" in configuration
metadata. A distro can switch to using say "clang" as default system
compiler by defining

TOOLCHAIN ?= "clang"

In local.conf or other distro specific global configuration metadata

It is also selectable at recipe scope, since not all packages are
buildable with either clang or gcc, a recipe can explicitly demand
a given toolchain e.g. glibc can not be built with clang therefore
glibc recipe sets.

TOOLCHAIN = "gcc"

Based on ideas/work by Khem Raj <raj.khem@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass                            | 6 ++++++
 .../toolchain/clang.inc => classes/toolchain/clang.bbclass} | 0
 .../build-gcc.inc => classes/toolchain/gcc-native.bbclass}  | 0
 .../toolchain/gcc.inc => classes/toolchain/gcc.bbclass}     | 0
 meta/conf/bitbake.conf                                      | 3 ---
 meta/recipes-devtools/binutils/binutils-cross.inc           | 2 ++
 meta/recipes-devtools/clang/clang-cross_git.bb              | 1 +
 meta/recipes-devtools/clang/clang-crosssdk_git.bb           | 1 +
 8 files changed, 10 insertions(+), 3 deletions(-)
 rename meta/{conf/toolchain/clang.inc => classes/toolchain/clang.bbclass} (100%)
 rename meta/{conf/toolchain/build-gcc.inc => classes/toolchain/gcc-native.bbclass} (100%)
 rename meta/{conf/toolchain/gcc.inc => classes/toolchain/gcc.bbclass} (100%)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index a9b0fdd1f10..f449d7dcabb 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -19,6 +19,12 @@ PACKAGECONFIG_CONFARGS ??= ""
 
 inherit metadata_scm
 
+TOOLCHAIN ??= "gcc"
+TOOLCHAIN:class-native ??= "gcc"
+TOOLCHAIN:class-nativesdk ??= "gcc"
+inherit toolchain/gcc-native
+inherit_defer toolchain/${TOOLCHAIN}
+
 def lsb_distro_identifier(d):
     adjust = d.getVar('LSB_DISTRO_ADJUST')
     adjust_func = None
diff --git a/meta/conf/toolchain/clang.inc b/meta/classes/toolchain/clang.bbclass
similarity index 100%
rename from meta/conf/toolchain/clang.inc
rename to meta/classes/toolchain/clang.bbclass
diff --git a/meta/conf/toolchain/build-gcc.inc b/meta/classes/toolchain/gcc-native.bbclass
similarity index 100%
rename from meta/conf/toolchain/build-gcc.inc
rename to meta/classes/toolchain/gcc-native.bbclass
diff --git a/meta/conf/toolchain/gcc.inc b/meta/classes/toolchain/gcc.bbclass
similarity index 100%
rename from meta/conf/toolchain/gcc.inc
rename to meta/classes/toolchain/gcc.bbclass
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 61c6a492bcb..c011c943d42 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -834,9 +834,6 @@ include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
 
-require toolchain/gcc.inc
-require toolchain/build-gcc.inc
-
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
 ##################################################################
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 9c371e7e137..c545ea2ad97 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -9,6 +9,8 @@ TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
+TOOLCHAIN = "gcc"
+
 SRC_URI += "file://0002-binutils-cross-Do-not-generate-linker-script-directo.patch"
 
 # Specify lib-path else we use a load of search dirs which we don't use
diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipes-devtools/clang/clang-cross_git.bb
index 9b9b120a3d7..323cc0d8809 100644
--- a/meta/recipes-devtools/clang/clang-cross_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -11,6 +11,7 @@ PN = "clang-cross-${TARGET_ARCH}"
 require common-clang.inc
 require common-source.inc
 inherit cross
+TOOLCHAIN = "clang"
 DEPENDS += "clang-native virtual/cross-binutils"
 
 #INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
index 47ac96f4f93..ef162ef153f 100644
--- a/meta/recipes-devtools/clang/clang-crosssdk_git.bb
+++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
@@ -11,6 +11,7 @@ PN = "clang-crosssdk-${SDK_SYS}"
 require common-clang.inc
 require common-source.inc
 inherit crosssdk
+TOOLCHAIN = "clang"
 DEPENDS += "clang-native nativesdk-clang-glue virtual/nativesdk-cross-binutils virtual/nativesdk-libc"
 
 do_install() {


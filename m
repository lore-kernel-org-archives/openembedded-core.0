Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EB7C71141
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:00:05 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.14015.1749736800331058075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 07:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=axkt9jkj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so615086f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 07:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749736798; x=1750341598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKwEp/GUuU5IZihmYjeD/yJvRAS/jZ8FZBS41TGJ8pY=;
        b=axkt9jkjKJreIDVXiO1WYLdDedFC9Ux0JR6um1J1k4M+Hxkmy5HLuYG6Sv4qyS6yJU
         USkAHioAlxS+WAw7YL3I+vHxbmh7hkHytYKRGkOMbr6iVMoSKTnd1CpygYS8EjM3b7XU
         GORcc3BxQxx1O5cYjDnMBHPYRp0TNtJ0nVPDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736798; x=1750341598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKwEp/GUuU5IZihmYjeD/yJvRAS/jZ8FZBS41TGJ8pY=;
        b=KQ7NabA1+at5qLerfuIlb3sfoBX8ALuTe4HyCVdcqUBILIZ8z+7Mu3qytTjgXDWN9v
         71lHUBhr0UVULpXQyTHsGC9MMaYgSxZI3txGVgv+MWr5BcD7Fh9iemCmypD40hHdBfCc
         JvzT3P496ONLfNa5w6OXefivOwbCYWaFCYi54JaMYvpuBGIxISxtk5z1maQ/Z9HqBPP1
         YgeDNrHKe77zVlFdNzmHcoyZ+x4DPMSwE3kmHOPOyDlBXqgBvs6bOicdgvbXbI9lle2q
         FiWmYFHdEQEwFOd0eeep2DpZLoZ9XWssN9lgnKudhUBfHRFCT+QqOdNVd4dnba5AO91c
         IG0w==
X-Gm-Message-State: AOJu0YxjYAWCmza8kQZfEM55s6hyVEeX4oo3BT5W8JnMPYgAlWqbKyTX
	odotmxpDYpuGQ3ZXb3C2NZgz7NEgRCBLwnHRijrc3T4BE5DXzKthkEQ1wgobY/7ZvS8QRza0u8M
	fF03Na5c=
X-Gm-Gg: ASbGncugrRY00kXLOB/O/X2VkB1OFpped6+VkIDYLa5BPWA+iy7ipMC5u7IgGNM52Bs
	a2MSIYXcz2tG+JYmjEF9DI46NwEtVtxFJDngI2UErBXuUZVCWDROJ0slo9ROfiAX6Q+//1TGpyL
	ZtRdykuy7ShXg8E3qJ1hznXURDS8l+rmQlQUP3EOhsWSZfFXsGsGG7HipPUYYvrQ+dGyjQSCFVf
	MjxQyAAvkRzHPgKQ9HfMdVby4Yusx9KN4yIoTNit/CuHeRaherp0I0pwh1wyU3Hnc3/PG50t+RX
	uEN0G/9BQYju8ngZ6w0GWHyS3LV0nnzVdMH99cPcolN8jw8X6Mo/aEBmiKL+1YHo6V8JNCveu04
	U0nm/DSMuBCIDtj+ea8/8Yi3KnA==
X-Google-Smtp-Source: AGHT+IGQFblq1fMMFKNLo2GCkhRZKmNK61SOpQ/plzZdAR+V2xZHK4253edMAPiOJT15X5EyRwaZCw==
X-Received: by 2002:a05:6000:240b:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3a56797ecd5mr5993f8f.4.1749736798259;
        Thu, 12 Jun 2025 06:59:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9e93:4c2d:3b22:8e08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2089474f8f.4.2025.06.12.06.59.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:59:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] toolchain: Provide abstraction for recipe specific toolchain selection
Date: Thu, 12 Jun 2025 14:59:52 +0100
Message-ID: <20250612135955.1413300-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
References: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 14:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218522

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
 meta/classes-global/base.bbclass                         | 9 +++++++++
 .../clang.inc => classes/toolchain/clang.bbclass}        | 0
 .../toolchain/gcc-native.bbclass}                        | 0
 .../toolchain/gcc.inc => classes/toolchain/gcc.bbclass}  | 0
 meta/conf/bitbake.conf                                   | 3 ---
 meta/recipes-devtools/binutils/binutils-cross.inc        | 2 ++
 meta/recipes-devtools/clang/clang-cross_git.bb           | 1 +
 meta/recipes-devtools/clang/clang-crosssdk_git.bb        | 1 +
 8 files changed, 13 insertions(+), 3 deletions(-)
 rename meta/{conf/toolchain/clang.inc => classes/toolchain/clang.bbclass} (100%)
 rename meta/{conf/toolchain/build-gcc.inc => classes/toolchain/gcc-native.bbclass} (100%)
 rename meta/{conf/toolchain/gcc.inc => classes/toolchain/gcc.bbclass} (100%)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 4ac3b83eb5c..4809cca27de 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -19,6 +19,15 @@ PACKAGECONFIG_CONFARGS ??= ""
 
 inherit metadata_scm
 
+TOOLCHAIN ??= "gcc"
+TOOLCHAIN:class-native ??= "gcc"
+TOOLCHAIN:class-cross ??= "gcc"
+TOOLCHAIN:class-crosssdk ??= "gcc"
+TOOLCHAIN:class-nativesdk ??= "gcc"
+
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
index e600d9d774a..9a91d6aa6a4 100644
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


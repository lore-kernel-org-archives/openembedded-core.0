Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BE5C71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 13:14:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.30187.1750079635479329185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 06:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XQRK/1ep;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a5096158dcso3896775f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750079633; x=1750684433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bl32t8uMkkmJfcCaQ5hSmdtopWSi725LUsOZdhpKr0U=;
        b=XQRK/1epHHYryEYJtRdDhZiLNSFrwiDEIsWYHKYFbeBflaE3BqmP+spnVsAhqW2Bn/
         TY1suS0EdjRqPtwocP/zbXb+9E7mqpDtqsQCmFYFeg54LZ/qr/IclB21Wc8tXJzkWAAg
         PdoR+lvjjTLhoiM+Rfjqm8ohfE2gD9saTF5D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079633; x=1750684433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bl32t8uMkkmJfcCaQ5hSmdtopWSi725LUsOZdhpKr0U=;
        b=A/HAFO1djeFVP+w/4/B3BFQ2AkWjEQIWgWPauXlb7wdVIbDT+R6uzd6g+XoN6vCaDa
         1GsdYIpWZmQB4tsegVf/a+ziaM6sUw3HkS879C3T1P10akXczl7EfdnEa0f8c3AUG9ln
         2pARce7zfwJegA6Awp896RZ3jdDYL7e12hkQO14abKxBekdmLtFIeX66QqoGfRsjW/a5
         IGN5wzD9k7bAcflAhdlaXsdu5eU/cZ4KnI2lGZK/2w514txS/UceXyjAnGiklvZg95zM
         6wbl2p7fu7r2b8R9X17D6Qvd03TZC8McMNg4MbmfOL6RV87Ood3+KssIceZVIlUt1EMv
         OX+g==
X-Gm-Message-State: AOJu0YwQ7k1bqtBH0HPG6ScwUIFtv/ySorhRaomqeWn5FQDd8Y8dt80j
	NQFDn2tzpmgS+/pAqY3fwZtzJkDkXzN0oliSewR6qWjpsrKDoMSuUcrFlZdKMLKGYeSI2qRHm+S
	U91K7gPM=
X-Gm-Gg: ASbGncuPMSGum3+icrJ9odo/6jOQQjMHatiUnFE+qMbTlYEwdUiGqIdsFBM4rG+doOU
	n58D0RB6hVCzWIFnlT6UQYqaY/Szi/CYLpjYVXB30yMqwENzSEUwrX3KcTk4ooty7L9hcwsrAvs
	pFZIEM3NPuYFRVyEQGF2MQxkZ8iNtqJJ+S/6t+tuOBjCU0w7MDqSfL3PB2/z3IJEF7QL674oB4t
	kgbDbFnnLV89hyO1oLy8kBadRku+PsANfhUukio+gbvv+Mpr0QKbR3hVgNDGeV3xkG9uKnopJx8
	hfJ0s5l1OSihtB4f+t6XMx7ml7LGh+/qFo1AjqocFrRXeZARfvUbYpzvWg/lOCC+5t2R58u9FmM
	FFN+53/0YvXj3KQ==
X-Google-Smtp-Source: AGHT+IGJd3af9YC+k8Kt1hQco1VKutnZK9jlCmwTC0dDp3xyUBi0qkOkf8+WNI6uiS8T4i4eTSqKsg==
X-Received: by 2002:a05:6000:18ac:b0:3a4:f6fe:5244 with SMTP id ffacd0b85a97d-3a572367b13mr7432392f8f.12.1750079633129;
        Mon, 16 Jun 2025 06:13:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea15b0sm146410625e9.11.2025.06.16.06.13.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:13:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] toolchain: Provide abstraction for recipe specific toolchain selection
Date: Mon, 16 Jun 2025 14:13:51 +0100
Message-ID: <20250616131351.1960499-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 13:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218823

This change implements a toolchain selection mechanism. Selection is
made using a set of variables, primarily PREFERRED_TOOLCHAIN_TARGET which
defaults to gcc.

It uses the familiar name for toolchain e.g. "gcc" which selects GNU
compiler + binutils as default C/C++ toolchain or "clang" which will
use LLVM/Clang Compiler. Layers an add their own toolchain definitions
too.

There are also PREFERRED_TOOLCHAIN_NATIVE and PREFERRED_TOOLCHAIN_SDK
which will ulitmately allow selection of the toolchain used for the
native/cross and nativesdk/crosssdk compilers. This currently isn't
functional but is essential to the patch to ensure things are set
to the existing gcc support in those cases.

Users would most commonly want to set:

PREFERRED_TOOLCHAIN_TARGET ?= "clang"

in local.conf or other distro specific global configuration metadata.

It is also selectable at recipe scope, since not all packages are
buildable with either clang or gcc, a recipe can explicitly require
a given toolchain using the TOOLCAHIN variable, e.g. glibc can not
be built with clang therefore glibc recipe sets:

TOOLCHAIN = "gcc"

The TOOLCHAIN variable is distinct from the user preference so recipes
with specific requirements can be identified. This also allows different
polcies to be be specified for native/SDK cases in the future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass                  | 15 +++++++++++++++
 .../clang.inc => classes/toolchain/clang.bbclass} |  0
 .../toolchain/gcc-native.bbclass}                 |  0
 .../gcc.inc => classes/toolchain/gcc.bbclass}     |  0
 meta/conf/bitbake.conf                            |  3 ---
 meta/recipes-devtools/binutils/binutils-cross.inc |  2 ++
 meta/recipes-devtools/clang/clang-cross_git.bb    |  1 +
 meta/recipes-devtools/clang/clang-crosssdk_git.bb |  1 +
 8 files changed, 19 insertions(+), 3 deletions(-)
 rename meta/{conf/toolchain/clang.inc => classes/toolchain/clang.bbclass} (100%)
 rename meta/{conf/toolchain/build-gcc.inc => classes/toolchain/gcc-native.bbclass} (100%)
 rename meta/{conf/toolchain/gcc.inc => classes/toolchain/gcc.bbclass} (100%)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 4ac3b83eb5c..e55a538e36c 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -19,6 +19,21 @@ PACKAGECONFIG_CONFARGS ??= ""
 
 inherit metadata_scm
 
+PREFERRED_TOOLCHAIN_TARGET ??= "gcc"
+PREFERRED_TOOLCHAIN_NATIVE ??= "gcc"
+PREFERRED_TOOLCHAIN_SDK ??= "gcc"
+
+PREFERRED_TOOLCHAIN = "${PREFERRED_TOOLCHAIN_TARGET}"
+PREFERRED_TOOLCHAIN:class-native = "${PREFERRED_TOOLCHAIN_NATIVE}"
+PREFERRED_TOOLCHAIN:class-cross = "${PREFERRED_TOOLCHAIN_NATIVE}"
+PREFERRED_TOOLCHAIN:class-crosssdk = "${PREFERRED_TOOLCHAIN_SDK}"
+PREFERRED_TOOLCHAIN:class-nativesdk = "${PREFERRED_TOOLCHAIN_SDK}"
+
+TOOLCHAIN ??= "${PREFERRED_TOOLCHAIN}"
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


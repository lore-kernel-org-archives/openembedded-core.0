Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3A8C6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 16:32:59 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.25414.1680366771660528797
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 09:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=HAoyDvfZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id ew6so101445366edb.7
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 09:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680366770; x=1682958770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y8cvgcc2jyK0RiwtKhdkygx+UZOkcmxMkXOR6SVBbw=;
        b=HAoyDvfZYz5fjXafQ+KfPbC1PQ+I1zOes/SFmieB8hVIesvEKoCwcQ3TzrqVzR6LSH
         41QxHeAKfUl0yT5NXLWHHRkPc81WGGnBf2UB/C7WBzAd4EckNI325DONaaCMXECpL3v5
         SAWtZisZuvJAGsaJbio6ZJmL0mX6+SGOo/oRt+AnDnynvFsi1E5nt6Iegpg5AYo106gq
         gL1yti4XKs0PUwFgPEPS09sFGI5hcgWA+psBrin9wHYZNf0tbI+R7uX7f8ui7XrY1zB3
         ly1tkH1Rrn33rlQPmZzIkYxi4+cd3JmnT5S8/JJsZKLH1EnHtfn4uvK75v9zNuYo/z6c
         kbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680366770; x=1682958770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Y8cvgcc2jyK0RiwtKhdkygx+UZOkcmxMkXOR6SVBbw=;
        b=qVJGOctvTTQcvzqdisy3I/lU+IpJbnSIpvP8l1QzKFewlJossasgbouDu8Wlp6ZegM
         WywVZt+29IXR64QpOM5jgrzBFIcxf2cZdxige3k6DOHw4o1Xg99CdjPLjjVX33YOMrrb
         9ruyctqfmE4cqIMLxvvfD6lNshxSv9TxejCJZQzGboHDQmYmKLYsf8JAl+p8obbUQbeh
         ZPJaOlsTL1a6M/f0lGha/XftxDosHH0LFvklU4neKB1Tevl+CbMZMsV0VibxxUzWhj44
         eJUlPRtJT2jp46UGAt5apahWCkpHO/MRzejqdEQiI0npmmKTGDE/FPg7ETOHplMaG9Et
         CByA==
X-Gm-Message-State: AAQBX9enqRwSAraHDY3ohOUxmeYOxvFmbPhzXF2ECNWHwrSd1WSdAcSD
	+4jR0o+xB2NUDwtqqxrNDpDVYFC+qmU=
X-Google-Smtp-Source: AKy350alde+wDIf0BQlAwgegQHGNZelK1jS/a/bLv/DqcjDUsYnszsly9CSllS+MRrLmhDi3hzvhVw==
X-Received: by 2002:a05:6402:2808:b0:4af:6e95:861b with SMTP id h8-20020a056402280800b004af6e95861bmr13749018ede.2.1680366769854;
        Sat, 01 Apr 2023 09:32:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t20-20020a50d714000000b005021d17d896sm2286088edi.21.2023.04.01.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 09:32:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH] tcmode-default.inc: Add LLVM_PREFERRED_VERSION
Date: Sat,  1 Apr 2023 18:32:41 +0200
Message-Id: <20230401163241.354257-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 16:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179469

* Allow to independently set P_V for llvm* recipes and actual llvm version used in other places

* This is needed for meta-clang which provides different llvm version from clang recipes, see:
  https://github.com/kraj/meta-clang/pull/766
  https://lists.openembedded.org/g/bitbake-devel/message/14521
* as reported in:
  https://lists.openembedded.org/g/bitbake-devel/message/14523
  the other places in kirkstone and langdale which use LLVMVERSION
  (which doesn't have to be the same as LLVM_PREFERRED_VERSION) are:

  meta/classes-recipe/meson.bbclass:llvm-config = 'llvm-config${LLVMVERSION}'
  meta/recipes-graphics/mesa/mesa.inc:MESA_LLVM_RELEASE ?= "${LLVMVERSION}"

  these were removed in mickledore, but there are other places which
  use LLVMVERSION as the actual LLVM version as reported in:
  https://github.com/kraj/meta-clang/pull/766#pullrequestreview-1349170591:

  meta-intel/dynamic-layers/clang-layer/recipes-opencl/igc/intel-graphics-compiler_1.0.12812.24.bb:                  -DIGC_OPTION__LLVM_PREFERRED_VERSION=${LLVMVERSION} \
  meta-intel/dynamic-layers/clang-layer/recipes-opencl/opencl-clang/opencl-clang_14.0.0.bb:                  -DPREFERRED_LLVM_VERSION=${LLVMVERSION} \
  meta-intel/dynamic-layers/clang-layer/recipes-opencl/opencl-clang/opencl-clang_15.0.0.bb:                  -DPREFERRED_LLVM_VERSION=${LLVMVERSION} \
  meta-intel/conf/machine/include/meta-intel.inc:PREFERRED_VERSION_opencl-clang ?= "${@bb.utils.contains('LLVMVERSION', '14.0.3', '14.0.0', '15.0.0', d)}"
  meta-intel/conf/machine/include/meta-intel.inc:PREFERRED_VERSION_opencl-clang-native ?= "${@bb.utils.contains('LLVMVERSION', '14.0.3', '14.0.0', '15.0.0', d)}"
  meta-riscv/recipes-graphics/mesa/mesa-pvr.inc:MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
  meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:# Check the LLVMVERSION defined in the meta-clang layer. Given Chromium is
  meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:# developed using new C++ features, the LLVMVERSION has to be >= 12. Otherwise,
  meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:  llvm_version = d.getVar('LLVMVERSION', False)
  meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:    bb.fatal("Your LLVMVERSION (%s) is lower than the minimum required "
  meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:             "LLVMVERSION (%s). If you are using dunfell, make sure you "
  meta-clang/conf/layer.conf:LLVMVERSION = "16.0.0"
  meta-clang/recipes-devtools/spirv-llvm-translator/spirv-llvm-translator_git.bb:        -DBASE_LLVM_VERSION=${LLVMVERSION} \
  meta-clang/dynamic-layers/openembedded-layer/recipes-devtools/bcc/bcc_0.26.0.bb:    -DLLVM_PACKAGE_VERSION=${LLVMVERSION} \
  meta-clang/dynamic-layers/openembedded-layer/recipes-devtools/bpftrace/bpftrace_0.17.0.bb:    pvsplit = d.getVar('LLVMVERSION').split('.')

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 30408e0729..2a3074b940 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,11 @@ GLIBCVERSION ?= "2.37"
 LINUXLIBCVERSION ?= "6.1%"
 QEMUVERSION ?= "7.2%"
 GOVERSION ?= "1.20%"
-LLVMVERSION ?= "15.%"
+# Allow to independently set P_V for llvm* recipes and actual llvm version used in other places
+# This is needed for meta-clang which provides different llvm version from clang recipes, see:
+# https://github.com/kraj/meta-clang/pull/766
+LLVM_PREFERRED_VERSION ?= "15.%"
+LLVMVERSION ?= "${LLVM_PREFERRED_VERSION}"
 RUSTVERSION ?= "1.67%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
@@ -77,9 +81,9 @@ PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
 
-PREFERRED_VERSION_llvm = "${LLVMVERSION}"
-PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
-PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
+PREFERRED_VERSION_llvm = "${LLVM_PREFERRED_VERSION}"
+PREFERRED_VERSION_llvm-native = "${LLVM_PREFERRED_VERSION}"
+PREFERRED_VERSION_nativesdk-llvm = "${LLVM_PREFERRED_VERSION}"
 
 # Rust toolchain preferred versions:
 
-- 
2.40.0



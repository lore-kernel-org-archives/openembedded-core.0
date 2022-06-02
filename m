Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE51DCCA47A
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:13 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.1517.1654188790202788905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=T6cfAYLo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso5342860pjg.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E+aU9OZJ39fJlmFuB4OOBK80FlTWQ3odTvVbJ2sk39Q=;
        b=T6cfAYLoeZKtUW36wuExyiH9JGEcpsGsXL2f0YLORi4UqQH2Mtqs/vwiVgnukuITs+
         AIgCnILHmoVuFleq4etT0uZldb1rZxxDc9TvwbyTUaYRChBimL2SOUElasxBd+QEGhR4
         u6RWtg4xnQLUp3tJvIYgmkOpMVsGj22vssAHpromasWpweuhBA4Va51P4t9ZcUXVzdeg
         DSBt9OghmLIvtIyshj9kklAjhCAknNqlDQQoGukZUp04xdaulEs0sPGRpZJTHXrTXjPI
         PlwTahWksIcGLm98XzhizcsCRhGCS7y/H4+878wbJFvxnrqAdEDEHmZC+pIWHxP8bqXe
         1r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E+aU9OZJ39fJlmFuB4OOBK80FlTWQ3odTvVbJ2sk39Q=;
        b=4g3h9h5VjFTMtc2aT2jY8SiNYcCOpRlHYautukFtiU2ddtNwEW8De2TD4IbLmOKgj4
         cyj5Uc6eilvD0r65lwTg5IQtGhGBhkd6odiu0uHlGcV8Erf++5YFgo0A84nGw0O1k1Eg
         YXEe0PUpSXy3xNw4lDALMWDoHFmTZO1fmYwhk8/ELlcreEvshLf4PWPzlJjxFDfWKoRl
         ZtMVVeCazAuVMIAusOWSCzorQQaIp4BisucfP2hy++ZJWT6TF/Xcsk6XsBoxkKzLTzE9
         YKNQ0CY+6Wnuf2XiLmOfVn6aUJ4Va97Hclqv8NSUlA1JgALtVAxg8+iqW2RMFwdjoO25
         VQgQ==
X-Gm-Message-State: AOAM531BxWPzn+PKb5P36BbEyNGhrz/5AsNKmTh37TSvggOg0Cje9tny
	PlBl0v8I7Uha2IvBZqwG4CFQ9MJET/AVf9hg
X-Google-Smtp-Source: 
 ABdhPJyqrLL+KL3JmRCQRRoc9gJmkySXqUzziogTyvw1XyWWPKflh5ZVaeCr5iN+Rx417S5SL5YhFg==
X-Received: by 2002:a17:902:704a:b0:161:996e:bf4 with SMTP id
 h10-20020a170902704a00b00161996e0bf4mr5781000plt.118.1654188788922;
        Thu, 02 Jun 2022 09:53:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.53.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:53:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/26] rust-common: Drop LLVM_TARGET and simplify
Date: Thu,  2 Jun 2022 06:51:56 -1000
Message-Id: 
 <cf7c1cde3a3949498d0566e1ac524f8468b91380.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:53:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166501

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This all seems over complicated for something which is basically always
one of two values. This might even help cross-canadian work on something
which isn't x86-64.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bd36593ba3db758b3eacc974e48468a665967961)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cargo/cargo-cross-canadian.inc            |  2 --
 meta/recipes-devtools/rust/rust-common.inc    | 23 ++++---------------
 .../rust/rust-cross-canadian-common.inc       |  1 -
 3 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
index 840793c50b..7fc22a4128 100644
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
+++ b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
@@ -28,8 +28,6 @@ inherit cross-canadian
 
 PN = "cargo-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-LLVM_TARGET[x86_64] = "${RUST_HOST_SYS}"
-
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
 
diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 984fe9099e..3cdce36439 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -120,7 +120,6 @@ def llvm_features(d):
 
 ## arm-unknown-linux-gnueabihf
 DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-LLVM_TARGET[arm] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[arm] = "little"
 TARGET_POINTER_WIDTH[arm] = "32"
 TARGET_C_INT_WIDTH[arm] = "32"
@@ -129,7 +128,6 @@ FEATURES[arm] = "+v6,+vfp2"
 
 ## armv7-unknown-linux-gnueabihf
 DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-LLVM_TARGET[armv7-eabi] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[armv7-eabi] = "little"
 TARGET_POINTER_WIDTH[armv7-eabi] = "32"
 TARGET_C_INT_WIDTH[armv7-eabi] = "32"
@@ -138,7 +136,6 @@ FEATURES[armv7-eabi] = "+v7,+vfp2,+thumb2"
 
 ## aarch64-unknown-linux-{gnu, musl}
 DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
-LLVM_TARGET[aarch64] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[aarch64] = "little"
 TARGET_POINTER_WIDTH[aarch64] = "64"
 TARGET_C_INT_WIDTH[aarch64] = "32"
@@ -146,7 +143,6 @@ MAX_ATOMIC_WIDTH[aarch64] = "128"
 
 ## x86_64-unknown-linux-{gnu, musl}
 DATA_LAYOUT[x86_64] = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
-LLVM_TARGET[x86_64] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[x86_64] = "little"
 TARGET_POINTER_WIDTH[x86_64] = "64"
 TARGET_C_INT_WIDTH[x86_64] = "32"
@@ -154,7 +150,6 @@ MAX_ATOMIC_WIDTH[x86_64] = "64"
 
 ## x86_64-unknown-linux-gnux32
 DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
-LLVM_TARGET[x86_64-x32] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[x86_64-x32] = "little"
 TARGET_POINTER_WIDTH[x86_64-x32] = "32"
 TARGET_C_INT_WIDTH[x86_64-x32] = "32"
@@ -162,7 +157,6 @@ MAX_ATOMIC_WIDTH[x86_64-x32] = "64"
 
 ## i686-unknown-linux-{gnu, musl}
 DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
-LLVM_TARGET[i686] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[i686] = "little"
 TARGET_POINTER_WIDTH[i686] = "32"
 TARGET_C_INT_WIDTH[i686] = "32"
@@ -170,7 +164,6 @@ MAX_ATOMIC_WIDTH[i686] = "64"
 
 ## XXX: a bit of a hack so qemux86 builds, clone of i686-unknown-linux-{gnu, musl} above
 DATA_LAYOUT[i586] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
-LLVM_TARGET[i586] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[i586] = "little"
 TARGET_POINTER_WIDTH[i586] = "32"
 TARGET_C_INT_WIDTH[i586] = "32"
@@ -178,7 +171,6 @@ MAX_ATOMIC_WIDTH[i586] = "64"
 
 ## mips-unknown-linux-{gnu, musl}
 DATA_LAYOUT[mips] = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
-LLVM_TARGET[mips] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[mips] = "big"
 TARGET_POINTER_WIDTH[mips] = "32"
 TARGET_C_INT_WIDTH[mips] = "32"
@@ -186,7 +178,6 @@ MAX_ATOMIC_WIDTH[mips] = "32"
 
 ## mipsel-unknown-linux-{gnu, musl}
 DATA_LAYOUT[mipsel] = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
-LLVM_TARGET[mipsel] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[mipsel] = "little"
 TARGET_POINTER_WIDTH[mipsel] = "32"
 TARGET_C_INT_WIDTH[mipsel] = "32"
@@ -194,7 +185,6 @@ MAX_ATOMIC_WIDTH[mipsel] = "32"
 
 ## mips64-unknown-linux-{gnu, musl}
 DATA_LAYOUT[mips64] = "E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
-LLVM_TARGET[mips64] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[mips64] = "big"
 TARGET_POINTER_WIDTH[mips64] = "64"
 TARGET_C_INT_WIDTH[mips64] = "64"
@@ -202,7 +192,6 @@ MAX_ATOMIC_WIDTH[mips64] = "64"
 
 ## mips64el-unknown-linux-{gnu, musl}
 DATA_LAYOUT[mips64el] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
-LLVM_TARGET[mips64el] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[mips64el] = "little"
 TARGET_POINTER_WIDTH[mips64el] = "64"
 TARGET_C_INT_WIDTH[mips64el] = "64"
@@ -210,7 +199,6 @@ MAX_ATOMIC_WIDTH[mips64el] = "64"
 
 ## powerpc-unknown-linux-{gnu, musl}
 DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-i64:64-n32"
-LLVM_TARGET[powerpc] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[powerpc] = "big"
 TARGET_POINTER_WIDTH[powerpc] = "32"
 TARGET_C_INT_WIDTH[powerpc] = "32"
@@ -218,7 +206,6 @@ MAX_ATOMIC_WIDTH[powerpc] = "32"
 
 ## powerpc64-unknown-linux-{gnu, musl}
 DATA_LAYOUT[powerpc64] = "E-m:e-i64:64-n32:64-S128-v256:256:256-v512:512:512"
-LLVM_TARGET[powerpc64] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[powerpc64] = "big"
 TARGET_POINTER_WIDTH[powerpc64] = "64"
 TARGET_C_INT_WIDTH[powerpc64] = "64"
@@ -226,7 +213,6 @@ MAX_ATOMIC_WIDTH[powerpc64] = "64"
 
 ## powerpc64le-unknown-linux-{gnu, musl}
 DATA_LAYOUT[powerpc64le] = "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512"
-LLVM_TARGET[powerpc64le] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[powerpc64le] = "little"
 TARGET_POINTER_WIDTH[powerpc64le] = "64"
 TARGET_C_INT_WIDTH[powerpc64le] = "64"
@@ -234,7 +220,6 @@ MAX_ATOMIC_WIDTH[powerpc64le] = "64"
 
 ## riscv32-unknown-linux-{gnu, musl}
 DATA_LAYOUT[riscv32] = "e-m:e-p:32:32-i64:64-n32-S128"
-LLVM_TARGET[riscv32] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[riscv32] = "little"
 TARGET_POINTER_WIDTH[riscv32] = "32"
 TARGET_C_INT_WIDTH[riscv32] = "32"
@@ -242,7 +227,6 @@ MAX_ATOMIC_WIDTH[riscv32] = "32"
 
 ## riscv64-unknown-linux-{gnu, musl}
 DATA_LAYOUT[riscv64] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
-LLVM_TARGET[riscv64] = "${RUST_TARGET_SYS}"
 TARGET_ENDIAN[riscv64] = "little"
 TARGET_POINTER_WIDTH[riscv64] = "64"
 TARGET_C_INT_WIDTH[riscv64] = "64"
@@ -325,7 +309,10 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
 
     # build tspec
     tspec = {}
-    tspec['llvm-target'] = d.getVarFlag('LLVM_TARGET', arch_abi)
+    if bb.data.inherits_class('cross-canadian', d):
+        tspec['llvm-target'] = d.getVar('RUST_HOST_SYS', arch_abi)
+    else:
+        tspec['llvm-target'] = d.getVar('RUST_TARGET_SYS', arch_abi)
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
     tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
@@ -360,7 +347,7 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     with open(wd + sys + '.json', 'w') as f:
         json.dump(tspec, f, indent=4)
 
-do_rust_gen_targets[vardeps] += "DATA_LAYOUT LLVM_TARGET TARGET_ENDIAN TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
+do_rust_gen_targets[vardeps] += "DATA_LAYOUT TARGET_ENDIAN TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
 
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
index 827000f7bd..1f21c8af26 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
@@ -25,7 +25,6 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDP
                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                     "
 
-LLVM_TARGET[x86_64] = "${RUST_HOST_SYS}"
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
     rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
-- 
2.25.1



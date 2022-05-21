Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BE7C433EF
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 13:15:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.5440.1653138923143013185
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 06:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d8nRmBMo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 n6-20020a05600c3b8600b0039492b44ce7so5660615wms.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+tb13/iYD4QyK/O2qegz20+8qE4kX29Kkpn713KRGI=;
        b=d8nRmBMooDiImnJxdtkzw7tOXD6qOpV0qx1BvQjeT5dX2I4/W60SP+3lUpkRVTN4sp
         50La432t+0s9rnUCLfwEOtru/coQUbulvVEbo4SP16cax801bLLiO/nvx/NXaOW0qG00
         DGr/+XVng4eLg8Xkx8SzBZ01raXUihfjKzYuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+tb13/iYD4QyK/O2qegz20+8qE4kX29Kkpn713KRGI=;
        b=uQwS77rH/J23NCvA/mH3dgNCqt7d0tKBD5JgdvgJ0h2WeKNDzOxeF1RyEAYZJ32T/X
         aMSIKq6+R98pE3agxSLbLccxlOYGmXPQOjkOkXPmR1YnZ8a7sw+GJSoGYx0k4y/Wdf2S
         VKYekonH1ck2PieuHRFWxzIdwBVJYcqsmX6/XF1Hm0T44CmGijYyvEbZWrOC1ulls70E
         eNsuMSNiGI1+IFTKaBjHOqpccLrdXFcJ+B1nI1q7kVDpQLMZni6m0nVUfZWdKPEv0xxX
         Gb66SBBtGUKNw5GBzBw2EwbzAOpgQXg3kZu3ZcXFtiasRot62oLVXcFsEjkMXeL7uTOj
         ta5Q==
X-Gm-Message-State: AOAM5317nm0+pyONhoajzqNJqJLYv7wEfOVRrnnwDOf19AD8+hCutErQ
	IFPw7rJTy+JaPr+SvXN8E7YtNCpSbtHAe3XM
X-Google-Smtp-Source: 
 ABdhPJyOAN+wUZMCPkP4DvUIzr0oUSioGd585op3y4r28tDYgYoHGhUSqwdrKBsfKx65pT1rKxwDng==
X-Received: by 2002:a7b:c401:0:b0:397:26fb:ebf7 with SMTP id
 k1-20020a7bc401000000b0039726fbebf7mr12537913wmi.90.1653138921111;
        Sat, 21 May 2022 06:15:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d812:46de:9e00:ca1c])
        by smtp.gmail.com with ESMTPSA id
 r11-20020a1c440b000000b003942a244ec4sm4847481wma.9.2022.05.21.06.15.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 06:15:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] rust-common: Drop LLVM_TARGET and simplify
Date: Sat, 21 May 2022 14:15:18 +0100
Message-Id: <20220521131519.179261-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 May 2022 13:15:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165962

This all seems over complicated for something which is basically always
one of two values. This might even help cross-canadian work on something
which isn't x86-64.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cargo/cargo-cross-canadian.inc            |  2 --
 meta/recipes-devtools/rust/rust-common.inc    | 23 ++++---------------
 .../rust/rust-cross-canadian-common.inc       |  1 -
 3 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
index 840793c50bb8..7fc22a4128dd 100644
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
+++ b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
@@ -28,8 +28,6 @@ inherit cross-canadian
 
 PN = "cargo-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-LLVM_TARGET[x86_64] = "${RUST_HOST_SYS}"
-
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
 
diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 984fe9099e21..3cdce3643907 100644
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
index 827000f7bd1e..1f21c8af26ef 100644
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
2.34.1



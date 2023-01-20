Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F5FC38159
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:10 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.82047.1674238270372454591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RKprEnqC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id 200so4583421pfx.7
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R75sAYVtD09sADc4/LsogHekAk2rJFMN9psKMbpzlJM=;
        b=RKprEnqCxeIuXoVw6X2XXVcLNyWvOTsP/NDdaFVgAp0dbrqtVyclikJMHursuiOR6l
         M4gPszISAIhmd/cbeHeg71cYz94MhP9dqeoEWP8UtcbDkhHU1Fx/RI4F1iFtG0NNoCgZ
         aXBjU+G5aFjYtEY1UxeB/pBAC5MT1+842XxRVPX48o7KrDmU7uVUQPOGVr4BtM4VYm/F
         mLtZHUvnXkP0XRzMaIfe82ifLCtmhqSMJzZyCyYu4BE8M/gwup4TuZwYIzXFQrANidly
         +JcMAchh4CU1RRddC1Z6mEWCcMo20w54EY59Qa9rB4yxOEsj4+pkgZbrYvoZ7ZMuIdkl
         pHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R75sAYVtD09sADc4/LsogHekAk2rJFMN9psKMbpzlJM=;
        b=SLyth6jRDcoUIzKvK3cTUPePxgfLrtrbs9tS5gL3O++PYk878bb9bocCb6ZyPb2e8u
         caKucOnule8ZyIeSzvQKrZrLH7g5qoM0Hej3aZ9hH0VRquphrl3nIckTW83gFQL/QAJT
         S+WgPNDOR/mJ/tPyRHLtK0Lm17AhM8jk0A2vg67ABVSjF1yB5b+6hZPn4C/+wIFA/Bh2
         2GXSHdkblduers5HthCC8LipHa4ccWoTmQYgPU2gUQRp1gy32UXlxKacH+JEQtyYMuZA
         xhalt895U6216oL1SZAi0x4mWSZ3/AxQoghtnU3eYF2OmQKYZI3+3mK7TQodULELg60a
         9VCg==
X-Gm-Message-State: AFqh2krmxJmJE2vuUgD5wpVAhGuLvj/2PRLaiTWoaLqWoQN2FY33q38r
	bsoRPpELWXs9UMSUsLYigfQpxarGqYACLYSGbzc=
X-Google-Smtp-Source: AMrXdXtviMP2l8eKqxUMXPKdm7PApwSrnPonppNXe0tV7by/nMP5w5WTKm7M/jWch1wY4exlfCp8jA==
X-Received: by 2002:a05:6a00:2913:b0:58e:1b58:56ec with SMTP id cg19-20020a056a00291300b0058e1b5856ecmr2189770pfb.16.1674238320723;
        Fri, 20 Jan 2023 10:12:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 31/41] rust: Do not use default compiler flags defined in CC crate
Date: Fri, 20 Jan 2023 08:10:48 -1000
Message-Id: <94939f608c6984e3a92999a384a03a35c2b34ed6.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176238

From: Anton Antonov <anton.antonov@arm.com>

Rust crates build dependecy C libraries using "CC" crate.
This crate adds some default compiler parameters depending on target arch.
For some targets these parameters conflict with the parameters defined by OE.

Warnings/errors like this can be seen in the case:

cc1: error: switch '-mcpu=cortex-a15' conflicts with switch '-march=armv7-a+fp' [-Werror]

Lets use only the OE parameters by exporting CRATE_CC_NO_DEFAULTS.
https://github.com/rust-lang/cc-rs#external-configuration-via-environment-variables

This patch fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=14947

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c07089bdf7e0d7d8f37552db0bcd75f860979d9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rust-common.bbclass       | 28 +++++++++++++------
 .../classes-recipe/rust-target-config.bbclass | 16 +++++++++++
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 93bf6c8be6..5e70007377 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -94,7 +94,7 @@ RUST_BUILD_ARCH = "${@oe.rust.arch_to_rust_arch(d.getVar('BUILD_ARCH'))}"
 # Rust additionally will use two additional cases:
 # - undecorated (e.g. CC) - equivalent to TARGET
 # - triple suffix (e.g. CC:x86_64_unknown_linux_gnu) - both
-#   see: https://github.com/alexcrichton/gcc-rs
+#   see: https://github.com/rust-lang/cc-rs
 # The way that Rust's internal triples and Yocto triples are mapped together
 # its likely best to not use the triple suffix due to potential confusion.
 
@@ -125,12 +125,22 @@ create_wrapper_rust () {
 	shift
 	extras="$1"
 	shift
+	crate_cc_extras="$1"
+	shift
 
 	cat <<- EOF > "${file}"
 	#!/usr/bin/env python3
 	import os, sys
 	orig_binary = "$@"
 	extras = "${extras}"
+
+	# Apply a required subset of CC crate compiler flags
+	# when we build a target recipe for a non-bare-metal target.
+	# https://github.com/rust-lang/cc-rs/blob/main/src/lib.rs#L1614
+	if "CRATE_CC_NO_DEFAULTS" in os.environ.keys() and \
+	   "TARGET" in os.environ.keys() and not "-none-" in os.environ["TARGET"]:
+	    orig_binary += "${crate_cc_extras}"
+
 	binary = orig_binary.split()[0]
 	args = orig_binary.split() + sys.argv[1:]
 	if extras:
@@ -154,22 +164,22 @@ do_rust_create_wrappers () {
 	mkdir -p "${WRAPPER_DIR}"
 
 	# Yocto Build / Rust Host C compiler
-	create_wrapper_rust "${RUST_BUILD_CC}" "" "${BUILD_CC}"
+	create_wrapper_rust "${RUST_BUILD_CC}" "" "${CRATE_CC_FLAGS}" "${BUILD_CC}"
 	# Yocto Build / Rust Host C++ compiler
-	create_wrapper_rust "${RUST_BUILD_CXX}" "" "${BUILD_CXX}"
+	create_wrapper_rust "${RUST_BUILD_CXX}" "" "${CRATE_CC_FLAGS}" "${BUILD_CXX}"
 	# Yocto Build / Rust Host linker
-	create_wrapper_rust "${RUST_BUILD_CCLD}" "" "${BUILD_CCLD}" "${BUILD_LDFLAGS}"
+	create_wrapper_rust "${RUST_BUILD_CCLD}" "" "" "${BUILD_CCLD}" "${BUILD_LDFLAGS}"
 	# Yocto Build / Rust Host archiver
-	create_wrapper_rust "${RUST_BUILD_AR}" "" "${BUILD_AR}"
+	create_wrapper_rust "${RUST_BUILD_AR}" "" "" "${BUILD_AR}"
 
 	# Yocto Target / Rust Target C compiler
-	create_wrapper_rust "${RUST_TARGET_CC}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CC}" "${WRAPPER_TARGET_LDFLAGS}"
+	create_wrapper_rust "${RUST_TARGET_CC}" "${WRAPPER_TARGET_EXTRALD}" "${CRATE_CC_FLAGS}" "${WRAPPER_TARGET_CC}" "${WRAPPER_TARGET_LDFLAGS}"
 	# Yocto Target / Rust Target C++ compiler
-	create_wrapper_rust "${RUST_TARGET_CXX}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CXX}" "${CXXFLAGS}"
+	create_wrapper_rust "${RUST_TARGET_CXX}" "${WRAPPER_TARGET_EXTRALD}" "${CRATE_CC_FLAGS}" "${WRAPPER_TARGET_CXX}" "${CXXFLAGS}"
 	# Yocto Target / Rust Target linker
-	create_wrapper_rust "${RUST_TARGET_CCLD}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CCLD}" "${WRAPPER_TARGET_LDFLAGS}"
+	create_wrapper_rust "${RUST_TARGET_CCLD}" "${WRAPPER_TARGET_EXTRALD}" "" "${WRAPPER_TARGET_CCLD}" "${WRAPPER_TARGET_LDFLAGS}"
 	# Yocto Target / Rust Target archiver
-	create_wrapper_rust "${RUST_TARGET_AR}" "" "${WRAPPER_TARGET_AR}"
+	create_wrapper_rust "${RUST_TARGET_AR}" "" "" "${WRAPPER_TARGET_AR}"
 
 }
 
diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 2710b4325d..9158b1918e 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -401,3 +401,19 @@ python do_rust_gen_targets () {
 addtask rust_gen_targets after do_patch before do_compile
 do_rust_gen_targets[dirs] += "${RUST_TARGETS_DIR}"
 
+# For building target C dependecies use only compiler parameters defined in OE
+# and ignore the CC crate defaults which conflicts with OE ones in some cases.
+# https://github.com/rust-lang/cc-rs#external-configuration-via-environment-variables
+# Some CC crate compiler flags are still required.
+# We apply them conditionally in rust wrappers.
+
+CRATE_CC_FLAGS:class-native = ""
+CRATE_CC_FLAGS:class-nativesdk = ""
+CRATE_CC_FLAGS:class-target = " -ffunction-sections -fdata-sections -fPIC"
+
+do_compile:prepend:class-target() {
+    export CRATE_CC_NO_DEFAULTS=1
+}
+do_install:prepend:class-target() {
+    export CRATE_CC_NO_DEFAULTS=1
+}
-- 
2.25.1



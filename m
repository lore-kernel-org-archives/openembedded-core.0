Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45285CCFA16
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 17:16:03 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1232.1762276557051813149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 09:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TG3frer1;
 spf=pass (domain: smile.fr, ip: 209.85.167.42, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59390875930so6962594e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 09:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762276555; x=1762881355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGYCvnfqL3/5mz6X8yBtl7bQgQBCg98RdvWgfl2eTa8=;
        b=TG3frer1wMFwqKUozS/7pyPp2Kb+8PPjOvHAn8tsm37bb8IKvXoLSMyeGVt15+ceCZ
         uKDMD0I7paiUfpLLQpeoyLkw3KE2+ucbAvlZzYw+9DGx3HrWfiGP+3vcEpkYd8EM3dI3
         CpIhG3mtvIFj7Hjpz5Lw2+6S379lmYDNbkSDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762276555; x=1762881355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGYCvnfqL3/5mz6X8yBtl7bQgQBCg98RdvWgfl2eTa8=;
        b=SB+zTlPP8M8PYddk5t/ulfRMqGts2kpHPC9I5K+ybpD4YyXY+cvFlL0vbFX6hff9HO
         9/oolB/2ChjU99Z48jgm1IFpJ1jDLqludWFdxC7gghTWhKypXP/zw65XFH9gTIPWGoZn
         /KDRr9esVlUMu4rSxBNdwl+I2osDE62JwSaCH4EZ8jp7VfvGXprDc2p9LQmlLOfmW0bN
         T9TAuiYRPLK5Zh7GgzH+hIMx1dBoQ9mVZ+n4IPeCaSBXQ/Poo6oQ03CnbvTTlRHwTiwf
         8UDdiFkw8+6eYAerxQgs0C3TEes4SOpSECzzOfye2iNu2X8tf4UjIz42xlxUl9+ddPRX
         q2JQ==
X-Gm-Message-State: AOJu0YzmWq+r8smnxswY3xSljUGGApZ9By4BpfP3NqIYPdcXp3Wcx3iD
	r7z10lfZwM9qVS9dDtYWB6tEUZRXM33CE5OfdOORNvlkWR0Pb8reuxJYJ+6QE9PiUB7RQHu46m1
	2OgTl4sw=
X-Gm-Gg: ASbGncvZD+PHhuoaPqLJ3mMeniCNBX4FfGMGVNrTOfuYRkwsUlLbS7VyE9PKSz4w9BA
	ewaU9XFqpNlM5I3ovxysi952Pvfqs/ySMVT2FMAct7HtB8czrB+nj4CLvdEyJ45Cq2PwiqDG39H
	AEQWfUy9uGM8zo6NyObzNlDJLI7VVfMLOYhLCqv9Hr1WHt0KUWdEud7oNifefr6V75cwHGNkEFN
	MnhjS1tCaKz6ZkeLq9UF2+1+FRlZDjGe00550fjQy8CWGwmGOvzRnEehgdyK6h8ngwhTxVJMdGK
	4EdmM4rvli41D8GfFPqjRgZAAJg4eK+WYQpeMKxDZpd+SfaMHMus2z5g+2NThGP3JygF0Y1xJeT
	BTuiqzoaGVB8so0Xo7vDHwBlPcL4uCVHG+HqnNUAsMoHHyu4ebN5OQv51Ydk42RMLsWt+zzR/SS
	EyaJ6rypn2jTLnNFekghF3/jKEEwW2o6Sl3unZYYnDvxQ3M5r4JMiNvTWrnKplxecSvoB5ug==
X-Google-Smtp-Source: AGHT+IHxeh69d/c4q7PrO2cZ74M6d4288iH4edSvfnZHMiJlhyltZ9BbKAal9GI+jaYd3GxcpDgvgA==
X-Received: by 2002:a05:6512:2389:b0:594:2827:1932 with SMTP id 2adb3069b0e04-59428271972mr3298633e87.32.1762276554729;
        Tue, 04 Nov 2025 09:15:54 -0800 (PST)
Received: from FRSMI25-BOLET.. (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943437efd1sm914407e87.4.2025.11.04.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 09:15:53 -0800 (PST)
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	El Mehdi YOUNES <elmehdi.younes@smile.fr>
Subject: [RFC PATCH 1/4] kernel-yocto.bbclass: Add integrated support for Rust-for-Linux
Date: Tue,  4 Nov 2025 18:16:08 +0100
Message-ID: <20251104171611.2227798-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104171611.2227798-1-elmehdi.younes@smile.fr>
References: <20251104171611.2227798-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 17:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225737

This change introduces a comprehensive solution to build Rust-enabled
kernels cleanly, controlled by a new DISTRO_FEATURE named 'rust-kernel'.

When this feature is enabled, the class performs the following actions:

1.  Appends the necessary native toolchain dependencies (rust-native,
    bindgen-native, etc.) to the kernel recipe's DEPENDS.

2.  Implements a solution for reproducible builds to fix the [buildpaths]
    QA failures.
    To solve this, the rustc flag --remap-path-prefix is used. This
    flag instructs the compiler to replace build-specific path prefixes
    with generic ones in all output, including debug metadata. The official
    documentation for this flag is here:
    https://doc.rust-lang.org/nightly/rustc/remap-source-paths.html

    To apply this flag cleanly, the rust-common class is inherited to
    use its RUST_DEBUG_REMAP variable. This commit extends
    RUST_DEBUG_REMAP with the specific paths for the kernel source (${S}),
    the build directory (${B}), and the native sysroot (${STAGING_DIR_NATIVE}).
    The resulting flags are then passed to the kernel's Makefile via the
    KRUSTFLAGS variable.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 meta/classes-recipe/kernel-yocto.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..e722a7a81d 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -463,6 +463,7 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
+do_kernel_configme[depends] += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust-native:do_populate_sysroot clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot', '', d)}"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
 	do_kernel_metadata config
@@ -491,6 +492,16 @@ do_kernel_configme() {
 		bberror "${configs}"
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
+        # Run the kernel's 'make rustavailable' check.
+        # This is a critical step for getting a clear error message.
+        # Without this check, if the Rust toolchain is incomplete
+        # (e.g., missing sources), Kbuild just silently disables
+        # CONFIG_RUST=y. The build would then succeed *without* Rust
+        # support, which is very difficult to debug.
+        # This command forces an explicit failure if the toolchain is not ready.
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            oe_runmake -C ${S} O=${B} rustavailable
+        fi
 
 	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
 	if [ $? -ne 0 -o ! -f ${B}/.config ]; then
@@ -776,3 +787,11 @@ python () {
 addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
+
+INHERIT:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust-common', '', d)}"
+KERNEL_EXTRA_DEPENDS_RUST = "rust-native cargo-native clang-native llvm-native bindgen-cli-native"
+DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' ${KERNEL_EXTRA_DEPENDS_RUST}', '', d)}"
+RUST_KERNEL_OEMAKE_VARS = "KRUSTFLAGS=\"${RUST_DEBUG_REMAP}\""
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' ${RUST_KERNEL_OEMAKE_VARS}', '', d)}"
+RUST_DEBUG_REMAP:append = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' --remap-path-prefix=${S}=${TARGET_DBGSRC_DIR}/kernel --remap-path-prefix=${STAGING_DIR_NATIVE}=${TARGET_DBGSRC_DIR}/rustc --remap-path-prefix=${B}=${TARGET_DBGSRC_DIR}/build', '', d)}"
+


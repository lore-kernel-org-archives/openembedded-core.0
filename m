Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0F3C54E60
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 16:01:13 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.40409.1710086471233662176
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 09:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PNpIVDbL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dd2dca2007so12273545ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710086470; x=1710691270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbdG0FbeYcVqAxxm94kLrXI40hi+MtGr2ckMRSrQl0M=;
        b=PNpIVDbL728Y0VMOnqoi884z1z+g53rJISudcxi6snNszNDy2AX/CUnxwm3n8SjeOz
         uHEaiMtkrFEojYZzmLkhIzHrCAMQnnz48x9mz4okljeNIiQKYI8tMgi4M1Qew28RsKIN
         JsyElcIRQ2grP4Ck9TKpU8mIxaheqaojIW7tNR57wyNtVR989sE68z3K3l3AP8OvzaE6
         aP/GiWZka/aKpPRITy3fuQIvOtCA77f4baf1TVpvLHMrOfMP9ponhCMrLXVms+wkvNEM
         Qv5r9Mrb1mJg0wGfMBTQNRbA+NpiNPgr10j5KzhgdmxdBMXJo87WUFKBqgpjBdCNIykC
         M9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710086470; x=1710691270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbdG0FbeYcVqAxxm94kLrXI40hi+MtGr2ckMRSrQl0M=;
        b=kuI7A794h47b2fWarvMQwfJa3t+w37QB6XkZbTxE1dZqJo2AhzzhPIa1UGRK/FgmRP
         au7tgFx9ClUGjK56kdhqJOQ0nhID5s6VF1VxN50YBfOhLDfdii6m1uqW7fxzV8O//6Wv
         nxWLTRyjTxYEEHSYyPc/f0T38WU1GIsrqmTqOzuE5dvXCXJR1aSt54A2mOBTTVDDk2tC
         EQCJKYoAQ5CA0r4YIT30g2+ouNYqcqyz8X59434kP6ngQcZ2mGBZO17ERjdFxKlXGoB0
         0pT4AvJ6z94Q9a1NtokfiaIkUUUMigeB7HLuob6TJy7SSNldyB913FSCHlyZ+okarEjp
         7P+g==
X-Gm-Message-State: AOJu0YxtAffLSxJuf41A2COW74ASI2A0BZN0OFJXz9JQUVXHr671lWPo
	4eT5ZMVKY3lmiVxu/JYsS37c3VkL1H/zCz9prmaosBSSNWIb/JZKPjsgamdGQIdGS08214eo+VC
	tq0kpew==
X-Google-Smtp-Source: AGHT+IHkHn8bNyWU6ZBC8LPBxBWzxfWzDsMcviPQGwLR7xJHh7Xz40AHoSXoeTR64+GH8osTI5iNVA==
X-Received: by 2002:a17:902:e748:b0:1dd:1c6f:af52 with SMTP id p8-20020a170902e74800b001dd1c6faf52mr4322708plf.12.1710086470368;
        Sun, 10 Mar 2024 09:01:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902cf4900b001da105d6a83sm2836862plg.224.2024.03.10.09.01.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 09:01:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 5/5] kernel.bbclass: Set pkg-config variables for building modules
Date: Sun, 10 Mar 2024 06:00:54 -1000
Message-Id: <d88e0fa7c5e6c8252f8f775996f512a37fea4818.1710086264.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710086264.git.steve@sakoman.com>
References: <cover.1710086264.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196898

From: Munehisa Kamata <kamatam@amazon.com>

The pkg-config workaround has been applied for kernel image building, but
not for module building. So pkg-config variables are different between
do_compile and do_compile_kernelmodules tasks. It may unnecessary trigger
rebuilding of a few host tools at the later task.

Especially when CONFIG_DEBUG_INFO_BTF is enabled in the kernel, it may even
trigger rebuilding vmlinux at do_compile_kernelmodules due to the rebuilt
host tools such as certs/extract-cert or objtool (on x86). This eventually
creates an inconsistent set of kernel binaries.

Here is the repro steps:

 - Check out nanbield on x86
   - The unexpected rebuild happens on kirkstone or possibly earlier

 - Ensure that pahole is available (e.g. via meta-oe)

 - Set KERNEL_DEBUG to "True" to properly set up PAHOLE
   e.g.
   $ export KERNEL_DEBUG="True"
   $ export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS} KERNEL_DEBUG"

 - Enable CONFIG_DEBUG_INFO_BTF=y
   e.g.
   $ bitbake -c menuconfig virtual/kernel
    -> Kernel hacking
      -> Compile-time checks and compiler options
        -> Generate BTF typeinfo

 - Build the kernel
   e.g.
   $ bitbake virtual/kernel

The BTF information in the resulting bzImage and kernel modules are
inconsistent, because the module's BTF information is generated using the
"second" vmlinux that doesn't have the identical BTF to the "first" vmlinux.
These modules can't be loaded at runtime due to the BTF mismatch.

This also leads to a build-id mismatch between the installed bzImage and
vmlinux since the bzImage is created from the first vmlinux, but the
installed vmlinux is the second one.

  $ eu-readelf -n tmp/work/qemux86_64-poky-linux/linux-yocto/6.5.13+git/image/boot/{bzImage*,vmlinux*} | grep "Build ID"
   Build ID: 4a0d62ee7fef0244950f0f604253729875bea493
   Build ID: fb99b3d91399dbe42bf67ddee59e0f5a0c7f74d9

To avoid the unexpected rebuilding that results in such inconsistency, set
the same pkg-config variables when building kernel and modules. For kernel
5.19 and above, simply set the HOSTPKG_CONFIG in the make command line.

Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd2072e5d953af981339427028e19083257e6a92)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 16b85dbca4..2ff2dff9e2 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -239,6 +239,8 @@ KERNEL_EXTRA_ARGS ?= ""
 EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}"'
 EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
 EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
+# Only for newer kernels (5.19+), native pkg-config variables are set for older kernels when building kernel and modules
+EXTRA_OEMAKE += ' HOSTPKG_CONFIG="pkg-config-native"'
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
@@ -356,9 +358,6 @@ kernel_do_compile() {
 	export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
 	export PKG_CONFIG_SYSROOT_DIR=""
 
-	# for newer kernels (5.19+) there's a dedicated variable
-	export HOSTPKG_CONFIG="pkg-config-native"
-
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
@@ -408,6 +407,13 @@ addtask transform_kernel after do_compile before do_install
 
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+
+	# setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
+	export PKG_CONFIG_DIR="${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
+	export PKG_CONFIG_PATH="$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkgconfig"
+	export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
+	export PKG_CONFIG_SYSROOT_DIR=""
+
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
-- 
2.34.1



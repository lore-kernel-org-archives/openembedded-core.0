Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753B1C54E4A
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:50 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.101514.1709565826743567990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a07YhMtC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2997a92e23bso2759039a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565826; x=1710170626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTmdJzFRLfodyzxSNlD2MC2tcAdl33kqTRxcKCPbP6I=;
        b=a07YhMtC/6U0tyRWQYC6amGET1sAtGSPJAjxRMEsJUc16KrgcOOp7xoiYKeeDQRSvf
         dtEqqGDdVHhyrFid4nHLCF9yjzD1inf4d256KU8HeyQQX5e7nubtyCb/IORDVvRn2C+t
         NKpPXm41RhFIdLd43JRlnLf8tFy4xTGutxSC77kaxKfPMW+EFB2nsUR7rjixrZPdrOc1
         SVYtBNKMkZg83+ATeSjtF904NiSOmQjMjL0tz0suvT61N/bvY2BZ/Fcw40iHQInc7WHJ
         s97sxv4fmX6LUoXjrfbZ3j9iVv5dWMJA8ItJD34BytDHxDCSlXoz6eOJsB1UmUuc++Gr
         sdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565826; x=1710170626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTmdJzFRLfodyzxSNlD2MC2tcAdl33kqTRxcKCPbP6I=;
        b=LJr4Og8G2yGMpnAEss21CPX3Sv7pZENgxqXNh9kCWr4V3mWth3XRIr50IxDoCil8lV
         yL/HSzYlB99kbhSfAHXJkHlDySn/jbrIby5RqkHAFvqxDSsFvyTMoO9vgSlI0ntUBgoO
         WFJibepJcUtU3qz6Skw4wRkTwNf2xb9oOCjLzAPmzxXXdDZhpQZ3t3TQiwXHlUK6Chop
         S+K3jwVBh4O5C2Bnp7ppVbCp6UV7WxgDO1yTDtxpzx40NfZsmG4Rs3u94hOpzYJYAbEf
         3Mam8tdI5mNg3KTTarAe01FvmySHbyY7e6LsnEqtQ563gnwH7+DG1wuVY0GDfz3dUJIl
         tv4A==
X-Gm-Message-State: AOJu0Yz1PJMWitP9MhZ1JjToA1gSobmmjagq48kpDgSvGn2AGF5lswnG
	ggcGdO27xE03SGIbonIdaMvYmOtA614LxaiTPG8JqmrkmiYgIqvcDVdkejlg5hNCxhge9cLJPns
	S9FA=
X-Google-Smtp-Source: AGHT+IE/vVTYnXFH/2xrQ8FClBCv4+j3MTVP5DxOcsmfbkMZJfXwbCAc8M2Cmm/qlpBULcRtrNei9A==
X-Received: by 2002:a17:90a:4813:b0:29a:5c44:2d03 with SMTP id a19-20020a17090a481300b0029a5c442d03mr5886343pjh.27.1709565825980;
        Mon, 04 Mar 2024 07:23:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/11] kernel.bbclass: Set pkg-config variables for building modules
Date: Mon,  4 Mar 2024 05:23:16 -1000
Message-Id: <d63af11e92094487d6e358f27283e5385937e7a8.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196609

From: Munehisa Kamata <kamatam@amazon.com>

[Backport cd2072e5d953 from the master without HOSTPKG_CONFIG setting]

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 96e41b5192..dbd89057f3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -396,6 +396,13 @@ addtask transform_kernel after do_compile before do_install
 
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



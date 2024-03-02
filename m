Return-Path: <kamatam@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FD1C54798
	for <webhook@archiver.kernel.org>; Sat,  2 Mar 2024 23:24:18 +0000 (UTC)
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
 by mx.groups.io with SMTP id smtpd.web10.63254.1709421858184170035
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Mar 2024 15:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=niyCFRFF;
 spf=pass (domain: amazon.com, ip: 99.78.197.218, mailfrom: prvs=784dd95fc=kamatam@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1709421859; x=1740957859;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GXsqG64nHv+WCUSHh12KKZwG1p5WcraIi5CkwRw97nk=;
  b=niyCFRFF5ppZ+BUntZL8gpIuTjO4sSMh4RPRZt0RaHjojPyBybC3sqe4
   p2OSTqQ6luwoS3b7rGGb/k/m9MEw7pk/UxUxYVxHzxmlT7QW/ywG12yVx
   Bdp/71J+pwXr+dM8A+CR4e4NdxiZ8vvVZxuMo7DYILG0E9Mi3OOCslF67
   w=;
X-IronPort-AV: E=Sophos;i="6.06,200,1705363200"; 
   d="scan'208";a="278166849"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 23:24:18 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:40026]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.7.31:2525] with esmtp (Farcaster)
 id 9abcc5cd-d1aa-46e2-a780-74c5c06555f4; Sat, 2 Mar 2024 23:24:17 +0000 (UTC)
X-Farcaster-Flow-ID: 9abcc5cd-d1aa-46e2-a780-74c5c06555f4
Received: from EX19D010UWA004.ant.amazon.com (10.13.138.204) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 2 Mar 2024 23:24:17 +0000
Received: from u0acfa43c8cad58.ant.amazon.com (10.88.187.181) by
 EX19D010UWA004.ant.amazon.com (10.13.138.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 2 Mar 2024 23:24:16 +0000
From: Munehisa Kamata <kamatam@amazon.com>
To: <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>, Munehisa Kamata
	<kamatam@amazon.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] kernel.bbclass: Set pkg-config variables for building modules
Date: Sat, 2 Mar 2024 15:23:58 -0800
Message-ID: <20240302232358.3802416-1-kamatam@amazon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.88.187.181]
X-ClientProxiedBy: EX19D045UWC003.ant.amazon.com (10.13.139.198) To
 EX19D010UWA004.ant.amazon.com (10.13.138.204)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Mar 2024 23:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196553

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



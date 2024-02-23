Return-Path: <kamatam@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C4DC48BC4
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 08:05:35 +0000 (UTC)
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com [207.171.190.10])
 by mx.groups.io with SMTP id smtpd.web11.6270.1708675528053129899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 00:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=E2z7jush;
 spf=pass (domain: amazon.com, ip: 207.171.190.10, mailfrom: prvs=776613517=kamatam@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1708675529; x=1740211529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hP/QpvCiljSDMxQ680dlaAd76cJAaU4zwPyTXG4hKNw=;
  b=E2z7jush1uijC7qvSLaJHCWHOvxRzfQXYnnnNctvWwBfEnIheoPL7evZ
   yz4fumhm3ke5DimQ0QykQAnnf5CWVO2i1OFN1XEQ8a8hr6hiBlG97s0aC
   +EIlkdqpRY1RlzfsXytZvVUKr7LS31jbA9i79t7W12FX1NOKU3ZrdQysc
   g=;
X-IronPort-AV: E=Sophos;i="6.06,179,1705363200"; 
   d="scan'208";a="328788943"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 08:05:27 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:16656]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.229:2525] with esmtp (Farcaster)
 id 5b9097cf-3c66-4650-b964-68c35eb2b92e; Fri, 23 Feb 2024 08:05:25 +0000 (UTC)
X-Farcaster-Flow-ID: 5b9097cf-3c66-4650-b964-68c35eb2b92e
Received: from EX19D010UWA004.ant.amazon.com (10.13.138.204) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 23 Feb 2024 08:05:25 +0000
Received: from u0acfa43c8cad58.ant.amazon.com (10.187.171.35) by
 EX19D010UWA004.ant.amazon.com (10.13.138.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 23 Feb 2024 08:05:24 +0000
From: Munehisa Kamata <kamatam@amazon.com>
To: <bruce.ashfield@gmail.com>
CC: <kamatam@amazon.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] kernel.bbclass: Set pkg-config variables for building modules
Date: Fri, 23 Feb 2024 00:05:13 -0800
Message-ID: <20240223080513.1200106-1-kamatam@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CADkTA4M7qHmuZAst9jHQS52k7SKEjsBhcdeB+HM2TWAEeVdMRw@mail.gmail.com>
References: <CADkTA4M7qHmuZAst9jHQS52k7SKEjsBhcdeB+HM2TWAEeVdMRw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.171.35]
X-ClientProxiedBy: EX19D046UWA003.ant.amazon.com (10.13.139.18) To
 EX19D010UWA004.ant.amazon.com (10.13.138.204)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 08:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196049

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
---

v1 -> v2: Rewrote the commit message with the repro steps

 meta/classes-recipe/kernel.bbclass | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a76aaee5ba..db4461e551 100644
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



Return-Path: <kamatam@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF61C5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 23:44:37 +0000 (UTC)
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
 by mx.groups.io with SMTP id smtpd.web10.664.1708991072478411564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 15:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=ChX89/BO;
 spf=pass (domain: amazon.com, ip: 99.78.197.219, mailfrom: prvs=779f0d7f9=kamatam@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1708991072; x=1740527072;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y4JrCax7LWxFYjjcg4LvZGhHS6cSc1eVfH7AcFfNloo=;
  b=ChX89/BOFJ5cwATuFwl64MhUAX5i3U9EUxLgkAZDdVQf9Ia6vMTMVAbQ
   +PszLc8drL7WS4bx5MohxgDIx2oapJrejCrp/rcySl58mNEJBMcuj8Q79
   cAcLZukNPSEZCiAtJoVHQJE+doIevqyO0psEzvfV/O4dZNgbxE4IlTJH3
   E=;
X-IronPort-AV: E=Sophos;i="6.06,186,1705363200"; 
   d="scan'208";a="68927224"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 23:44:31 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.38.20:55764]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.178:2525] with esmtp (Farcaster)
 id 1ee33e1f-3db9-4119-b835-d7bac6630219; Mon, 26 Feb 2024 23:44:31 +0000 (UTC)
X-Farcaster-Flow-ID: 1ee33e1f-3db9-4119-b835-d7bac6630219
Received: from EX19D010UWA004.ant.amazon.com (10.13.138.204) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 26 Feb 2024 23:44:30 +0000
Received: from u0acfa43c8cad58.ant.amazon.com (10.88.187.238) by
 EX19D010UWA004.ant.amazon.com (10.13.138.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 26 Feb 2024 23:44:30 +0000
From: Munehisa Kamata <kamatam@amazon.com>
To: <openembedded-core@lists.openembedded.org>
CC: <bruce.ashfield@gmail.com>, <kamatam@amazon.com>
Subject: [PATCH] kernel.bbclass: make pkg-config variables globally exported in the class
Date: Mon, 26 Feb 2024 15:44:17 -0800
Message-ID: <20240226234417.270628-1-kamatam@amazon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.88.187.238]
X-ClientProxiedBy: EX19D044UWB001.ant.amazon.com (10.13.139.171) To
 EX19D010UWA004.ant.amazon.com (10.13.138.204)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 23:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196233

Rather than repeatedly exporting the variables in the different functions,
make them globally exported in the class for better maintainability.

This is essentially "v3" discussed in [1].

[1] https://lore.kernel.org/openembedded-core/20240222202827.3675576-1-kamatam@amazon.com/T/#t

Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
---
 meta/classes-recipe/kernel.bbclass | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index db4461e551..fce810a9e4 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -239,9 +239,15 @@ KERNEL_EXTRA_ARGS ?= ""
 EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}"'
 EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
 EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
-# Only for newer kernels (5.19+), native pkg-config variables are set for older kernels when building kernel and modules
+# Only for newer kernels (5.19+), native pkg-config variables are set below for older kernels
 EXTRA_OEMAKE += ' HOSTPKG_CONFIG="pkg-config-native"'
 
+# setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
+export PKG_CONFIG_DIR = "${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
+export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR_NATIVE}/pkgconfig"
+export PKG_CONFIG_LIBDIR = "${PKG_CONFIG_DIR}"
+export PKG_CONFIG_SYSROOT_DIR = ""
+
 KERNEL_ALT_IMAGETYPE ??= ""
 
 copy_initramfs() {
@@ -352,12 +358,6 @@ KERNEL_DEBUG_TIMESTAMPS ??= "0"
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 
-	# setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
-	export PKG_CONFIG_DIR="${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
-	export PKG_CONFIG_PATH="$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkgconfig"
-	export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
-	export PKG_CONFIG_SYSROOT_DIR=""
-
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
@@ -408,12 +408,6 @@ addtask transform_kernel after do_compile before do_install
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 
-	# setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
-	export PKG_CONFIG_DIR="${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
-	export PKG_CONFIG_PATH="$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkgconfig"
-	export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
-	export PKG_CONFIG_SYSROOT_DIR=""
-
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
-- 
2.34.1



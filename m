Return-Path: <kamatam@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59204C5478C
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 20:28:50 +0000 (UTC)
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
 by mx.groups.io with SMTP id smtpd.web11.23483.1708633723579703976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 12:28:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=hUe/zLJu;
 spf=pass (domain: amazon.com, ip: 99.78.197.217, mailfrom: prvs=77545739a=kamatam@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1708633724; x=1740169724;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2s+FMCKhMtpNZx+VJGSEUSd6NSp0HXbaXO5bIQCzCTE=;
  b=hUe/zLJugD/q9UmRgbKX1ATRIv3M//UDjA0NAh0fuL8z4AS/uge+blgt
   15ZY/5cQ+vgmAsNw+IhIC91f8xJQaqQ2PxBnlJgpWx+i0j5BbZqbiIvD5
   ARHxOtF4CScseBdM7jjbwxhKcO1Q4010LPGq8xesQciS5fcvI+We3cqsE
   g=;
X-IronPort-AV: E=Sophos;i="6.06,179,1705363200"; 
   d="scan'208";a="275232339"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 20:28:43 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:55159]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.236:2525] with esmtp (Farcaster)
 id de4a4c75-0e48-44c6-9387-4921c017d782; Thu, 22 Feb 2024 20:28:42 +0000 (UTC)
X-Farcaster-Flow-ID: de4a4c75-0e48-44c6-9387-4921c017d782
Received: from EX19D010UWA004.ant.amazon.com (10.13.138.204) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 20:28:39 +0000
Received: from u0acfa43c8cad58.ant.amazon.com (10.187.171.35) by
 EX19D010UWA004.ant.amazon.com (10.13.138.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 20:28:39 +0000
From: Munehisa Kamata <kamatam@amazon.com>
To: <openembedded-core@lists.openembedded.org>
CC: Munehisa Kamata <kamatam@amazon.com>
Subject: [PATCH] kernel.bbclass: Set pkg-config variables for building modules
Date: Thu, 22 Feb 2024 12:28:27 -0800
Message-ID: <20240222202827.3675576-1-kamatam@amazon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.171.35]
X-ClientProxiedBy: EX19D032UWB004.ant.amazon.com (10.13.139.136) To
 EX19D010UWA004.ant.amazon.com (10.13.138.204)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 20:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196041

The pkg-config workaround has been applied for kernel image building, but
not for module building. On x86, this can trigger rebuilding of objtool
unnecessary at do_compile_kernelmodules task. If the kernel is built with
CONFIG_DEBUG_INFO_BTF=y, the task even rebuilds vmlinux and leads to
inconsistent build-id between bzImage and vmlinux, and also BTF mismatches
between the bzImage and modules.

To avoid the inconsistency, apply the same workaround when building
modules. For kernels 5.19+, simply set HOSTPKG_CONFIG in the make command
line.

Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
---
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



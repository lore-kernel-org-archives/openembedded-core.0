Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77AAC369CB
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 06:47:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.34120.1745304429066806434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 23:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YtsfGR1Q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745304429; x=1776840429;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JA5FjuEIQ8Rsq3XrYYQFrQni+GlHGNUhlJPr1nTQ12Q=;
  b=YtsfGR1Q0Jrp87nXqoiARl2hy+oZdKS0lA2756Ehmo114YPf6TxV8euY
   cKKvZw7TF9oybMqccLWOTy9Vyq6kdi36caNmXNt9N9VazA/GPuC1Ry9xF
   JEKFfetP5PByeVd+/hPu/kUlBQHe1Tszy0bp2MyrLuo5XbPhz2Ahcu0Ck
   7m2u7UYdSlT2XJLnA7z67Wasr2n0M4jV4yE5ab3f0Y2KSXYEdKIK/BCjA
   z+nvTdcbZfPtrYFAKch9ySRjJvamjy/fWa01g1rOYcAt8xOGLV8O+HuNE
   jQwj53EO5DwL/up/cJ0fSV3GXALG/IyriPRarYx5O2tZJLWHiOKZefByE
   w==;
X-CSE-ConnectionGUID: P0QozUYjSXSmONGyKQuHNg==
X-CSE-MsgGUID: KK4dAkfSQ6iWD4l0NJMK/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="200117622"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="200117622"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 15:47:06 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 57669D4F57
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:47:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 17D9FCF7E0
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:47:04 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B6531A0078;
	Tue, 22 Apr 2025 14:47:03 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] llvm: multilib-header fix for llvm-config.h
Date: Tue, 22 Apr 2025 14:46:51 +0800
Message-Id: <20250422064651.824-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 06:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215193

fix the issue that:
| file /usr/include/llvm/Config/llvm-config.h conflicts between attempted installs of lib32-llvm-dev-20.1.2-r0.core2_32 and llvm-dev-20.1.2-r0.core2_64

reproduce steps:
1. Add in local.conf the following lines:

  MACHINE ?= "qemux86-64"

  require conf/multilib.conf

  MULTILIBS ?= "multilib:lib32"

  DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"

2. add lib32-llvm-dev llvm-dev to core-image-minimal.bb

  IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} lib32-llvm-dev llvm-dev"

3. $ bitbake core-image-minimal

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.2.bb b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
index 98855fa4c1..5e2c0e0300 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.2.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "libffi libxml2 zlib zstd libedit ninja-native llvm-native"
 
 RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig multilib_header
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
@@ -155,6 +155,8 @@ do_install() {
     # Try to clean up datadir if it is empty, but don't fail if there are
     # libclc files there
     rmdir ${D}${datadir} || true
+
+    oe_multilib_header llvm/Config/llvm-config.h
 }
 
 do_install:append:class-native() {
-- 
2.43.0



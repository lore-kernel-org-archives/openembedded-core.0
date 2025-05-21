Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17225C3ABC9
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 03:40:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.3043.1747798817680502105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 20:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UviP43qM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747798817; x=1779334817;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Cf7XXNAzv3HOvbnXXu/97Qz4wJNzhU5hf3t259JmKd8=;
  b=UviP43qMu+YPyYM0ppqxC5T2g3UqAIyZjpW+HxRyihesr4S9MtFzhd/a
   iBR0S4b2KtVlUUsxidX16mDlG29UxBaKgV9JUUf/rX8RHdH+NV1dV3HnU
   WrUJ2/PSiB0XgtqxYixox6VbP8Pr4qedrNWxZPmKJD6F+QX6ynIaCA/Bg
   SuXGY12gBOWxBOV8DLxpLpx5Cp65orLHHZqzCuxo4vWvFf/KO5o621i4m
   4vuyxO/uK6UWrM/IVX3zgVauaThueTQ4J2Y+DPOp5zrllohrJ8OkD3C0l
   Fc+AfddjRaBv+MqulIO53vHgKRU7/igTy9Ty/l44Q2kDHJxE7Negqnr6R
   w==;
X-CSE-ConnectionGUID: cNWCXMMnTge/zuqdcRAzSg==
X-CSE-MsgGUID: 5bVHJ7UQTp6szKazRXekhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188115462"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188115462"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 12:40:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A97DE8FE0
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 12:40:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A67FD602B
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 12:40:13 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7DCDB1A0071;
	Wed, 21 May 2025 11:40:12 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] libunwind: disable installation of tests dir
Date: Wed, 21 May 2025 11:40:03 +0800
Message-ID: <20250521034004.1592-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 03:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216964

fix the issue that:
| Error: Transaction test error:
|   file /usr/libexec/libunwind/check-namespace.sh conflicts between attempted installs of libunwind-1.8.1-r0.core2_64 and lib32-libunwind-1.8.1-r0.core2_32
|   file /usr/libexec/libunwind/test-runner conflicts between attempted installs of libunwind-1.8.1-r0.core2_64 and lib32-libunwind-1.8.1-r0.core2_32

By default, test suite from srcdir/tests/* will be installed to /usr/libexec/libunwind, here pass --disable-tests to not install test suite.
Test suite can be added to libunwind-ptest in the future if needed

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-support/libunwind/libunwind_1.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
index 68d7a98ee4..10714ea247 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
@@ -28,7 +28,7 @@ PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,xz"
 PACKAGECONFIG[zlib] = "--enable-zlibdebuginfo,--disable-zlibdebuginfo,zlib"
 PACKAGECONFIG[latexdocs] = "--enable-documentation, --disable-documentation, latex2man-native"
 
-EXTRA_OECONF = "--enable-static"
+EXTRA_OECONF = "--enable-static --disable-tests"
 
 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.43.0



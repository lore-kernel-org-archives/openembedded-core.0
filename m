Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE2BC3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 03:12:46 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.4813.1747278753208318149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 20:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tgiRVDdG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747278753; x=1778814753;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g9Vlr53l7N0Rwej4xbr8/B4260AgHYTvHQ0oQK+TOO4=;
  b=tgiRVDdGAd3ZlCsK6JOKhuXwyynRJU1vpdC/NkMfg51XtZ9hGBEC+Mwi
   JcBIUAVOUKExofQun6jpjeNyL52MBBBwejnYttO+FlIjer3wKh84Gj02A
   VPkOatc6//aQYYVTkto+o4ZE8qt0hvCuYWB4MBEyTcDPZZSRmXhY+2NTg
   McIsVKKXvgUOMHMuU071paf/5qLq+KYkEd+B+uE7JamkKl1/i9533cIGm
   Pd5ErrVrOs0SO3Qh5NJT+1sXkRq/VWkqEiyF3HWUnP/C9OHVgYSraHoZF
   9O60qdVTHp25Gti9DApFhRLINQs3makzWiHRo3MuBsJlDFFxLJQPNXiAv
   A==;
X-CSE-ConnectionGUID: IHpRfCjGQb2f3hlYgW2N2A==
X-CSE-MsgGUID: RHd5KtErR4aZcv/sUDoksg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="199879838"
X-IronPort-AV: E=Sophos;i="6.15,290,1739804400"; 
   d="scan'208";a="199879838"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 12:12:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BE4F6C2266
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:12:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E3AED4BF7
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:12:28 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9ACCA1A0071;
	Thu, 15 May 2025 11:12:27 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] libunwind: fix multilib conflict
Date: Thu, 15 May 2025 11:12:13 +0800
Message-ID: <20250515031214.924-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 03:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216565

fix issue that
| Error: Transaction test error:
|   file /usr/libexec/libunwind/check-namespace.sh conflicts between attempted installs of libunwind-1.8.1-r0.core2_64 and lib32-libunwind-1.8.1-r0.core2_32
|   file /usr/libexec/libunwind/test-runner conflicts between attempted installs of libunwind-1.8.1-r0.core2_64 and lib32-libunwind-1.8.1-r0.core2_32

Pass ${libdir} to configure option --libexecdir of libunwind that it installs
    plugin libraries to /usr/lib{,64} rather than /usr/libexec/

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-support/libunwind/libunwind_1.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
index 68d7a98ee4..1dca39e1b7 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
@@ -28,7 +28,7 @@ PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,xz"
 PACKAGECONFIG[zlib] = "--enable-zlibdebuginfo,--disable-zlibdebuginfo,zlib"
 PACKAGECONFIG[latexdocs] = "--enable-documentation, --disable-documentation, latex2man-native"
 
-EXTRA_OECONF = "--enable-static"
+EXTRA_OECONF = "--enable-static --libexecdir=${libdir}"
 
 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.43.0



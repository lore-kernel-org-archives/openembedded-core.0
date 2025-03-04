Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068C2C282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.18199.1741079368646739157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QXRRuojy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079369; x=1772615369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4/1YYQp4XPkG8RPpnzIWHyccSuAYOQauzDAcOOHeZKc=;
  b=QXRRuojyr7s4HBWIByGRR9u/5CTU4Qd1fBhnRLYuMFLDyntwvxuIsQeb
   wWrueanF85BAO56CfFNNvMrmtLUtKkZPOZ6ot1bILyPEVmLyFEhOno38p
   McYZJP5fPBd/LRpSxAPIFfFdxBUbf/u1/7dhmjknAUTvn6yXQ8sAvgoUd
   87SYb2JPMtxFNaourH1lzaYe9kC0jQpswI2Ib3i2BcqQ0/HYoekCJoJFp
   0kvcWOsHkzVLwb4t8gOfpimnJ1xQrVbq+PFw8RAB7vbV3IMhsbD8h8jsp
   Hn3mw9lkRwakruPJ+R+xBH77ksjntrv2U98+8oUCMdynajDnP/S8e5n6a
   g==;
X-CSE-ConnectionGUID: YU5RyapcTwSCeFcju6n/6w==
X-CSE-MsgGUID: XIxsi+LDQHOru2PD92MbSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="180271619"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="180271619"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:26 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 312E5D6EA9
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E32C8CF7DB
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 738B21A0071;
	Tue,  4 Mar 2025 17:09:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/31] fmt: upgrade 11.1.3 -> 11.1.4
Date: Tue,  4 Mar 2025 17:08:48 +0800
Message-Id: <1741079356-13445-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212230

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed ABI compatibility with earlier 11.x versions on Windows
- Improved the logic of switching between fixed and exponential format for float
- Moved is_compiled_string to the public API
- Simplified implementation of operator""_cf
- Fixed __builtin_strlen detection
- Fixed handling of BMI paths with the Ninja generator
- Fixed gcc 8.3 compile errors
- Fixed a bogus MSVC warning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/fmt/{fmt_11.1.3.bb => fmt_11.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fmt/{fmt_11.1.3.bb => fmt_11.1.4.bb} (90%)

diff --git a/meta/recipes-devtools/fmt/fmt_11.1.3.bb b/meta/recipes-devtools/fmt/fmt_11.1.4.bb
similarity index 90%
rename from meta/recipes-devtools/fmt/fmt_11.1.3.bb
rename to meta/recipes-devtools/fmt/fmt_11.1.4.bb
index 9a2ee396dd..7c860eb608 100644
--- a/meta/recipes-devtools/fmt/fmt_11.1.3.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.1.4.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "9cf9f38eded63e5e0fb95cd536ba51be601d7fa2"
+SRCREV = "123913715afeb8a437e6388b4473fcc4753e1c9a"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3364ECF9C7A
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.9320.1727246989147612632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e+pqwj+P;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246992; x=1758782992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Wms6iYGC5fb04iReyS+v+bCMUpxI/+Lo/yxR8GvydCs=;
  b=e+pqwj+Pu6uWa2zA35VDKgDHRTbuKilAfY/V2tLxUii/2ofJ2bWCp+X6
   PshroodQEh5tL0n5TSs/dl0l1Ols4UHJFsLw4Zh3wz6fczreSwRF42e5R
   PGoTnX3xeKvoJVND8XUmjJq+duNLCEN1sNaGYZwh3uzgQDQxfB3+Igy4G
   82pobBER2sNvx0mywsrYjKg3w3qOOkeq6nb3G9nVoqWPvomxDBV4/AgzQ
   5nm3tNl84GlkjFW1UXvC7BoQq0KHb8SII1eGO734+jg51BQJdNb55N+rB
   ynASCOdZ0FcSw7/pXtlNAWSBTza8SL67LKMTIrZmuuS7lkFm5pcyLdrBJ
   A==;
X-CSE-ConnectionGUID: +nxYWM34S428DAxR7Q/T6g==
X-CSE-MsgGUID: SVTqLNXHTFiBSiLtg6BaKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="162105440"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="162105440"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:51 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 373BFC68E1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 83006D969D
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CD6F20086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BEF7A1A01E9;
	Wed, 25 Sep 2024 14:49:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 41/47] shaderc: upgrade 2024.1 -> 2024.2
Date: Wed, 25 Sep 2024 14:49:14 +0800
Message-Id: <1727246960-20665-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-0.790500-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrUuVVTCQr62rx/es4TBfOp2Pn
	vRfVcWtI0JBo+IVTgnENyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7hEz
	I3+mkzifQNSIDx0xToZg+xMERr0NZeBzEkCCpnRloMLOoNHsM9vWr7HvOSElaSMg2Oe/b8Ey7FY
	/sCUPw04tdCHcgtsOwgDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLOE7hvsnT6jeLMqL
	R9y+LgC2X/uTw5QCC1dDlfAalpC8psoHyXyfiOBEhsJDzpTXIfapChd1jFGmUCu59FpanqfQnXG
	VxD/74eIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204932

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Update dependencies:
  Glslang: top of tree 2024-06-21
  SPIRV-Header: top of tree 2024-06-21
  SPIRV-Tools: v2024.3.rc1
- Build:
  Remove support for VS2017

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../shaderc/{shaderc_2024.1.bb => shaderc_2024.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.1.bb => shaderc_2024.2.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.1.bb b/meta/recipes-graphics/shaderc/shaderc_2024.2.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2024.1.bb
rename to meta/recipes-graphics/shaderc/shaderc_2024.2.bb
index 1f0b12ef57..c658e7df05 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.1.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2024.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "5d7736da11e626b49c5463aadb2afb228ad20276"
+SRCREV = "5dad9194c038702ef20ccabbe4e3c188f2b13cec"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.34.1



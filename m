Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77F8D116FC
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:04 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.5572.1729834798086149420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SCcfboXA;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834798; x=1761370798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4Tdl7UU/H+HVI7mtfKMR/kJWAF45WAjnHBvxF2uzcAA=;
  b=SCcfboXAUtSKdelTv9UYuLLLENH0uh0XiSo29RZw7zP1z0H+h2h3EphI
   n6F4qAhaCIdd5gXsGnlBEy0riLzrvCXeTmyFm4MNvQhiUGtkXEF/fFWz9
   SRAZirZwTYrQGVj8wSCZ/eYKX0GemFGrG2ysqZcx71SAbIkUHj/ooXE8x
   j8L/D7KLP6tmYtwEl0vHvlvDYrNar+4+3G+GWrYzcdbVQj6P805XNz5vp
   bF8lhvG9V4NZ6RE0u0HFR9bj2mPJ5iZO/iGUyzDcc1U4vi9MM369vgXoP
   Av2G04KEV5B7KFVYdn/8scovmyT+Py93MdPFcyQW2vuGsNUwD1ZGwLf0d
   w==;
X-CSE-ConnectionGUID: c+hqILZfTyCE/V58RBStnA==
X-CSE-MsgGUID: uIguZ/vdSGexj8oIYl18Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="165949025"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="165949025"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 615AF16B902
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D8CE17CB3
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C4EE20071A39
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE84D1A000B;
	Fri, 25 Oct 2024 13:39:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/22] i2c-tools: upgrade 4.3 -> 4.4
Date: Fri, 25 Oct 2024 13:39:11 +0800
Message-Id: <1729834769-4717-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10--0.866000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrWfgivgcUPZNqySooRL+R8pKy
	Pf1j7t43W1ufq90t3DTgfUR1p/fGQcgqWOFh1Y7m8IK7yRWPRNF6AgcdfYvhjJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprZiQDIJsDspXbWGLYxxB/4ejxY
	yRBa/qJcFwgTvxipFajoczmuoPCq0l7J6GdErdoPKLWWh1WPsOSfd0qTcgpOnsdisBZ1Y/F0z9z
	1osD1PLgvv5q7sn5LA0efTt9+pHYYXuYNhnrHCucsrt0ofBhgUdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206317

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- tools: Use getopt
       Implement and document option -h
- eeprog: Use force option when data comes from a pipe
- i2cdetect: Display more functionality bits with option -F
- i2cdump: Remove support for SMBus block mode
- i2cget: Document SMBus block mode
       Fix the return code of option -h
- i2cset: Fix the return code of option -h
- i2ctransfer: Sort command line options and add to help text
       Add an option to print binary data
       Drop redundant variable arg_idx
- py-smbus: Install in the defined prefix
	Use setuptools instead of distutils

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../i2c-tools/{i2c-tools_4.3.bb => i2c-tools_4.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_4.3.bb => i2c-tools_4.4.bb} (95%)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
similarity index 95%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
index 4e43c51496..f4881f3c2f 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "eec464e42301d93586cbeca3845ed61bff40f560670e5b35baec57301d438148"
+SRC_URI[sha256sum] = "04d1e3b0cd88df8fb96e7709f374dd0b3561191b4c0363eaf873a074b8b7cb22"
 
 inherit update-alternatives
 
-- 
2.34.1



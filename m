Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C087D59D92
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.35684.1732584619773401044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pbEQfaNJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584625; x=1764120625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bQSc/MsoXV0ZqYLDe3X5wUa+P0tfV77csl30QPaQqA4=;
  b=pbEQfaNJjdlPUrYm9f/8kZbALr5sKByT4AUI6diGBssI3MlZjqkwTKsY
   nYb3baMCTHB+huDad/Wv0T/sAxtLdmu8hGRPSFtCPKOpd+wBwXO2UQDpz
   nCgGbFWn9NeqiPOAMJS2ExiYe60PQt6eUFew0qyZdQF64ETXE3Ia0fP1W
   QKx6KpiUjJsv6mDXfnkDNMhmDiXfkMQ4wK0LkXhNO4/7v9qbspoPFwH0f
   LHASnauXoO6P82Nv5EjZujvEtHcMVHjTFaYXd34iXWaGlYUw4hbMhmBK6
   Cp3NQb2K6ob6aaVk0ENCepcS03GAgdIryNrEthANi22WFp3avQ1yAm76b
   A==;
X-CSE-ConnectionGUID: HfyD2oZZTOyYM4LCMqLpaQ==
X-CSE-MsgGUID: ibq0p32GSLGA3q4MDkTNNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="161094715"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="161094715"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:24 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AD157C2264
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 41951D560C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7944770BF6
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 271C31A006C;
	Tue, 26 Nov 2024 09:30:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/16] re2c: upgrade 3.1 -> 4.0
Date: Tue, 26 Nov 2024 09:30:00 +0800
Message-Id: <1732584602-4785-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.004
X-TMASE-Result: 10--3.111300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSB1x0KuswXklO79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gEQhNjZQYyI3FCedixYXzOrNBd
	ORIzcI4ZtAufOcViGeIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzv4fpP4gfIgZLhC
	iU8AhfwFJgO/cZLf4HcMGAg1lLBzVTDjFNElrZVunngL3qsROhL43ak1L/GkcBF+LxXLfxhsm1C
	I8LxktFiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207820

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://re2c.org/releases/release_notes.html#release-4-0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/re2c/{re2c_3.1.bb => re2c_4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_3.1.bb => re2c_4.0.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_3.1.bb b/meta/recipes-support/re2c/re2c_4.0.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_3.1.bb
rename to meta/recipes-support/re2c/re2c_4.0.bb
index a4b20422f6..fd7d36b632 100644
--- a/meta/recipes-support/re2c/re2c_3.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.0.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0ac299ad359e3f512b06a99397d025cfff81d3be34464ded0656f8a96676c029"
+SRC_URI[sha256sum] = "6281c6bf52e684d5727ac293667c8031a4aa9010636512da5aee45f19987c1ee"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2712E77187
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.116741.1733788630880754443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gVhf3q7H;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788631; x=1765324631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qOw6WenLCmCEzZpUMucHI/cbPwvx1v5U8oj+THf0qvM=;
  b=gVhf3q7HO601+XrjxEUtg6buiS8FnEFN4YRsWiRijymUXy/YjsD/qo+j
   Fo0Gc4mD4aRXRFFhCt/gNe3HdvrB4xhGR6lKsOh/wy5Y7gDkn3dqzsLEN
   k9JBSVoCgUTVJpkEdEt0VCV23lc4l350kiTwtVVKxzIk4YrGxYzINHjld
   hrdX5vL9wJy33Cs9Zhg8t0AK1hT/PANrkggOnFrvPFO1T10wR5C4uiXzu
   cWXod9/Y57qxOvdho+IotfrLlyb0uPOr1qKxfSlj8LHr1KslYXhWee8gw
   y8OBcg8As8TlQIi8x4FBpf5+pVjlIJPVeTKMdzVIOR1rmrzhIN29dIm3y
   Q==;
X-CSE-ConnectionGUID: 01Acfbe2RGSl3PEtgyN6Kw==
X-CSE-MsgGUID: WG/epU/zS3egnD9XLOKO7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="183357529"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="183357529"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:09 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44E1196742
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CD40CFBC0
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 964F920076D0F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2CEC61A006C;
	Tue, 10 Dec 2024 07:57:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 15/20] sqlite3: upgrade 3.47.0 -> 3.47.2
Date: Tue, 10 Dec 2024 07:56:47 +0800
Message-Id: <1733788612-20933-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10-1.880300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z71Wx2uUbPLcO8pJojG7qSpsoi2XrUn/J8m+
	hzBStant0zt8ihye3BAtuKBGekqUpnH7sbImOEBS7SjYM5OsLqogEvD31/I7coNdsvPgEukPxTA
	cBStaxMm35yRCQE7MUorSZ/QRApzjxLqcDPp77nBIGTGCP/p9kKHsKmqsK4vLsfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208510

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../sqlite/{sqlite3_3.47.0.bb => sqlite3_3.47.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.47.0.bb => sqlite3_3.47.2.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.47.0.bb b/meta/recipes-support/sqlite/sqlite3_3.47.2.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.47.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.47.2.bb
index 35cc49aee1..c4acb73ed9 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.47.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.47.2.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "83eb21a6f6a649f506df8bd3aab85a08f7556ceed5dbd8dea743ea003fc3a957"
+SRC_URI[sha256sum] = "f1b2ee412c28d7472bc95ba996368d6f0cdcf00362affdadb27ed286c179540b"
 
-- 
2.34.1



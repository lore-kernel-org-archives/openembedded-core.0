Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C98DC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.12725.1724136754234027356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z6IpXyfI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136755; x=1755672755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5YI457pFvJbw/IeGjR0HQLot8EhNd58lysm3CUJFoME=;
  b=Z6IpXyfIMvf1vXK02cjpdAKMCpSaCgx+qWbUloJOYcbOGJ6B2l+sckwv
   PsSeJEo6FwlBwgV0Q/BQq3MEbVSRxD9aP7MzLKMElxLSbOoBoPIPGiwUi
   zhXBPA1xgG2djZQMuLY70s0orSJ4+qVw7ClqgHBaCiZtGuwVYzjv5xRJG
   rHqlDur2XtkjbWoUhfbGNeu5XDrzZ2aEIFK8j4OODOX+x+7iLTRNDQqn6
   DBZFkSlje8vTbhD90yyPxL+xblmCYAqjyP5tfa9c3j6GQ8mRfg6sStliq
   k6QQgVl9KUnLBYRZdmhRh5qKrnWdqvH/ig+fX0oW90566UbTHrOPoquKc
   A==;
X-CSE-ConnectionGUID: YiY53G15Ry2OH5aYvAsSVQ==
X-CSE-MsgGUID: OJUIQhNbSEmfjjn3GBXizw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="171062419"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="171062419"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:16 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D56ECA1E6
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7545ED7500
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 057D5216F50
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A47E51A000C;
	Tue, 20 Aug 2024 14:52:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/24] libx11: upgrade 1.8.9 -> 1.8.10
Date: Tue, 20 Aug 2024 14:51:31 +0800
Message-Id: <1724136703-20023-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10-2.948600-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJEap0ms6oaKtLG9rp00HaFOjf3A4DTYuF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrX/faje7AxOPBIgVGdBE3jQnvW3yBehWoxcoK4Whmd7XX6cvWCFsBcFz6j
	Z1XGR5npPlvgOd6KGA7SzRlDj/dhoglvIwZ/Y5/h0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203545

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libx11_1.8.9.bb => libx11_1.8.10.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.9.bb => libx11_1.8.10.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb
index 5dcb063473..eda184cb35 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "779d8f111d144ef93e2daa5f23a762ce9555affc99592844e71c4243d3bd3262"
+SRC_URI[sha256sum] = "2b3b3dad9347db41dca56beb7db5878f283bde1142f04d9f8e478af435dfdc53"
 
 inherit gettext
 
-- 
2.34.1



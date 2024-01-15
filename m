Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED23BC47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:04:54 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.73463.1705309490043934210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="134161527"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="134161527"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:04:47 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 47055D63DB
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:04:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F136D5071
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:04:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C97E6B4C3
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:04:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9E6E71A0070;
	Mon, 15 Jan 2024 17:04:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] nghttp2: upgrade 1.57.0 -> 1.58.0
Date: Mon, 15 Jan 2024 17:04:24 +0800
Message-Id: <1705309464-24104-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--0.424600-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrTfK5j0EZbys8a+/GjoiAqlNp
	x0NRruuf7/58yt66/X7Mh6n2zJeIqnjcdYuF61vbRU4X3Mu13Iz/W9duQaNZ5XqSbXH7IxjNqTi
	UsAU6eYJNyZo5o8L48GG2xHh7XPu8pPgGGtEeUXg8+i/lP6Xo8WRVuM5hfkBC855M88ee2L/Fgi
	3ni9mKYOArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslNmVjpriVEtnrix/QSCPuKrpG0
	lipR3CecWOOMOP/tyiVlaIY1waEntaVXJCx4JNCngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSqb
	xBgG0w4h8FqiXaplfY2z7mv6zUijqWV0TSsS8/nXiCLlehE5DCgzt/4W6urmBWR+2fgk0U0kPmW
	oeJRLqk6qpJaTDL3BRe5dZ0JLsdeCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193646

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix build error when both clock_gettime and GetTickCount64 are available
-nghttpx: Shutdown h3 stream write if reset by a remote endpoint
-Bump golang.org/x/net from 0.15.0 to 0.17.0
-cmake: speed up warning option detection
-Update doc
-ngtcp2 has merged BBR and BBRv2 under BBR (fixes issue #1955)
-Bump ngtcp2
-Integration servertester h3
-Refactor character comparison
-nghttpx: Stricter transfer-encoding checks
-Configure cygwin
-windows: Fix warnings
-Prefer clock_gettime if CYGWIN defined
-Bump neverbleed
-Bump ngtcp2
-Bump neverbleed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.57.0.bb => nghttp2_1.58.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.57.0.bb => nghttp2_1.58.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.58.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.57.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.58.0.bb
index 0cf1e3e34c..7b2ff4b778 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.58.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "9210b0113109f43be526ac5835d58a701411821a4d39e155c40d67c40f47a958"
+SRC_URI[sha256sum] = "4a68a3040da92fd9872c056d0f6b0cd60de8410de10b578f8ade9ecc14d297e0"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26914C25B5C
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11718.1713948177341535100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wre0pt5Z;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948177; x=1745484177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vXcZDgr/NxydXih6ITR56oUzSBqBGM1+ptFo9lmNNEQ=;
  b=Wre0pt5ZHoGVteBqQrJQnlo5J6QcCPR6W3UzdPnrg4Jjkdn1glMIWvpQ
   MyDAAj/wsfRIpDohhVlnzDy5Yh4vv0dyY4mxWd2pmj7mffnG9R7jSkhET
   Hvhu65s089dYDAK+rM+Mng2k4CnviBVt0Wbaat8EqZmWI+yo90x3VVZAk
   eAxBXX/uLGYW1ZZr4Ot+sDhY+XR88eypyB/IRo8+aOTbGhcZU/HjDr/hZ
   sGZ00QG87zEJpKCa0+iB3JXYqjXMPGBt7k23xsLTcQ+85tqvTzXFeHxKp
   esh3RWMsYtg7sn081KXudMvBuP8CYdFxD2Js0mhqrBN2rbkwLbrYNVz3g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="145017021"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="145017021"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:42:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 70FBDC2AC2
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3278D96F0
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4AA30202CE13B
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA9D71A000A;
	Wed, 24 Apr 2024 16:42:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/38] dpkg: upgrade 1.22.5 -> 1.22.6
Date: Wed, 24 Apr 2024 16:41:58 +0800
Message-Id: <1713948152-13501-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-1.572800-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yUIIxwDaU5mrCZa9cSpBObmohlnMbn2V9FYM
	JR3dIrh2Mh5q4j58OIvkBJIJYqRkd/mEPaHBc5dLAxFf86Rcir2Uq+GQ/zyJdAc2rQd43YtUxiG
	K5KrHTeHQHqDRRCwfUJ/DgxbxdLnhyarxTb8wldagwCckvT2MZtdAAQaHqlK7SMg2Oe/b8ExdUn
	qWgKkfjSv0u9JM5n7+14gCqeAh8fJaQiLka9EcSj9B1SHosSXQwTlc9CcHMZerwqxtE531VIPcX
	uILVCbaT7RdnDjUyQI65m9meG/WS6/a/Ug5qXLH9DGkDtq4vAyUpb//ZJZA4g9r3iN/4cJv1+0K
	sXaxWz7i8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZImVvj6j3/h4DIyIbe2ByDJ4vzD14LmOIDisXJ
	TBmC+UHybl8VeOq18UFqBNqcW56dmkjde5zb7sxIInhTiTsAB76HompdvvfpLv5Eyr/YIrqsDhz
	tRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198649

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-po: Regenerate .pot files and merge .po files with them
-Dpkg::Vendor::Debian: Unconditionally set qa bug-implicit-func
-build: Fix typo in CI config
-build: Add gen-release script
-test: Skip OpenPGP tests if the backend does not have a verify command
-test: Refactor certfile and keyfile filenames for OpenPGP test
-test: Refactor OpenPGP backend and commands list
-build: Test with minimal library dependencies in CI
-dpkg-deb: Fix up compressor parameters for default legacy format
-man: Document dpkg versions supporting SOURCE_DATE_EPOCH for various tools
-debian: Fix typo in man page reference in changelog
-po: Fix typos in Swedish man pages translations
-po: Update Dutch man pages translations
-po: Update Portugese man pages translations
-Dpkg::Vendor::Debian: Make it possible to disable qa=-bug-implicit-func
-libdpkg: Use a macro to define the zstd default compression level
-libdpkg: Use array access instead of pointer arithmetic for meminfo parser
-po: Update German man pages translation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.22.5.bb => dpkg_1.22.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.22.5.bb => dpkg_1.22.6.bb} (94%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.5.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.6.bb
similarity index 94%
rename from meta/recipes-devtools/dpkg/dpkg_1.22.5.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.22.6.bb
index 9f1d00e208..3f5f7395e0 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.5.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.6.bb
@@ -17,6 +17,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "1c92a4a8bfbeea30ceb0109b096c4ec845e3c6ce"
+SRCREV = "b2f9600ead232a2dd3c27f8b52807a9ca5854d17"
 
 S = "${WORKDIR}/git"
-- 
2.34.1



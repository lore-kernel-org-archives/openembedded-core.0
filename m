Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F3AC3DA50
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.10227.1720604655290238036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BlMYcv00;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604655; x=1752140655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vJBxljnJ+/3/OSRUWyCB6Fzjn/G33FgNgHWKB1VWyrE=;
  b=BlMYcv00nedVA6raUUcvkEDI9ZBWb5c9IzKVsa9TRDe1apyTv2urYE4O
   +TdAF05JqMAscLtyqietT1KRb+OcyiYTidg5X6XSYNglVw6XG9scWp7aQ
   nlVnsBc7kHq3J8ApXs12Xto2hGN8hA2Lpq4Ycof6m5wGFmtZFG3JJj4fw
   4jCiNMdMNx2Lt/FQQ7l5wsDXAzJKrwMPYIEdmwrAeRK7sv0PA8mJo8Qx2
   15BJ+qtqmmThSEba4x4fobEU6LHRlYx8MFOl5bnuP2zjxMUNAVzOHAEIq
   XXkEPZB0lTUORXkC0e3G40d8PIV3gpC//ltfEtrq9Za1qESPBIyu1jb5r
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="166505401"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="166505401"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:12 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AD16D4F55
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F5F0D3F29
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D62CF220028
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8719E1A0002;
	Wed, 10 Jul 2024 17:44:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/30] ccache: upgrade 4.10 -> 4.10.1
Date: Wed, 10 Jul 2024 17:43:27 +0800
Message-Id: <1720604634-23406-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--2.464100-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjFu9dqRsNfOEPJ
	J9tLgfTQd4BOKkI/1xAebEdojyaGby8oE1Ngob6lXrBIbmgBxjwcZfiypOIZ1ZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3vVbHa5Rs8twC0f97LzNGnxKLCLOyCW5DW9n
	uzdghUMjo2a10XPZVUfOhfoy0690QIfku6ZcOLLZ4CIKY/Hg3AaZGo0EeYG978V77yhJRgo99pj
	zubZ2rH33fj+sMArfOUZ3IP5ATaH/HKkdk2nsgKCX0+cksn4sMFsGDtbJAmEYfvqyZxlGvzPqFN
	SmqMmfPNJ9m8upR+H87npZChhWjAxuooKNCHJ3vkD0lBX3fV8f6/2/nZkihaOgB/fz3EXdcVKT0
	eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201701

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Bundle Fmt again

Changelog:
===========
- Fixed prefix command lookup from PATH.
- Fixed detection and usage of system blake3.
- Find CppHttplib named libhttplib.so as well.
- Removed Xcode assembly workaround for zstd.
- Added bundled subset of Fmt again for convenience.
- Removed no longer needed workaround when building downloaded Zstd.
- Documentation improvements
- Clarified that --set-config writes to the configuration file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.10.bb => ccache_4.10.1.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.10.bb => ccache_4.10.1.bb} (86%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.10.bb b/meta/recipes-devtools/ccache/ccache_4.10.1.bb
similarity index 86%
rename from meta/recipes-devtools/ccache/ccache_4.10.bb
rename to meta/recipes-devtools/ccache/ccache_4.10.1.bb
index df169b9c2b..6ae85af4f5 100644
--- a/meta/recipes-devtools/ccache/ccache_4.10.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.10.1.bb
@@ -7,17 +7,17 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=c72fa5755dc70ec5b439212d47299414 \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=73b86311eaf2b66b0d093ec1a15fa60d \
                     file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=5389d9f5a88a138e42ba58894bbceeac \
                     file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
-"
+                    "
 
 DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "16972ba62c8499045edc3ae7d7b8a0b419a961567f5ff0f01bf5a44194204775"
+SRC_URI[sha256sum] = "8f8ad60d9363857812aa8af3fa7fb72be5ea5cf193f824d16d237a8a79256be4"
 
 inherit cmake github-releases
 
-- 
2.34.1



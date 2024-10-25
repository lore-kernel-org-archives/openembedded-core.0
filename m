Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8BCD116F6
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.5567.1729834800597175644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TUi/B1/D;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834800; x=1761370800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kuhWahMkXtOFILKkG1i6SAN7pcsrtYNcfWDGyImQLfM=;
  b=TUi/B1/DEKSUDd03fBf6k1EqdGWyE8r+IU0PAKXKp7ShQo4esXW6GXtu
   SSgdc9EFX5fmWLFKm6f+zlw3PpB0vAH1Of/aOGfxJK9QTF++5yW86PstY
   MJflp7otm2Spj9Jp6P0Wi3ld+TCOr9ZXRJd9rMfYplQicXkwknV7KR9wp
   qizEhRLvnxQRK709m0p8EbEe6Z1X6hYdgfhy0Z7++NA5+9PTVBgbO5GFy
   pFK3jxedgDLKrX1Lj6wRQUXn53WSYutGs7Ps4efYJ83iUXIxwo0Wu7K42
   SoZ56wX8OVROLl1p77KaAAX1DTYbZy6WZkv/b2lLghzwCccFqrNN6XO9N
   g==;
X-CSE-ConnectionGUID: ymIbH8MOT+OPZxWjz7B6Eg==
X-CSE-MsgGUID: /QTQ5j4VQfK/7IQWxQJUOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="166312880"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="166312880"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E75DC68EA
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7507DD3F1B
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1AA2020071A1D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BC9761A000B;
	Fri, 25 Oct 2024 13:39:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/22] libunistring: upgrade 1.2 -> 1.3
Date: Fri, 25 Oct 2024 13:39:15 +0800
Message-Id: <1729834769-4717-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-1.490400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr3f4tgBVXrZ10Tsch72XSbPCY
	Kqf93u4XRRa406V/YwxbfyRJXs6an/4/7++nTNOSfiKzBf4Yf9hUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG30tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt4MO/bx/QBs9dhSHi3coJ6d6kxZKeUX3K+34tbo11og0gMZ67MiyQQLHB9
	biRUZMmTjfrqT4JSqrv19SV6bbAP0zP6VPqUSo1HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206326

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* The data tables and algorithms have been updated to Unicode version 16.0.0.
* New function
uc_is_property_modifier_combining_mark
  and new constant
    UC_PROPERTY_MODIFIER_COMBINING_MARK.
* Fixed a bug in the *printf functions: The %ls and %lc directives could
  lead to a crash on Solaris and MSVC.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libunistring/{libunistring_1.2.bb => libunistring_1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libunistring/{libunistring_1.2.bb => libunistring_1.3.bb} (93%)

diff --git a/meta/recipes-support/libunistring/libunistring_1.2.bb b/meta/recipes-support/libunistring/libunistring_1.3.bb
similarity index 93%
rename from meta/recipes-support/libunistring/libunistring_1.2.bb
rename to meta/recipes-support/libunistring/libunistring_1.3.bb
index 3018dbfdfb..08531acec1 100644
--- a/meta/recipes-support/libunistring/libunistring_1.2.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.3.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
-SRC_URI[sha256sum] = "fd6d5662fa706487c48349a758b57bc149ce94ec6c30624ec9fdc473ceabbc8e"
+SRC_URI[sha256sum] = "8ea8ccf86c09dd801c8cac19878e804e54f707cf69884371130d20bde68386b7"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1



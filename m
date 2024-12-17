Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92399E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.77565.1734425913959706819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GUVuxh25;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425914; x=1765961914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Av+/z7rFtEccKRhziBXXjJxLXChtFi7rXkTz8IeI/x4=;
  b=GUVuxh250KiS5iZgloaZCMffiZ5MuRMgwedtvlLioVv8i7vRW+2F0I3y
   EBPoaWnZhTC7IyKPeUvixjQsiiqSnBEOpvNBJGrNAoDQlXL7ZYqlZzlqf
   sU1sVyit2WjAGBldlOlnS3M4+EhkHabGFHrud3tTo+Oh25QYfHqh2cpDF
   mnzeyqViAD/TubRIqGLap1KfzD55pzj6biUxodd5IWi8MdtdQJNVCEiPn
   50IoWKeUfux7LksDnI7R7+33i/RWDDleR0rzxzgKMKw8PjSV6k6FHqaM2
   aHndwWK5icw54MWcsZui4YYCOrtX3DGWXzS/cV1bCvfS2c1c3rJVqq/8K
   g==;
X-CSE-ConnectionGUID: GGgBI1wJQaKWWfBRAKs1sg==
X-CSE-MsgGUID: 2XxO6ZE5QsGE0trbdPmC+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="172377068"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="172377068"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C678DD6EA1
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C654D21D9
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 349403479C
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE2791A000B;
	Tue, 17 Dec 2024 16:58:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 09/21] libsm: upgrade 1.2.4 -> 1.2.5
Date: Tue, 17 Dec 2024 16:57:55 +0800
Message-Id: <1734425887-18069-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10-1.896500-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yRIRh9wkXSlFX098A7fr3VcOtoIh3n+lYr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Lja+c+9lYurNiL
	P5F13qP7i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFAxo5BB3Of2z89FnZqKQpNc9uE
	fjduJnTd/ve8S3WkeSHB48TgER4+Ny/Iecr0u/rsuijBWf/T4S23qb6GNCOUrCSedixbAS++x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208813

From: Wang Mingyu <wangmy@cn.fujitsu.com>

License-Update:
 Remove "All rights reserved" from Oracle copyright notices,
 since oracle no longer includes this term in our copyright & license notices.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-lib/{libsm_1.2.4.bb => libsm_1.2.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libsm_1.2.4.bb => libsm_1.2.5.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb
rename to meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb
index ab030723c6..52cca2bcd7 100644
--- a/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb
@@ -9,7 +9,7 @@ has a particular state."
 require xorg-lib-common.inc
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c0fb37f44e02bdbde80546024400728d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e04a412a93c7cb2b5e07ebd8fd922917"
 
 DEPENDS += "libice xorgproto xtrans"
 
@@ -22,7 +22,7 @@ PE = "1"
 
 XORG_PN = "libSM"
 
-SRC_URI[sha256sum] = "fdcbe51e4d1276b1183da77a8a4e74a137ca203e0bcfb20972dd5f3347e97b84"
+SRC_URI[sha256sum] = "2af9e12da5ef670dc3a7bce1895c9c0f1bfb0cb9e64e8db40fcc33f883bd20bc"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.43.0



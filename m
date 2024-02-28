Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAB6C54E51
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8391.1709105606647121810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QKK89L2Y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105610; x=1740641610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4ACVg22DaUWIX7ecbWZlmzFuNJUMO61FZCQy3Bz4/Ng=;
  b=QKK89L2YImYIHlSyRO+JJZec9/QEBA5OM/26pboclTt8LGZNrpgOvVqK
   qjUBgbmrch99fi199yJ7iX1aDVC5PQFVdYavuKSaRzCwzeVVgqB7jsPLe
   VxWJ6BWXSWJ6nBR9oznVNu+v9dSBQZFq/oF4T3ZjmF/QKL6yFGS4GFY+J
   uGeV7tDhMYeorYD0eiyZNtA6td5X3jzhHQ3jL5abpDBtCLB66S1rKE2az
   M12121EpAw8nuXhFVlYhV1CxCkxkLBMyhlg6gZhQJS6+nisuMNxUpb9sp
   TpngGtrxpKuS+IL+XLtLzeEYaTztU/gSkzm0q69dvRhd0pDorOV2nMnyt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="130045146"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="130045146"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:28 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AB3ECE8CD2
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DCDFCD7B7D
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 706D7347BF
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1E1DF1A006A;
	Wed, 28 Feb 2024 15:33:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/48] libunistring: upgrade 1.1 -> 1.2
Date: Wed, 28 Feb 2024 15:32:24 +0800
Message-Id: <1709105575-24259-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--10.734800-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yR2WoeMWnbVWjkDrBOJwwnS3Stk62MqiCGDO
	wqlK4VLvdnLCqPd2a8cQDbmeVdPdBL1MabCtVw9LQgjHANpTmavd/i2AFVetnXROxyHvZdJs8Jg
	qp/3e7heWJXSl/T5GYDX29y+TtMf9GXlxiKuY9Yr4FqzGb25nh6zghBiD4bcIOT3+89TCwZ4fQa
	rqCH5mUOuUQ4eZ12S0Dcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4IxtnbmU
	bkSsKD22uhBCcgvx7ZPBLaVQOnK5gm5tOOdRlSN3QqJN4m15UF9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO14uFxKD13nMTUvsryWf0b8Ig/b88Cq7m4Z9/LqQ3sBIsFQy0xA5Q50
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196341

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
===============
doc/libunistring.texi (Conventions):
 Explain the (resultbuf, lengthp) return value convention from the user's point of view.
doc/libunistring.texi (Include files):
 Fix documentation of _LIBUNISTRING_VERSION and _libunistring_version (incorrect since 2010-05-14).
 Add documentation of _libunistring_unicode_version.

Changelog:
=============
* The data tables and algorithms have been updated to Unicode version 15.1.0.
* New functions u8_pcpy, u16_pcpy, u32_pcpy, similar to mempcpy.
* New functions uc_indic_conjunct_break_name, uc_indic_conjunct_break_byname,
  uc_indic_conjunct_break.
* New functions
    uc_is_property_prepended_concatenation_mark,
    uc_is_property_id_compat_math_start, uc_is_property_id_compat_math_continue,
    uc_is_property_ids_unary_operator
  and new constants
    UC_PROPERTY_PREPENDED_CONCATENATION_MARK,
    UC_PROPERTY_ID_COMPAT_MATH_START, UC_PROPERTY_ID_COMPAT_MATH_CONTINUE,
    UC_PROPERTY_IDS_UNARY_OPERATOR.
* New constant _libunistring_unicode_version.
* The UTF-8 decoder functions, especially u8_mbtouc, are now more Unicode
  Standard compliant.
* The *printf functions no longer support the %n directive, for security
  reasons.
* Fixed a bug in the *printf functions: In the %U, %lU, %llU directives, a
  negative width given as an argument did not trigger left-justification.
* The functions u16_strstr and u32_strstr now operate in worst-case linear
  time.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libunistring_1.1.bb => libunistring_1.2.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libunistring/{libunistring_1.1.bb => libunistring_1.2.bb} (85%)

diff --git a/meta/recipes-support/libunistring/libunistring_1.1.bb b/meta/recipes-support/libunistring/libunistring_1.2.bb
similarity index 85%
rename from meta/recipes-support/libunistring/libunistring_1.1.bb
rename to meta/recipes-support/libunistring/libunistring_1.2.bb
index 009707a54a..3018dbfdfb 100644
--- a/meta/recipes-support/libunistring/libunistring_1.1.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.2.bb
@@ -16,12 +16,12 @@ SECTION = "devel"
 LICENSE = "LGPL-3.0-or-later | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=3a896a943b4da2c551e6be1af27eff8d \
-                    file://doc/libunistring.texi;md5=266e4297d7c18f197be3d9622ba99685 \
-                   "
+                    file://doc/libunistring.texi;md5=36b7d20daef7fbcc032333ae2429aa94 \
+                    "
 DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a2252beeec830ac444b9f68d6b38ad883db19919db35b52222cf827c385bdb6a"
+SRC_URI[sha256sum] = "fd6d5662fa706487c48349a758b57bc149ce94ec6c30624ec9fdc473ceabbc8e"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1



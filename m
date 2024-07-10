Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D855C3DA49
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.10247.1720604662823746588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I0a//bZ1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604664; x=1752140664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wQxNJWEBCjtfnl00f1dsME4gxC+Zl25MqpjZEWmgfWU=;
  b=I0a//bZ1k5vkOfIIVu95JK4pdf+LM85t4SgEW5iqGn+JKU+cYyFcuFk/
   C5C93TJLrLEqyd/UHPX/MIXe2XzQ/YeRx7iUMa2dk0kTrs/cztVzySk+c
   OnHd3etewdhmUZBz57Dr3MVAhZ8ogCZTOmrt30fed6jPmiybC8+2h5xt0
   Mkte26DIgF4HpSfmdG2qpdnP5a4kNzt/TBflRT06QJfRE0dVF3Qb4nPvA
   jWqUJ5sB5FlxK2Hw4SrMI78ydBTP9CzAl62EWZo+p2YkwLZIPDyNi4QTR
   D1KHTCpRM4BnvoteRcCw2OSaGDRb1XHJDoen0BXUyFoL2Feb3LRAAoV/O
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="168420922"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="168420922"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:20 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 04EB6D4F54
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5312A13F3E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9E6F220028
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8B9BD1A000C;
	Wed, 10 Jul 2024 17:44:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/30] pinentry: upgrade 1.3.0 -> 1.3.1
Date: Wed, 10 Jul 2024 17:43:45 +0800
Message-Id: <1720604634-23406-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--5.111800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yTo39wOA02LhpxAd6mi1Ga1s1Ir4NZzFmoiL
	DMCX3SQ8KqrQ7lLcMnyK8WnR386CVm0Xr+fj3ww/8t4fUUGeErRv8DQO96Tvf8C5DTEMxpeQFH0
	IKehhaobrME+4JvD76fm2FOJn9xXpGAdnzrnkM48URSScn+QSXt0H8LFZNFG7/nnwJ52QYi/M/g
	Wu/p797rBi2IVjE5dtN0HwB2vlzQrKf1seUNQZ6Wy8DOCdAiCrftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201721

From: Wang Mingyu <wangmy@fujitsu.com>

libassuan_pkgconf.patch
refreshed for 1.3.1

Changelog
===========
* qt: Install and use pinentry icon.
* qt: Small fix for Qt5.
* qt: Fix Windows build of Qt6.
* New envvar PINENTRY_KDE_USE_WALLET to enable the secret storage
  integration on KDE.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gpg-error_pkconf.patch                                  | 0
 .../libassuan_pkgconf.patch                                 | 6 +++---
 .../pinentry/{pinentry_1.3.0.bb => pinentry_1.3.1.bb}       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry-1.3.0 => pinentry-1.3.1}/gpg-error_pkconf.patch (100%)
 rename meta/recipes-support/pinentry/{pinentry-1.3.0 => pinentry-1.3.1}/libassuan_pkgconf.patch (97%)
 rename meta/recipes-support/pinentry/{pinentry_1.3.0.bb => pinentry_1.3.1.bb} (93%)

diff --git a/meta/recipes-support/pinentry/pinentry-1.3.0/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry-1.3.1/gpg-error_pkconf.patch
similarity index 100%
rename from meta/recipes-support/pinentry/pinentry-1.3.0/gpg-error_pkconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.3.1/gpg-error_pkconf.patch
diff --git a/meta/recipes-support/pinentry/pinentry-1.3.0/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry-1.3.1/libassuan_pkgconf.patch
similarity index 97%
rename from meta/recipes-support/pinentry/pinentry-1.3.0/libassuan_pkgconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.3.1/libassuan_pkgconf.patch
index bee9acd081..f2d50010c5 100644
--- a/meta/recipes-support/pinentry/pinentry-1.3.0/libassuan_pkgconf.patch
+++ b/meta/recipes-support/pinentry/pinentry-1.3.1/libassuan_pkgconf.patch
@@ -1,4 +1,4 @@
-From fb6179fabb5e793a83cbb0d0d45814d99b97807a Mon Sep 17 00:00:00 2001
+From 1bf04756b90832494020c39661ea944a0b11204f Mon Sep 17 00:00:00 2001
 From: Armin Kuster <akuster@mvista.com>
 Date: Thu, 22 May 2014 10:50:00 +0100
 Subject: [PATCH] libassuan: Improve pkgconfig support
@@ -15,10 +15,10 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  2 files changed, 9 insertions(+), 89 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f04c00d..8e6da5c 100644
+index 4944f7c..f03cbb7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -263,8 +263,8 @@ if test "$have_libassuan" = "yes"; then
+@@ -264,8 +264,8 @@ if test "$have_libassuan" = "yes"; then
                       [version of the libassuan library])
  fi
  
diff --git a/meta/recipes-support/pinentry/pinentry_1.3.0.bb b/meta/recipes-support/pinentry/pinentry_1.3.1.bb
similarity index 93%
rename from meta/recipes-support/pinentry/pinentry_1.3.0.bb
rename to meta/recipes-support/pinentry/pinentry_1.3.1.bb
index 6ce873871b..14b368177c 100644
--- a/meta/recipes-support/pinentry/pinentry_1.3.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://gpg-error_pkconf.patch \
 "
 
-SRC_URI[sha256sum] = "9b3cd5226e7597f2fded399a3bc659923351536559e9db0826981bca316494de"
+SRC_URI[sha256sum] = "bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04"
 
 inherit autotools pkgconfig
 
-- 
2.34.1



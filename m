Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F792C54E5A
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8391.1709105606647121810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dF/yutH5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105607; x=1740641607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KnO22+i9s6Q25Ip2T6bfeXSSY9t2C5hRueM0+le1gqY=;
  b=dF/yutH5/vz1AKL1cXPcdDUI2igGhalOI5SXCUPsv6z19+TtucllBvWn
   /mnUBTPT+hQxpz9zbZ1mxMkUZLAUknqcn1sqD8LlDrsmcEEqAa71WeFUa
   C9dKwKqVqc60zgi6DOEh1AOfLYzhw3ujSHeMJW8VdCVqywCE8//YOdq2Z
   6fzeZu2VxBLZoP640Q/EewbYdcgUDa9UVGutZjuMsQemCGoGUOG/kAYjI
   z4Q9clVOxJYXvVH/K+geO188KCDj4OJz1HKLpfm2VPkDMOVHcBUYschus
   TprBQZt1UZ3j6nhCrXxZOZCPyB8asPplbgpYXfwHJxJ9kApBTWlsT3oO8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="130045137"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="130045137"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:25 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C78627A808
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A205DD7B7D
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B0D52008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D2B861A006A;
	Wed, 28 Feb 2024 15:33:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/48] libksba: upgrade 1.6.5 -> 1.6.6
Date: Wed, 28 Feb 2024 15:32:19 +0800
Message-Id: <1709105575-24259-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-1.466400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbysRt1EvyOXA0dHP
	vwtR3Bjz4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0544jqjGwEhbwS5wM
	PMqdPNSwzatuHuXx5hPO14swvI6zRXYtXed01SF/dCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtut+V4SxDUehJaGgBaP+vErA5NnlY19gTXzgu5T7xkUa6K7EBa8NuJoEgs
	OwoPJkHGP51jhINtmaHyOtpWRdRQIvsga/WHOkBHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196337

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix a possible wrong error return from the DER builder.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libksba/{libksba_1.6.5.bb => libksba_1.6.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libksba/{libksba_1.6.5.bb => libksba_1.6.6.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba_1.6.5.bb b/meta/recipes-support/libksba/libksba_1.6.6.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.5.bb
rename to meta/recipes-support/libksba/libksba_1.6.6.bb
index 62ba73d2d5..2230a032f6 100644
--- a/meta/recipes-support/libksba/libksba_1.6.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.6.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "a564628c574c99287998753f98d750babd91a4e9db451f46ad140466ef2a6d16"
+SRC_URI[sha256sum] = "5dec033d211559338838c0c4957c73dfdc3ee86f73977d6279640c9cd08ce6a4"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.34.1



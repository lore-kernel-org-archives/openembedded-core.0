Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82ACC3DA4E
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.10245.1720604657638805985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W0z/Pa8e;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604657; x=1752140657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OjCyMQFbGmS9+Xp37rvCadbVslZh5S+lT3BBXX1lW8Y=;
  b=W0z/Pa8eEjsBGUujYqr+kgQpBSag77Jm56xWVcaAy80AG/2dkpS75Ga0
   6UvmrJ8O7j9x+aIV4dCDn1Kmnx1LnTJAaae0jhvWi/TPD1PE9hU2Yl03V
   aXTENiS7dbp8cIZpc6RVAKRwFrDV93dRc9xzOO3EUItx/kdBQZQusP8ku
   othr6glQtj8v8Ro9lfBwRQi7aL7WjeB33sco/gaHzZF011Bro9+eRoFVg
   bNoL5QTF9InP8VsNtni/Cr1h0wzRe4qAz0AU6z9UIcCypi5bcmzCA3vC/
   +lyCIkg/Fq7lXzjavLq9yp1vz76IVkaNnieWyLH3Wg2lfZcMpd3p0brKV
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="154818587"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="154818587"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1254BD4256
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 55593D8AF0
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E8473220028
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 982671A0002;
	Wed, 10 Jul 2024 17:44:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/30] diffoscope: upgrade 271 -> 272
Date: Wed, 10 Jul 2024 17:43:31 +0800
Message-Id: <1720604634-23406-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--1.168600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvOvY1zctlJ9TNAY
	WUo4HSIkWGH5wVAlhqHmUGgQxKjkmx2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnE6Po
	oNqqZn93i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFJzJcvAhlomEwGKGOnQ0Fgw+v1
	X/Ecx2TX6+Vd33j7IDXF9Ia8wkH76iVN3t94lrle9shGHVyAfnj0zyvXsjVnzZC4gkn60n/ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201704

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Move away from using DSA OpenSSH keys in tests; support has been removed
  in OpenSSH 9.8p1.
* Move to assert_diff helper in test_openssh_pub_key.py

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_271.bb => diffoscope_272.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_271.bb => diffoscope_272.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_271.bb b/meta/recipes-support/diffoscope/diffoscope_272.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_271.bb
rename to meta/recipes-support/diffoscope/diffoscope_272.bb
index a8443183ec..55e4cc7832 100644
--- a/meta/recipes-support/diffoscope/diffoscope_271.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_272.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7690f284a84a866c6f89fa5bb33a867574417ee1c5f2c6d49655cd3761d0fe2c"
+SRC_URI[sha256sum] = "f8983580efb8f4644719705590a43817d1159d4136836d7ce6dd4fec754c3943"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B759C2BD09
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.64030.1718936235260504963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ieFZ3Ni4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936240; x=1750472240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/eBCfmUVXwdLwToA19ehM0YdFB92c94vVTbst5L2b10=;
  b=ieFZ3Ni4ZI0r7tdc/tffBTBTgM2Ko62PMUw71jInzmvTxBGv3LKzYNqL
   3xdKIAOIU5EG0oRcsu6ZOnA1cXHkLO20tdyyWMCIywHJZa6gHMR+59W1g
   odxnW0FBBLsuYyZVXl8OPL/xE99dvwpq1xJSjl443GS+D9yqyl5i/u4+t
   X7LxBa7AiRSOm+IGxO7sQEei7gB62vdJA3r1Kiji9Jh9TU7d90cDn+8Vm
   5d7mAjxy2XEDClYghkdRfTlqr3wqz2Cb7VZkdetAHU1ZgHbdvXg/EiQzO
   yrOiTvbg5oBr5taeYwRB8f6Bru7lDs/aVaMrYFWhkpzf5DSPbi9vw+0q0
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="152738583"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="152738583"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:19 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C0E03E8D40
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 090D1D8B3C
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 95E19E4A9D
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 47C8B1A000C;
	Fri, 21 Jun 2024 10:17:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/22] pciutils: upgrade 3.12.0 -> 3.13.0
Date: Fri, 21 Jun 2024 10:16:44 +0800
Message-Id: <1718936206-8080-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10-0.056200-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTFQnI+epPIZgPgeggVwCFsDt
	xqCDKPpFFVnqm/OFhIhbZ90YIk0JNI0BNOD/HJdhVfLHMdWDkKhJziJDtUPgzZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprZiQDIJsDspXY8r/ndGdDsWNzf
	N/81GnbuLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUknmYqLbpH1S0OzWDmgGmXz890
	cjleh8MpoKWXTHAJA4ry8ObBmIhRyP8RRMZUDCz1xw6EONKUYXO/t70j7wXdSiIqJxBmoYY7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200980

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* lspci decodes CXL 1.1 device link status information.
  This requires a recent kernel which exports rcd_* atributes via
  sysfs.
* Further development of the pcilmr (the link margining utility)
* Dump parsing supports 6-digit domain numbers.
* Bug fixes in PCIe link state reporting.
* Decode more fields in PCIe AER capability.
* Fixed build on Linux systems with musl libc.
* Updated pci.ids.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pciutils/{pciutils_3.12.0.bb => pciutils_3.13.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.12.0.bb => pciutils_3.13.0.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.12.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.12.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
index 2db0895bf4..0b876c7070 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.12.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "make-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f185d116d5ff99b797497efce8f19f1ee8ccc5a668b97a159e3d13472f674154"
+SRC_URI[sha256sum] = "77f11f78298502634d1af50308f15a5788629f6cf45cba376f5009aea4cb4926"
 
 inherit multilib_header pkgconfig update-alternatives
 
-- 
2.34.1



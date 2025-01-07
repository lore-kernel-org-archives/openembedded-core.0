Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31D5E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:35 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.16403.1736240493843127112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oKS2Donr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240494; x=1767776494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=C/CShAaj14opzigRF7muECJ2W9z9dHLDlzc3yI57vz8=;
  b=oKS2DonrwAz0ejQ77nFeYRJ5bmrS8cxe54UvnbYBoCm1u2MyZvmcdOIa
   yDLkoQI9NQE2x1LQje5Y8L2qwF8owL5SiVISjkGoLVO0ASLzipFlSX8UF
   zN5bjVKGhAjQSS6k/3H2Ki4oH64nkkE6rpqJQf3vABIhnniOz+jiIlvBO
   fAFPVk6a2ScUMUDmc9Q64m+PoirxKM/PE8aLLH+lrPD482IGbVfBC9RFu
   fDkr0aoCyoFiIYu4MDgW/PNK5KNico4WEBWReZLwE1oGbWEwookb4gDYq
   rxGc29uhj7mLosyaJ9bplNndrpd0dJraQu7rei2L33DNEBruOtC4lvRTU
   w==;
X-CSE-ConnectionGUID: IoeIMAwDRROlp/iMLD+t/Q==
X-CSE-MsgGUID: 7wpfQ+BoSoOrdOiiaHW0Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="186036795"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="186036795"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 355B8D4C4A
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0EF25D728D
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A538A200930C8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C6A91A0003;
	Tue,  7 Jan 2025 17:01:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/13] stress-ng: upgrade 0.18.07 -> 0.18.08
Date: Tue,  7 Jan 2025 17:01:20 +0800
Message-Id: <1736240482-5243-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-1.138400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4BqkHTV8zp2nwH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRvAQzqh8D4IY5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SVVoukA+lnHZt9o/YzpWIqoSuMaMu0PnrAPQPT5Iw5S/c59
	7ZhTo0A3UME60Pj9LHBDNoigtW7UfYUTQdQINYzwhnK1/nxNjVS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209438

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.18.07.bb => stress-ng_0.18.08.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.07.bb => stress-ng_0.18.08.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.07.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.08.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.07.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.08.bb
index cc12edbbf4..f779f6fe6a 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.07.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.08.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "27f1171ff0718e67eac0730df34cbfd97aca587b"
+SRCREV = "0b0317597016ea89498570ed2621ee5ebeea768c"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.43.0



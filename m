Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD95D59D9C
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.35685.1732584621365787755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Cix+qO6J;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584622; x=1764120622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vp5yqMCYGoT9QyNp03YKsIw281E/jTFVsmv5AHhj3Oc=;
  b=Cix+qO6Jy63TOjtteG82KZ4Lim8iJCRSUTabTr6EpTO25YInSh67P2L6
   t/EdY1ERIc12tYOtaHNtrxFANr2gUEpaqwfllDUKh6n2hjaxwfnFdXfNK
   70JIw57Hj3ckORfjFnczImbcXhS9czNIqGQyRoVySBUkl/NCCtaz4nNWL
   SjCDVAmt+fHNL/3+GdZemlQLwDoUdmyGltWL6qCPNszPumPRYxfjnFcGC
   53azHw+MFB0iS3+92lV1JxWqtzOP4smBb91BHFw4X7wNjdKIAOhfk8LJN
   /J4RyMtjWJ4kIuiV60Iif8FdUL7JJG5xuQD5tkCi2KGs6zrLWgne6NCkS
   A==;
X-CSE-ConnectionGUID: MQGoHuGURGOBQbBCYIFHqA==
X-CSE-MsgGUID: LPcu4hFrRyy4tlPhi9ZSXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="181671584"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="181671584"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:19 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 18CE7C2264
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A9231BD7F0
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2576E21D17F
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C69CA1A006C;
	Tue, 26 Nov 2024 09:30:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/16] lsof: upgrade 4.99.3 -> 4.99.4
Date: Tue, 26 Nov 2024 09:29:53 +0800
Message-Id: <1732584602-4785-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.004
X-TMASE-Result: 10-1.911600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2sSuJRtSU84o3gcxJAgqZ0ZaDCzqDR7DPYxXH/dlhvLv/GmNQuSBG+Fo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKIho0KKgnPlpw/TVhLhxlamqYZQYGoDEAxz3
	xK05DdTPDrl/OVf6e9+4W2lrjhuZREGnGGH19JV4J3ccRxudmBNPJZmbB4dm7+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207815

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/lsof/{lsof_4.99.3.bb => lsof_4.99.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lsof/{lsof_4.99.3.bb => lsof_4.99.4.bb} (93%)

diff --git a/meta/recipes-extended/lsof/lsof_4.99.3.bb b/meta/recipes-extended/lsof/lsof_4.99.4.bb
similarity index 93%
rename from meta/recipes-extended/lsof/lsof_4.99.3.bb
rename to meta/recipes-extended/lsof/lsof_4.99.4.bb
index 93e91fb427..f1ec650029 100644
--- a/meta/recipes-extended/lsof/lsof_4.99.3.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://remove-host-information.patch"
-SRCREV = "2e4c7a1a9bc7258dc5b6a3ab28ebca44174279a8"
+SRCREV = "bbf320ce586a848f880bca7b758d50ae4c712624"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



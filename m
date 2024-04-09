Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323AACD12A5
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:58 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.130220.1712646652702382321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VNBg6Vz2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646653; x=1744182653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fyCPsSTESGH8ManEDePVfqV8LsliaiKi12JDfzA4GJw=;
  b=VNBg6Vz2MilUV3QRx6cQJGmPnKMtCFodFLedJeLxw1SHXByZHFaXVo4H
   Zq6rggpEcOP9nunexqWrR7xTpXxBsaZ+CRrG2iyVdVrGiW+se5uGUgioD
   Mo7mLFRacJA4iso94LLjnHcCP7e/1YnOsPiVAaouwg6uKhYekZGn2ex1a
   ncsfYiw12+dpEvfE55Bw0cWc+tv3X7uiEgqAzx/jQdWo+Vhx0N0dLM8qL
   8hPm1YeKJ956E7g4LbCzqAKHPRiZk31ukdDWmfdzScg1lisVW8L5FhAIJ
   1IoyxSLg7bNVGQySOE/V4sBkwSGW0Dx5iqkPEs9KCh0SHqaSCZVorDsbK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="156937706"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="156937706"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 429CDA345A
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 80DE43742F
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1041820093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B39D91A0002;
	Tue,  9 Apr 2024 15:10:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/33] python3-beartype: upgrade 0.17.2 -> 0.18.2
Date: Tue,  9 Apr 2024 15:10:11 +0800
Message-Id: <1712646620-16608-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXItHho7wgjNkNnYYqzvHd2TxB9WsSZipYsoC4
	4VEWsiR9TN1lN+8YBqtEWYRaWiPCZ4u7+Ro+e9hllePBiTZHZuoz6YBxH9RST+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198042

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-beartype_0.17.2.bb => python3-beartype_0.18.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.17.2.bb => python3-beartype_0.18.2.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.17.2.bb b/meta/recipes-devtools/python/python3-beartype_0.18.2.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-beartype_0.17.2.bb
rename to meta/recipes-devtools/python/python3-beartype_0.18.2.bb
index 05fd74543b..1b6ab6a42b 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.17.2.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.18.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
 
-SRC_URI[sha256sum] = "e911e1ae7de4bccd15745f7643609d8732f64de5c2fb844e89cbbed1c5a8d495"
+SRC_URI[sha256sum] = "a6fbc0be9269889312388bfec6a9ddf41bf8fe31b68bcf9c8239db35cd38f411"
 
 inherit setuptools3 pypi
 
-- 
2.34.1



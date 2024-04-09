Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2CFCD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.130853.1712646645873563871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qrsgIXD9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646646; x=1744182646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jTBF/u2B5Zx1tMJHe3OwkTctyl8+unPLwwcHZxuA44M=;
  b=qrsgIXD91Q0MbTPAWL9UeO6OQoCVHPbNSr0mtK0T+T/9Hcf4BZhcb/yo
   WyaARDl9ZF6ijuZC0ViccXkIK1k1LTo4efwMtVNWGILgzLzGU5uC9Nay4
   LWKvckQ0nLhWQpKj/tp3rHQ1oiptPI/a9nfDGj6F8lpJQ3h6UldrSCvGG
   BSqy5t6mFKBFCbA41dX+6tWhpDYa7VWY6NuYgHfPFn2Lzya51hn3DdPX5
   PSXJ3IQzPYIdBHhW+p+mk1JcNxdbsV+KLVFRqJMm2OLHO3KLI4khQ7BSU
   qn83rYmWnfmDrPW15TY6ECCo8B9YvY2ZjFFxN5+jkj7c4+cqfqeAPt4rc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="154905334"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="154905334"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 61CA32A2354
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E6D0D5A35
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AC894018B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CDEE51A0002;
	Tue,  9 Apr 2024 15:10:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/33] libx11: upgrade 1.8.7 -> 1.8.9
Date: Tue,  9 Apr 2024 15:10:02 +0800
Message-Id: <1712646620-16608-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10-3.947100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytK1w81t1VVbeLS
	dVP2tZn5YBvXPbiTXr7y9zcRSkKate1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ//S
	AQv/+tsrwCBNO5BSkrp6ne24V5SQS8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNViXW+mYY/X1vgdtztHYynUAN+XCwqi0jX5/woA0YCW/6IJ898a5VGSDyeOEE3E8r//CF
	D575jPhRkfwVPHme7zriKDYC5dGdIByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198033

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-xlibi18n: restore parse_line1 for WIN32 builds
-Fix _XkbReadGetDeviceInfoReply for nButtons == dev->buttons
-_XimProtoIMFree:no need to check arg for Xfree()
-_XimEncodeString:no need to check arg for Xfree()
-Fix XCreateIC() memory leak (Part 2)
-_XimLocalDestroyIC:fix possible mem leak
-_XimLocalCreateIC: get rid of bzero
-_XimLocalCreateIC: minor cleanup
-_XimLocalCreateIC:no need to check arg for Xfree()
-_XimLocalDestroyIC: no need to check arg for Xfree()
-fix table width

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libx11_1.8.7.bb => libx11_1.8.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.7.bb => libx11_1.8.9.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb
index 5f14e62446..5dcb063473 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "05f267468e3c851ae2b5c830bcf74251a90f63f04dd7c709ca94dc155b7e99ee"
+SRC_URI[sha256sum] = "779d8f111d144ef93e2daa5f23a762ce9555affc99592844e71c4243d3bd3262"
 
 inherit gettext
 
-- 
2.34.1



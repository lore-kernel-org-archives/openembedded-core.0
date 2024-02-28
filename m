Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA6BC54E5D
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8396.1709105613845511941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ue7S3sqn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105614; x=1740641614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PKxqn2PEn+0RglApnu6H7JjbhWA8kT0yLAv24t4Bvl0=;
  b=Ue7S3sqncolCvqVoRyBrJW/eh4o6Q7+Bacg9D/Fp6xGbYJyCN8/H+Rxq
   sMeuGmwJP+346tLtktAp8MTaNKgeaXQ0qtEplKJYma71QGTriBHfZKcLf
   TiO9nOEpmZbXSH9pgS8pUgSgilp6/Gs83HVXLZzeXVaPyvvAy1hbIB5c9
   SbJWKIUF0lNzX6dXaRBKU+lqydcPqNguEvjRrgTLx49EboCjbNudO8G0R
   RNdUnMWAJKgyXdAOVdbZC2dhsZ4sfmV4eYJ10HtM3LdxHsVWFccI9jFDU
   PI0rJ1AkzXXnSea4z9acA3kisTKW2G3ASuazUlKC3VnK37uC250Sgxq72
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150517356"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150517356"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:31 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FE80E8CD7
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 735B6D7B81
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 05D292008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AAB911A006A;
	Wed, 28 Feb 2024 15:33:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/48] makedepend: upgrade 1.0.8 -> 1.0.9
Date: Wed, 28 Feb 2024 15:32:30 +0800
Message-Id: <1709105575-24259-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Zb056mCmF00ZV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SbuuRBGsAAyD2vjG3F09PkZxOc4nnn/00twfNWz35uwQMJw
	nmboDm+8SF4eme4L58oQE27djnfQVVMcNBMYdBMiRL3IYok5VtS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196350

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-util/{makedepend_1.0.8.bb => makedepend_1.0.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.8.bb => makedepend_1.0.9.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.8.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-util/makedepend_1.0.8.bb
rename to meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb
index ad769de205..6db7d04079 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb
@@ -17,4 +17,4 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=43a6eda34b48ee821b3b66f4f753ce4f"
 
-SRC_URI[sha256sum] = "275f0d2b196bfdc740aab9f02bb48cb7a97e4dfea011a7b468ed5648d0019e54"
+SRC_URI[sha256sum] = "bc94ffda6cd4671603a69c39dbe8f96b317707b9185b2aaa3b54b5d134b41884"
-- 
2.34.1



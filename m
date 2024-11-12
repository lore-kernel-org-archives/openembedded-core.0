Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E720D32D6E
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.82749.1731403559624767916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sp9kQJl6;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403560; x=1762939560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eJPWi8Og7SbSekYOYWu/jm7aWqQOpUptMIQLr4HvtBg=;
  b=Sp9kQJl6JUqg3674j56LQrAsswm0+ajl6HXaxo5TyrTWo+ZWT6kSPCdZ
   YroqSR5Rh0m+6MqvJPDBlOk+Bt7c9lUfXwImTMlJewUjohc9iBJWQRl6Q
   TRvJxneYLJNdmmzIQVfBJ3qnf7j/ekULm6JnzwtFerBNQl3WhLJPN1BYi
   NPaDiUqO9PgV9s/xSWy/x+78XhFl9swCXuVAB+k9io2irllBLJDpVGfWK
   Ydr51+mZyjolunQEbpsg3Dw7OkaANsALD/wRmygUkjtNs3O8m0UgQSke9
   /C8ghwsHa21ATA2l/qOl3UKpYlKuGCDJCNvn8GIme16284mkdUPh05o91
   g==;
X-CSE-ConnectionGUID: n4eFyyroTV2F44wLODwf2g==
X-CSE-MsgGUID: MTk5klh3R/GnyaW5KLGskw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="159037436"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="159037436"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DE30D6EA5
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E0D2228CD9
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7538620071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 255FD1A000A;
	Tue, 12 Nov 2024 17:25:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 44/47] stress-ng: upgrade 0.18.02 -> 0.18.06
Date: Tue, 12 Nov 2024 17:24:40 +0800
Message-Id: <1731403483-21399-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-1.138400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4BqkHTV8zp2nwH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRvAQzqh8D4IY5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SYLPn1Sl7x7xXJzJ9BhrdRS3hGdy5E1dCUFK5hFMRB6E0bF
	/agpHvbuh4rQu/IBxYoIGulMtwRBC55vSCgdLFZj6oPQsleUyHS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207032

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.18.02.bb => stress-ng_0.18.06.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.02.bb => stress-ng_0.18.06.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.02.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.06.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.02.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.06.bb
index e63a68aa6d..137b41cdda 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.02.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.06.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "be42d072c0df72dc8136f52d3962e4ba264a100a"
+SRCREV = "8357df5586a8f8f435ef532c53b770d9c2802c3d"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.34.1



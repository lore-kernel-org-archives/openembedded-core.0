Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2675E77185
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.116741.1733788630880754443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RFTaqSpY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788630; x=1765324630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qiUdpruXFcqMu9/75RRrqu6MNau0ajQtdpPeDgba5TE=;
  b=RFTaqSpYawcyBHkpo/4c45Tflldj/bzBuzm52X99jxq4XQQm/ZbO6Bbw
   oZfOX6HhjDmPeUqpKcOvxE4aJuIGS9xhhtLOlrFkznl94BSfzZ9OYQDbf
   Opn5165avMd5bCrNGNxibW1RSUh2Yxm5ajiU0G4VcF6186lgW63/NFBnr
   LlonTBr32Q/TvC8+9jrDvN9CGCQnEjAz/XZYy52i0hQYRallomXaQiMYd
   Nl5EReUurvNn98mMCfbWwaVcp8iEYpKvb/JXrDzDyhqTmBFTvrrj07q1/
   eqLhpK99FSQEgX/Ny7pnMdOmmazW9ZcATmZKQoRslMSBwfjG9I6ZNHCQY
   Q==;
X-CSE-ConnectionGUID: ftMkSGJWT/u/BejEJwxYRw==
X-CSE-MsgGUID: 2VIwjfQNRnWoRac+UXZgYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="183357527"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="183357527"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:08 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D5C896741
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BD01D21AC
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AC69E20076D0F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 556081A006C;
	Tue, 10 Dec 2024 07:57:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 13/20] pixman: upgrade 0.44.0 -> 0.44.2
Date: Tue, 10 Dec 2024 07:56:45 +0800
Message-Id: <1733788612-20933-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10-1.343300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOxl9HNVJWpc6nHbeBu5LnmR1LeQ+VpnJTP3WYNhkszlwOJ
	rPJVdQ2SESVL06fzYOwP2BNMDlvQPDPIzF4wRfrAURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrVYW4CsRJ49dN5j7Vf7acB7K5S4hHxWmRqVB3zBy5FgK/M1vY0CXv7bhhLd+FvcVSEP9s
	kw3LcEPazEqd7ndzp0oSGm3zeZkwh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208509

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-lib/{pixman_0.44.0.bb => pixman_0.44.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.44.0.bb => pixman_0.44.2.bb} (96%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.44.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb
similarity index 96%
rename from meta/recipes-graphics/xorg-lib/pixman_0.44.0.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb
index aeb1c392d3..9e2a102a9b 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.44.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb
@@ -10,7 +10,7 @@ DEPENDS = "zlib"
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
            "
-SRC_URI[sha256sum] = "89a4c1e1e45e0b23dffe708202cb2eaffde0fe3727d7692b2e1739fec78a7dac"
+SRC_URI[sha256sum] = "6349061ce1a338ab6952b92194d1b0377472244208d47ff25bef86fc71973466"
 
 # see http://cairographics.org/releases/ - only even minor versions are stable
 UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCFBCF0448
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:36 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9171.1728452975929969153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S3838TxZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452976; x=1759988976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=D/WeZwhDKWxS23JXzg7RKHiuqgdQ7wj2Vf3+b7mgglk=;
  b=S3838TxZQrqzcZjwnFx9AelC3SHObUg5qKLjz7XhZJwI7ndCCe3SZTZb
   r5F+SS8npXfHT3/9UTf0tZeakH3LBguuRQ9B7zX1eN9OT7u/SdjVCYQze
   CE1hKnfAXRe+GP7vNFpNadDghukkj+dICR+7m22+zvgs3kTjstQN+dCPE
   +xLY9weIfnx/TExYC75BqMhNPG/DJTgF/N38G3MeZxVTn5vix+m2e5B/K
   tt+2i82wm3rKyyyBtztMvFyKkaHr13PMTVeFUvLB/FqJuKTzHEscsZOzj
   myDUWLDPmdoTSghY3H17U5JUy2zNzu3KIdY3cUFbJKrbjakdkXEuKCkGt
   A==;
X-CSE-ConnectionGUID: J+T1lfUYRESwlhAkLDRsWA==
X-CSE-MsgGUID: 5wscXI7OQHmw4auZRYhWtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="164586937"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="164586937"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:33 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F658D7AD4
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B00E7D5406
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 418362007AA9F
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE3E11A000A;
	Wed,  9 Oct 2024 13:49:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/26] dhcpcd: upgrade 10.0.10 -> 10.1.0
Date: Wed,  9 Oct 2024 13:48:51 +0800
Message-Id: <1728452955-25051-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10-0.371200-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8srvGEmcXHXAmHWRJEfGP5nmR1LeQ+VpnJZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SDRZtJ8hkSkzjoy69OfkXx7VwEmllwAvcfokv5VndqRKzam
	4Nd6tBypzV/L+FPAll635ILDwOdEvsU9LQmpHHvoODzQlQdE/dS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205313

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dhcpcd/{dhcpcd_10.0.10.bb => dhcpcd_10.1.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.10.bb => dhcpcd_10.1.0.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.10.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.10.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
index 0ae9db911c..3f806bb187 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.10.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "ab5ec18e755c1bb450c74d3a4657ea48d0f7f314"
+SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
-- 
2.34.1



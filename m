Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79963C2D0CE
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.64032.1718936238182412693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sLXpQ3sx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936240; x=1750472240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DuLBqjGXYQ1axjuww3mF/sti6wGbDspqHBn8FtIYnSc=;
  b=sLXpQ3sxwKUdV+Bze44XBl5idKMYGnK8b+brq4UJBQ8UwYL9MTuWl9ES
   cZhUE+oDhJuHA0zhQv1tj/M7/eGyxfQlw4Zh8SjfWSPDrB8q9OYPFGuct
   sjBurVQ+dd1Cqyq2i3sSBmKsnX4ZElqubAiidIroHWWInYfCJPJFj3UdQ
   Fp8qQtCfl9nGAEmI52rnKwwZnYzQWZ7I5mjcdmy0pIUJogQK1i4Z/A3EU
   SxyvM6I5mVEfZ9cB+/0XeCTjKRv7cAFVD37FwBNAQ3BM4pivuJSacTZTF
   rUPH4fVAH4WPF8oynfUNu428Dhj3qBXvq7Oc9XO9RpOrRllC5bWSD4zww
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="164424731"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="164424731"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:19 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C448CE8520
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B1E4CF7F7
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 842E1E5185
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 332B81A0002;
	Fri, 21 Jun 2024 10:17:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/22] libpcre2: upgrade 10.43 -> 10.44
Date: Fri, 21 Jun 2024 10:16:41 +0800
Message-Id: <1718936206-8080-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--2.855200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ5D53rZ0sb/bNdVHptfHl6nVTWWiNp+v8CgPWSZHDoZtW0pkpPR1DaeWw
	Yle3v1Yz8bQRM2WaSHIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzf49k96uttwIBev
	JWunbykr6P1WHXI2B/f7XlcWAgYWK3VfyNRvOZMNjL6WXrfvuDgsuH0vmM+LZTwrv3axp7W+XNA
	XmaBwLSiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200978

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpcre/{libpcre2_10.43.bb => libpcre2_10.44.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.43.bb => libpcre2_10.44.bb} (95%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.43.bb b/meta/recipes-support/libpcre/libpcre2_10.44.bb
similarity index 95%
rename from meta/recipes-support/libpcre/libpcre2_10.43.bb
rename to meta/recipes-support/libpcre/libpcre2_10.44.bb
index fd0bd79212..ceb2b85458 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.43.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.44.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb"
+SRC_URI[sha256sum] = "d34f02e113cf7193a1ebf2770d3ac527088d485d4e047ed10e5d217c6ef5de96"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.34.1



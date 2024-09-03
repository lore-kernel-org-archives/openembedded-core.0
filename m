Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90455CD3427
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:28 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.18366.1725352407767059325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=avPD7AXt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352407; x=1756888407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GKRJzSTqgD5cqE+a6tlgGUdhmB0Us/EOaTr4Fl/GO24=;
  b=avPD7AXtYHWpWznuowzaHbzgVORlKL0wW6+2nf8vg9939UnjP2edWj4I
   yn/s8Bl/SOxMg8M/vfJxXhE6CgfcYfWl27MYl5ieAyQJ8bAHMKS+nI7SN
   JGhBGkjRfoh7othk8H/pZM3gYMxSlYENTL/TDbIbUfQntF2TIejdUPiT3
   mxrV3o17tYxsAgXz7H0aDr8RqeTQTRg+gQFZ/+PmGmOKweGm4R4sEYAeL
   odLlTAYBLocrpD1Rj2c+4bbAp9dxQWfEM8uPC1ZUBIZihe+H2+afSalZm
   fvscjoKguxHaBLtpkReZoz7rD+b8onmQeNWFl8FOThQxZ2Qs0gN9aatMN
   Q==;
X-CSE-ConnectionGUID: ofC/LWVmTMejGYn006PAlw==
X-CSE-MsgGUID: f+7R118MS2Cf6VRhmjzbbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="160840638"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="160840638"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:16 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D48BFD9223
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 21FB2E49E2
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 882BB6C811
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 291311A000E;
	Tue,  3 Sep 2024 16:33:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/22] mc: upgrade 4.8.31 -> 4.8.32
Date: Tue,  3 Sep 2024 16:32:48 +0800
Message-Id: <1725352379-20334-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--0.691900-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2s0FJKIRy8cWhFGVCReGq2EOjf3A4DTYuF9LQinZ4QefCP/VFuTOXUT6C2
	1l3Lq9xrkwjHXXC/4I8ZW5ai5WKlyQAfH5df8yaWUW9/+DFfDmppgjIOpKNzAhPno108mvY2lfk
	BJgdLl/TOQHybpZfoLzrmQdVXICaZhbpFHLwtvxODPFo67wEG+/r/b+dmSKFo6AH9/PcRd1xUpP
	R4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204149

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/mc/{mc_4.8.31.bb => mc_4.8.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/mc/{mc_4.8.31.bb => mc_4.8.32.bb} (97%)

diff --git a/meta/recipes-extended/mc/mc_4.8.31.bb b/meta/recipes-extended/mc/mc_4.8.32.bb
similarity index 97%
rename from meta/recipes-extended/mc/mc_4.8.31.bb
rename to meta/recipes-extended/mc/mc_4.8.32.bb
index 5f8257f71f..d3b8ea006b 100644
--- a/meta/recipes-extended/mc/mc_4.8.31.bb
+++ b/meta/recipes-extended/mc/mc_4.8.32.bb
@@ -11,7 +11,7 @@ RRECOMMENDS:${PN} = "ncurses-terminfo"
 SRC_URI = "http://ftp.midnight-commander.org/${BPN}-${PV}.tar.bz2 \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "f42f4114ed42f6cf9995f1d896fa6c797ccb36dac57760dda8dd9f78ac462841"
+SRC_URI[sha256sum] = "51a039ebd15d5e442312a7053a4ca28276b7f241050b7714d5bae5362ecd3319"
 
 inherit autotools gettext pkgconfig
 
-- 
2.34.1



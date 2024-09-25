Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F73CF9C77
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.9323.1727246989761149089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WYiUNC2k;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246993; x=1758782993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zR5BtWr228yRZOmmaw5Afzjf+PHJH2vECADgHOmYlzI=;
  b=WYiUNC2k1K8zebOsNe92BqzvZxpqIl8xQPK0dcjgG0uRC65a01e/zRLn
   DhgYdxT1CJOyuPom4CfYc3MOIylQIWa1VUPssNS/A3VaXRxsQAs7Pu1pY
   oZN5LL7h0DoSNbe/XnomMTY5aR8qbQ7inSKrDi124u9Uk0z616GUdL1P6
   UTLZ6EVbeQBgjO6bptYM6tuQv7DsGVB+nO5K2T1h510r6quTo++9cDMGu
   J28AU7dHfIKWGEMS3+/Fi9dAnSvgNdvRaT2/hfBkS9MkSWmDCBNalkvx/
   wI2V0JK8xE5JO3w9LfCdjDAENgUs0Q3CX1Hphlrqza26XBMIyedlwfyp4
   Q==;
X-CSE-ConnectionGUID: s6k2m3deSSGQoJ28WwMbQQ==
X-CSE-MsgGUID: wAu+TLb4T1+8VnUXgg0Cdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="163052416"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="163052416"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:52 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E4C60E8523
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2770DD5BA5
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B5C5920086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 65C8C1A000A;
	Wed, 25 Sep 2024 14:49:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 43/47] sysklogd: upgrade 2.6.1 -> 2.6.2
Date: Wed, 25 Sep 2024 14:49:16 +0800
Message-Id: <1727246960-20665-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--1.336800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yaoXHZz/dXlx5CUjluD0wWIli8Y5a0svLxxq
	dt22rdOgoUusYzqrLBfT00JySEpRt576e9GOpfQKA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYscG+qFF0DyyNyl1nd9CIt0URSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJ5sXksxFA/J5tY+rVRaeexnI1AGI89GDAcxHahAdcebxiOh64lMbVFT2WETskxdpiWL71
	uHgh2kkESL2PIfi5hzDxh4l/A8UDfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204936

From: Wang Mingyu <wangmy@fujitsu.com>

Changes
=========
- 'syslog.conf': misplaced continuation character in example
- Adapt facilities for RFC5424 compliance.
- Add support for IPv6 addresses in 'listen' directive, issue #90
Fixes
=======
- Fix #85: logging to remote IPv6 address does not work.
- Fix #88: initial delay for unresolvable remote target.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysklogd/{sysklogd_2.6.1.bb => sysklogd_2.6.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.6.1.bb => sysklogd_2.6.2.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb b/meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb
index 99454b8230..7f06738d00 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "c2bc519697aaa94f7b5e658a31ff55b9d54e7c8d"
+SRCREV = "c1f8842853378781c2fdf6e70070a95539ba7d2e"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



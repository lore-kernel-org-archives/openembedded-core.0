Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6B1CD3436
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.18516.1725352400539239901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wiopv70S;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352400; x=1756888400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dFKETf2jLKtGhWVn2gCljDVGy6YwLNgQmKIP1vY0p5Y=;
  b=Wiopv70SYum12+kvKrmyxEV4vQ0sVO812MVhUO3uOT2o+b19oQfaaaNf
   vK1GSHLMvxI+836p1Kyw/GjZOjvSuWc8KxUqTRsUguKQvlBl+KDLD9tLE
   igMfMxlncYkG9x1ZeEyNM7WRvIyX+kvmDv/RT5BiSpZYSiZuWg0GlIiz8
   QzZ5XwUNyrNbS70rHbd1pdz7ju/Papl4wxNtvcEfcUax1YvikCaMjSNfG
   MK4f9l0X0nJM149ljvLbBxCdlVNDWWwXNEbLRel597lyRDuUqNZc4NH+0
   TmHmy2Yyc4/JBZnMMiVSiJH7tfwNhUAdYCBI6926gpiCgotpZqsdrbApG
   g==;
X-CSE-ConnectionGUID: Ht8EekJsSWSRXBV2UBfOag==
X-CSE-MsgGUID: ekV0W7IzRkyVteP/gPMOUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="151536275"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="151536275"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B64C3C9440
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ED6FDCFA5C
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 76C6B6C811
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1C8181A000D;
	Tue,  3 Sep 2024 16:33:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/22] ofono: upgrade 2.9 -> 2.10
Date: Tue,  3 Sep 2024 16:32:50 +0800
Message-Id: <1725352379-20334-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--1.002800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbysvPRFFhcWhYIY+
	d4I4WCpEObGQghSUoLLFOr5lVdtXOFpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVU2d8
	mtRIRsUNm7jq4CNcjwxQAXi4Ga9GRHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6HIg
	cWgc0p452pKfNCWId/O1vrP/mEgs6gLlZ/XNy1Ro+VfqJmvb0J3R2D6yfSkwpf6z5zy672eF6UC
	A3spxnEyRg9M/wukbiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204141

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix issue with SMS and user data length checks.
- Add support for QMI and Dual-Stack context activation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/ofono/{ofono_2.9.bb => ofono_2.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.9.bb => ofono_2.10.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.9.bb b/meta/recipes-connectivity/ofono/ofono_2.10.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.9.bb
rename to meta/recipes-connectivity/ofono/ofono_2.10.bb
index 26cb9bb7ff..c1f686b164 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.9.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "9d2612925a23a7fb668f297a044b5ea136215cc399ecc3f127135c8f2a9845f9"
+SRC_URI[sha256sum] = "ce65c12e446f7b15d2ed98a220f9cc6f1571b269d83c4f14b0a2d67c33919fef"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1



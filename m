Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EADD11718
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.5566.1729834799620168832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r8Rd6/oe;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834799; x=1761370799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=p0jxnwXhh8Ca1+G6OpQmQqHtatJ5npcns8pZZuRno9w=;
  b=r8Rd6/oeFPt2TVE6XkExJCQ6xi9lT0SsqvDcRfj96sPEgJoWNuTJbVrO
   r+1HkjEQATRZ9UjHgAHCKk4h+JnexLWqi9UkskY8abQWzUQndut62bfFi
   ZjRdn86Dikt2LJ5zRkZzFUabGw17HbveVTBbMkk6+9Pm/P4hw9SN3d6gr
   FKytPbhSsqMknH4a3Q4jiacqphgICmiqdMW7eAbxOyhn5DLjmCEh+Om+j
   K1Zkq7VFYexM9EMQ5dBQ5LcNRCOOUdeExxwVwSY+qqZCJ8lpbwSsv+dcz
   LFmheDCguHNoeZb12tcscqQ5dSGKCkwV3L8+zoQJxL2huRu2iAqP3nlnD
   Q==;
X-CSE-ConnectionGUID: +dhAU0hHRL+opl3ez7SfBQ==
X-CSE-MsgGUID: k58OZvjuRBSoYQ4XmZm4ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="165337141"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="165337141"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F9D816B900
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EDB7D3F0C
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2593520071A1D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E38671A01EC;
	Fri, 25 Oct 2024 13:39:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/22] ofono: upgrade 2.10 -> 2.11
Date: Fri, 25 Oct 2024 13:39:20 +0800
Message-Id: <1729834769-4717-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10--1.107800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrnpdnAKvzbsFtrfCb186XI2lF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74Aejl8XURi8fGnUsFdofYzqo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLt/TpeyNuX8D3/aRwMntG1fnZpBv8yPztoPU
	p4yVWG/BKApgRL1cfGKL+uOYItph2G7z7HkL6M1RGwd6X77jV3NDPllKm9eej+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206322

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add support for SIMCom A7672E-FASE modem.
- Add support for Quectel EG916Q-GL modem.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-connectivity/ofono/{ofono_2.10.bb => ofono_2.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.10.bb => ofono_2.11.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.10.bb b/meta/recipes-connectivity/ofono/ofono_2.11.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.10.bb
rename to meta/recipes-connectivity/ofono/ofono_2.11.bb
index c1f686b164..85119c73d4 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.10.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.11.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "ce65c12e446f7b15d2ed98a220f9cc6f1571b269d83c4f14b0a2d67c33919fef"
+SRC_URI[sha256sum] = "fa908ac79e2ffaa52391b6c6737cd451275ef788284e46d3f05a7a409bc52cfc"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1



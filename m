Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37E7C3DA49
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:30 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.46933.1722215421841684566
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T3LjZPVO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215422; x=1753751422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GzuXnhV83lnIAuIVGMJqPUHDM/mCU3+lBPwK+nP9pXM=;
  b=T3LjZPVOeGDTDDCyoUwT41kLzu+et8CrKHbNHj5hTMkhjzs4OJ5Nl5ZE
   NVaTo+xKZKebFXygqbgUyp5yVjrseu54vO1+6rxEmWaDA5sueAxHs8xDG
   Tg1bhO5+V3GLWfsMlxIJwBHJ3Oe7i2T/XQGT87a2VtF4TkhlqCUiGCLuV
   JSHX4chgCzDRXY4DKPkXz319nCy3plengindvYX6+H9dqz24lkrrXpytn
   90VXm1N4W3pmSTZUL2313sBh9aVNeyVlxt92cU8s2YFwM+KvlG9siYdZb
   BZq40snV1WNwUQ2JqQqWCssPh8TS0GQEjBxAyzuU3BoA51hErhcx9IEtt
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168911477"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168911477"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:19 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 35475C9448
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 75A79D506E
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E85220071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B79B61A0002;
	Mon, 29 Jul 2024 09:10:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/33] cryptodev-linux: upgrade 1.13 -> 1.14
Date: Mon, 29 Jul 2024 09:09:37 +0800
Message-Id: <1722215408-27541-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--1.852600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvfKapXkCLRBVFY
	OXQ26hVbLLkRhIefmxrGKIf6hBf7VRvtxLq45qm9leLXPzO3VNHBOVz0Jwcxl6vCrG0TnfVU2d8
	mtRIRsUOBkESMI05d4qHvyg1ZsxTfNyl1nd9CIt0URSScn+QSXmrz/G/ZSbVq+gtHj7OwNO0X9r
	pBZuBDbcFD1iKbwNrVKjJ4nChy2gAa9UZ+lCjBDSg/E7F3sXqXZ4nCdyHmne5YFB0ijRG0Gxype
	82CtdmeiLVnsCw8/9brtV9taEEX+/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202576

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix compilation issues after API changes in several Linux kernels
* Split install targets to help package maintainers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 64a9c2926b..8d0aad4a01 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
-SRCREV = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
-PV = "1.13+git${SRCPV}"
+SRCREV = "135cbff90af2ba97d88f1472be595ce78721972c"
+PV = "1.14"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



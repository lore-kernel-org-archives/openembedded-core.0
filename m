Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476FCCED602
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9230.1728452979019762894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WrNtwI4M;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452979; x=1759988979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QlsTfoDH/F8c4S7BlKBHa7Pa11QNfHTtHMyxyJt+/X4=;
  b=WrNtwI4MU/GXctd96nZe+btscyKwLgr+MsNQPPaCrwbklyOFHnxyTeVm
   Ls6CZW7WE00c6gCkSRtI4XqsehDMCEoPvx4EcCzYuTYsBNHfrWRoBxLXZ
   Z1GTGmZSRO1f1GHGihAbfUU62pmxnr29xHmTWjWI1PLNKBxrj55GyADbG
   4v+YmvrwjWCWLzGSpBpnwr+NiNPdOjlvzW/Ol3KvA54Ub2Ox3C2zz2LOm
   WKzG6CKUkyoR9uPlrPMxFMieY1YGyYzzFgng7xV+wevtw8cGSl7h3ufHf
   A4gzRC3PbfhiUYuFWZZ+NwYX2b1FhbyvUyUGwASpPchXzTemnDb835RSS
   w==;
X-CSE-ConnectionGUID: A5zoSIVJR9i+qN/7azXKiQ==
X-CSE-MsgGUID: EOg/ZSfsRMWZvALG2KGzxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="176256735"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="176256735"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 96D49D4F54
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D66FFD50FA
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E3AD2007AA9F
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 15FFD1A000A;
	Wed,  9 Oct 2024 13:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/26] libproxy: upgrade 0.5.8 -> 0.5.9
Date: Wed,  9 Oct 2024 13:48:57 +0800
Message-Id: <1728452955-25051-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10-3.120200-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mroZoUnnV928KKlGc9JzXmorpt
	MBEexxEK9GF0M6TbxPyhH3kE6Tg1fObviKMxuy8uh5kaQXRvR9cxXH/dlhvLv0gxtwipGNzAkum
	iLpgzZZJmtt+/uJm6SA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMjeWrdgSBjomOuZvZnhv1ksZVv8sb18qeZ4CIKY/Hg3AaZGo0EeYG95UMLUJu4leYyq2r
	l3dzGQ1FUHAAiI0UCyYUrI9CTPRUIJQU7U1bo3bpH03UL3vpEGkNGMzrGoNTIFyyJKuSrzBYFcU
	YUPE6ABfaaiU9xe4To3XBEZns5ZQ/OzX972hRyhTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205321

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Ignore invalid proxy URL
- Memleak fixes
- kde: Add ReversedException support
- Fix memory leak using PX_FORCE_CONFIG
- Update msys2 build steps
- Remove white space in key value

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libproxy/{libproxy_0.5.8.bb => libproxy_0.5.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.8.bb => libproxy_0.5.9.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.8.bb b/meta/recipes-support/libproxy/libproxy_0.5.9.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.8.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.9.bb
index 5dcd7d019b..e6192a6960 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.8.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.9.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "04c5185729e164dcc2d010177f83b6209769d9e7"
+SRCREV = "77e2a2b88a319974cf099c8eaaaa03030bc4c0d4"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.34.1



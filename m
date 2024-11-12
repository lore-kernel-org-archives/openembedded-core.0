Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18815D3ABFB
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:36 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.82732.1731403532211576234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G+mNniOy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403533; x=1762939533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=oaMOEaU4Q1PWwJ8NhaX6ly5HgnBvBFqZDq5fRCObKQs=;
  b=G+mNniOyz8nffs8asTXROISYcTrjdtTrP3wakeGQjF0xqn6M/DItONWH
   03PqARkigp6bY50stIcQcsXZIs+Rqdyc921m20NkdHQLd0UrePHZaqiT5
   KVV1aebekliNJDwEAVBnxTdo2y+FsMM++ZoYoxa0BYQvRlMzCef62Dayy
   50R45xy3b73GQTYQ1Mcw+pPNz2QMe7WYH4vDqjVjUAc97EN/xl97GBkqw
   fA0QquxE8XQvAHqmioNU7c279NxJ1zGW2VE68jq/Cg/nXb6qGCGoVCCPC
   IN+iQTT+hzFkYWyiQ7FYxuQLRnnW2F6xvxxqSspEM88atkyTKbDri+PRo
   w==;
X-CSE-ConnectionGUID: e5Fno30rTraQ04ZioEXePQ==
X-CSE-MsgGUID: 8Ml1eCMRQXm6Zpo8jq5sAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="167418241"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="167418241"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:32 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FC36D500C
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5FAED50E4
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 829A56BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3140E1A000A;
	Tue, 12 Nov 2024 17:25:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/47] nghttp2: upgrade 1.63.0 -> 1.64.0
Date: Tue, 12 Nov 2024 17:24:22 +0800
Message-Id: <1731403483-21399-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--7.342300-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrBGvINcfHqhds1Ir4NZzFmgbo
	TDS3zulAJL/yQ5n90+VQkxpBD/sjJLuz8zGC5XEHlyI0nNqpRfVUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBGwK0ZgbTOeKUvGsAbY6bunYrGb
	ISEEw4TOLzNWBegCW24nmFeyfGnuMLbigRnpKlKSBuGJWwgxAr0t0ccteCeDdkLj1vGUBNCR2k8
	+RVQSXPRQIVwNTEqL5NYSDjGg8aSrAUyUg9ogFt
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207012

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The internal :authoriy and host field value validation now treats @ as invalid.
  nghttp2_check_authority still treats it as a valid character.
- Fix c-ares v1.34.0 version detection failure.
- Fix race condition on h1 connection close.
- Fix UDP datagram send/recv metric.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.63.0.bb => nghttp2_1.64.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.63.0.bb => nghttp2_1.64.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.63.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.64.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.63.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.64.0.bb
index 43dbf722e9..5d5111a937 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.63.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.64.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4879c75dd32a74421b9857924449460b8341796c0613ba114ab2188e4622354b"
+SRC_URI[sha256sum] = "88bb94c9e4fd1c499967f83dece36a78122af7d5fb40da2019c56b9ccc6eb9dd"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.34.1



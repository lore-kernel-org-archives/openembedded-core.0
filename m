Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2456CF0450
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:46 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9171.1728452975929969153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hZ+kkGBK;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452985; x=1759988985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5K4PAIBVzKm/Q4vp5YiRToLhTlf7Fn62TjReNbNYgXQ=;
  b=hZ+kkGBKFmhVvhWMXPKp8o74FTVN1wPsgJ1tYOCFE4Nxt/gsyE73x5BA
   FdWAYpUz9G90fXGqXvkAUTULEIh/XCw/yZhmzM/gaSWNFrc7judjSEp9o
   LZ0G0c0bdUICR1EMKOARVArZeTPOc6YfynG8AnLcAUUvWApEC+pS8N+C4
   CkOQ8/40b3Y1gxnHmqf7kTVeg9q4WYvDWvFQSxpA2kFGdqUrlmyV4n/Un
   eaWJSGJfKyfRzjpYZfW1Mbnym/HbA/awKqSL6GivlxV4cEJNuY5hOLF8O
   bZgY3jXfcFBop6T1UZNuXZrjXdIsrQM9+6t9DYExXbb43U/uEktiMAigp
   w==;
X-CSE-ConnectionGUID: 18F4I6T0Qc2AieDrphNEFQ==
X-CSE-MsgGUID: uHHU2YPWRa+J/1Uqe505jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="164586956"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="164586956"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 15651C68E1
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D58CD50FE
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA3592007AA9F
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 833041A000A;
	Wed,  9 Oct 2024 13:49:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/26] mtools: upgrade 4.0.44 -> 4.0.45
Date: Wed,  9 Oct 2024 13:49:02 +0800
Message-Id: <1728452955-25051-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--2.797800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhfwudzT4nmGfcw
	yVYGZr7IXd2qhDWeOxqPQi9XuOWoOO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ3JB
	1YIf9iAqqJw61GpPIsoAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSz+k2EwvD9bpU/ta
	obwLBXOiAW6DYKakdR35QDRmhyUW8uhQ7mUCVDdVFBN+Ib3phW2G5QVGjwBd+UPgq23XNBLz1Fb
	E4oIPQBiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205333

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed iconv descriptor leak
- Fixed size of error message buffer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mtools/{mtools_4.0.44.bb => mtools_4.0.45.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.44.bb => mtools_4.0.45.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.44.bb b/meta/recipes-devtools/mtools/mtools_4.0.45.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.44.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.45.bb
index d8dd671be2..34040d7a0d 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.44.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.45.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "37dc4df022533c3d4b2ec1c78973c27c7e8b585374c2d46ab64c6a3db31eddb8"
+SRC_URI[sha256sum] = "0b008a96bd0efe0e542fa4383d469af66bc4a93394990b103730a8160a67d618"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.34.1


